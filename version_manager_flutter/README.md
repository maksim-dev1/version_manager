# Version Manager — Flutter

Панель администратора для управления версиями мобильных приложений.  
Flutter Web-приложение, подключённое к серверу через [Serverpod](https://serverpod.dev).

---

## Что делает приложение

Веб-панель для разработчиков и команд, позволяющая:

- 📱 **Управлять приложениями** — создание, настройка, API-ключи
- 🏷 **Управлять версиями** — создание, блокировка, рекомендации обновлений
- 👥 **Работать в командах** — приглашения, роли, совместный доступ
- 📊 **Смотреть статистику** — графики, платформы, adoption rate, экспорт
- 🔐 **Управлять сессиями** — просмотр активных сессий, завершение на других устройствах

---

## Структура проекта

```
version_manager_flutter/
├── lib/
│   ├── main.dart                     # Точка входа, инициализация Sentry
│   ├── version_manager_app.dart      # Корневой виджет, роутинг по состоянию auth
│   ├── env.dev.json                  # Переменные окружения (dev)
│   ├── env.prod.json                 # Переменные окружения (prod)
│   ├── common/
│   │   └── constants/                # Ключи хранилища, env-константы
│   ├── features/                     # Фичи (Clean Architecture + BLoC)
│   │   ├── auth/                     # Состояние аутентификации
│   │   ├── email_check/              # Проверка email (первый шаг входа)
│   │   ├── code_verification/        # Ввод кода верификации
│   │   ├── login/                    # Вход по паролю
│   │   ├── registration/             # Регистрация
│   │   ├── application/              # Список и управление приложениями
│   │   ├── create_application/       # Создание приложения
│   │   ├── api_key/                  # Регенерация API-ключей
│   │   ├── version/                  # Список версий
│   │   ├── version_detail/           # Детали версии
│   │   ├── version_action/           # Действия над версиями
│   │   ├── team/                     # Команды
│   │   ├── team_member/              # Участники команд
│   │   ├── user/                     # Профиль пользователя
│   │   ├── session/                  # Управление сессиями
│   │   └── statistics/               # Аналитика и графики
│   ├── screens/
│   │   └── home_screen.dart          # Главный экран с навигацией
│   ├── shared/
│   │   ├── services/                 # Общие сервисы
│   │   └── widgets/                  # Переиспользуемые виджеты
│   └── theme/
│       └── snow_ui/                  # Дизайн-система (цвета, типографика, тема)
├── assets/
│   └── config.json                   # Конфиг подключения к серверу
├── web/                              # Web-специфичные файлы
└── test/                             # Тесты
```

---

## Архитектура

### Слои фичи (Clean Architecture)

Каждая фича имеет до трёх слоёв:

```
feature/
├── data/
│   └── repository/          # Реализация — вызовы Serverpod Client
├── domain/
│   └── repository/          # Интерфейс репозитория
└── presentation/
    ├── bloc/                # BLoC — состояние и события
    ├── view/                # UI — экраны и виджеты
    └── *_provider.dart      # Провайдер — внедрение зависимостей
```

### Стейт-менеджмент

- **BLoC / Cubit** — управление состоянием фич
- **Provider** — DI и сервисы на уровне приложения

### Навигация

Приложение использует **адаптивную навигацию**:

| Ширина экрана | Компонент |
|:-------------:|-----------|
| ≥ 840px | `NavigationRail` (боковая панель) |
| < 840px | `NavigationBar` (нижняя панель) |

Разделы:

| Иконка | Раздел | Описание |
|:------:|--------|----------|
| 📱 | Приложения | Список приложений и управление версиями |
| 👥 | Команды | Команды, участники, приглашения |
| 👤 | Профиль | Данные пользователя, сессии, тема |

---

## Аутентификация

Поток авторизации управляется через `AuthBloc` с тремя состояниями:

```
AuthLoading  →  проверка сохранённых токенов
     ├── Authenticated    →  HomeScreen
     └── Unauthenticated  →  EmailScreen (начало входа/регистрации)
```

**Токены** хранятся в `SharedPreferences` и автоматически обновляются через `AuthKeyProvider` (Refresh Token Rotation).

---

## Сервисы

| Сервис | Описание |
|--------|----------|
| `ClientService` | Инициализация Serverpod Client, доступ к API |
| `StorageService` | Обёртка над SharedPreferences |
| `AuthKeyProvider` | Автоматическое обновление токенов |
| `DeviceInfoService` | Информация об устройстве |

---

## Дизайн-система (Snow UI)

Собственная тема, построенная поверх Material 3:

| Модуль | Описание |
|--------|----------|
| `SnowTheme` | Светлая и тёмная тема |
| `SnowColors` | Палитра цветов |
| `SnowTypography` | Типографика (Google Fonts) |
| `SnowSpacing` | Стандартные отступы |

Переключение темы доступно в профиле пользователя.

---

## Запуск

### Предварительные требования

- Flutter ≥ 3.32.0, Dart ≥ 3.8.0
- Запущенный сервер `version_manager_server`

### Development

```bash
flutter run -d chrome --dart-define-from-file=lib/env.dev.json
```

### Production

```bash
flutter run -d chrome --dart-define-from-file=lib/env.prod.json
```

### Сборка для деплоя

```bash
flutter build web --dart-define-from-file=lib/env.prod.json
```

Собранные файлы будут в `build/web/`. Для встраивания в сервер используется Serverpod script:

```bash
cd ../version_manager_server
serverpod flutter_build
```

После этого веб-приложение доступно по адресу `http://{server}:{webPort}/app`.

---

## Переменные окружения

Передаются через `--dart-define-from-file`:

| Переменная | Описание | Dev | Prod |
|------------|----------|-----|------|
| `PROD` | Режим продакшена | `false` | `true` |
| `SERVER_URL` | URL сервера API | `http://localhost:8080` | URL продакшен-сервера |
| `SENTRY_DSN` | DSN для Sentry | DSN | DSN |

---

## Мониторинг

Интегрирован **Sentry** для отслеживания ошибок и производительности:

- Автоматический трекинг навигации (`SentryNavigatorObserver`)
- Теги: версия приложения, номер сборки
- Семплирование: dev — 100%, prod — 20%

---

## Основные зависимости

| Пакет | Назначение |
|-------|------------|
| `serverpod_flutter` | Клиент Serverpod |
| `flutter_bloc` / `bloc` | Стейт-менеджмент |
| `provider` | Dependency Injection |
| `fl_chart` | Графики статистики |
| `pinput` | Ввод кода верификации |
| `shared_preferences` | Локальное хранилище |
| `sentry_flutter` | Мониторинг ошибок |
| `google_fonts` | Шрифты |
| `device_info_plus` | Информация об устройстве |
| `url_launcher` | Открытие ссылок |
| `freezed` | Иммутабельные модели |
