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
import 'package:version_manager_client/src/protocol/app_check_response.dart'
    as _i3;
import 'package:version_manager_client/src/protocol/enums/platform.dart' as _i4;
import 'package:version_manager_client/src/protocol/application.dart' as _i5;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i6;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i7;
import 'package:version_manager_client/src/protocol/app_version.dart' as _i8;
import 'package:version_manager_client/src/protocol/store_links.dart' as _i9;
import 'package:version_manager_client/src/protocol/greetings/greeting.dart'
    as _i10;
import 'protocol.dart' as _i11;

/// {@category Endpoint}
class EndpointAppCheck extends _i1.EndpointRef {
  EndpointAppCheck(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appCheck';

  /// Проверка версии приложения клиента
  ///
  /// Принимает информацию о текущей версии клиента и возвращает:
  /// - Заблокирована ли эта версия
  /// - Информацию о последней доступной версии
  /// - Ссылки на магазины для обновления
  _i2.Future<_i3.AppCheckResponse> checkVersion({
    required String packageName,
    required String currentVersion,
    required String currentBuildNumber,
    required _i4.Platform platform,
  }) => caller.callServerEndpoint<_i3.AppCheckResponse>(
    'appCheck',
    'checkVersion',
    {
      'packageName': packageName,
      'currentVersion': currentVersion,
      'currentBuildNumber': currentBuildNumber,
      'platform': platform,
    },
  );
}

/// {@category Endpoint}
class EndpointApplication extends _i1.EndpointRef {
  EndpointApplication(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'application';

  /// Добавление нового приложения.
  ///
  _i2.Future<List<_i5.Application>> addAplication({
    required _i5.Application application,
  }) => caller.callServerEndpoint<List<_i5.Application>>(
    'application',
    'addAplication',
    {'application': application},
  );

  /// Получение списка всех приложений.
  ///
  _i2.Future<List<_i5.Application>> getAllApplications() =>
      caller.callServerEndpoint<List<_i5.Application>>(
        'application',
        'getAllApplications',
        {},
      );

  /// Редактирование приложения.
  ///
  _i2.Future<List<_i5.Application>> editApplication({
    required String changeablePackageName,
    required _i5.Application application,
  }) => caller.callServerEndpoint<List<_i5.Application>>(
    'application',
    'editApplication',
    {
      'changeablePackageName': changeablePackageName,
      'application': application,
    },
  );

  /// Деактивация/Активация приложения.
  ///
  _i2.Future<List<_i5.Application>> deactivateApplication({
    required String packageName,
    required bool isActive,
  }) => caller.callServerEndpoint<List<_i5.Application>>(
    'application',
    'deactivateApplication',
    {
      'packageName': packageName,
      'isActive': isActive,
    },
  );

  /// Удаление приложения.
  ///
  _i2.Future<List<_i5.Application>> deleteApplication({
    required String packageName,
  }) => caller.callServerEndpoint<List<_i5.Application>>(
    'application',
    'deleteApplication',
    {'packageName': packageName},
  );
}

/// {@category Endpoint}
class EndpointEmailIdp extends _i6.EndpointEmailIdpBase {
  EndpointEmailIdp(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<_i7.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_i7.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _i2.Future<_i1.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _i2.Future<String> verifyRegistrationCode({
    required _i1.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _i2.Future<_i7.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_i7.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _i2.Future<_i1.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_i1.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _i2.Future<String> verifyPasswordResetCode({
    required _i1.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _i2.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );
}

/// {@category Endpoint}
class EndpointRefreshJwtTokens extends _i7.EndpointRefreshJwtTokens {
  EndpointRefreshJwtTokens(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'refreshJwtTokens';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _i2.Future<_i7.AuthSuccess> refreshAccessToken({
    required String refreshToken,
  }) => caller.callServerEndpoint<_i7.AuthSuccess>(
    'refreshJwtTokens',
    'refreshAccessToken',
    {'refreshToken': refreshToken},
    authenticated: false,
  );
}

/// {@category Endpoint}
class EndpointVersion extends _i1.EndpointRef {
  EndpointVersion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'version';

  /// Добавление новой версии приложения.
  ///
  _i2.Future<List<_i8.AppVersion>> addVersion({
    required _i1.UuidValue applicationId,
    required String version,
    required int buildNumber,
    required String changelog,
    List<_i4.Platform>? platforms,
    List<_i9.StoreLinks>? storeLinks,
  }) => caller.callServerEndpoint<List<_i8.AppVersion>>(
    'version',
    'addVersion',
    {
      'applicationId': applicationId,
      'version': version,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'platforms': platforms,
      'storeLinks': storeLinks,
    },
  );

  /// Получение списка версий всех платформ с сортировкой по версии и сборке
  ///
  _i2.Future<List<_i8.AppVersion>> getAllVersions() =>
      caller.callServerEndpoint<List<_i8.AppVersion>>(
        'version',
        'getAllVersions',
        {},
      );

  /// Получение списка версий по фильтрам с сортировкой
  _i2.Future<List<_i8.AppVersion>> getVersionsByFilters({
    required _i1.UuidValue applicationId,
    _i4.Platform? platform,
  }) => caller.callServerEndpoint<List<_i8.AppVersion>>(
    'version',
    'getVersionsByFilters',
    {
      'applicationId': applicationId,
      'platform': platform,
    },
  );

  /// Обновление существующей версии приложения
  ///
  /// Все поля версии будут обновлены. Объект должен содержать валидный id.
  _i2.Future<List<_i8.AppVersion>> updateVersion({
    required _i8.AppVersion appVersion,
  }) => caller.callServerEndpoint<List<_i8.AppVersion>>(
    'version',
    'updateVersion',
    {'appVersion': appVersion},
  );

  /// Блокирования/Разблокирование версии приложения
  ///
  _i2.Future<List<_i8.AppVersion>> blockUnblockVersion({
    required _i1.UuidValue id,
    required bool isBlocked,
    required String reason,
  }) => caller.callServerEndpoint<List<_i8.AppVersion>>(
    'version',
    'blockUnblockVersion',
    {
      'id': id,
      'isBlocked': isBlocked,
      'reason': reason,
    },
  );

  /// Удаление версии приложения по id
  ///
  _i2.Future<List<_i8.AppVersion>> deleteVersion({
    required _i8.AppVersion version,
  }) => caller.callServerEndpoint<List<_i8.AppVersion>>(
    'version',
    'deleteVersion',
    {'version': version},
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
  _i2.Future<_i10.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i10.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _i6.Caller(client);
    serverpod_auth_core = _i7.Caller(client);
  }

  late final _i6.Caller serverpod_auth_idp;

  late final _i7.Caller serverpod_auth_core;
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
         _i11.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
       ) {
    appCheck = EndpointAppCheck(this);
    application = EndpointApplication(this);
    emailIdp = EndpointEmailIdp(this);
    refreshJwtTokens = EndpointRefreshJwtTokens(this);
    version = EndpointVersion(this);
    greeting = EndpointGreeting(this);
    modules = Modules(this);
  }

  late final EndpointAppCheck appCheck;

  late final EndpointApplication application;

  late final EndpointEmailIdp emailIdp;

  late final EndpointRefreshJwtTokens refreshJwtTokens;

  late final EndpointVersion version;

  late final EndpointGreeting greeting;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
    'appCheck': appCheck,
    'application': application,
    'emailIdp': emailIdp,
    'refreshJwtTokens': refreshJwtTokens,
    'version': version,
    'greeting': greeting,
  };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
