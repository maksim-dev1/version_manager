part of 'version_bloc.dart';

@freezed
sealed class VersionEvent with _$VersionEvent {
  /// Загрузить версии приложения.
  const factory VersionEvent.loadVersions({
    required UuidValue applicationId,
  }) = _LoadVersions;

  /// Быстрая блокировка/разблокировка.
  const factory VersionEvent.toggleVersionBlock({
    required UuidValue versionId,
    required bool isBlocked,
    required UuidValue applicationId,
    String? blockReason,
  }) = _ToggleVersionBlock;
}
