part of 'api_key_bloc.dart';

@freezed
sealed class ApiKeyEvent with _$ApiKeyEvent {
  /// Получить замаскированный email владельца.
  const factory ApiKeyEvent.fetchEmail({
    required UuidValue applicationId,
  }) = _FetchEmail;

  /// Запросить код подтверждения.
  const factory ApiKeyEvent.requestCode({
    required UuidValue applicationId,
  }) = _RequestCode;

  /// Регенерировать API ключ с кодом подтверждения.
  const factory ApiKeyEvent.regenerate({
    required UuidValue applicationId,
    required String code,
  }) = _Regenerate;
}
