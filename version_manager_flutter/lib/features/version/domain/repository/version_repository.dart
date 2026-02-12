import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления версиями приложений.
abstract interface class VersionRepository {
  /// Получает список версий приложения.
  Future<VersionListResponse> getVersions({
    required UuidValue applicationId,
  });

  /// Получает детальную информацию о версии.
  Future<VersionDetailResponse> getVersionDetail({
    required UuidValue versionId,
  });

  /// Получает следующий рекомендуемый номер сборки.
  Future<NextBuildNumberResponse> getNextBuildNumber({
    required UuidValue applicationId,
  });

  /// Создаёт новую версию.
  Future<Version> createVersion({
    required UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  });

  /// Обновляет версию.
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
  });

  /// Быстрая блокировка/разблокировка версии.
  Future<Version> toggleVersionBlock({
    required UuidValue versionId,
    required bool isBlocked,
    String? blockReason,
  });

  /// Установить или снять рекомендуемую версию.
  Future<Version> setVersionRecommendation({
    required UuidValue versionId,
    UuidValue? recommendedVersionId,
    RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  });

  /// Удалить версию.
  Future<SuccessResponse> deleteVersion({
    required UuidValue versionId,
  });
}
