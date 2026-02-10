part of 'application_bloc.dart';

/// Состояния для ApplicationBloc.
@freezed
sealed class ApplicationState with _$ApplicationState {
  /// Начальное состояние.
  const factory ApplicationState.initial() = ApplicationInitial;

  /// Загрузка.
  const factory ApplicationState.loading() = ApplicationLoading;

  /// Приложения загружены.
  const factory ApplicationState.loaded({
    required List<Application> applications,
    required List<Team> teams,
  }) = ApplicationLoaded;

  /// Ошибка загрузки.
  const factory ApplicationState.error({required String message}) =
      ApplicationError;

  /// Приложение успешно создано (содержит API ключ для показа).
  const factory ApplicationState.created({
    required Application application,
    required String apiKey,
  }) = ApplicationCreated;

  /// Код подтверждения для регенерации отправлен на email.
  const factory ApplicationState.apiKeyRegenerationCodeSent({
    int? retryAfterSeconds,
    String? maskedEmail,
  }) = ApplicationApiKeyRegenerationCodeSent;

  /// Замаскированный email владельца получен.
  const factory ApplicationState.regenerationEmailLoaded({
    required String maskedEmail,
  }) = ApplicationRegenerationEmailLoaded;

  /// API ключ успешно регенерирован.
  const factory ApplicationState.apiKeyRegenerated({
    required String apiKey,
    required DateTime regeneratedAt,
  }) = ApplicationApiKeyRegenerated;
}
