part of 'application_bloc.dart';

/// События для ApplicationBloc.
@freezed
sealed class ApplicationEvent with _$ApplicationEvent {
  /// Загрузить приложения пользователя.
  const factory ApplicationEvent.loadApplications() = _LoadApplications;

  /// Создать новое приложение.
  const factory ApplicationEvent.createApplication({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<PlatformType> platforms,
    required OwnerType ownerType,
    UuidValue? teamId,
    List<StoreLinkEntry>? storeLinks,
  }) = _CreateApplication;

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

  /// Запросить код подтверждения для регенерации API ключа.
  const factory ApplicationEvent.requestApiKeyRegeneration({
    required UuidValue applicationId,
  }) = _RequestApiKeyRegeneration;

  /// Получить замаскированный email владельца для регенерации.
  const factory ApplicationEvent.fetchRegenerationEmail({
    required UuidValue applicationId,
  }) = _FetchRegenerationEmail;

  /// Регенерировать API ключ с кодом подтверждения.
  const factory ApplicationEvent.regenerateApiKey({
    required UuidValue applicationId,
    required String code,
  }) = _RegenerateApiKey;

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
