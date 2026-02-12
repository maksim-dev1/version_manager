part of 'version_detail_bloc.dart';

@freezed
sealed class VersionDetailEvent with _$VersionDetailEvent {
  /// Загрузить детальную информацию о версии.
  const factory VersionDetailEvent.loadDetail({
    required UuidValue versionId,
  }) = _LoadDetail;
}
