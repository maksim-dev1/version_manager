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
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/auth_endpoint.dart' as _i2;
import '../greetings/greeting_endpoint.dart' as _i3;
import 'package:version_manager_server/src/generated/auth/check_email.dart'
    as _i4;
import 'package:version_manager_server/src/generated/auth/register_send_code.dart'
    as _i5;
import 'package:version_manager_server/src/generated/auth/register_verify_code.dart'
    as _i6;
import 'package:version_manager_server/src/generated/auth/register_set_password.dart'
    as _i7;
import 'package:version_manager_server/src/generated/auth/login.dart' as _i8;
import 'package:version_manager_server/src/generated/auth/refresh_token.dart'
    as _i9;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'auth': _i2.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'greeting': _i3.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'checkEmail': _i1.MethodConnector(
          name: 'checkEmail',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i4.CheckEmailRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).checkEmail(
                session,
                params['request'],
              ),
        ),
        'registerSendCode': _i1.MethodConnector(
          name: 'registerSendCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i5.RegisterSendCodeRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).registerSendCode(
                    session,
                    params['request'],
                  ),
        ),
        'registerVerifyCode': _i1.MethodConnector(
          name: 'registerVerifyCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i6.RegisterVerifyCodeRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).registerVerifyCode(
                    session,
                    params['request'],
                  ),
        ),
        'registerSetPassword': _i1.MethodConnector(
          name: 'registerSetPassword',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i7.RegisterSetPasswordRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).registerSetPassword(
                    session,
                    params['request'],
                  ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i8.LoginRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).login(
                session,
                params['request'],
              ),
        ),
        'refresh': _i1.MethodConnector(
          name: 'refresh',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.RefreshTokenRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).refresh(
                session,
                params['request'],
              ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).logout(
                session,
                params['accessToken'],
              ),
        ),
        'logoutAll': _i1.MethodConnector(
          name: 'logoutAll',
          params: {
            'accessToken': _i1.ParameterDescription(
              name: 'accessToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).logoutAll(
                session,
                params['accessToken'],
              ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['greeting'] as _i3.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
  }
}
