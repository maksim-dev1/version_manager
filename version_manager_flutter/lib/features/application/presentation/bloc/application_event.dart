part of 'application_bloc.dart';

/// События для ApplicationBloc.
@freezed
sealed class ApplicationEvent with _$ApplicationEvent {
  /// Загрузить приложения пользователя.
  const factory ApplicationEvent.loadApplications() = _LoadApplications;

  /// Обновить приложение.
  const factory ApplicationEvent.updateApplication({
    required UuidValue applicationId,
    String? name,
    String? description,
    String? iconUrl,
    List<PlatformType>? platforms,
    List<StoreLinkEntry>? storeLinks,
  }) = _UpdateApplication;

  /// Удалить приложение.
  const factory ApplicationEvent.deleteApplication({
    required UuidValue applicationId,
    required String confirmationName,
  }) = _DeleteApplication;

  /// Активировать / деактивировать приложение.
  const factory ApplicationEvent.toggleApplicationStatus({
    required UuidValue applicationId,
    required bool isActive,
  }) = _ToggleApplicationStatus;

  /// Передать владение приложением.
  const factory ApplicationEvent.transferApplicationOwnership({
    required UuidValue applicationId,
    required OwnerType newOwnerType,
    UuidValue? newTeamId,
  }) = _TransferApplicationOwnership;
}
