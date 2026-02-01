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
import 'package:version_manager_client/src/protocol/auth/check_email_response.dart'
    as _i3;
import 'package:version_manager_client/src/protocol/auth/check_email.dart'
    as _i4;
import 'package:version_manager_client/src/protocol/auth/send_code_response.dart'
    as _i5;
import 'package:version_manager_client/src/protocol/auth/register_send_code.dart'
    as _i6;
import 'package:version_manager_client/src/protocol/auth/verify_code_response.dart'
    as _i7;
import 'package:version_manager_client/src/protocol/auth/register_verify_code.dart'
    as _i8;
import 'package:version_manager_client/src/protocol/auth/auth_response.dart'
    as _i9;
import 'package:version_manager_client/src/protocol/auth/register_set_password.dart'
    as _i10;
import 'package:version_manager_client/src/protocol/auth/login.dart' as _i11;
import 'package:version_manager_client/src/protocol/auth/token_pair_response.dart'
    as _i12;
import 'package:version_manager_client/src/protocol/auth/refresh_token.dart'
    as _i13;
import 'package:version_manager_client/src/protocol/auth/common_success.dart'
    as _i14;
import 'package:version_manager_client/src/protocol/greetings/greeting.dart'
    as _i15;
import 'protocol.dart' as _i16;

/// Endpoint для авторизации и регистрации пользователей
/// {@category Endpoint}
class EndpointAuth extends _i1.EndpointRef {
  EndpointAuth(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'auth';

  /// 1. Проверка существования email (вход или регистрация?)
  _i2.Future<_i3.CheckEmailResponse> checkEmail(
    _i4.CheckEmailRequest request,
  ) => caller.callServerEndpoint<_i3.CheckEmailResponse>(
    'auth',
    'checkEmail',
    {'request': request},
  );

  /// 2. Регистрация: отправить код на email
  _i2.Future<_i5.SendCodeResponse> registerSendCode(
    _i6.RegisterSendCodeRequest request,
  ) => caller.callServerEndpoint<_i5.SendCodeResponse>(
    'auth',
    'registerSendCode',
    {'request': request},
  );

  /// 3. Регистрация: проверить код
  _i2.Future<_i7.VerifyCodeResponse> registerVerifyCode(
    _i8.RegisterVerifyCodeRequest request,
  ) => caller.callServerEndpoint<_i7.VerifyCodeResponse>(
    'auth',
    'registerVerifyCode',
    {'request': request},
  );

  /// 4. Регистрация: установить пароль и авторизоваться
  _i2.Future<_i9.AuthResponse> registerSetPassword(
    _i10.RegisterSetPasswordRequest request,
  ) => caller.callServerEndpoint<_i9.AuthResponse>(
    'auth',
    'registerSetPassword',
    {'request': request},
  );

  /// 5. Вход по email и паролю
  _i2.Future<_i9.AuthResponse> login(_i11.LoginRequest request) =>
      caller.callServerEndpoint<_i9.AuthResponse>(
        'auth',
        'login',
        {'request': request},
      );

  /// 6. Обновление токенов
  _i2.Future<_i12.TokenPairResponse> refresh(
    _i13.RefreshTokenRequest request,
  ) => caller.callServerEndpoint<_i12.TokenPairResponse>(
    'auth',
    'refresh',
    {'request': request},
  );

  /// 7. Выход (завершение текущей сессии)
  _i2.Future<_i14.SuccessResponse> logout(String accessToken) =>
      caller.callServerEndpoint<_i14.SuccessResponse>(
        'auth',
        'logout',
        {'accessToken': accessToken},
      );

  /// 8. Выход со всех устройств
  _i2.Future<_i14.SuccessResponse> logoutAll(String accessToken) =>
      caller.callServerEndpoint<_i14.SuccessResponse>(
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
  _i2.Future<_i15.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i15.Greeting>(
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
         _i16.Protocol(),
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
