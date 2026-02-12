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
import '../endpoints/app_endpoint.dart' as _i2;
import '../endpoints/auth_endpoint.dart' as _i3;
import '../endpoints/session_endpoint.dart' as _i4;
import '../endpoints/team_endpoint.dart' as _i5;
import '../endpoints/version_endpoint.dart' as _i6;
import '../greetings/greeting_endpoint.dart' as _i7;
import 'package:version_manager_server/src/generated/apps/create_application_request.dart'
    as _i8;
import 'package:version_manager_server/src/generated/apps/update_application_request.dart'
    as _i9;
import 'package:version_manager_server/src/generated/apps/delete_application_request.dart'
    as _i10;
import 'package:version_manager_server/src/generated/apps/request_api_key_regeneration_request.dart'
    as _i11;
import 'package:version_manager_server/src/generated/apps/regenerate_api_key_request.dart'
    as _i12;
import 'package:version_manager_server/src/generated/apps/toggle_application_status_request.dart'
    as _i13;
import 'package:version_manager_server/src/generated/apps/transfer_application_ownership_request.dart'
    as _i14;
import 'package:version_manager_server/src/generated/auth/check_email.dart'
    as _i15;
import 'package:version_manager_server/src/generated/auth/register_send_code.dart'
    as _i16;
import 'package:version_manager_server/src/generated/auth/register_verify_code.dart'
    as _i17;
import 'package:version_manager_server/src/generated/auth/register.dart'
    as _i18;
import 'package:version_manager_server/src/generated/auth/login.dart' as _i19;
import 'package:version_manager_server/src/generated/auth/refresh_token.dart'
    as _i20;
import 'package:version_manager_server/src/generated/sessions/terminate_session_request.dart'
    as _i21;
import 'package:version_manager_server/src/generated/teams/create_team_request.dart'
    as _i22;
import 'package:version_manager_server/src/generated/teams/update_team_request.dart'
    as _i23;
import 'package:version_manager_server/src/generated/teams/invite_team_member_request.dart'
    as _i24;
import 'package:version_manager_server/src/generated/teams/respond_to_invitation_request.dart'
    as _i25;
import 'package:version_manager_server/src/generated/teams/revoke_invitation_request.dart'
    as _i26;
import 'package:version_manager_server/src/generated/teams/update_member_role_request.dart'
    as _i27;
import 'package:version_manager_server/src/generated/teams/remove_member_request.dart'
    as _i28;
import 'package:version_manager_server/src/generated/teams/leave_team_request.dart'
    as _i29;
import 'package:version_manager_server/src/generated/teams/transfer_team_ownership_request.dart'
    as _i30;
import 'package:version_manager_server/src/generated/teams/delete_team_request.dart'
    as _i31;
import 'package:version_manager_server/src/generated/versions/create_version_request.dart'
    as _i32;
import 'package:version_manager_server/src/generated/versions/update_version_request.dart'
    as _i33;
import 'package:version_manager_server/src/generated/versions/toggle_version_block_request.dart'
    as _i34;
import 'package:version_manager_server/src/generated/versions/set_version_recommendation_request.dart'
    as _i35;
import 'package:version_manager_server/src/generated/versions/delete_version_request.dart'
    as _i36;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'app': _i2.AppEndpoint()
        ..initialize(
          server,
          'app',
          null,
        ),
      'auth': _i3.AuthEndpoint()
        ..initialize(
          server,
          'auth',
          null,
        ),
      'session': _i4.SessionEndpoint()
        ..initialize(
          server,
          'session',
          null,
        ),
      'team': _i5.TeamEndpoint()
        ..initialize(
          server,
          'team',
          null,
        ),
      'version': _i6.VersionEndpoint()
        ..initialize(
          server,
          'version',
          null,
        ),
      'greeting': _i7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
    };
    connectors['app'] = _i1.EndpointConnector(
      name: 'app',
      endpoint: endpoints['app']!,
      methodConnectors: {
        'getMyApplications': _i1.MethodConnector(
          name: 'getMyApplications',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i2.AppEndpoint)
                  .getMyApplications(session),
        ),
        'getApplication': _i1.MethodConnector(
          name: 'getApplication',
          params: {
            'applicationId': _i1.ParameterDescription(
              name: 'applicationId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i2.AppEndpoint).getApplication(
                session,
                applicationId: params['applicationId'],
              ),
        ),
        'createApplication': _i1.MethodConnector(
          name: 'createApplication',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i8.CreateApplicationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['app'] as _i2.AppEndpoint).createApplication(
                    session,
                    request: params['request'],
                  ),
        ),
        'updateApplication': _i1.MethodConnector(
          name: 'updateApplication',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.UpdateApplicationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['app'] as _i2.AppEndpoint).updateApplication(
                    session,
                    request: params['request'],
                  ),
        ),
        'deleteApplication': _i1.MethodConnector(
          name: 'deleteApplication',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i10.DeleteApplicationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['app'] as _i2.AppEndpoint).deleteApplication(
                    session,
                    request: params['request'],
                  ),
        ),
        'getRegenerationTargetEmail': _i1.MethodConnector(
          name: 'getRegenerationTargetEmail',
          params: {
            'applicationId': _i1.ParameterDescription(
              name: 'applicationId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i2.AppEndpoint)
                  .getRegenerationTargetEmail(
                    session,
                    applicationId: params['applicationId'],
                  ),
        ),
        'requestApiKeyRegeneration': _i1.MethodConnector(
          name: 'requestApiKeyRegeneration',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i11.RequestApiKeyRegenerationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i2.AppEndpoint)
                  .requestApiKeyRegeneration(
                    session,
                    request: params['request'],
                  ),
        ),
        'regenerateApiKey': _i1.MethodConnector(
          name: 'regenerateApiKey',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i12.RegenerateApiKeyRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i2.AppEndpoint).regenerateApiKey(
                session,
                request: params['request'],
              ),
        ),
        'toggleApplicationStatus': _i1.MethodConnector(
          name: 'toggleApplicationStatus',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i13.ToggleApplicationStatusRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['app'] as _i2.AppEndpoint).toggleApplicationStatus(
                    session,
                    request: params['request'],
                  ),
        ),
        'transferApplicationOwnership': _i1.MethodConnector(
          name: 'transferApplicationOwnership',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i14.TransferApplicationOwnershipRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['app'] as _i2.AppEndpoint)
                  .transferApplicationOwnership(
                    session,
                    request: params['request'],
                  ),
        ),
      },
    );
    connectors['auth'] = _i1.EndpointConnector(
      name: 'auth',
      endpoint: endpoints['auth']!,
      methodConnectors: {
        'checkEmailAndSendCode': _i1.MethodConnector(
          name: 'checkEmailAndSendCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i15.CheckEmailRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i3.AuthEndpoint).checkEmailAndSendCode(
                    session,
                    request: params['request'],
                  ),
        ),
        'resendCode': _i1.MethodConnector(
          name: 'resendCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i16.RegisterSendCodeRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i3.AuthEndpoint).resendCode(
                session,
                request: params['request'],
              ),
        ),
        'verifyRegisterCode': _i1.MethodConnector(
          name: 'verifyRegisterCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i17.RegisterVerifyCodeRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i3.AuthEndpoint).verifyRegisterCode(
                    session,
                    request: params['request'],
                  ),
        ),
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i18.RegisterRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i3.AuthEndpoint).register(
                session,
                request: params['request'],
              ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i19.LoginRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i3.AuthEndpoint).login(
                session,
                request: params['request'],
              ),
        ),
        'refreshTokens': _i1.MethodConnector(
          name: 'refreshTokens',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i20.RefreshTokenRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i3.AuthEndpoint).refreshTokens(
                session,
                request: params['request'],
              ),
        ),
        'logout': _i1.MethodConnector(
          name: 'logout',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i3.AuthEndpoint).logout(session),
        ),
        'logoutAll': _i1.MethodConnector(
          name: 'logoutAll',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i3.AuthEndpoint).logoutAll(session),
        ),
        'getCurrentUser': _i1.MethodConnector(
          name: 'getCurrentUser',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i3.AuthEndpoint).getCurrentUser(
                session,
              ),
        ),
      },
    );
    connectors['session'] = _i1.EndpointConnector(
      name: 'session',
      endpoint: endpoints['session']!,
      methodConnectors: {
        'getActiveSessions': _i1.MethodConnector(
          name: 'getActiveSessions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['session'] as _i4.SessionEndpoint)
                  .getActiveSessions(session),
        ),
        'terminateSession': _i1.MethodConnector(
          name: 'terminateSession',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i21.TerminateSessionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['session'] as _i4.SessionEndpoint)
                  .terminateSession(
                    session,
                    request: params['request'],
                  ),
        ),
        'terminateAllOtherSessions': _i1.MethodConnector(
          name: 'terminateAllOtherSessions',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['session'] as _i4.SessionEndpoint)
                  .terminateAllOtherSessions(session),
        ),
      },
    );
    connectors['team'] = _i1.EndpointConnector(
      name: 'team',
      endpoint: endpoints['team']!,
      methodConnectors: {
        'createTeam': _i1.MethodConnector(
          name: 'createTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i22.CreateTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).createTeam(
                session,
                request: params['request'],
              ),
        ),
        'updateTeam': _i1.MethodConnector(
          name: 'updateTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i23.UpdateTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).updateTeam(
                session,
                request: params['request'],
              ),
        ),
        'getTeam': _i1.MethodConnector(
          name: 'getTeam',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).getTeam(
                session,
                teamId: params['teamId'],
              ),
        ),
        'getMyTeams': _i1.MethodConnector(
          name: 'getMyTeams',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i5.TeamEndpoint).getMyTeams(session),
        ),
        'inviteMember': _i1.MethodConnector(
          name: 'inviteMember',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i24.InviteTeamMemberRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).inviteMember(
                session,
                request: params['request'],
              ),
        ),
        'getMyInvitations': _i1.MethodConnector(
          name: 'getMyInvitations',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint)
                  .getMyInvitations(session),
        ),
        'respondToInvitation': _i1.MethodConnector(
          name: 'respondToInvitation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i25.RespondToInvitationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i5.TeamEndpoint).respondToInvitation(
                    session,
                    request: params['request'],
                  ),
        ),
        'revokeInvitation': _i1.MethodConnector(
          name: 'revokeInvitation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i26.RevokeInvitationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i5.TeamEndpoint).revokeInvitation(
                    session,
                    request: params['request'],
                  ),
        ),
        'getTeamMembers': _i1.MethodConnector(
          name: 'getTeamMembers',
          params: {
            'teamId': _i1.ParameterDescription(
              name: 'teamId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).getTeamMembers(
                session,
                teamId: params['teamId'],
              ),
        ),
        'updateMemberRole': _i1.MethodConnector(
          name: 'updateMemberRole',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i27.UpdateMemberRoleRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i5.TeamEndpoint).updateMemberRole(
                    session,
                    request: params['request'],
                  ),
        ),
        'removeMember': _i1.MethodConnector(
          name: 'removeMember',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i28.RemoveMemberRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).removeMember(
                session,
                request: params['request'],
              ),
        ),
        'leaveTeam': _i1.MethodConnector(
          name: 'leaveTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i29.LeaveTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).leaveTeam(
                session,
                request: params['request'],
              ),
        ),
        'transferOwnership': _i1.MethodConnector(
          name: 'transferOwnership',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i30.TransferTeamOwnershipRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i5.TeamEndpoint).transferOwnership(
                    session,
                    request: params['request'],
                  ),
        ),
        'deleteTeam': _i1.MethodConnector(
          name: 'deleteTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i31.DeleteTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i5.TeamEndpoint).deleteTeam(
                session,
                request: params['request'],
              ),
        ),
      },
    );
    connectors['version'] = _i1.EndpointConnector(
      name: 'version',
      endpoint: endpoints['version']!,
      methodConnectors: {
        'getVersions': _i1.MethodConnector(
          name: 'getVersions',
          params: {
            'applicationId': _i1.ParameterDescription(
              name: 'applicationId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i6.VersionEndpoint).getVersions(
                    session,
                    applicationId: params['applicationId'],
                  ),
        ),
        'getVersionDetail': _i1.MethodConnector(
          name: 'getVersionDetail',
          params: {
            'versionId': _i1.ParameterDescription(
              name: 'versionId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i6.VersionEndpoint)
                  .getVersionDetail(
                    session,
                    versionId: params['versionId'],
                  ),
        ),
        'getNextBuildNumber': _i1.MethodConnector(
          name: 'getNextBuildNumber',
          params: {
            'applicationId': _i1.ParameterDescription(
              name: 'applicationId',
              type: _i1.getType<_i1.UuidValue>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i6.VersionEndpoint)
                  .getNextBuildNumber(
                    session,
                    applicationId: params['applicationId'],
                  ),
        ),
        'createVersion': _i1.MethodConnector(
          name: 'createVersion',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i32.CreateVersionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i6.VersionEndpoint).createVersion(
                    session,
                    request: params['request'],
                  ),
        ),
        'updateVersion': _i1.MethodConnector(
          name: 'updateVersion',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i33.UpdateVersionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i6.VersionEndpoint).updateVersion(
                    session,
                    request: params['request'],
                  ),
        ),
        'toggleVersionBlock': _i1.MethodConnector(
          name: 'toggleVersionBlock',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i34.ToggleVersionBlockRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i6.VersionEndpoint)
                  .toggleVersionBlock(
                    session,
                    request: params['request'],
                  ),
        ),
        'setVersionRecommendation': _i1.MethodConnector(
          name: 'setVersionRecommendation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i35.SetVersionRecommendationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['version'] as _i6.VersionEndpoint)
                  .setVersionRecommendation(
                    session,
                    request: params['request'],
                  ),
        ),
        'deleteVersion': _i1.MethodConnector(
          name: 'deleteVersion',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i36.DeleteVersionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['version'] as _i6.VersionEndpoint).deleteVersion(
                    session,
                    request: params['request'],
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
              ) async => (endpoints['greeting'] as _i7.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
  }
}
