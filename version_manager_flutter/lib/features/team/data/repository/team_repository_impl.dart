import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/team/domain/repository/team_repository.dart';

/// Реализация репозитория команд.
///
/// Использует Serverpod эндпоинт [EndpointTeam]
/// для CRUD операций с командами.
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
      request: CreateTeamRequest(name: name, description: description),
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
    return await _teamEndpoint.getTeam(teamId: teamId);
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
  Future<SuccessResponse> respondToInvitation({
    required UuidValue teamId,
    required bool accept,
  }) async {
    return await _teamEndpoint.respondToInvitation(
      request: RespondToInvitationRequest(teamId: teamId, accept: accept),
    );
  }

  @override
  Future<SuccessResponse> deleteTeam({
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
}
