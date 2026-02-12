part of 'code_verification_bloc.dart';

@freezed
sealed class CodeVerificationState with _$CodeVerificationState {
  /// Начальное состояние — готов к вводу кода.
  const factory CodeVerificationState.initial() = CodeVerificationInitial;

  /// Загрузка — проверка или отправка кода.
  const factory CodeVerificationState.loading() = CodeVerificationLoading;

  /// Код подтверждён — можно переходить к созданию пароля.
  const factory CodeVerificationState.verified({
    required String email,
  }) = CodeVerificationVerified;

  /// Ошибка проверки / отправки кода.
  const factory CodeVerificationState.error({
    required String message,
    String? field,
    @Default(false) bool isAttemptsExhausted,
  }) = CodeVerificationError;
}
