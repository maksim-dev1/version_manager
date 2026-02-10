import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/application/domain/repository/application_repository.dart';

/// Реализация репозитория приложений.
///
/// Использует Serverpod эндпоинт [EndpointApp]
/// для CRUD операций с приложениями.
class ApplicationRepositoryImpl implements ApplicationRepository {
  final EndpointApp _appEndpoint;
  final EndpointTeam _teamEndpoint;

  ApplicationRepositoryImpl({
    required EndpointApp appEndpoint,
    required EndpointTeam teamEndpoint,
  }) : _appEndpoint = appEndpoint,
       _teamEndpoint = teamEndpoint;

  @override
  Future<List<Application>> getMyApplications() async {
    return await _appEndpoint.getMyApplications();
  }

  @override
  Future<List<Team>> getMyTeams() async {
    return await _teamEndpoint.getMyTeams();
  }

  @override
  Future<Application> getApplication({
    required UuidValue applicationId,
  }) async {
    return await _appEndpoint.getApplication(applicationId: applicationId);
  }

  @override
  Future<CreateApplicationResponse> createApplication({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<PlatformType> platforms,
    required OwnerType ownerType,
    UuidValue? teamId,
    List<StoreLinkEntry>? storeLinks,
  }) async {
    return await _appEndpoint.createApplication(
      request: CreateApplicationRequest(
        namespace: namespace,
        name: name,
        description: description,
        iconUrl: iconUrl,
        platforms: platforms,
        ownerType: ownerType,
        teamId: teamId,
        storeLinks: storeLinks,
      ),
    );
  }

  @override
  Future<Application> updateApplication({
    required UuidValue applicationId,
    String? name,
    String? description,
    String? iconUrl,
    List<PlatformType>? platforms,
    List<StoreLinkEntry>? storeLinks,
  }) async {
    return await _appEndpoint.updateApplication(
      request: UpdateApplicationRequest(
        applicationId: applicationId,
        name: name,
        description: description,
        iconUrl: iconUrl,
        platforms: platforms,
        storeLinks: storeLinks,
      ),
    );
  }

  @override
  Future<SuccessResponse> deleteApplication({
    required UuidValue applicationId,
    required String confirmationName,
  }) async {
    return await _appEndpoint.deleteApplication(
      request: DeleteApplicationRequest(
        applicationId: applicationId,
        confirmationName: confirmationName,
      ),
    );
  }

  @override
  Future<String> getRegenerationTargetEmail({
    required UuidValue applicationId,
  }) async {
    return await _appEndpoint.getRegenerationTargetEmail(
      applicationId: applicationId,
    );
  }

  @override
  Future<RequestApiKeyRegenerationResponse> requestApiKeyRegeneration({
    required UuidValue applicationId,
  }) async {
    return await _appEndpoint.requestApiKeyRegeneration(
      request: RequestApiKeyRegenerationRequest(
        applicationId: applicationId,
      ),
    );
  }

  @override
  Future<RegenerateApiKeyResponse> regenerateApiKey({
    required UuidValue applicationId,
    required String code,
  }) async {
    return await _appEndpoint.regenerateApiKey(
      request: RegenerateApiKeyRequest(
        applicationId: applicationId,
        code: code,
      ),
    );
  }

  @override
  Future<Application> toggleApplicationStatus({
    required UuidValue applicationId,
    required bool isActive,
  }) async {
    return await _appEndpoint.toggleApplicationStatus(
      request: ToggleApplicationStatusRequest(
        applicationId: applicationId,
        isActive: isActive,
      ),
    );
  }

  @override
  Future<SuccessResponse> transferApplicationOwnership({
    required UuidValue applicationId,
    required OwnerType newOwnerType,
    UuidValue? newTeamId,
  }) async {
    return await _appEndpoint.transferApplicationOwnership(
      request: TransferApplicationOwnershipRequest(
        applicationId: applicationId,
        newOwnerType: newOwnerType,
        newTeamId: newTeamId,
      ),
    );
  }
}
