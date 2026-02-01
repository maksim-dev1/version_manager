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
import 'package:version_manager_client/src/protocol/dto/email_check_result.dart'
    as _i3;
import 'package:version_manager_client/src/protocol/dto/verification_code_sent_result.dart'
    as _i4;
import 'package:version_manager_client/src/protocol/dto/auth_response.dart'
    as _i5;
import 'package:version_manager_client/src/protocol/user.dart' as _i6;
import 'package:version_manager_client/src/protocol/greetings/greeting.dart'
    as _i7;
import 'protocol.dart' as _i8;

/// Endpoint для авторизации пользователей.
///
/// Поддерживает:
/// - Регистрацию через email с кодом подтверждения
/// - Вход по email и паролю
/// - Сброс пароля
/// - Управление сессиями
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// Проверяет существование email в системе.
  ///
  /// Возвращает:
  /// - exists: true если email уже зарегистрирован
  /// - canResendCode: true если можно отправить код (прошел cooldown)
  /// - resendAvailableAt: когда можно будет отправить код повторно
  _i2.Future<_i3.EmailCheckResult> checkEmail(String email) =>
      caller.callServerEndpoint<_i3.EmailCheckResult>(
        'auth',
        'checkEmail',
        {'email': email},
      );

  /// Начинает процесс регистрации.
  ///
  /// Отправляет код подтверждения на указанный email.
  /// Код действителен 10 минут, максимум 5 попыток ввода.
  ///
  /// Throws InvalidDataException если:
  /// - email невалидный
  /// - email уже зарегистрирован
  /// - не прошел cooldown (1 минута)
  _i2.Future<_i4.VerificationCodeSentResult> startRegistration(String email) =>
      caller.callServerEndpoint<_i4.VerificationCodeSentResult>(
        'auth',
        'startRegistration',
        {'email': email},
      );

  /// Завершает регистрацию.
  ///
  /// Проверяет код и создает нового пользователя.
  /// При успехе возвращает токены авторизации.
  ///
  /// [verificationId] - ID из startRegistration
  /// [code] - 6-значный код из email
  /// [password] - пароль (минимум 8 символов, буквы и цифры)
  _i2.Future<_i5.AuthResponse> completeRegistration({
    required int verificationId,
    required String code,
    required String password,
  }) => caller.callServerEndpoint<_i5.AuthResponse>(
    'auth',
    'completeRegistration',
    {
      'verificationId': verificationId,
      'code': code,
      'password': password,
    },
  );

  /// Вход по email и паролю.
  ///
  /// При успехе возвращает токены авторизации.
  _i2.Future<_i5.AuthResponse> login({
    required String email,
    required String password,
    String? deviceInfo,
  }) => caller.callServerEndpoint<_i5.AuthResponse>(
    'auth',
    'login',
    {
      'email': email,
      'password': password,
      'deviceInfo': deviceInfo,
    },
  );

  /// Начинает процесс сброса пароля.
  ///
  /// Отправляет код на email для сброса пароля.
  _i2.Future<_i4.VerificationCodeSentResult> startPasswordReset(String email) =>
      caller.callServerEndpoint<_i4.VerificationCodeSentResult>(
        'auth',
        'startPasswordReset',
        {'email': email},
      );

  /// Завершает сброс пароля.
  ///
  /// Устанавливает новый пароль и возвращает новые токены.
  /// Все старые сессии будут деактивированы.
  _i2.Future<_i5.AuthResponse> completePasswordReset({
    required int verificationId,
    required String code,
    required String newPassword,
  }) => caller.callServerEndpoint<_i5.AuthResponse>(
    'auth',
    'completePasswordReset',
    {
      'verificationId': verificationId,
      'code': code,
      'newPassword': newPassword,
    },
  );

  /// Проверяет токен и возвращает текущего пользователя.
  ///
  /// Используется для проверки авторизации на клиенте.
  _i2.Future<_i6.User?> validateToken(String token) =>
      caller.callServerEndpoint<_i6.User?>(
        'auth',
        'validateToken',
        {'token': token},
      );

  /// Обновляет токен используя refresh token.
  ///
  /// Возвращает новую пару токенов.
  _i2.Future<_i5.AuthResponse> refreshToken(String refreshToken) =>
      caller.callServerEndpoint<_i5.AuthResponse>(
        'auth',
        'refreshToken',
        {'refreshToken': refreshToken},
      );

  /// Выход из системы.
  ///
  /// Деактивирует текущую сессию.
  _i2.Future<void> logout(String token) => caller.callServerEndpoint<void>(
    'auth',
    'logout',
    {'token': token},
  );

  /// Выход со всех устройств.
  ///
  /// Деактивирует все сессии текущего пользователя.
  _i2.Future<void> logoutAll(String token) => caller.callServerEndpoint<void>(
    'auth',
    'logoutAll',
    {'token': token},
  );
}

/// Эндпоинт для управления профилем пользователя.
/// Требует валидной сессии авторизации.
/// {@category Endpoint}
class EndpointProfile extends _i1.EndpointRef {
  EndpointProfile(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'profile';

  /// Получить профиль текущего пользователя по токену.
  _i2.Future<_i6.User?> getProfile(String token) =>
      caller.callServerEndpoint<_i6.User?>(
        'profile',
        'getProfile',
        {'token': token},
      );

  /// Обновить профиль текущего пользователя.
  _i2.Future<_i6.User> updateProfile(
    String token, {
    String? firstName,
    String? lastName,
    String? displayName,
    String? phone,
  }) => caller.callServerEndpoint<_i6.User>(
    'profile',
    'updateProfile',
    {
      'token': token,
      'firstName': firstName,
      'lastName': lastName,
      'displayName': displayName,
      'phone': phone,
    },
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
  _i2.Future<_i7.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i7.Greeting>(
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
         _i8.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    auth = EndpointAuth(this);
    profile = EndpointProfile(this);
    greeting = EndpointGreeting(this);
  }

  late final EndpointAuth auth;

  late final EndpointProfile profile;

  late final EndpointGreeting greeting;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'auth': auth,
    'profile': profile,
    'greeting': greeting,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
