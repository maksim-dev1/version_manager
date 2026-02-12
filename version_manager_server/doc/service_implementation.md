# Описание реализации сервиса отправки данных из Flutter-приложения на сервер

## Содержание

1. [Обзор архитектуры](#обзор-архитектуры)
2. [Стек технологий](#стек-технологий)
3. [Структура проекта (три пакета)](#структура-проекта)
4. [Слой транспорта: Serverpod Client](#слой-транспорта-serverpod-client)
5. [Аутентификация и авторизация](#аутентификация-и-авторизация)
6. [Паттерн передачи данных на сервер (Flutter → Server)](#паттерн-передачи-данных-на-сервер)
   - 6.1 [Определение модели на сервере (YAML)](#61-определение-модели-на-сервере)
   - 6.2 [Серверный эндпоинт](#62-серверный-эндпоинт)
   - 6.3 [Генерация клиентского кода](#63-генерация-клиентского-кода)
   - 6.4 [Domain-слой во Flutter (Repository Interface)](#64-domain-слой-во-flutter)
   - 6.5 [Data-слой во Flutter (Repository Implementation)](#65-data-слой-во-flutter)
   - 6.6 [Presentation-слой (BLoC + Provider)](#66-presentation-слой)
   - 6.7 [UI-вызов](#67-ui-вызов)
7. [Публичное API (без авторизации)](#публичное-api)
8. [Потоки данных (диаграммы)](#потоки-данных)
9. [Обработка ошибок](#обработка-ошибок)
10. [Безопасность и Privacy](#безопасность-и-privacy)

---

## Обзор архитектуры

Проект **Version Manager** представляет собой систему управления версиями мобильных приложений. Архитектура состоит из трёх Dart-пакетов, связанных через кодогенерацию Serverpod:

```
┌──────────────────────────────────────────────────────────────────┐
│                     Flutter-приложение                           │
│  (version_manager_flutter)                                       │
│                                                                  │
│  ┌─────────────┐   ┌──────────────┐   ┌───────────────────────┐ │
│  │ Presentation │──▶│    Domain     │◀──│        Data           │ │
│  │  (BLoC/UI)   │   │ (Repository  │   │ (RepositoryImpl →     │ │
│  │              │   │  Interface)  │   │  Serverpod Endpoint)  │ │
│  └─────────────┘   └──────────────┘   └───────────┬───────────┘ │
│                                                    │             │
└────────────────────────────────────────────────────┼─────────────┘
                                                     │
                                           Serverpod Protocol
                                           (HTTP/WebSocket)
                                                     │
┌────────────────────────────────────────────────────┼─────────────┐
│                   Клиентский пакет                  │             │
│  (version_manager_client)                          │             │
│                                                    │             │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────┤             │
│  │ Client class  │  │ Endpoint*    │  │ Models     │             │
│  │ (auto-gen)    │  │ (auto-gen)   │  │ (auto-gen) │             │
│  └──────────────┘  └──────────────┘  └────────────┘             │
└────────────────────────────────────────────────────┬─────────────┘
                                                     │
                                                     │ HTTP(S)
                                                     ▼
┌──────────────────────────────────────────────────────────────────┐
│                        Сервер Serverpod                          │
│  (version_manager_server)                                        │
│                                                                  │
│  ┌──────────────┐   ┌──────────────┐   ┌───────────────────────┐│
│  │  Endpoints    │   │   Services   │   │   Database (Postgres) ││
│  │ (VersionEP,   │──▶│ (CheckVer,   │──▶│   (versions, apps,   ││
│  │  AppEP, etc.) │   │  Token, etc.)│   │    auth_sessions...)  ││
│  └──────────────┘   └──────────────┘   └───────────────────────┘│
│                                                                  │
│  ┌──────────────────────────────────────────────────────────────┐│
│  │  Web Routes (REST API)  —  /api/v1/check-version             ││
│  │  (публичный доступ по API-ключу, для мобильных приложений)   ││
│  └──────────────────────────────────────────────────────────────┘│
└──────────────────────────────────────────────────────────────────┘
```

---

## Стек технологий

| Компонент | Технология |
|-----------|-----------|
| Бэкенд | **Serverpod** (Dart) |
| Фронтенд | **Flutter** (Dart) |
| State Management | **flutter_bloc** + **freezed** |
| Транспорт (авторизованный) | Serverpod Protocol (binary HTTP/WebSocket) |
| Транспорт (публичный) | REST API (`Route`) |
| БД | PostgreSQL |
| Аутентификация | JWT-подобные токены (Access + Refresh) |
| Кодогенерация | `serverpod generate` |
| Локальное хранилище | `SharedPreferences` |

---

## Структура проекта

```
version_manager/
├── version_manager_server/      # Серверный пакет (Serverpod)
│   ├── lib/src/
│   │   ├── endpoints/           # Серверные эндпоинты (авторизованные)
│   │   ├── models/              # Определения моделей (*.spy.yaml)
│   │   ├── services/            # Бизнес-логика
│   │   └── web/routes/          # REST API роуты (публичные)
│   └── migrations/              # Миграции БД
│
├── version_manager_client/      # Клиентский пакет (auto-generated)
│   └── lib/src/protocol/        # Сгенерированные модели и эндпоинты
│       ├── client.dart           # Client class с typed endpoints
│       ├── versions/             # Version, CreateVersionRequest, etc.
│       ├── apps/                 # Application, CreateApplicationRequest, etc.
│       ├── auth/                 # AuthResponse, LoginRequest, etc.
│       ├── api/                  # CheckVersionRequest/Response (для REST)
│       └── enums/                # PlatformType, OwnerType, etc.
│
└── version_manager_flutter/     # Flutter-приложение
    └── lib/
        ├── main.dart             # Точка входа, DI
        ├── shared/services/      # Общие сервисы (Client, Storage, Auth)
        └── features/             # Feature-based архитектура
            ├── version/          # data/ → domain/ → presentation/
            ├── application/      # data/ → domain/ → presentation/
            ├── auth/             # data/ → domain/ → presentation/
            ├── session/          # data/ → domain/ → presentation/
            └── ...
```

---

## Слой транспорта: Serverpod Client

### Инициализация клиента

При запуске приложения создаётся единственный экземпляр `ClientService`, который оборачивает автосгенерированный Serverpod `Client`:

```dart
// main.dart
final clientService = ClientService();
clientService.initializeClient(serverUrl, storageService: storageService);
```

Внутри `ClientService`:

```dart
_client = Client(baseUrl)
  ..authKeyProvider = MutexRefresherClientAuthKeyProvider(_authKeyProvider!);
```

`Client` — это автосгенерированный класс из `version_manager_client`, содержащий типизированные эндпоинты:

- `client.version` → `EndpointVersion` (управление версиями)
- `client.app` → `EndpointApp` (управление приложениями)
- `client.auth` → `EndpointAuth` (аутентификация)
- `client.session` → `EndpointSession` (управление сессиями)
- `client.team` → `EndpointTeam` (управление командами)

### Как данные передаются

Каждый метод `Endpoint*` на клиенте вызывает:

```dart
caller.callServerEndpoint<ReturnType>('endpointName', 'methodName', {params});
```

Serverpod автоматически:
1. **Сериализует** параметры в JSON (`toJson()`)
2. **Добавляет** заголовок `Authorization: Bearer {accessToken}`
3. **Отправляет** HTTP POST запрос на сервер
4. **Десериализует** ответ обратно в типизированный Dart-объект
5. **Автоматически** обновляет Access Token через Refresh Token при 401

---

## Аутентификация и авторизация

### Схема токенов

```
┌──────────┐     login/register     ┌──────────┐
│  Flutter  │ ─────────────────────▶ │  Server  │
│           │ ◀───────────────────── │          │
│           │   AccessToken (1 час)  │          │
│           │   RefreshToken (30 дн) │          │
└──────────┘                        └──────────┘
```

### AuthKeyProvider

`AuthKeyProvider` реализует `RefresherClientAuthKeyProvider` от Serverpod:

- **Хранение токенов**: через `StorageService` → `SharedPreferences`
- **Автоматический refresh**: при получении 401 Serverpod вызывает `refreshAuthKey()`
- **Mutex**: `MutexRefresherClientAuthKeyProvider` гарантирует, что refresh выполняется один раз при параллельных запросах

```
Запрос → [AuthKeyProvider.authHeaderValue] → "Bearer {accessToken}"
       ↓ (если 401)
       → [AuthKeyProvider.refreshAuthKey()] → POST /auth.refreshTokens
       → Сохранение нового accessToken + refreshToken
       → Повторный запрос с новым токеном
```

### Защита серверных эндпоинтов

Все эндпоинты наследуются от `LoggedInEndpoint`:

```dart
abstract class LoggedInEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;
}
```

Serverpod автоматически проверяет наличие и валидность токена. Если токен невалиден — возвращается 401.

---

## Паттерн передачи данных на сервер

Рассмотрим полный цикл на примере **создания версии приложения** (Flutter → Server → БД → ответ).

### 6.1 Определение модели на сервере

Файл: `version_manager_server/lib/src/models/versions/create_version_request.spy.yaml`

```yaml
class: CreateVersionRequest
fields:
  applicationId: UuidValue
  versionNumber: String       # Семантическая версия MAJOR.MINOR.PATCH
  buildNumber: int            # Уникальный номер сборки
  changelog: String           # Описание изменений, 10–2000 символов
```

После `serverpod generate` создаётся:
- Серверная модель: `version_manager_server/lib/src/generated/protocol.dart`
- Клиентская модель: `version_manager_client/lib/src/protocol/versions/create_version_request.dart`

Обе модели имеют `toJson()` / `fromJson()` и `copyWith()`.

### 6.2 Серверный эндпоинт

Файл: `version_manager_server/lib/src/endpoints/version_endpoint.dart`

```dart
class VersionEndpoint extends LoggedInEndpoint {

  Future<Version> createVersion(
    Session session, {
    required CreateVersionRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    // 1. Проверка доступа на запись
    await _getAppWithWriteAccessCheck(session,
      applicationId: request.applicationId, userId: userId);

    // 2. Валидация входных данных
    _validateVersionNumber(request.versionNumber);  // regex ^\d+\.\d+\.\d+$
    _validateBuildNumber(request.buildNumber);       // > 0
    _validateChangelog(request.changelog);            // 10..2000 символов

    // 3. Проверка уникальности (versionNumber + buildNumber)
    // ...

    // 4. Создание записи в БД
    final version = Version(
      applicationId: request.applicationId,
      versionNumber: request.versionNumber.trim(),
      buildNumber: request.buildNumber,
      changelog: request.changelog.trim(),
      isBlocked: false,
    );

    return await Version.db.insertRow(session, version);
  }
}
```

**Ключевые принципы серверных эндпоинтов:**
- Проверка авторизации (через `LoggedInEndpoint`)
- Проверка прав доступа (владелец/член команды)
- Валидация входных данных с выбросом `InvalidDataException`
- Логирование через `session.log()`
- Возврат типизированной модели

### 6.3 Генерация клиентского кода

Команда `serverpod generate` создаёт в `version_manager_client`:

```dart
// Автосгенерированный EndpointVersion
class EndpointVersion extends EndpointLoggedIn {
  Future<Version> createVersion({required CreateVersionRequest request}) =>
    caller.callServerEndpoint<Version>(
      'version', 'createVersion', {'request': request},
    );
}
```

Клиентский пакет — **единственная зависимость** Flutter-приложения от серверной части.

### 6.4 Domain-слой во Flutter

Файл: `version_manager_flutter/lib/features/version/domain/repository/version_repository.dart`

```dart
abstract interface class VersionRepository {
  Future<Version> createVersion({
    required UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  });

  Future<VersionListResponse> getVersions({required UuidValue applicationId});
  Future<VersionDetailResponse> getVersionDetail({required UuidValue versionId});
  Future<Version> updateVersion({required UuidValue versionId, ...});
  Future<Version> toggleVersionBlock({required UuidValue versionId, ...});
  Future<SuccessResponse> deleteVersion({required UuidValue versionId});
  // ...
}
```

**Принцип**: Domain-слой определяет **контракт** (interface) без деталей реализации. BLoC зависит только от этого интерфейса.

### 6.5 Data-слой во Flutter

Файл: `version_manager_flutter/lib/features/version/data/repository/version_repository_impl.dart`

```dart
class VersionRepositoryImpl implements VersionRepository {
  final EndpointVersion _versionEndpoint;

  VersionRepositoryImpl({required EndpointVersion versionEndpoint})
    : _versionEndpoint = versionEndpoint;

  @override
  Future<Version> createVersion({
    required UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  }) async {
    return await _versionEndpoint.createVersion(
      request: CreateVersionRequest(
        applicationId: applicationId,
        versionNumber: versionNumber,
        buildNumber: buildNumber,
        changelog: changelog,
      ),
    );
  }
}
```

**Принцип**: Data-слой создаёт Request-объект и делегирует вызов автосгенерированному `EndpointVersion`.

### 6.6 Presentation-слой (BLoC + Provider)

#### Provider (DI)

Файл: `version_manager_flutter/lib/features/version/presentation/version_provider.dart`

```dart
class VersionProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clientService = context.read<ClientService>();

    return RepositoryProvider<VersionRepository>(
      create: (_) => VersionRepositoryImpl(
        versionEndpoint: clientService.client.version,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (ctx) => VersionBloc(
            versionRepository: ctx.read<VersionRepository>(),
          )..add(VersionEvent.loadVersions(applicationId: applicationId))),

          BlocProvider(create: (ctx) => VersionActionBloc(
            versionRepository: ctx.read<VersionRepository>(),
          )),
        ],
        child: child,
      ),
    );
  }
}
```

#### BLoC (State Management)

```dart
// Events (freezed)
sealed class VersionEvent with _$VersionEvent {
  const factory VersionEvent.loadVersions({required UuidValue applicationId}) = _LoadVersions;
  const factory VersionEvent.toggleVersionBlock({...}) = _ToggleVersionBlock;
}

// States (freezed)
sealed class VersionState with _$VersionState {
  const factory VersionState.initial() = VersionInitial;
  const factory VersionState.loading() = VersionLoading;
  const factory VersionState.loaded({
    required Application application,
    required List<VersionListItem> versions,
  }) = VersionLoaded;
  const factory VersionState.error({required String message}) = VersionError;
}
```

BLoC вызывает репозиторий и эмитит состояния:

```dart
Future<void> _onLoadVersions({...}) async {
  emit(const VersionState.loading());
  try {
    final response = await _versionRepository.getVersions(applicationId: ...);
    emit(VersionState.loaded(application: ..., versions: ...));
  } catch (e) {
    emit(VersionState.error(message: e.toString()));
  }
}
```

### 6.7 UI-вызов

```dart
// Отправка события из UI
context.read<VersionActionBloc>().add(
  VersionActionEvent.createVersion(
    applicationId: application.id!,
    versionNumber: '2.1.0',
    buildNumber: 42,
    changelog: 'Исправлены критические баги',
  ),
);

// Реакция на результат
BlocListener<VersionActionBloc, VersionActionState>(
  listener: (context, state) {
    switch (state) {
      case VersionActionSuccess(:final message):
        NotificationService.showSuccess(context, message);
        // Перезагружаем список версий
        context.read<VersionBloc>().add(
          VersionEvent.loadVersions(applicationId: application.id!),
        );
      case VersionActionError(:final message):
        NotificationService.showError(context, message);
    }
  },
)
```

---

## Публичное API

Помимо авторизованных эндпоинтов, сервер предоставляет **публичный REST API** для проверки версий мобильными приложениями (клиентами пользователей Version Manager).

### Маршрут: `POST /api/v1/check-version`

Файл: `version_manager_server/lib/src/web/routes/check_version_route.dart`

**Авторизация**: `Authorization: Bearer {API_KEY}` (не JWT, а API-ключ приложения).

#### Запрос (CheckVersionRequest)

```json
{
  "namespace": "com.example.myapp",
  "version": "2.1.0",
  "buildNumber": 42,
  "platform": "ios",
  "osVersion": "17.2",
  "deviceId": "abc-123-def",
  "locale": "ru_RU",
  "deviceModel": "iPhone 15 Pro",
  "screenWidth": 393,
  "screenHeight": 852,
  "timezone": "Europe/Moscow",
  "connectionType": "wifi",
  "buildType": "release",
  "cpuArchitecture": "arm64",
  "totalRamMb": 6144,
  "freeStorageMb": 25600,
  "sdkVersion": "1.0.0"
}
```

#### Ответ (CheckVersionResponse)

```json
{
  "status": "update_available",
  "isBlocked": false,
  "updatePriority": "recommended",
  "recommendedVersion": {
    "versionNumber": "2.2.0",
    "buildNumber": 45,
    "changelog": "Улучшена производительность...",
    "storeLinks": [
      { "platform": "ios", "storeName": "App Store", "url": "https://..." }
    ],
    "recommendationFrequency": "oncePer",
    "recommendationPeriodHours": 168
  },
  "message": "Доступна новая версия 2.2.0",
  "currentVersion": "2.1.0",
  "currentBuildNumber": 42,
  "serverTimestamp": "2026-02-12T10:30:00Z"
}
```

#### Логика обработки (`CheckVersionService`)

```
1. Валидация API-ключа → получение Application
2. Проверка namespace (совпадает с приложением)
3. Поиск версии по buildNumber
4. Если не найдена → status: active (с предупреждением)
5. Если заблокирована → status: blocked + причина + priority: critical
6. Если есть рекомендация → status: update_available + ссылки на магазин
7. Иначе → status: active
8. Логирование запроса (аналитика, анонимизация IP)
```

---

## Потоки данных

### Поток 1: Авторизованный запрос (Flutter Dashboard → Server)

```
┌─────────────────────────────────────────────────────────────────────────┐
│  UI (кнопка "Создать версию")                                          │
│      │                                                                  │
│      ▼                                                                  │
│  BLoC.add(VersionActionEvent.createVersion(...))                        │
│      │                                                                  │
│      ▼                                                                  │
│  VersionRepository.createVersion(...)            [domain interface]      │
│      │                                                                  │
│      ▼                                                                  │
│  VersionRepositoryImpl → EndpointVersion.createVersion(                 │
│      request: CreateVersionRequest(...)           [data layer]          │
│  )                                                                      │
│      │                                                                  │
│      ▼                                                                  │
│  Serverpod Client: сериализация → HTTP POST                            │
│      + Authorization: Bearer {accessToken}                              │
└─────────────────────────┬───────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  Serverpod Server                                                       │
│      │                                                                  │
│      ▼                                                                  │
│  requireLogin → проверка JWT → session.authenticated                    │
│      │                                                                  │
│      ▼                                                                  │
│  VersionEndpoint.createVersion(session, request)                        │
│      ├── _getAppWithWriteAccessCheck()   → проверка прав                │
│      ├── _validateVersionNumber()        → формат X.Y.Z                 │
│      ├── _validateBuildNumber()          → > 0                          │
│      ├── _validateChangelog()            → 10..2000 символов            │
│      ├── проверка уникальности           → version + buildNumber        │
│      └── Version.db.insertRow()          → INSERT в PostgreSQL          │
│      │                                                                  │
│      ▼                                                                  │
│  Возврат Version (сериализация → JSON → HTTP Response)                  │
└─────────────────────────┬───────────────────────────────────────────────┘
                          │
                          ▼
┌─────────────────────────────────────────────────────────────────────────┐
│  Flutter: десериализация → Version объект                                │
│      │                                                                  │
│      ▼                                                                  │
│  BLoC.emit(VersionActionState.success(...))                             │
│      │                                                                  │
│      ▼                                                                  │
│  BlocListener → NotificationService.showSuccess()                       │
│              → VersionBloc.add(loadVersions)  [обновление списка]        │
└─────────────────────────────────────────────────────────────────────────┘
```

### Поток 2: Публичный API (Мобильное приложение → Server)

```
┌──────────────────────────────────────────────────┐
│  Мобильное приложение (клиент пользователя)       │
│      │                                            │
│      ▼                                            │
│  POST /api/v1/check-version                       │
│  Authorization: Bearer {API_KEY}                  │
│  Body: { namespace, version, buildNumber, ... }   │
└──────────────────┬───────────────────────────────┘
                   │
                   ▼
┌──────────────────────────────────────────────────┐
│  CheckVersionRoute.handleCall()                   │
│      ├── Извлечение API-ключа из заголовка        │
│      ├── Парсинг JSON body                        │
│      ├── CheckVersionService.validateApiKey()     │
│      ├── Проверка namespace                       │
│      └── CheckVersionService.processVersionCheck()│
│           ├── findVersion() по buildNumber         │
│           ├── Определение статуса                  │
│           ├── Формирование ответа с ссылками       │
│           └── _logVersionCheck() — аналитика       │
│      │                                            │
│      ▼                                            │
│  JSON Response: { status, recommendedVersion, ... }│
└──────────────────────────────────────────────────┘
```

---

## Обработка ошибок

### На сервере

Сервер использует типизированные исключения, определённые как Serverpod модели:

```yaml
# invalid_data_exception.spy.yaml
class: InvalidDataException
serverOnly: false
fields:
  field: String
  message: String
  stackTrace: String?
```

```dart
throw InvalidDataException(
  field: 'versionNumber',
  message: 'Версия с номером 2.1.0 уже существует',
);
```

Serverpod автоматически оборачивает исключение в `ServerpodClientException` с кодом ошибки и передаёт его клиенту.

### На клиенте (Flutter)

BLoC ловит все исключения и переводит в состояние ошибки:

```dart
try {
  final response = await _versionRepository.createVersion(...);
  emit(VersionActionState.success(message: 'Версия создана'));
} catch (e) {
  emit(VersionActionState.error(message: e.toString()));
}
```

UI отображает ошибку через `NotificationService.showError()` (SnackBar).

### Автоматический retry (token refresh)

При получении 401 `MutexRefresherClientAuthKeyProvider` автоматически:
1. Вызывает `AuthKeyProvider.refreshAuthKey()`
2. Выполняет запрос к `auth.refreshTokens()` через временный клиент
3. Сохраняет новые токены в `SharedPreferences`
4. Повторяет исходный запрос

При неудачном refresh — вызывается `onAuthenticationFailed()`, который перенаправляет на экран логина.

---

## Безопасность и Privacy

### Авторизованные эндпоинты
- **Access Token** (1 час) + **Refresh Token** (30 дней)
- JWT-совместимые токены через `TokenService`
- Проверка прав доступа: владелец / член команды с нужной ролью
- Mutex на refresh для предотвращения race condition

### Публичный API
- Авторизация по **API-ключу** (хеш хранится в БД, `_tokenService.hashToken()`)
- **Анонимизация IP**: обрезка до /24 для IPv4
- **Non-PII данные**: собираются только технические метрики устройства
- Правовое основание: GDPR Art. 6(1)(f) — legitimate interest
- `deviceId` не привязан к пользовательским аккаунтам
- Не собираются: email, имя, телефон, геолокация

### Серверные сервисы
- `PasswordService` — хеширование паролей
- `TokenService` — генерация/валидация токенов, хеширование API-ключей
- `AuthValidationService` — валидация данных аутентификации
- `EmailService` — отправка кодов подтверждения (Yandex SMTP)
- `VerificationCodeService` — генерация и проверка одноразовых кодов

---

## Сводная таблица: все эндпоинты для передачи данных

### Авторизованные (Serverpod Protocol)

| Эндпоинт | Метод | Request | Response | Описание |
|-----------|-------|---------|----------|----------|
| `version.getVersions` | GET | `applicationId` | `VersionListResponse` | Список версий приложения |
| `version.getVersionDetail` | GET | `versionId` | `VersionDetailResponse` | Детали версии |
| `version.getNextBuildNumber` | GET | `applicationId` | `NextBuildNumberResponse` | Следующий номер сборки |
| `version.createVersion` | POST | `CreateVersionRequest` | `Version` | Создание версии |
| `version.updateVersion` | POST | `UpdateVersionRequest` | `Version` | Обновление версии |
| `version.toggleVersionBlock` | POST | `ToggleVersionBlockRequest` | `Version` | Блокировка/разблокировка |
| `version.setVersionRecommendation` | POST | `SetVersionRecommendationRequest` | `Version` | Установка рекомендации |
| `version.deleteVersion` | POST | `DeleteVersionRequest` | `SuccessResponse` | Удаление версии |
| `app.getMyApplications` | GET | — | `List<Application>` | Все приложения пользователя |
| `app.createApplication` | POST | `CreateApplicationRequest` | `CreateApplicationResponse` | Создание приложения |
| `app.updateApplication` | POST | `UpdateApplicationRequest` | `Application` | Обновление приложения |
| `app.deleteApplication` | POST | `DeleteApplicationRequest` | `SuccessResponse` | Удаление приложения |
| `auth.login` | POST | `LoginRequest` | `AuthResponse` | Авторизация |
| `auth.refreshTokens` | POST | `RefreshTokenRequest` | `TokenPairResponse` | Обновление токенов |
| `session.getActiveSessions` | GET | — | `List<SessionInfo>` | Активные сессии |
| `session.terminateSession` | POST | `TerminateSessionRequest` | `SuccessResponse` | Завершение сессии |

### Публичные (REST API)

| Маршрут | Метод | Auth | Request | Response |
|---------|-------|------|---------|----------|
| `/api/v1/check-version` | POST | API Key | `CheckVersionRequest` (JSON) | `CheckVersionResponse` (JSON) |
