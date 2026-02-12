/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:version_manager_client/src/protocol/apps/application.dart'
    as _i3;
import 'package:version_manager_client/src/protocol/apps/create_application_response.dart'
    as _i4;
import 'package:version_manager_client/src/protocol/apps/create_application_request.dart'
    as _i5;
import 'package:version_manager_client/src/protocol/apps/update_application_request.dart'
    as _i6;
import 'package:version_manager_client/src/protocol/auth/common_success.dart'
    as _i7;
import 'package:version_manager_client/src/protocol/apps/delete_application_request.dart'
    as _i8;
import 'package:version_manager_client/src/protocol/apps/request_api_key_regeneration_response.dart'
    as _i9;
import 'package:version_manager_client/src/protocol/apps/request_api_key_regeneration_request.dart'
    as _i10;
import 'package:version_manager_client/src/protocol/apps/regenerate_api_key_response.dart'
    as _i11;
import 'package:version_manager_client/src/protocol/apps/regenerate_api_key_request.dart'
    as _i12;
import 'package:version_manager_client/src/protocol/apps/toggle_application_status_request.dart'
    as _i13;
import 'package:version_manager_client/src/protocol/apps/transfer_application_ownership_request.dart'
    as _i14;
import 'package:version_manager_client/src/protocol/auth/check_email_and_send_code_response.dart'
    as _i15;
import 'package:version_manager_client/src/protocol/auth/check_email.dart'
    as _i16;
import 'package:version_manager_client/src/protocol/auth/send_code_response.dart'
    as _i17;
import 'package:version_manager_client/src/protocol/auth/register_send_code.dart'
    as _i18;
import 'package:version_manager_client/src/protocol/auth/register_verify_code.dart'
    as _i19;
import 'package:version_manager_client/src/protocol/auth/auth_response.dart'
    as _i20;
import 'package:version_manager_client/src/protocol/auth/register.dart' as _i21;
import 'package:version_manager_client/src/protocol/auth/login.dart' as _i22;
import 'package:version_manager_client/src/protocol/auth/token_pair_response.dart'
    as _i23;
import 'package:version_manager_client/src/protocol/auth/refresh_token.dart'
    as _i24;
import 'package:version_manager_client/src/protocol/auth/common.dart' as _i25;
import 'package:version_manager_client/src/protocol/sessions/session_info.dart'
    as _i26;
import 'package:version_manager_client/src/protocol/sessions/terminate_session_request.dart'
    as _i27;
import 'package:version_manager_client/src/protocol/teams/team.dart' as _i28;
import 'package:version_manager_client/src/protocol/teams/create_team_request.dart'
    as _i29;
import 'package:version_manager_client/src/protocol/teams/update_team_request.dart'
    as _i30;
import 'package:version_manager_client/src/protocol/teams/invite_team_member_request.dart'
    as _i31;
import 'package:version_manager_client/src/protocol/teams/team_member.dart'
    as _i32;
import 'package:version_manager_client/src/protocol/teams/respond_to_invitation_request.dart'
    as _i33;
import 'package:version_manager_client/src/protocol/teams/revoke_invitation_request.dart'
    as _i34;
import 'package:version_manager_client/src/protocol/teams/update_member_role_request.dart'
    as _i35;
import 'package:version_manager_client/src/protocol/teams/remove_member_request.dart'
    as _i36;
import 'package:version_manager_client/src/protocol/teams/leave_team_request.dart'
    as _i37;
import 'package:version_manager_client/src/protocol/teams/transfer_team_ownership_request.dart'
    as _i38;
import 'package:version_manager_client/src/protocol/teams/delete_team_request.dart'
    as _i39;
import 'package:version_manager_client/src/protocol/versions/version_list_response.dart'
    as _i40;
import 'package:version_manager_client/src/protocol/versions/version_detail_response.dart'
    as _i41;
import 'package:version_manager_client/src/protocol/versions/next_build_number_response.dart'
    as _i42;
import 'package:version_manager_client/src/protocol/versions/version.dart'
    as _i43;
import 'package:version_manager_client/src/protocol/versions/create_version_request.dart'
    as _i44;
import 'package:version_manager_client/src/protocol/versions/update_version_request.dart'
    as _i45;
import 'package:version_manager_client/src/protocol/versions/toggle_version_block_request.dart'
    as _i46;
import 'package:version_manager_client/src/protocol/versions/set_version_recommendation_request.dart'
    as _i47;
import 'package:version_manager_client/src/protocol/versions/delete_version_request.dart'
    as _i48;
import 'package:version_manager_client/src/protocol/greetings/greeting.dart'
    as _i49;
import 'protocol.dart' as _i50;

/// Эндпоинт для управления приложениями.
///
/// Предоставляет функционал для:
/// - Создания, редактирования и удаления приложений
/// - Управления API ключами (генерация, регенерация)
/// - Активации/деактивации приложений
/// - Получения списка приложений пользователя
///
/// Наследуется от [LoggedInEndpoint] — требует авторизации.
///
/// ## Владение приложением
/// - **user** — личное приложение пользователя
/// - **team** — командное приложение (доступно owner/admin команды)
/// {@category Endpoint}
class EndpointApp extends EndpointLoggedIn {
  EndpointApp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'app';

  /// Получить все приложения текущего пользователя.
  ///
  /// Возвращает личные приложения пользователя и приложения
  /// команд, в которых он состоит.
  _i2.Future<List<_i3.Application>> getMyApplications() =>
      caller.callServerEndpoint<List<_i3.Application>>(
        'app',
        'getMyApplications',
        {},
      );

  /// Получить приложение по ID.
  ///
  /// Проверяет права доступа пользователя к приложению.
  _i2.Future<_i3.Application> getApplication({
    required _i1.UuidValue applicationId,
  }) => caller.callServerEndpoint<_i3.Application>(
    'app',
    'getApplication',
    {'applicationId': applicationId},
  );

  /// Создать новое приложение.
  ///
  /// Генерирует уникальный API ключ при создании.
  /// Ключ возвращается в ответе и показывается пользователю один раз.
  _i2.Future<_i4.CreateApplicationResponse> createApplication({
    required _i5.CreateApplicationRequest request,
  }) => caller.callServerEndpoint<_i4.CreateApplicationResponse>(
    'app',
    'createApplication',
    {'request': request},
  );

  /// Обновить данные приложения.
  ///
  /// Позволяет изменить все поля кроме namespace.
  _i2.Future<_i3.Application> updateApplication({
    required _i6.UpdateApplicationRequest request,
  }) => caller.callServerEndpoint<_i3.Application>(
    'app',
    'updateApplication',
    {'request': request},
  );

  /// Удалить приложение.
  ///
  /// Требует подтверждение — имя приложения должно совпадать.
  /// При удалении также удаляются все версии, ссылки и логи.
  _i2.Future<_i7.SuccessResponse> deleteApplication({
    required _i8.DeleteApplicationRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'app',
    'deleteApplication',
    {'request': request},
  );

  /// Получить замаскированный email владельца приложения.
  ///
  /// Используется для показа пользователю, на какой адрес
  /// будет отправлен код подтверждения, до отправки кода.
  _i2.Future<String> getRegenerationTargetEmail({
    required _i1.UuidValue applicationId,
  }) => caller.callServerEndpoint<String>(
    'app',
    'getRegenerationTargetEmail',
    {'applicationId': applicationId},
  );

  /// Шаг 1: Запросить код подтверждения для регенерации API ключа.
  ///
  /// Отправляет 6-значный код на email владельца приложения.
  /// Код действует 10 минут, максимум 5 попыток ввода.
  _i2.Future<_i9.RequestApiKeyRegenerationResponse> requestApiKeyRegeneration({
    required _i10.RequestApiKeyRegenerationRequest request,
  }) => caller.callServerEndpoint<_i9.RequestApiKeyRegenerationResponse>(
    'app',
    'requestApiKeyRegeneration',
    {'request': request},
  );

  /// Шаг 2: Регенерировать API ключ с подтверждением кода.
  ///
  /// Проверяет 6-значный код из email и генерирует новый API ключ.
  /// Старый ключ становится недействительным.
  /// Новый ключ показывается пользователю один раз.
  _i2.Future<_i11.RegenerateApiKeyResponse> regenerateApiKey({
    required _i12.RegenerateApiKeyRequest request,
  }) => caller.callServerEndpoint<_i11.RegenerateApiKeyResponse>(
    'app',
    'regenerateApiKey',
    {'request': request},
  );

  /// Активировать или деактивировать приложение.
  _i2.Future<_i3.Application> toggleApplicationStatus({
    required _i13.ToggleApplicationStatusRequest request,
  }) => caller.callServerEndpoint<_i3.Application>(
    'app',
    'toggleApplicationStatus',
    {'request': request},
  );

  /// Передать приложение другому владельцу.
  ///
  /// Поддерживает три сценария:
  /// - **user → team**: личное приложение передаётся в команду
  /// - **team → user**: командное приложение забирается в личные
  /// - **team → team**: приложение переносится из одной команды в другую
  ///
  /// ## Безопасность
  /// - **user → team**: пользователь должен быть владельцем приложения
  ///   и owner/admin целевой команды.
  /// - **team → user**: пользователь должен быть owner/admin исходной команды.
  /// - **team → team**: пользователь должен быть owner/admin в обеих командах.
  _i2.Future<_i7.SuccessResponse> transferApplicationOwnership({
    required _i14.TransferApplicationOwnershipRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'app',
    'transferApplicationOwnership',
    {'request': request},
  );
}

/// Эндпоинт аутентификации и авторизации пользователей.
///
/// Предоставляет полный цикл работы с учётными записями:
/// - Проверка существования email и отправка кода верификации
/// - Регистрация новых пользователей с подтверждением email
/// - Вход в систему по email и паролю
/// - Управление токенами доступа (refresh token rotation)
/// - Завершение сессий (logout)
///
/// ## Защита методов
/// Большинство методов этого эндпоинта **НЕ требуют** авторизации,
/// так как они используются для получения токенов. Исключения:
/// - [logout] — требует валидный access token
/// - [logoutAll] — требует валидный access token
///
/// ## Поток регистрации
/// 1. [checkEmailAndSendCode] — проверяет email, отправляет код для новых пользователей
/// 2. [resendCode] — повторная отправка кода (если нужно)
/// 3. [register] — подтверждение кода, создание аккаунта и автоматический вход
///
/// ## Поток входа
/// 1. [checkEmailAndSendCode] — определяет, что пользователь существует
/// 2. [login] — аутентификация по email и паролю
///
/// ## Управление сессиями
/// - [refreshTokens] — обновление пары токенов
/// - [logout] — завершение текущей сессии (требует авторизации)
/// - [logoutAll] — завершение всех сессий пользователя (требует авторизации)
///
/// Все методы логируют свои действия через [Session.log] для аудита.
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Проверяет существование email и автоматически отправляет код верификации
  /// для новых пользователей.
  ///
  /// **Не требует авторизации** — это первый шаг регистрации/входа.
  ///
  /// Это первый шаг в потоке регистрации/входа. Метод определяет,
  /// существует ли пользователь с указанным email:
  /// - **Если существует** — возвращает `existsEmail: true`, клиент
  ///   должен показать форму ввода пароля
  /// - **Если не существует** — отправляет 6-значный код на email
  ///   и возвращает `codeSent: true`
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД и логированию
  /// - [request] — запрос с полем `email`
  ///
  /// ### Возвращает
  /// [CheckEmailAndSendCodeResponse] со следующими полями:
  /// - `existsEmail` — `true` если пользователь существует (нужен вход)
  /// - `codeSent` — `true` если код успешно отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit (опционально)
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'email'` — невалидный формат email
  ///
  /// ### Пример использования
  /// ```dart
  /// final response = await client.auth.checkEmailAndSendCode(
  ///   CheckEmailRequest(email: 'user@example.com'),
  /// );
  /// if (response.existsEmail) {
  ///   // Показать форму входа
  /// } else if (response.codeSent) {
  ///   // Показать форму ввода кода
  /// }
  /// ```
  _i2.Future<_i15.CheckEmailAndSendCodeResponse> checkEmailAndSendCode({
    required _i16.CheckEmailRequest request,
  }) => caller.callServerEndpoint<_i15.CheckEmailAndSendCodeResponse>(
    'auth',
    'checkEmailAndSendCode',
    {'request': request},
    authenticated: false,
  );

  /// Повторно отправляет код верификации на указанный email.
  ///
  /// **Не требует авторизации** — используется в процессе регистрации.
  ///
  /// Используется когда пользователь не получил код или срок его действия
  /// истёк. Метод создаёт новый код и отправляет его на email.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос с полем `email`
  ///
  /// ### Возвращает
  /// [SendCodeResponse] со следующими полями:
  /// - `success` — `true` если код успешно отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit (опционально)
  ///
  /// ### Rate Limiting
  /// Между отправками кодов должно пройти минимум 60 секунд.
  /// При превышении лимита возвращается `success: false` и
  /// `retryAfterSeconds` с временем ожидания.
  ///
  /// ### Пример использования
  /// ```dart
  /// final response = await client.auth.resendCode(
  ///   RegisterSendCodeRequest(email: 'user@example.com'),
  /// );
  /// if (!response.success && response.retryAfterSeconds != null) {
  ///   // Показать таймер обратного отсчёта
  /// }
  /// ```
  _i2.Future<_i17.SendCodeResponse> resendCode({
    required _i18.RegisterSendCodeRequest request,
  }) => caller.callServerEndpoint<_i17.SendCodeResponse>(
    'auth',
    'resendCode',
    {'request': request},
    authenticated: false,
  );

  /// Проверяет код регистрации без создания аккаунта.
  ///
  /// **Не требует авторизации** — используется в процессе регистрации.
  ///
  /// Полезно для отдельного шага в UI, когда нужно подтвердить код
  /// перед переходом к созданию пароля.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос с полями `email` и `code`
  ///
  /// ### Возвращает
  /// [SuccessResponse] с `success: true` при успешной проверке
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'code'` — неверный/истёкший код или
  ///   превышен лимит попыток
  _i2.Future<_i7.SuccessResponse> verifyRegisterCode({
    required _i19.RegisterVerifyCodeRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'auth',
    'verifyRegisterCode',
    {'request': request},
    authenticated: false,
  );

  /// Регистрирует нового пользователя с проверкой кода и автоматическим входом.
  ///
  /// **Не требует авторизации** — создаёт новую учётную запись.
  ///
  /// Финальный шаг регистрации, объединяющий:
  /// 1. Верификацию кода, отправленного на email
  /// 2. Создание учётной записи с хэшированным паролем
  /// 3. Автоматический вход с генерацией токенов
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос со следующими полями:
  ///   - `email` — email пользователя`
  ///   - `code` — 6-значный код верификации`. `
  ///   - `password` — пароль (минимум 8 символов)
  ///
  /// ### Возвращает
  /// [AuthResponse] со следующими полями:
  /// - `accessToken` — JWT токен доступа (время жизни: 1 час)
  /// - `refreshToken` — токен обновления (время жизни: 30 дней)
  /// - `user` — публичные данные созданного пользователя [UserPublic]
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'password'` — пароль короче 8 символов
  /// - [InvalidDataException] с `field: 'email'` — пользователь уже существует
  /// - [InvalidDataException] с `field: 'code'` — неверный/истёкший код или
  ///   превышен лимит попыток
  /// - [InvalidDataException] с `field: 'user'` — ошибка создания пользователя
  ///
  /// ### Безопасность
  /// - Пароль хэшируется с использованием bcrypt перед сохранением
  /// - Код верификации удаляется после успешного использования
  /// - Создаётся запись [AuthSession] для отслеживания сессии
  ///
  /// ### Пример использования
  /// ```dart
  /// final response = await client.auth.register(
  ///   RegisterRequest(
  ///     email: 'user@example.com',
  ///     code: '123456',
  ///     password: 'securePassword123',
  ///   ),
  /// );
  /// // Сохранить токены и данные пользователя
  /// ```
  _i2.Future<_i20.AuthResponse> register({
    required _i21.RegisterRequest request,
  }) => caller.callServerEndpoint<_i20.AuthResponse>(
    'auth',
    'register',
    {'request': request},
    authenticated: false,
  );

  /// Аутентифицирует пользователя по email и паролю.
  ///
  /// **Не требует авторизации** — выполняет вход в систему.
  ///
  /// Проверяет учётные данные и создаёт новую сессию с токенами.
  /// Обновляет поле `lastLoginAt` пользователя.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос со следующими полями:
  ///   - `email` — email пользователя
  ///   - `password` — пароль
  ///
  /// ### Возвращает
  /// [AuthResponse] со следующими полями:
  /// - `accessToken` — JWT токен доступа (время жизни: 1 час)
  /// - `refreshToken` — токен обновления (время жизни: 30 дней)
  /// - `user` — публичные данные пользователя [UserPublic]
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'credentials'` — неверный email или пароль
  /// - [InvalidDataException] с `field: 'account'` — аккаунт заблокирован
  /// - [InvalidDataException] с `field: 'user'` — ошибка идентификации
  ///
  /// ### Безопасность
  /// - Пароль проверяется через bcrypt сравнение с хэшем
  /// - Сообщение об ошибке не раскрывает, что именно неверно (email или пароль)
  /// - Создаётся новая запись [AuthSession] для каждого входа
  ///
  /// ### Пример использования
  /// ```dart
  /// try {
  ///   final response = await client.auth.login(
  ///     LoginRequest(email: 'user@example.com', password: 'password123'),
  ///   );
  ///   // Сохранить токены
  /// } on InvalidDataException catch (e) {
  ///   // Показать ошибку
  /// }
  /// ```
  _i2.Future<_i20.AuthResponse> login({required _i22.LoginRequest request}) =>
      caller.callServerEndpoint<_i20.AuthResponse>(
        'auth',
        'login',
        {'request': request},
        authenticated: false,
      );

  /// Обновляет пару токенов доступа с использованием refresh token.
  ///
  /// **Не требует авторизации** — использует refresh token для обновления.
  ///
  /// Реализует паттерн **Refresh Token Rotation**: при каждом обновлении
  /// генерируется новая пара токенов, а старые становятся недействительными.
  /// Это повышает безопасность, ограничивая время жизни скомпрометированных токенов.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос с полем `refreshToken`
  ///
  /// ### Возвращает
  /// [TokenPairResponse] со следующими полями:
  /// - `accessToken` — новый JWT токен доступа (время жизни: 1 час)
  /// - `refreshToken` — новый токен обновления (время жизни: 30 дней)
  ///
  /// - [InvalidDataException] с `field: 'refreshToken'` — токен недействителен,
  ///   истёк или сессия была завершена
  ///
  /// ### Жизненный цикл токенов
  /// - **Access Token**: 1 час — для аутентификации API запросов
  /// - **Refresh Token**: 30 дней — только для получения новых токенов
  ///
  /// ### Пример использования
  /// ```dart
  /// // При получении 401 ошибки
  /// final newTokens = await client.auth.refreshTokens(
  ///   RefreshTokenRequest(refreshToken: storedRefreshToken),
  /// );
  /// // Заменить старые токены на новые
  /// ```
  _i2.Future<_i23.TokenPairResponse> refreshTokens({
    required _i24.RefreshTokenRequest request,
  }) => caller.callServerEndpoint<_i23.TokenPairResponse>(
    'auth',
    'refreshTokens',
    {'request': request},
    authenticated: false,
  );

  /// Завершает текущую сессию пользователя (выход из системы).
  ///
  /// **Требует авторизации** — access token должен быть валидным.
  ///
  /// Деактивирует сессию, связанную с переданным access token.
  /// После вызова токены этой сессии становятся недействительными.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [accessToken] — текущий токен доступа пользователя
  ///
  /// ### Возвращает
  /// [SuccessResponse] с `success: true` независимо от того, была ли найдена сессия.
  /// Это предотвращает утечку информации о существовании сессий.
  ///
  /// ### Побочные эффекты
  /// - Устанавливает `isActive: false` для записи [AuthSession]
  /// - Записывает время отзыва в `revokedAt`
  ///
  /// ### Пример использования
  /// ```dart
  /// await client.auth.logout(currentAccessToken);
  /// // Очистить локальное хранилище токенов
  /// ```
  _i2.Future<_i7.SuccessResponse> logout() =>
      caller.callServerEndpoint<_i7.SuccessResponse>(
        'auth',
        'logout',
        {},
      );

  /// Завершает все активные сессии пользователя на всех устройствах.
  ///
  /// **Требует авторизации** — access token должен быть валидным.
  ///
  /// Используется для повышения безопасности, например после смены пароля
  /// или при подозрении на компрометацию аккаунта. Деактивирует все сессии,
  /// включая текущую.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [accessToken] — текущий токен доступа для идентификации пользователя
  ///
  /// ### Возвращает
  /// [SuccessResponse] со следующими полями:
  /// - `success: true` — операция выполнена успешно
  /// - `message` — информационное сообщение
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'session'` — текущая сессия недействительна
  ///
  /// ### Побочные эффекты
  /// - Деактивирует **все** записи [AuthSession] пользователя
  /// - После вызова клиент должен выполнить повторный вход
  ///
  /// ### Пример использования
  /// ```dart
  /// // После смены пароля — принудительный выход везде
  /// await client.auth.logoutAll(currentAccessToken);
  /// // Перенаправить на экран входа
  /// ```
  _i2.Future<_i7.SuccessResponse> logoutAll() =>
      caller.callServerEndpoint<_i7.SuccessResponse>(
        'auth',
        'logoutAll',
        {},
      );

  /// Получает информацию о текущем пользователе.
  ///
  /// Проверяет access token и возвращает публичные данные пользователя.
  ///
  /// **Параметры:**
  /// - `accessToken` — JWT-токен для авторизации.
  ///
  /// **Возвращает:** [UserPublic] — публичные данные текущего пользователя.
  ///
  /// **Исключения:**
  /// - [UnauthorizedException] — если токен недействителен или истёк.
  /// - [InvalidDataException] — если токен недействителен, истёк или пользователь не найден.
  ///
  /// **Пример использования:**
  /// ```dart
  /// final user = await client.auth.getCurrentUser('access_token');
  /// print(user.email);
  /// ```
  _i2.Future<_i25.UserPublic> getCurrentUser() =>
      caller.callServerEndpoint<_i25.UserPublic>(
        'auth',
        'getCurrentUser',
        {},
      );
}

/// Базовый эндпоинт, требующий аутентификации.
///
/// Все эндпоинты, наследующиеся от этого класса, автоматически
/// требуют валидный токен доступа. Serverpod проверит токен
/// перед вызовом любого метода.
///
/// ### Использование
/// ```dart
/// class UserEndpoint extends LoggedInEndpoint {
///   Future<UserData> getData(Session session) async {
///     // session.authenticated гарантированно не null
///     final userId = (await session.authenticated)!.userId;
///     // ...
///   }
/// }
/// ```
///
/// ### Публичные методы в защищённом эндпоинте
/// Если нужен отдельный публичный метод, пометьте его:
/// ```dart
/// @unauthenticatedClientCall
/// Future<String> publicMethod(Session session) async {
///   return 'доступно всем';
/// }
/// ```
/// {@category Endpoint}
abstract class EndpointLoggedIn extends _i1.EndpointRef {
  EndpointLoggedIn(_i1.EndpointCaller caller) : super(caller);
}

/// Эндпоинт для управления сессиями пользователя.
///
/// Предоставляет функционал для:
/// - Просмотра всех активных сессий текущего пользователя
/// - Завершения конкретной сессии
/// - Завершения всех сессий кроме текущей
///
/// Наследуется от [LoggedInEndpoint] — авторизация через заголовок.
/// {@category Endpoint}
class EndpointSession extends EndpointLoggedIn {
  EndpointSession(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'session';

  /// Получить список всех активных сессий текущего пользователя.
  ///
  /// Возвращает информацию о каждой сессии включая:
  /// - Устройство, браузер, IP адрес
  /// - Дату создания и последней активности
  /// - Признак текущей сессии
  /// - Геолокацию (город, страна) если доступна
  ///
  /// ### Возвращает
  /// Список [SessionInfo] со всеми активными сессиями пользователя.
  _i2.Future<List<_i26.SessionInfo>> getActiveSessions() =>
      caller.callServerEndpoint<List<_i26.SessionInfo>>(
        'session',
        'getActiveSessions',
        {},
      );

  /// Завершить конкретную сессию по её ID.
  ///
  /// Помечает сессию как неактивную (`isActive = false`) и
  /// устанавливает время отзыва (`revokedAt`).
  ///
  /// Нельзя завершить текущую сессию этим методом.
  /// Для этого используйте метод `logout` из [AuthEndpoint].
  _i2.Future<_i7.SuccessResponse> terminateSession({
    required _i27.TerminateSessionRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'session',
    'terminateSession',
    {'request': request},
  );

  /// Завершить все сессии пользователя кроме текущей.
  _i2.Future<_i7.SuccessResponse> terminateAllOtherSessions() =>
      caller.callServerEndpoint<_i7.SuccessResponse>(
        'session',
        'terminateAllOtherSessions',
        {},
      );
}

/// Эндпоинт для управления командами.
///
/// Предоставляет функционал для:
/// - Создания и редактирования команд
/// - Приглашения участников и управления ролями
/// - Принятия/отклонения приглашений
/// - Передачи владения командой
/// - Удаления команд с опциями сохранения приложений
///
/// Наследуется от [LoggedInEndpoint] — авторизация через заголовок.
///
/// ## Роли и права доступа
/// - **owner** — полный доступ, включая удаление команды
/// - **admin** — управление участниками и приложениями
/// - **developer** — создание и редактирование версий
/// - **observer** — только просмотр
/// {@category Endpoint}
class EndpointTeam extends EndpointLoggedIn {
  EndpointTeam(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'team';

  /// Создать новую команду.
  ///
  /// Создатель автоматически становится владельцем команды.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД
  /// - [accessToken] — access token текущего пользователя
  /// - [request] — данные для создания команды (название, описание)
  ///
  /// ### Возвращает
  /// Созданную [Team] с полной информацией.
  ///
  /// ### Исключения
  /// - [InvalidDataException] если название пустое или слишком короткое
  _i2.Future<_i28.Team> createTeam({required _i29.CreateTeamRequest request}) =>
      caller.callServerEndpoint<_i28.Team>(
        'team',
        'createTeam',
        {'request': request},
      );

  /// Обновить информацию о команде.
  ///
  /// Доступно только владельцу и администраторам команды.
  _i2.Future<_i28.Team> updateTeam({required _i30.UpdateTeamRequest request}) =>
      caller.callServerEndpoint<_i28.Team>(
        'team',
        'updateTeam',
        {'request': request},
      );

  /// Получить команду по ID.
  ///
  /// Доступно только активным участникам команды.
  _i2.Future<_i28.Team> getTeam({required _i1.UuidValue teamId}) =>
      caller.callServerEndpoint<_i28.Team>(
        'team',
        'getTeam',
        {'teamId': teamId},
      );

  /// Получить список всех команд пользователя.
  ///
  /// Возвращает команды, где пользователь является активным участником.
  /// Команды с приглашениями (status = invited) не включаются.
  _i2.Future<List<_i28.Team>> getMyTeams() =>
      caller.callServerEndpoint<List<_i28.Team>>(
        'team',
        'getMyTeams',
        {},
      );

  /// Пригласить участника в команду.
  ///
  /// Отправляет приглашение пользователю по email.
  /// Доступно владельцу и администраторам.
  _i2.Future<_i7.SuccessResponse> inviteMember({
    required _i31.InviteTeamMemberRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'inviteMember',
    {'request': request},
  );

  /// Получить список приглашений для текущего пользователя.
  ///
  /// Возвращает все активные приглашения в команды.
  _i2.Future<List<_i32.TeamMember>> getMyInvitations() =>
      caller.callServerEndpoint<List<_i32.TeamMember>>(
        'team',
        'getMyInvitations',
        {},
      );

  /// Принять или отклонить приглашение в команду.
  _i2.Future<_i7.SuccessResponse> respondToInvitation({
    required _i33.RespondToInvitationRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'respondToInvitation',
    {'request': request},
  );

  /// Отозвать приглашение.
  ///
  /// Доступно владельцу и администраторам.
  _i2.Future<_i7.SuccessResponse> revokeInvitation({
    required _i34.RevokeInvitationRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'revokeInvitation',
    {'request': request},
  );

  /// Получить список участников команды.
  ///
  /// Возвращает всех участников (активных и приглашённых).
  /// Доступно всем активным участникам команды.
  _i2.Future<List<_i32.TeamMember>> getTeamMembers({
    required _i1.UuidValue teamId,
  }) => caller.callServerEndpoint<List<_i32.TeamMember>>(
    'team',
    'getTeamMembers',
    {'teamId': teamId},
  );

  /// Изменить роль участника команды.
  ///
  /// Доступно владельцу и администраторам (с ограничениями).
  _i2.Future<_i7.SuccessResponse> updateMemberRole({
    required _i35.UpdateMemberRoleRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'updateMemberRole',
    {'request': request},
  );

  /// Удалить участника из команды.
  ///
  /// Доступно владельцу и администраторам.
  _i2.Future<_i7.SuccessResponse> removeMember({
    required _i36.RemoveMemberRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'removeMember',
    {'request': request},
  );

  /// Покинуть команду.
  ///
  /// Владелец не может покинуть команду — нужно сначала передать владение.
  _i2.Future<_i7.SuccessResponse> leaveTeam({
    required _i37.LeaveTeamRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'leaveTeam',
    {'request': request},
  );

  /// Передать владение командой другому активному участнику.
  ///
  /// Доступно только владельцу.
  /// После передачи бывший владелец становится администратором.
  _i2.Future<_i7.SuccessResponse> transferOwnership({
    required _i38.TransferTeamOwnershipRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'transferOwnership',
    {'request': request},
  );

  /// Удалить команду.
  ///
  /// Доступно только владельцу.
  /// Позволяет выбрать: удалить все приложения или забрать себе.
  ///
  /// ### Параметры
  /// - [request.teamId] — ID команды
  /// - [request.transferAppsToOwner] — true = забрать приложения, false = удалить
  /// - [request.confirmationName] — название команды для подтверждения
  _i2.Future<_i7.SuccessResponse> deleteTeam({
    required _i39.DeleteTeamRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'team',
    'deleteTeam',
    {'request': request},
  );
}

/// Эндпоинт для управления версиями приложений.
///
/// Предоставляет функционал для:
/// - Получения списка версий приложения
/// - Создания, редактирования и удаления версий
/// - Быстрой блокировки/разблокировки версий
/// - Установки рекомендуемой версии для обновления
/// - Получения детальной информации о версии
/// - Получения следующего номера сборки
///
/// Наследуется от [LoggedInEndpoint] — требует авторизации.
/// {@category Endpoint}
class EndpointVersion extends EndpointLoggedIn {
  EndpointVersion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'version';

  /// Получить список всех версий приложения.
  ///
  /// Возвращает приложение с информацией и список версий,
  /// отсортированный по номеру сборки по убыванию (самая новая сверху).
  /// Для каждой версии подсчитывается количество активных пользователей.
  _i2.Future<_i40.VersionListResponse> getVersions({
    required _i1.UuidValue applicationId,
  }) => caller.callServerEndpoint<_i40.VersionListResponse>(
    'version',
    'getVersions',
    {'applicationId': applicationId},
  );

  /// Получить детальную информацию о версии (для редактирования).
  ///
  /// Возвращает полную информацию о версии, включая:
  /// - Является ли версия самой новой
  /// - Список более новых версий (для выбора рекомендуемой)
  /// - Количество активных пользователей
  /// - Количество версий, рекомендующих обновление на эту
  _i2.Future<_i41.VersionDetailResponse> getVersionDetail({
    required _i1.UuidValue versionId,
  }) => caller.callServerEndpoint<_i41.VersionDetailResponse>(
    'version',
    'getVersionDetail',
    {'versionId': versionId},
  );

  /// Получить следующий рекомендуемый номер сборки.
  ///
  /// Возвращает текущий максимальный номер сборки и предложенный следующий.
  _i2.Future<_i42.NextBuildNumberResponse> getNextBuildNumber({
    required _i1.UuidValue applicationId,
  }) => caller.callServerEndpoint<_i42.NextBuildNumberResponse>(
    'version',
    'getNextBuildNumber',
    {'applicationId': applicationId},
  );

  /// Создать новую версию приложения.
  ///
  /// Принимает только базовые поля:
  /// - Номер версии (формат MAJOR.MINOR.PATCH)
  /// - Номер сборки (уникальное положительное число)
  /// - Описание изменений (changelog)
  ///
  /// Блокировка, рекомендации и настройки частоты при создании недоступны.
  _i2.Future<_i43.Version> createVersion({
    required _i44.CreateVersionRequest request,
  }) => caller.callServerEndpoint<_i43.Version>(
    'version',
    'createVersion',
    {'request': request},
  );

  /// Обновить данные версии.
  ///
  /// Базовые поля (versionNumber, buildNumber, changelog) доступны всегда.
  /// Дополнительные поля (блокировка, рекомендация, частота) доступны
  /// только если версия не является самой новой.
  _i2.Future<_i43.Version> updateVersion({
    required _i45.UpdateVersionRequest request,
  }) => caller.callServerEndpoint<_i43.Version>(
    'version',
    'updateVersion',
    {'request': request},
  );

  /// Быстрая блокировка/разблокировка версии.
  ///
  /// Переключатель в карточке/строке версии.
  /// Недоступна для самой новой версии.
  _i2.Future<_i43.Version> toggleVersionBlock({
    required _i46.ToggleVersionBlockRequest request,
  }) => caller.callServerEndpoint<_i43.Version>(
    'version',
    'toggleVersionBlock',
    {'request': request},
  );

  /// Установить или снять рекомендуемую версию для обновления.
  ///
  /// Позволяет указать рекомендуемую версию и настройки частоты показа.
  /// Доступно только если версия не самая новая.
  _i2.Future<_i43.Version> setVersionRecommendation({
    required _i47.SetVersionRecommendationRequest request,
  }) => caller.callServerEndpoint<_i43.Version>(
    'version',
    'setVersionRecommendation',
    {'request': request},
  );

  /// Удалить версию приложения.
  ///
  /// Ограничения:
  /// - Нельзя удалить последнюю оставшуюся версию приложения
  /// - При удалении версии, которая рекомендуется другим, возвращается
  ///   предупреждение (но удаление проходит, т.к. onDelete=SetNull)
  _i2.Future<_i7.SuccessResponse> deleteVersion({
    required _i48.DeleteVersionRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'version',
    'deleteVersion',
    {'request': request},
  );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
///
/// **Требует авторизации** — наследуется от [LoggedInEndpoint].
/// {@category Endpoint}
class EndpointGreeting extends EndpointLoggedIn {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i49.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i49.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    @Deprecated(
      'Use authKeyProvider instead. This will be removed in future releases.',
    )
    super.authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
         host,
         _i50.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    app = EndpointApp(this);
    auth = EndpointAuth(this);
    session = EndpointSession(this);
    team = EndpointTeam(this);
    version = EndpointVersion(this);
    greeting = EndpointGreeting(this);
  }

  late final EndpointApp app;

  late final EndpointAuth auth;

  late final EndpointSession session;

  late final EndpointTeam team;

  late final EndpointVersion version;

  late final EndpointGreeting greeting;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'app': app,
    'auth': auth,
    'session': session,
    'team': team,
    'version': version,
    'greeting': greeting,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
