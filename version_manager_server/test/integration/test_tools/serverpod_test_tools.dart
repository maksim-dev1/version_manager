/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: no_leading_underscores_for_local_identifiers

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_test/serverpod_test.dart' as _i1;
import 'package:serverpod/serverpod.dart' as _i2;
import 'dart:async' as _i3;
import 'package:version_manager_server/src/generated/auth/check_email_and_send_code_response.dart'
    as _i4;
import 'package:version_manager_server/src/generated/auth/check_email.dart'
    as _i5;
import 'package:version_manager_server/src/generated/auth/send_code_response.dart'
    as _i6;
import 'package:version_manager_server/src/generated/auth/register_send_code.dart'
    as _i7;
import 'package:version_manager_server/src/generated/auth/common_success.dart'
    as _i8;
import 'package:version_manager_server/src/generated/auth/register_verify_code.dart'
    as _i9;
import 'package:version_manager_server/src/generated/auth/auth_response.dart'
    as _i10;
import 'package:version_manager_server/src/generated/auth/register.dart'
    as _i11;
import 'package:version_manager_server/src/generated/auth/login.dart' as _i12;
import 'package:version_manager_server/src/generated/auth/token_pair_response.dart'
    as _i13;
import 'package:version_manager_server/src/generated/auth/refresh_token.dart'
    as _i14;
import 'package:version_manager_server/src/generated/auth/common.dart' as _i15;
import 'package:version_manager_server/src/generated/sessions/session_info.dart'
    as _i16;
import 'package:version_manager_server/src/generated/sessions/terminate_session_request.dart'
    as _i17;
import 'package:version_manager_server/src/generated/teams/team.dart' as _i18;
import 'package:version_manager_server/src/generated/teams/create_team_request.dart'
    as _i19;
import 'package:version_manager_server/src/generated/teams/update_team_request.dart'
    as _i20;
import 'package:version_manager_server/src/generated/teams/invite_team_member_request.dart'
    as _i21;
import 'package:version_manager_server/src/generated/teams/team_member.dart'
    as _i22;
import 'package:version_manager_server/src/generated/teams/respond_to_invitation_request.dart'
    as _i23;
import 'package:version_manager_server/src/generated/teams/revoke_invitation_request.dart'
    as _i24;
import 'package:version_manager_server/src/generated/teams/update_member_role_request.dart'
    as _i25;
import 'package:version_manager_server/src/generated/teams/remove_member_request.dart'
    as _i26;
import 'package:version_manager_server/src/generated/teams/leave_team_request.dart'
    as _i27;
import 'package:version_manager_server/src/generated/teams/transfer_team_ownership_request.dart'
    as _i28;
import 'package:version_manager_server/src/generated/teams/delete_team_request.dart'
    as _i29;
import 'package:version_manager_server/src/generated/greetings/greeting.dart'
    as _i30;
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/generated/endpoints.dart';
export 'package:serverpod_test/serverpod_test_public_exports.dart';

/// Creates a new test group that takes a callback that can be used to write tests.
/// The callback has two parameters: `sessionBuilder` and `endpoints`.
/// `sessionBuilder` is used to build a `Session` object that represents the server state during an endpoint call and is used to set up scenarios.
/// `endpoints` contains all your Serverpod endpoints and lets you call them:
/// ```dart
/// withServerpod('Given Example endpoint', (sessionBuilder, endpoints) {
///   test('when calling `hello` then should return greeting', () async {
///     final greeting = await endpoints.example.hello(sessionBuilder, 'Michael');
///     expect(greeting, 'Hello Michael');
///   });
/// });
/// ```
///
/// **Configuration options**
///
/// [applyMigrations] Whether pending migrations should be applied when starting Serverpod. Defaults to `true`
///
/// [enableSessionLogging] Whether session logging should be enabled. Defaults to `false`
///
/// [rollbackDatabase] Options for when to rollback the database during the test lifecycle.
/// By default `withServerpod` does all database operations inside a transaction that is rolled back after each `test` case.
/// Just like the following enum describes, the behavior of the automatic rollbacks can be configured:
/// ```dart
/// /// Options for when to rollback the database during the test lifecycle.
/// enum RollbackDatabase {
///   /// After each test. This is the default.
///   afterEach,
///
///   /// After all tests.
///   afterAll,
///
///   /// Disable rolling back the database.
///   disabled,
/// }
/// ```
///
/// [runMode] The run mode that Serverpod should be running in. Defaults to `test`.
///
/// [serverpodLoggingMode] The logging mode used when creating Serverpod. Defaults to `ServerpodLoggingMode.normal`
///
/// [serverpodStartTimeout] The timeout to use when starting Serverpod, which connects to the database among other things. Defaults to `Duration(seconds: 30)`.
///
/// [testServerOutputMode] Options for controlling test server output during test execution. Defaults to `TestServerOutputMode.normal`.
/// ```dart
/// /// Options for controlling test server output during test execution.
/// enum TestServerOutputMode {
///   /// Default mode - only stderr is printed (stdout suppressed).
///   /// This hides normal startup/shutdown logs while preserving error messages.
///   normal,
///
///   /// All logging - both stdout and stderr are printed.
///   /// Useful for debugging when you need to see all server output.
///   verbose,
///
///   /// No logging - both stdout and stderr are suppressed.
///   /// Completely silent mode, useful when you don't want any server output.
///   silent,
/// }
/// ```
///
/// [testGroupTagsOverride] By default Serverpod test tools tags the `withServerpod` test group with `"integration"`.
/// This is to provide a simple way to only run unit or integration tests.
/// This property allows this tag to be overridden to something else. Defaults to `['integration']`.
///
/// [experimentalFeatures] Optionally specify experimental features. See [Serverpod] for more information.
@_i1.isTestGroup
void withServerpod(
  String testGroupName,
  _i1.TestClosure<TestEndpoints> testClosure, {
  bool? applyMigrations,
  bool? enableSessionLogging,
  _i2.ExperimentalFeatures? experimentalFeatures,
  _i1.RollbackDatabase? rollbackDatabase,
  String? runMode,
  _i2.RuntimeParametersListBuilder? runtimeParametersBuilder,
  _i2.ServerpodLoggingMode? serverpodLoggingMode,
  Duration? serverpodStartTimeout,
  List<String>? testGroupTagsOverride,
  _i1.TestServerOutputMode? testServerOutputMode,
}) {
  _i1.buildWithServerpod<_InternalTestEndpoints>(
    testGroupName,
    _i1.TestServerpod(
      testEndpoints: _InternalTestEndpoints(),
      endpoints: Endpoints(),
      serializationManager: Protocol(),
      runMode: runMode,
      applyMigrations: applyMigrations,
      isDatabaseEnabled: true,
      serverpodLoggingMode: serverpodLoggingMode,
      testServerOutputMode: testServerOutputMode,
      experimentalFeatures: experimentalFeatures,
      runtimeParametersBuilder: runtimeParametersBuilder,
    ),
    maybeRollbackDatabase: rollbackDatabase,
    maybeEnableSessionLogging: enableSessionLogging,
    maybeTestGroupTagsOverride: testGroupTagsOverride,
    maybeServerpodStartTimeout: serverpodStartTimeout,
    maybeTestServerOutputMode: testServerOutputMode,
  )(testClosure);
}

class TestEndpoints {
  late final _AuthEndpoint auth;

  late final _SessionEndpoint session;

  late final _TeamEndpoint team;

  late final _GreetingEndpoint greeting;
}

class _InternalTestEndpoints extends TestEndpoints
    implements _i1.InternalTestEndpoints {
  @override
  void initialize(
    _i2.SerializationManager serializationManager,
    _i2.EndpointDispatch endpoints,
  ) {
    auth = _AuthEndpoint(
      endpoints,
      serializationManager,
    );
    session = _SessionEndpoint(
      endpoints,
      serializationManager,
    );
    team = _TeamEndpoint(
      endpoints,
      serializationManager,
    );
    greeting = _GreetingEndpoint(
      endpoints,
      serializationManager,
    );
  }
}

class _AuthEndpoint {
  _AuthEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i4.CheckEmailAndSendCodeResponse> checkEmailAndSendCode(
    _i1.TestSessionBuilder sessionBuilder, {
    required _i5.CheckEmailRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'checkEmailAndSendCode',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'checkEmailAndSendCode',
          parameters: _i1.testObjectToJson({'request': request}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i4.CheckEmailAndSendCodeResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i6.SendCodeResponse> resendCode(
    _i1.TestSessionBuilder sessionBuilder, {
    required _i7.RegisterSendCodeRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'resendCode',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'resendCode',
          parameters: _i1.testObjectToJson({'request': request}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i6.SendCodeResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> verifyRegisterCode(
    _i1.TestSessionBuilder sessionBuilder, {
    required _i9.RegisterVerifyCodeRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'verifyRegisterCode',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'verifyRegisterCode',
          parameters: _i1.testObjectToJson({'request': request}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.AuthResponse> register(
    _i1.TestSessionBuilder sessionBuilder, {
    required _i11.RegisterRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'register',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'register',
          parameters: _i1.testObjectToJson({'request': request}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.AuthResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i10.AuthResponse> login(
    _i1.TestSessionBuilder sessionBuilder, {
    required _i12.LoginRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'login',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'login',
          parameters: _i1.testObjectToJson({'request': request}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i10.AuthResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i13.TokenPairResponse> refreshTokens(
    _i1.TestSessionBuilder sessionBuilder, {
    required _i14.RefreshTokenRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'refreshTokens',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'refreshTokens',
          parameters: _i1.testObjectToJson({'request': request}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i13.TokenPairResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> logout(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'logout',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'logout',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> logoutAll(
    _i1.TestSessionBuilder sessionBuilder, {
    required String accessToken,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'logoutAll',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'logoutAll',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i15.UserPublic> getCurrentUser(
    _i1.TestSessionBuilder sessionBuilder, {
    required String accessToken,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'auth',
            method: 'getCurrentUser',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'auth',
          methodName: 'getCurrentUser',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i15.UserPublic>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _SessionEndpoint {
  _SessionEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<List<_i16.SessionInfo>> getActiveSessions(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'session',
            method: 'getActiveSessions',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'session',
          methodName: 'getActiveSessions',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i16.SessionInfo>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> terminateSession(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i17.TerminateSessionRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'session',
            method: 'terminateSession',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'session',
          methodName: 'terminateSession',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> terminateAllOtherSessions(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'session',
            method: 'terminateAllOtherSessions',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'session',
          methodName: 'terminateAllOtherSessions',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _TeamEndpoint {
  _TeamEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i18.Team> createTeam(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i19.CreateTeamRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'createTeam',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'createTeam',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i18.Team>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i18.Team> updateTeam(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i20.UpdateTeamRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'updateTeam',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'updateTeam',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i18.Team>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i18.Team> getTeam(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i2.UuidValue teamId,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'getTeam',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'getTeam',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'teamId': teamId,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i18.Team>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i18.Team>> getMyTeams(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'getMyTeams',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'getMyTeams',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i18.Team>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> inviteMember(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i21.InviteTeamMemberRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'inviteMember',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'inviteMember',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i22.TeamMember>> getMyInvitations(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'getMyInvitations',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'getMyInvitations',
          parameters: _i1.testObjectToJson({'accessToken': accessToken}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i22.TeamMember>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> respondToInvitation(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i23.RespondToInvitationRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'respondToInvitation',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'respondToInvitation',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> revokeInvitation(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i24.RevokeInvitationRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'revokeInvitation',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'revokeInvitation',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<List<_i22.TeamMember>> getTeamMembers(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i2.UuidValue teamId,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'getTeamMembers',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'getTeamMembers',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'teamId': teamId,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<List<_i22.TeamMember>>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> updateMemberRole(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i25.UpdateMemberRoleRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'updateMemberRole',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'updateMemberRole',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> removeMember(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i26.RemoveMemberRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'removeMember',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'removeMember',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> leaveTeam(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i27.LeaveTeamRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'leaveTeam',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'leaveTeam',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> transferOwnership(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i28.TransferTeamOwnershipRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'transferOwnership',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'transferOwnership',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }

  _i3.Future<_i8.SuccessResponse> deleteTeam(
    _i1.TestSessionBuilder sessionBuilder,
    String accessToken, {
    required _i29.DeleteTeamRequest request,
  }) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'team',
            method: 'deleteTeam',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'team',
          methodName: 'deleteTeam',
          parameters: _i1.testObjectToJson({
            'accessToken': accessToken,
            'request': request,
          }),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i8.SuccessResponse>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}

class _GreetingEndpoint {
  _GreetingEndpoint(
    this._endpointDispatch,
    this._serializationManager,
  );

  final _i2.EndpointDispatch _endpointDispatch;

  final _i2.SerializationManager _serializationManager;

  _i3.Future<_i30.Greeting> hello(
    _i1.TestSessionBuilder sessionBuilder,
    String name,
  ) async {
    return _i1.callAwaitableFunctionAndHandleExceptions(() async {
      var _localUniqueSession =
          (sessionBuilder as _i1.InternalTestSessionBuilder).internalBuild(
            endpoint: 'greeting',
            method: 'hello',
          );
      try {
        var _localCallContext = await _endpointDispatch.getMethodCallContext(
          createSessionCallback: (_) => _localUniqueSession,
          endpointPath: 'greeting',
          methodName: 'hello',
          parameters: _i1.testObjectToJson({'name': name}),
          serializationManager: _serializationManager,
        );
        var _localReturnValue =
            await (_localCallContext.method.call(
                  _localUniqueSession,
                  _localCallContext.arguments,
                )
                as _i3.Future<_i30.Greeting>);
        return _localReturnValue;
      } finally {
        await _localUniqueSession.close();
      }
    });
  }
}
