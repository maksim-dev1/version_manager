part of 'api_key_bloc.dart';

/// Состояния ApiKeyBloc: initial, loading, loaded, error.
@freezed
sealed class ApiKeyState with _$ApiKeyState {
  const factory ApiKeyState.initial() = ApiKeyInitial;
  const factory ApiKeyState.loading() = ApiKeyLoading;
  const factory ApiKeyState.loaded({required ApiKeyResult result}) =
      ApiKeyLoaded;
  const factory ApiKeyState.error({required String message}) = ApiKeyError;
}

/// Типизированный результат успешной операции.
@freezed
sealed class ApiKeyResult with _$ApiKeyResult {
  /// Email владельца получен.
  const factory ApiKeyResult.emailLoaded({required String maskedEmail}) =
      ApiKeyEmailLoaded;

  /// Код подтверждения отправлен.
  const factory ApiKeyResult.codeSent({
    String? maskedEmail,
    int? retryAfterSeconds,
  }) = ApiKeyCodeSent;

  /// API ключ регенерирован.
  const factory ApiKeyResult.regenerated({
    required String apiKey,
    required DateTime regeneratedAt,
  }) = ApiKeyRegenerated;
}
