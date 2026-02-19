# Version Manager — Server

Серверная часть системы управления версиями мобильных приложений.  
Построена на [Serverpod](https://serverpod.dev) (Dart), PostgreSQL и Redis.

---

## Что делает сервер

Сервер предоставляет **два типа API**:

| Тип | Для кого | Аутентификация |
|-----|----------|----------------|
| **Serverpod endpoints** | Flutter-панель администратора | Access Token (JWT) |
| **REST API** (`/api/v1/check-version`) | Мобильные приложения | API ключ (Bearer) |

Мобильное приложение отправляет запрос с информацией о своей версии → сервер отвечает, нужно ли обновляться, заблокирована ли версия, и куда перейти для обновления.

---

## Структура проекта

```
version_manager_server/
├── bin/
│   └── main.dart                  # Точка входа
├── config/
│   ├── development.yaml           # Конфиг для разработки
│   ├── production.yaml            # Конфиг для продакшена
│   ├── staging.yaml               # Конфиг для стейджинга
│   ├── passwords.yaml             # Пароли (БД, Redis, SMTP)
│   └── generator.yaml             # Настройки кодогенерации
├── lib/
│   ├── server.dart                # Инициализация сервера и маршрутов
│   └── src/
│       ├── endpoints/             # API эндпоинты (Serverpod)
│       ├── models/                # Модели данных (протокол)
│       ├── services/              # Бизнес-логика
│       ├── web/                   # REST маршруты и middleware
│       └── generated/             # Автогенерация Serverpod
├── migrations/                    # Миграции БД
├── docker-compose.yaml            # PostgreSQL + Redis для разработки
├── Dockerfile                     # Сборка для продакшена
└── test/                          # Интеграционные тесты
```

---

## Эндпоинты

### 🔐 AuthEndpoint

Аутентификация и регистрация пользователей.

| Метод | Описание | Авторизация |
|-------|----------|:-----------:|
| `checkEmailAndSendCode` | Проверка email + отправка кода для новых | ❌ |
| `resendCode` | Повторная отправка кода | ❌ |
| `verifyRegisterCode` | Проверка кода без создания аккаунта | ❌ |
| `register` | Регистрация + автоматический вход | ❌ |
| `login` | Вход по email/пароль | ❌ |
| `refreshTokens` | Обновление пары токенов (rotation) | ❌ |
| `logout` | Завершение текущей сессии | ✅ |
| `logoutAll` | Завершение всех сессий | ✅ |
| `getCurrentUser` | Данные текущего пользователя | ✅ |

**Поток регистрации:** `checkEmailAndSendCode` → `verifyRegisterCode` → `register`  
**Поток входа:** `checkEmailAndSendCode` → `login`

### 📱 AppEndpoint

Управление приложениями (CRUD, API-ключи, передача владения).

| Метод | Описание |
|-------|----------|
| `getMyApplications` | Список всех приложений пользователя (личные + командные) |
| `getApplication` | Получение приложения по ID |
| `createApplication` | Создание приложения с генерацией API-ключа |
| `updateApplication` | Редактирование приложения |
| `deleteApplication` | Удаление с подтверждением имени |
| `getRegenerationTargetEmail` | Замаскированный email для регенерации ключа |
| `requestApiKeyRegeneration` | Запрос кода подтверждения на email |
| `regenerateApiKey` | Регенерация ключа по коду |
| `toggleApplicationStatus` | Активация / деактивация |
| `transferApplicationOwnership` | Передача владения (user↔team) |

### 🏷 VersionEndpoint

Управление версиями приложений.

| Метод | Описание |
|-------|----------|
| `getVersions` | Список версий приложения |
| `getVersionDetail` | Детальная информация о версии |
| `getNextBuildNumber` | Следующий номер сборки |
| `createVersion` | Создание версии (semver + buildNumber) |
| `updateVersion` | Редактирование (changelog, блокировка, рекомендация) |
| `toggleVersionBlock` | Быстрая блокировка/разблокировка |
| `setVersionRecommendation` | Установка рекомендуемой версии для обновления |
| `deleteVersion` | Удаление версии |

### 👥 TeamEndpoint

Управление командами и участниками.

| Метод | Описание |
|-------|----------|
| `createTeam` / `updateTeam` / `deleteTeam` | CRUD команд |
| `getTeam` / `getMyTeams` | Получение команд |
| `inviteMember` | Приглашение по email |
| `getMyInvitations` | Список приглашений |
| `respondToInvitation` | Принять / отклонить приглашение |
| `revokeInvitation` | Отозвать приглашение |
| `getTeamMembers` | Участники команды |
| `updateMemberRole` | Изменение роли |
| `removeMember` / `leaveTeam` | Удаление / выход |
| `transferOwnership` | Передача владения командой |

**Роли:** `owner` → `admin` → `developer` → `observer`

### 📊 StatisticsEndpoint

Аналитика и статистика по приложениям.

| Метод | Описание |
|-------|----------|
| `getOverview` | Общие метрики (проверки за день/неделю/месяц) |
| `getDailyActiveUsers` | График активности по дням |
| `getVersionStatistics` | Распределение по версиям, adoption rate |
| `getPlatformStatistics` | Распределение по ОС, устройствам |
| `getGeoStatistics` | Статистика по локалям |
| `getTimeAnalytics` | Тепловая карта (день недели × час) |
| `getExportData` | Полный отчёт для экспорта |

### 🔒 SessionEndpoint

Управление сессиями пользователя.

| Метод | Описание |
|-------|----------|
| `getActiveSessions` | Список активных сессий |
| `terminateSession` | Завершить конкретную сессию |
| `terminateAllOtherSessions` | Завершить все кроме текущей |

---

## REST API — Проверка версии

```
POST /api/v1/check-version
Authorization: Bearer {API_KEY}
Content-Type: application/json
```

**Запрос:**
```json
{
  "namespace": "com.example.myapp",
  "version": "1.2.0",
  "buildNumber": 42,
  "platform": "ios",
  "osVersion": "17.2.1",
  "deviceModel": "iPhone 15 Pro",
  "locale": "ru_RU"
}
```

**Варианты ответа:**

| Статус | Код HTTP | Описание |
|--------|:--------:|----------|
| `active` | 200 | Версия актуальна |
| `update_available` | 200 | Есть рекомендуемое обновление |
| `blocked` | 200 | Версия заблокирована, обязательное обновление |

---

## Сервисы

| Сервис | Описание |
|--------|----------|
| `PasswordService` | Хеширование и верификация паролей (bcrypt) |
| `TokenService` | Генерация токенов и API-ключей, хеширование |
| `EmailService` | Отправка email (Gmail / Яндекс SMTP) |
| `VerificationCodeService` | 6-значные коды с rate limiting и TTL |
| `CheckVersionService` | Логика проверки версии для REST API |
| `AuthValidationService` | Валидация токенов и сессий |
| `StatisticsService` | Агрегация и расчёт метрик |

Все сервисы доступны через **Service Locator** (`Services()`), инициализируются при старте сервера.

---

## Запуск для разработки

### 1. Поднять PostgreSQL и Redis

```bash
cd version_manager_server
docker compose up -d
```

### 2. Применить миграции и запустить сервер

```bash
dart bin/main.dart --apply-migrations
```

Или через Serverpod script:

```bash
serverpod run
```

### 3. Остановить инфраструктуру

```bash
docker compose stop
```

---

## Конфигурация

| Файл | Назначение |
|------|------------|
| `config/development.yaml` | Порты, БД, Redis для разработки |
| `config/production.yaml` | Конфиг продакшена |
| `config/passwords.yaml` | Пароли БД, Redis, SMTP (не коммитить!) |
| `config/generator.yaml` | Настройки кодогенерации Serverpod |

### Порты (development)

| Сервис | Порт |
|--------|:----:|
| API Server | 8080 |
| Insights Server | 8081 |
| Web Server | 8082 |
| PostgreSQL | 8090 |
| Redis | 8091 |

---

## Миграции

Создание новой миграции:

```bash
serverpod create-migration
```

Миграции применяются автоматически при запуске с флагом `--apply-migrations`.

---

## Технологии

- **Serverpod 3.2.3** — фреймворк
- **PostgreSQL 16** (pgvector) — база данных
- **Redis 6** — кэширование
- **Dart 3.8** — язык
- **bcrypt** — хеширование паролей
- **SMTP** (Gmail / Яндекс) — email-уведомления
