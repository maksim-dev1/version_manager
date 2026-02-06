import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/domain/repository/team_repository.dart';

/// Реализация репозитория команд и участников.
///
/// Использует Serverpod эндпоинт [EndpointTeam]
/// для CRUD операций с командами и управления участниками.
///
/// Авторизация осуществляется автоматически через заголовок запроса.
class TeamRepositoryImpl implements TeamRepository {
  final EndpointTeam _teamEndpoint;
  final EndpointAuth _authEndpoint;

  TeamRepositoryImpl({
    required EndpointTeam teamEndpoint,
    required EndpointAuth authEndpoint,
  }) : _teamEndpoint = teamEndpoint,
       _authEndpoint = authEndpoint;

  @override
  Future<UserPublic> getCurrentUser() async {
    return await _authEndpoint.getCurrentUser();
  }

  @override
  Future<Team> createTeam({
    required String name,
    String? description,
  }) async {
    return await _teamEndpoint.createTeam(
      request: CreateTeamRequest(
        name: name,
        description: description,
      ),
    );
  }

  @override
  Future<Team> updateTeam({
    required UuidValue teamId,
    required String name,
    String? description,
  }) async {
    return await _teamEndpoint.updateTeam(
      request: UpdateTeamRequest(
        teamId: teamId,
        name: name,
        description: description,
      ),
    );
  }

  @override
  Future<Team> getTeam({
    required UuidValue teamId,
  }) async {
    return await _teamEndpoint.getTeam(
      teamId: teamId,
    );
  }

  @override
  Future<List<Team>> getMyTeams() async {
    return await _teamEndpoint.getMyTeams();
  }

  @override
  Future<List<TeamMember>> getMyInvitations() async {
    return await _teamEndpoint.getMyInvitations();
  }

  @override
  Future<List<Team>> respondToInvitation({
    required UuidValue teamId,
    required bool accept,
  }) async {
    return await _teamEndpoint.respondToInvitation(
      request: RespondToInvitationRequest(
        teamId: teamId,
        accept: accept,
      ),
    );
  }

  @override
  Future<List<Team>> deleteTeam({
    required UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
  }) async {
    return await _teamEndpoint.deleteTeam(
      request: DeleteTeamRequest(
        teamId: teamId,
        transferAppsToOwner: transferAppsToOwner,
        confirmationName: confirmationName,
      ),
    );
  }

  // ── Участники команды ──

  @override
  Future<List<TeamMember>> getTeamMembers({
    required UuidValue teamId,
  }) async {
    return await _teamEndpoint.getTeamMembers(
      teamId: teamId,
    );
  }

  @override
  Future<List<Team>> inviteMember({
    required UuidValue teamId,
    required String email,
    required TeamRoleType role,
  }) async {
    return await _teamEndpoint.inviteMember(
      request: InviteTeamMemberRequest(
        teamId: teamId,
        email: email,
        role: role,
      ),
    );
  }

  @override
  Future<List<Team>> revokeInvitation({
    required UuidValue memberId,
  }) async {
    return await _teamEndpoint.revokeInvitation(
      request: RevokeInvitationRequest(memberId: memberId),
    );
  }

  @override
  Future<List<Team>> updateMemberRole({
    required UuidValue memberId,
    required TeamRoleType newRole,
  }) async {
    return await _teamEndpoint.updateMemberRole(
      request: UpdateMemberRoleRequest(
        memberId: memberId,
        newRole: newRole,
      ),
    );
  }

  @override
  Future<List<Team>> removeMember({
    required UuidValue memberId,
  }) async {
    return await _teamEndpoint.removeMember(
      request: RemoveMemberRequest(memberId: memberId),
    );
  }

  @override
  Future<List<Team>> leaveTeam({
    required UuidValue teamId,
  }) async {
    return await _teamEndpoint.leaveTeam(
      request: LeaveTeamRequest(teamId: teamId),
    );
  }

  @override
  Future<List<Team>> transferOwnership({
    required UuidValue teamId,
    required UuidValue newOwnerId,
  }) async {
    return await _teamEndpoint.transferOwnership(
      request: TransferTeamOwnershipRequest(
        teamId: teamId,
        newOwnerId: newOwnerId,
      ),
    );
  }
}
