part of 'version_action_bloc.dart';

@freezed
sealed class VersionActionEvent with _$VersionActionEvent {
  /// Создать новую версию.
  const factory VersionActionEvent.createVersion({
    required UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  }) = _CreateVersion;

  /// Обновить версию.
  const factory VersionActionEvent.updateVersion({
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
  }) = _UpdateVersion;

  /// Удалить версию.
  const factory VersionActionEvent.deleteVersion({
    required UuidValue versionId,
  }) = _DeleteVersion;
}
