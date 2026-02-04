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
import 'package:version_manager_client/src/protocol/auth/check_email_and_send_code_response.dart'
    as _i3;
import 'package:version_manager_client/src/protocol/auth/check_email.dart'
    as _i4;
import 'package:version_manager_client/src/protocol/auth/send_code_response.dart'
    as _i5;
import 'package:version_manager_client/src/protocol/auth/register_send_code.dart'
    as _i6;
import 'package:version_manager_client/src/protocol/auth/common_success.dart'
    as _i7;
import 'package:version_manager_client/src/protocol/auth/register_verify_code.dart'
    as _i8;
import 'package:version_manager_client/src/protocol/auth/auth_response.dart'
    as _i9;
import 'package:version_manager_client/src/protocol/auth/register.dart' as _i10;
import 'package:version_manager_client/src/protocol/auth/login.dart' as _i11;
import 'package:version_manager_client/src/protocol/auth/token_pair_response.dart'
    as _i12;
import 'package:version_manager_client/src/protocol/auth/refresh_token.dart'
    as _i13;
import 'package:version_manager_client/src/protocol/greetings/greeting.dart'
    as _i14;
import 'protocol.dart' as _i15;

/// Эндпоинт аутентификации и авторизации пользователей.
///
/// Предоставляет полный цикл работы с учётными записями:
/// - Проверка существования email и отправка кода верификации
/// - Регистрация новых пользователей с подтверждением email
/// - Вход в систему по email и паролю
/// - Управление токенами доступа (refresh token rotation)
/// - Завершение сессий (logout)
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
/// - [logout] — завершение текущей сессии
/// - [logoutAll] — завершение всех сессий пользователя
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
  _i2.Future<_i3.CheckEmailAndSendCodeResponse> checkEmailAndSendCode({
    required _i4.CheckEmailRequest request,
  }) => caller.callServerEndpoint<_i3.CheckEmailAndSendCodeResponse>(
    'auth',
    'checkEmailAndSendCode',
    {'request': request},
  );

  /// Повторно отправляет код верификации на указанный email.
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
  _i2.Future<_i5.SendCodeResponse> resendCode({
    required _i6.RegisterSendCodeRequest request,
  }) => caller.callServerEndpoint<_i5.SendCodeResponse>(
    'auth',
    'resendCode',
    {'request': request},
  );

  /// Проверяет код регистрации без создания аккаунта.
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
    required _i8.RegisterVerifyCodeRequest request,
  }) => caller.callServerEndpoint<_i7.SuccessResponse>(
    'auth',
    'verifyRegisterCode',
    {'request': request},
  );

  /// Регистрирует нового пользователя с проверкой кода и автоматическим входом.
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
  _i2.Future<_i9.AuthResponse> register({
    required _i10.RegisterRequest request,
  }) => caller.callServerEndpoint<_i9.AuthResponse>(
    'auth',
    'register',
    {'request': request},
  );

  /// Аутентифицирует пользователя по email и паролю.
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
  _i2.Future<_i9.AuthResponse> login({required _i11.LoginRequest request}) =>
      caller.callServerEndpoint<_i9.AuthResponse>(
        'auth',
        'login',
        {'request': request},
      );

  /// Обновляет пару токенов доступа с использованием refresh token.
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
  /// ### Исключения
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
  _i2.Future<_i12.TokenPairResponse> refreshTokens({
    required _i13.RefreshTokenRequest request,
  }) => caller.callServerEndpoint<_i12.TokenPairResponse>(
    'auth',
    'refreshTokens',
    {'request': request},
  );

  /// Завершает текущую сессию пользователя (выход из системы).
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
  _i2.Future<_i7.SuccessResponse> logout(String accessToken) =>
      caller.callServerEndpoint<_i7.SuccessResponse>(
        'auth',
        'logout',
        {'accessToken': accessToken},
      );

  /// Завершает все активные сессии пользователя на всех устройствах.
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
  _i2.Future<_i7.SuccessResponse> logoutAll({required String accessToken}) =>
      caller.callServerEndpoint<_i7.SuccessResponse>(
        'auth',
        'logoutAll',
        {'accessToken': accessToken},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i14.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i14.Greeting>(
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
         _i15.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    auth = EndpointAuth(this);
    greeting = EndpointGreeting(this);
  }

  late final EndpointAuth auth;

  late final EndpointGreeting greeting;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'auth': auth,
    'greeting': greeting,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
