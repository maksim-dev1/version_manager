# Сбор данных для аналитики при проверке версий

## Обзор

При каждом запросе к эндпоинту `/api/v1/check-version` от клиентского приложения сервер собирает **исключительно анонимные технические метрики** устройства. Данные используются для аналитики использования приложения и принятия решений о версионировании.

## Подход: Zero-Disclosure

Сбор данных спроектирован так, чтобы **не требовать никакого уведомления пользователя**:

- ❌ Не собираются идентификаторы устройства (deviceId, IDFA, Advertising ID)
- ❌ Не сохраняется IP-адрес клиента
- ❌ Не сохраняется User-Agent
- ❌ Не определяется страна по GeoIP

### Анонимный Device Fingerprint

Для подсчёта уникальных пользователей используется **анонимный хеш** характеристик устройства:

```
SHA-256(platform | deviceModel | osVersion | screenW×H | locale | cpuArchitecture | totalRamMb)
```

**Почему это НЕ PII:**
- Один хеш соответствует **классу устройств** с одинаковыми характеристиками
  (например, все Pixel 7 с Android 14, 8GB RAM, ru_RU → один хеш)
- Невозможно восстановить данные из хеша (SHA-256, one-way)
- Результат: слегка **заниженные** уникальные пользователи
- Это **не** device fingerprinting в терминах GDPR — нет tracking across sites

### Что НЕ требуется

- Consent popup / баннер с cookies
- ATT dialog (App Tracking Transparency)
- Раздел «Device ID» в Apple App Privacy Details
- Раздел «Device or other IDs» в Google Play Data Safety
- Упоминание в Privacy Policy (хотя можно добавить для прозрачности)

## Собираемые данные

### 1. Обязательные поля запроса (клиентские)

| Поле | Тип | Описание |
|------|-----|----------|
| `namespace` | String | Идентификатор приложения (bundle ID) |
| `version` | String | Семантическая версия (MAJOR.MINOR.PATCH) |
| `buildNumber` | int | Номер сборки |
| `platform` | enum | Платформа (ios, android, web, macos, windows, linux) |

### 2. Технические характеристики устройства (опциональные, в запросе)

Все поля отправляются клиентом. Часть сохраняется в `version_check_logs` для аналитики,
остальные используются только для вычисления fingerprint-хеша.

**Сохраняются в `version_check_logs`** (для per-dimension статистики):

| Поле | Тип | Описание | Примеры |
|------|-----|----------|---------|
| `osVersion` | String? | Версия ОС | "17.2.1", "14" |
| `deviceModel` | String? | Модель устройства | "iPhone 15 Pro", "Pixel 8" |
| `locale` | String? | Локаль (язык_регион) | "ru_RU", "en_US" |

**Используются только для fingerprint** (не сохраняются в логах):

| Поле | Тип | Описание | Примеры |
|------|-----|----------|---------|
| `screenWidth` | int? | Ширина экрана | 1170, 1080 |
| `screenHeight` | int? | Высота экрана | 2532, 2400 |
| `cpuArchitecture` | String? | Архитектура CPU | "arm64", "x86_64" |
| `totalRamMb` | int? | Общий объём RAM (МБ) | 6144, 8192 |

**Прочие** (отправляются клиентом, не сохраняются на сервере):

| Поле | Тип | Описание |
|------|-----|----------|
| `freeStorageMb` | int? | Свободное хранилище (МБ) |
| `deviceLanguage` | String? | Язык интерфейса (ISO 639-1) |
| `timezone` | String? | Часовой пояс IANA |
| `connectionType` | String? | Тип соединения (wifi, cellular) |
| `buildType` | String? | Тип сборки (release, debug) |
| `isLowPowerMode` | bool? | Режим энергосбережения |
| `frameworkVersion` | String? | Версия фреймворка |

### 3. Метаданные SDK

| Поле | Тип | Описание |
|------|-----|----------|
| `sdkVersion` | String? | Версия клиентского SDK |

### 6. Метаданные ответа (вычисляются на сервере)

| Поле | Тип | Описание |
|------|-----|----------|
| `responseStatus` | enum | Статус: `blocked`, `update_available`, `active`, `error` |
| `updatePriority` | enum? | Приоритет: `critical`, `high`, `medium`, `low` |
| `processingTimeMs` | int? | Время обработки запроса (мс) |
| `checkedAt` | DateTime | Время выполнения проверки (UTC) |

## Хранение данных

### Таблица `version_check_logs`

Облегчённая запись каждого запроса check-version.
Хранит только поля, используемые в per-dimension статистике.

**Поля**: `versionNumber`, `buildNumber`, `platform`, `osVersion`, `locale`, `deviceModel`, `responseStatus`, `updatePriority`, `processingTimeMs`, `checkedAt`

**Индексы**: `applicationId`, `versionId`, `checkedAt`, `platform`, `(applicationId, checkedAt)`, `(applicationId, platform, checkedAt)`

**Retention Policy**: Рекомендуется **90 дней** для детальных логов.

### Таблица `device_fingerprints`

Анонимные fingerprint-хеши для подсчёта уникальных пользователей.

**Поля**: `fingerprintHash` (SHA-256), `applicationId`, `platform`, `firstSeenAt`, `lastSeenAt`

**Индексы**: уникальный `(applicationId, fingerprintHash)`, `(applicationId, firstSeenAt)`, `(applicationId, lastSeenAt)`, `(applicationId, platform)`

**Retention Policy**: **Бессрочно** (~150 байт на запись).

### Таблица `version_check_daily_summaries`

Преагрегированная дневная статистика.

**Поля**:
- `date`, `platform`, `buildNumber`, `versionNumber`
- `uniqueDevices` — уникальные устройства за день (по fingerprint)
- `newDevices` — новые устройства за день (firstSeenAt = сегодня)
- `totalChecks` — общее количество проверок
- `blockedChecks`, `updateAvailableChecks`, `activeChecks`, `errorChecks`
- `avgProcessingTimeMs`, `maxProcessingTimeMs`

**Retention Policy**: **Бессрочно** (~200 байт на запись).

## Вычисляемые метрики

### Основные метрики
- **Total Checks** — общее количество запросов за всё время
- **Daily Checks** — запросы за последние 24 часа
- **Weekly Checks** — запросы за последние 7 дней
- **Monthly Checks** — запросы за последние 30 дней
- **Period Checks** — запросы за выбранный период

### Уникальные пользователи (по device fingerprint)
- **Total Unique Users** — уникальных пользователей за всё время
- **DAU** — уникальных пользователей за последние 24 часа
- **WAU** — уникальных пользователей за последние 7 дней
- **MAU** — уникальных пользователей за последние 30 дней
- **New Users in Period** — новых пользователей за выбранный период

### Активность по дням
- **Daily Active Users** — уникальных пользователей за каждый день
- **Daily New Users** — новых пользователей за каждый день
- **Cumulative Users** — кумулятивный рост пользовательской базы

### Статистика по версиям
- **Распределение по версиям** — количество/процент запросов на каждой версии
- **Adoption Rate** — процент запросов на последней версии
- **Version Age** — возраст версии в днях
- **Checks on Blocked Versions** — количество/процент запросов на заблокированных версиях
- **Adoption Timeline** — график распространения версии по дням

### Статистика по платформам
- **Platform Distribution** — iOS, Android, Web и т.д. (количество/процент)
- **OS Versions** — распределение по версиям ОС
- **Top Device Models** — топ-10 моделей устройств

### Статистика по локалям
- **Locale Distribution** — распределение по языкам/локалям

### Временная аналитика
- **Heatmap** — активность по дням недели и часам суток (7×24 матрица)

### Метрики производительности
- **Average Processing Time** — среднее время обработки запроса (мс)
- **Max Processing Time** — максимальное время обработки

## Фильтрация данных

Все метрики поддерживают фильтрацию через `StatisticsFilter`:

| Фильтр | Тип | Описание |
|--------|-----|----------|
| `applicationId` | UUID | Приложение (обязательно) |
| `dateFrom` | DateTime? | Начало периода |
| `dateTo` | DateTime? | Конец периода |
| `platform` | PlatformType? | Фильтр по платформе |
| `buildNumber` | int? | Фильтр по номеру сборки |

**По умолчанию**: последние 30 дней.

## Пример Dashboard

```
Общая статистика:
  Total Checks: 425,300       Unique Users: 89,200
  Checks (24h): 14,200        DAU: 3,100
  Checks (7d):  98,500        WAU: 18,500
  Checks (30d): 312,000       MAU: 67,800
  New Users (30d): 12,300

Распределение по версиям:
  2.1.0 (build 210): 198,300 (62.5%)  ← последняя
  2.0.5 (build 205): 89,100 (28.1%)
  2.0.0 (build 200): 29,700 (9.4%)   ⚠️ заблокирована

Платформы:
  iOS: 241,500 (56.8%)
  Android: 176,800 (41.6%)
  Web: 7,000 (1.6%)

Локали:
  ru_RU: 153,100 (36.0%)
  en_US: 97,800 (23.0%)
  de_DE: 42,500 (10.0%)
```

## Compliance Checklist

- [x] Нет сбора персональных данных (non-PII)
- [x] Нет идентификаторов устройства (deviceId не собирается)
- [x] Device fingerprint — анонимный хеш класса устройств (не tracking)
- [x] IP-адреса не сохраняются
- [x] User-Agent не сохраняется
- [x] Не используются рекламные идентификаторы (IDFA/Advertising ID)
- [x] Не требуется disclosure в магазинах (нет Device ID / Location)
- [x] Не требуется consent popup или ATT dialog
- [x] Retention policy для детальных логов (90 дней)
- [x] Data Minimization — в логах только поля для статистики
- [x] Purpose Limitation — данные используются только для аналитики

## Связанные файлы

- **Модель запроса**: `lib/src/models/api/check_version_request.spy.yaml`
- **Модель лога**: `lib/src/models/logs/version_check_log.spy.yaml`
- **Модель fingerprint**: `lib/src/models/logs/device_fingerprint.spy.yaml`
- **Агрегированная модель**: `lib/src/models/logs/version_check_daily_summary.spy.yaml`
- **Сервис сбора**: `lib/src/services/check_version_service.dart`
- **Сервис аналитики**: `lib/src/services/statistics_service.dart`
- **API эндпоинт**: `lib/src/endpoints/statistics_endpoint.dart`
- **REST route**: `lib/src/web/routes/check_version_route.dart`
