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
import '../endpoints/application_endpoint.dart' as _i2;
import '../endpoints/email_idp_endpoint.dart' as _i3;
import '../endpoints/refresh_jwt_tokens_endpoint.dart' as _i4;
import '../endpoints/version_endpoint.dart' as _i5;
import '../greetings/greeting_endpoint.dart' as _i6;
import 'package:version_manager_server/src/generated/application.dart' as _i7;
import 'package:version_manager_server/src/generated/enums/platform.dart'
    as _i8;
import 'package:version_manager_server/src/generated/store_links.dart' as _i9;
import 'package:version_manager_server/src/generated/app_version.dart' as _i10;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _i11;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i12;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'application': _i2.ApplicationEndpoint()
        ..initialize(
          server,
          'application',
          null,
        ),
      'emailIdp': _i3.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'refreshJwtTokens': _i4.RefreshJwtTokensEndpoint()
        ..initialize(
          server,
          'refreshJwtTokens',
          null,
        ),
      'version': _i5.VersionEndpoint()
        ..initialize(
          server,
          'version',
          null,
        ),
      'greeting': _i6.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['application'] = _i1.EndpointConnector(
      name: 'application',
      endpoint: endpoints['application']!,
      methodConnectors: {
        'addAplication': _i1.MethodConnector(
          name: 'addAplication',
          params: {
            'application': _i1.ParameterDescription(
              name: 'application',
              type: _i1.getType<_i7.Application>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['application'] as _i2.ApplicationEndpoint)
                  .addAplication(
                    session,
                    application: params['application'],
                  ),
        ),
        'getAllApplications': _i1.MethodConnector(
          name: 'getAllApplications',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['application'] as _i2.ApplicationEndpoint)
                  .getAllApplications(session),
        ),
        'editApplication': _i1.MethodConnector(
          name: 'editApplication',
          params: {
            'changeablePackageName': _i1.ParameterDescription(
              name: 'changeablePackageName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'application': _i1.ParameterDescription(
              name: 'application',
              type: _i1.getType<_i7.Application>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['application'] as _i2.ApplicationEndpoint)
                  .editApplication(
                    session,
                    changeablePackageName: params['changeablePackageName'],
                    application: params['application'],
                  ),
        ),
        'deactivateApplication': _i1.MethodConnector(
          name: 'deactivateApplication',
          params: {
            'packageName': _i1.ParameterDescription(
              name: 'packageName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isActive': _i1.ParameterDescription(
              name: 'isActive',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['application'] as _i2.ApplicationEndpoint)
                  .deactivateApplication(
                    session,
                    packageName: params['packageName'],
                    isActive: params['isActive'],
                  ),
        ),
        'deleteApplication': _i1.MethodConnector(
          name: 'deleteApplication',
          params: {
            'packageName': _i1.ParameterDescription(
              name: 'packageName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['application'] as _i2.ApplicationEndpoint)
                  .deleteApplication(
                    session,
                    packageName: params['packageName'],
                  ),
        ),
      },
    );
    connectors['emailIdp'] = _i1.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint).login(
                session,
                email: params['email'],
                password: params['password'],
              ),
        ),
        'startRegistration': _i1.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _i1.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _i1.ParameterDescription(
              name: 'accountRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _i1.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _i1.ParameterDescription(
              name: 'registrationToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _i1.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _i1.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _i1.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _i1.ParameterDescription(
              name: 'verificationCode',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _i1.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _i1.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'newPassword': _i1.ParameterDescription(
              name: 'newPassword',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _i3.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
      },
    );
    connectors['refreshJwtTokens'] = _i1.EndpointConnector(
      name: 'refreshJwtTokens',
      endpoint: endpoints['refreshJwtTokens']!,
      methodConnectors: {
        'refreshAccessToken': _i1.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _i1.ParameterDescription(
              name: 'refreshToken',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['refreshJwtTokens']
                          as _i4.RefreshJwtTokensEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['version'] = _i1.EndpointConnector(
      name: 'version',
      endpoint: endpoints['version']!,
      methodConnectors: {
        'addVersion': _i1.MethodConnector(
          name: 'addVersion',
          params: {
            'applicationId': _i1.ParameterDescription(
              name: 'applicationId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'version': _i1.ParameterDescription(
              name: 'version',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'buildNumber': _i1.ParameterDescription(
              name: 'buildNumber',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'changelog': _i1.ParameterDescription(
              name: 'changelog',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'platforms': _i1.ParameterDescription(
              name: 'platforms',
              type: _i1.getType<List<_i8.Platform>?>(),
              nullable: true,
            ),
            'storeLinks': _i1.ParameterDescription(
              name: 'storeLinks',
              type: _i1.getType<List<_i9.StoreLinks>?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i5.VersionEndpoint).addVersion(
                    session,
                    applicationId: params['applicationId'],
                    version: params['version'],
                    buildNumber: params['buildNumber'],
                    changelog: params['changelog'],
                    platforms: params['platforms'],
                    storeLinks: params['storeLinks'],
                  ),
        ),
        'getAllVersions': _i1.MethodConnector(
          name: 'getAllVersions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i5.VersionEndpoint)
                  .getAllVersions(session),
        ),
        'getVersionsByFilters': _i1.MethodConnector(
          name: 'getVersionsByFilters',
          params: {
            'applicationId': _i1.ParameterDescription(
              name: 'applicationId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'platform': _i1.ParameterDescription(
              name: 'platform',
              type: _i1.getType<_i8.Platform?>(),
              nullable: true,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i5.VersionEndpoint)
                  .getVersionsByFilters(
                    session,
                    applicationId: params['applicationId'],
                    platform: params['platform'],
                  ),
        ),
        'updateVersion': _i1.MethodConnector(
          name: 'updateVersion',
          params: {
            'appVersion': _i1.ParameterDescription(
              name: 'appVersion',
              type: _i1.getType<_i10.AppVersion>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i5.VersionEndpoint).updateVersion(
                    session,
                    appVersion: params['appVersion'],
                  ),
        ),
        'blockUnblockVersion': _i1.MethodConnector(
          name: 'blockUnblockVersion',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
            'isBlocked': _i1.ParameterDescription(
              name: 'isBlocked',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'reason': _i1.ParameterDescription(
              name: 'reason',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i5.VersionEndpoint)
                  .blockUnblockVersion(
                    session,
                    id: params['id'],
                    isBlocked: params['isBlocked'],
                    reason: params['reason'],
                  ),
        ),
        'deleteVersion': _i1.MethodConnector(
          name: 'deleteVersion',
          params: {
            'version': _i1.ParameterDescription(
              name: 'version',
              type: _i1.getType<_i10.AppVersion>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i5.VersionEndpoint).deleteVersion(
                    session,
                    version: params['version'],
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
              ) async => (endpoints['greeting'] as _i6.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _i11.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _i12.Endpoints()
      ..initializeEndpoints(server);
  }
}
