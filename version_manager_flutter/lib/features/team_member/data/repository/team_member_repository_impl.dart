import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team_member/domain/repository/team_member_repository.dart';

/// Реализация репозитория участников команды.
///
/// Использует Serverpod эндпоинт [EndpointTeam]
/// для управления участниками.
class TeamMemberRepositoryImpl implements TeamMemberRepository {
  final EndpointTeam _teamEndpoint;

  TeamMemberRepositoryImpl({
    required EndpointTeam teamEndpoint,
  }) : _teamEndpoint = teamEndpoint;

  @override
  Future<List<TeamMember>> getTeamMembers({
    required UuidValue teamId,
  }) async {
    return await _teamEndpoint.getTeamMembers(teamId: teamId);
  }

  @override
  Future<SuccessResponse> inviteMember({
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
  Future<SuccessResponse> revokeInvitation({
    required UuidValue memberId,
  }) async {
    return await _teamEndpoint.revokeInvitation(
      request: RevokeInvitationRequest(memberId: memberId),
    );
  }

  @override
  Future<SuccessResponse> updateMemberRole({
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
  Future<SuccessResponse> removeMember({
    required UuidValue memberId,
  }) async {
    return await _teamEndpoint.removeMember(
      request: RemoveMemberRequest(memberId: memberId),
    );
  }

  @override
  Future<SuccessResponse> leaveTeam({
    required UuidValue teamId,
  }) async {
    return await _teamEndpoint.leaveTeam(
      request: LeaveTeamRequest(teamId: teamId),
    );
  }

  @override
  Future<SuccessResponse> transferOwnership({
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
