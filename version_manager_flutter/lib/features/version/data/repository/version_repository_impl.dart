import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/version/domain/repository/version_repository.dart';

/// Реализация репозитория версий.
class VersionRepositoryImpl implements VersionRepository {
  final EndpointVersion _versionEndpoint;

  VersionRepositoryImpl({required EndpointVersion versionEndpoint})
    : _versionEndpoint = versionEndpoint;

  @override
  Future<VersionListResponse> getVersions({
    required UuidValue applicationId,
  }) async {
    return await _versionEndpoint.getVersions(applicationId: applicationId);
  }

  @override
  Future<VersionDetailResponse> getVersionDetail({
    required UuidValue versionId,
  }) async {
    return await _versionEndpoint.getVersionDetail(versionId: versionId);
  }

  @override
  Future<NextBuildNumberResponse> getNextBuildNumber({
    required UuidValue applicationId,
  }) async {
    return await _versionEndpoint.getNextBuildNumber(
      applicationId: applicationId,
    );
  }

  @override
  Future<Version> createVersion({
    required UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  }) async {
    return await _versionEndpoint.createVersion(
      request: CreateVersionRequest(
        applicationId: applicationId,
        versionNumber: versionNumber,
        buildNumber: buildNumber,
        changelog: changelog,
      ),
    );
  }

  @override
  Future<Version> updateVersion({
    required UuidValue versionId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    UuidValue? recommendedVersionId,
    bool? clearRecommendation,
    RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) async {
    return await _versionEndpoint.updateVersion(
      request: UpdateVersionRequest(
        versionId: versionId,
        versionNumber: versionNumber,
        buildNumber: buildNumber,
        changelog: changelog,
        isBlocked: isBlocked,
        blockReason: blockReason,
        recommendedVersionId: recommendedVersionId,
        clearRecommendation: clearRecommendation,
        recommendationFrequency: recommendationFrequency,
        recommendationEveryNthLaunch: recommendationEveryNthLaunch,
        recommendationPeriodHours: recommendationPeriodHours,
      ),
    );
  }

  @override
  Future<Version> toggleVersionBlock({
    required UuidValue versionId,
    required bool isBlocked,
    String? blockReason,
  }) async {
    return await _versionEndpoint.toggleVersionBlock(
      request: ToggleVersionBlockRequest(
        versionId: versionId,
        isBlocked: isBlocked,
        blockReason: blockReason,
      ),
    );
  }

  @override
  Future<Version> setVersionRecommendation({
    required UuidValue versionId,
    UuidValue? recommendedVersionId,
    RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) async {
    return await _versionEndpoint.setVersionRecommendation(
      request: SetVersionRecommendationRequest(
        versionId: versionId,
        recommendedVersionId: recommendedVersionId,
        recommendationFrequency: recommendationFrequency,
        recommendationEveryNthLaunch: recommendationEveryNthLaunch,
        recommendationPeriodHours: recommendationPeriodHours,
      ),
    );
  }

  @override
  Future<SuccessResponse> deleteVersion({
    required UuidValue versionId,
  }) async {
    return await _versionEndpoint.deleteVersion(
      request: DeleteVersionRequest(versionId: versionId),
    );
  }
}
