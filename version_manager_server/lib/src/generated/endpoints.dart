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
import '../endpoints/session_endpoint.dart' as _i3;
import '../endpoints/team_endpoint.dart' as _i4;
import '../greetings/greeting_endpoint.dart' as _i5;
import 'package:version_manager_server/src/generated/auth/check_email.dart'
    as _i6;
import 'package:version_manager_server/src/generated/auth/register_send_code.dart'
    as _i7;
import 'package:version_manager_server/src/generated/auth/register_verify_code.dart'
    as _i8;
import 'package:version_manager_server/src/generated/auth/register.dart' as _i9;
import 'package:version_manager_server/src/generated/auth/login.dart' as _i10;
import 'package:version_manager_server/src/generated/auth/refresh_token.dart'
    as _i11;
import 'package:version_manager_server/src/generated/sessions/terminate_session_request.dart'
    as _i12;
import 'package:version_manager_server/src/generated/teams/create_team_request.dart'
    as _i13;
import 'package:version_manager_server/src/generated/teams/update_team_request.dart'
    as _i14;
import 'package:version_manager_server/src/generated/teams/invite_team_member_request.dart'
    as _i15;
import 'package:version_manager_server/src/generated/teams/respond_to_invitation_request.dart'
    as _i16;
import 'package:version_manager_server/src/generated/teams/revoke_invitation_request.dart'
    as _i17;
import 'package:version_manager_server/src/generated/teams/update_member_role_request.dart'
    as _i18;
import 'package:version_manager_server/src/generated/teams/remove_member_request.dart'
    as _i19;
import 'package:version_manager_server/src/generated/teams/leave_team_request.dart'
    as _i20;
import 'package:version_manager_server/src/generated/teams/transfer_team_ownership_request.dart'
    as _i21;
import 'package:version_manager_server/src/generated/teams/delete_team_request.dart'
    as _i22;

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
      'session': _i3.SessionEndpoint()
        ..initialize(
          server,
          'session',
          null,
        ),
      'team': _i4.TeamEndpoint()
        ..initialize(
          server,
          'team',
          null,
        ),
      'greeting': _i5.GreetingEndpoint()
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
        'checkEmailAndSendCode': _i1.MethodConnector(
          name: 'checkEmailAndSendCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i6.CheckEmailRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).checkEmailAndSendCode(
                    session,
                    request: params['request'],
                  ),
        ),
        'resendCode': _i1.MethodConnector(
          name: 'resendCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i7.RegisterSendCodeRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).resendCode(
                session,
                request: params['request'],
              ),
        ),
        'verifyRegisterCode': _i1.MethodConnector(
          name: 'verifyRegisterCode',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i8.RegisterVerifyCodeRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).verifyRegisterCode(
                    session,
                    request: params['request'],
                  ),
        ),
        'register': _i1.MethodConnector(
          name: 'register',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i9.RegisterRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).register(
                session,
                request: params['request'],
              ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i10.LoginRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).login(
                session,
                request: params['request'],
              ),
        ),
        'refreshTokens': _i1.MethodConnector(
          name: 'refreshTokens',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i11.RefreshTokenRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).refreshTokens(
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
                  (endpoints['auth'] as _i2.AuthEndpoint).logout(session),
        ),
        'logoutAll': _i1.MethodConnector(
          name: 'logoutAll',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['auth'] as _i2.AuthEndpoint).logoutAll(session),
        ),
        'getCurrentUser': _i1.MethodConnector(
          name: 'getCurrentUser',
          params: {},
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['auth'] as _i2.AuthEndpoint).getCurrentUser(
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
              ) async => (endpoints['session'] as _i3.SessionEndpoint)
                  .getActiveSessions(session),
        ),
        'terminateSession': _i1.MethodConnector(
          name: 'terminateSession',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i12.TerminateSessionRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['session'] as _i3.SessionEndpoint)
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
              ) async => (endpoints['session'] as _i3.SessionEndpoint)
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
              type: _i1.getType<_i13.CreateTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i4.TeamEndpoint).createTeam(
                session,
                request: params['request'],
              ),
        ),
        'updateTeam': _i1.MethodConnector(
          name: 'updateTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i14.UpdateTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i4.TeamEndpoint).updateTeam(
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
              ) async => (endpoints['team'] as _i4.TeamEndpoint).getTeam(
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
                  (endpoints['team'] as _i4.TeamEndpoint).getMyTeams(session),
        ),
        'inviteMember': _i1.MethodConnector(
          name: 'inviteMember',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i15.InviteTeamMemberRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i4.TeamEndpoint).inviteMember(
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
              ) async => (endpoints['team'] as _i4.TeamEndpoint)
                  .getMyInvitations(session),
        ),
        'respondToInvitation': _i1.MethodConnector(
          name: 'respondToInvitation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i16.RespondToInvitationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i4.TeamEndpoint).respondToInvitation(
                    session,
                    request: params['request'],
                  ),
        ),
        'revokeInvitation': _i1.MethodConnector(
          name: 'revokeInvitation',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i17.RevokeInvitationRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i4.TeamEndpoint).revokeInvitation(
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
              ) async => (endpoints['team'] as _i4.TeamEndpoint).getTeamMembers(
                session,
                teamId: params['teamId'],
              ),
        ),
        'updateMemberRole': _i1.MethodConnector(
          name: 'updateMemberRole',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i18.UpdateMemberRoleRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i4.TeamEndpoint).updateMemberRole(
                    session,
                    request: params['request'],
                  ),
        ),
        'removeMember': _i1.MethodConnector(
          name: 'removeMember',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i19.RemoveMemberRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i4.TeamEndpoint).removeMember(
                session,
                request: params['request'],
              ),
        ),
        'leaveTeam': _i1.MethodConnector(
          name: 'leaveTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i20.LeaveTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i4.TeamEndpoint).leaveTeam(
                session,
                request: params['request'],
              ),
        ),
        'transferOwnership': _i1.MethodConnector(
          name: 'transferOwnership',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i21.TransferTeamOwnershipRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['team'] as _i4.TeamEndpoint).transferOwnership(
                    session,
                    request: params['request'],
                  ),
        ),
        'deleteTeam': _i1.MethodConnector(
          name: 'deleteTeam',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i22.DeleteTeamRequest>(),
              nullable: false,
            ),
          },
          call:
              (
                _i1.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['team'] as _i4.TeamEndpoint).deleteTeam(
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
              ) async => (endpoints['greeting'] as _i5.GreetingEndpoint).hello(
                session,
                params['name'],
              ),
        ),
      },
    );
  }
}
