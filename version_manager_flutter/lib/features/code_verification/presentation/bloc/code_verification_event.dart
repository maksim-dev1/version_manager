part of 'code_verification_bloc.dart';

@freezed
sealed class CodeVerificationEvent with _$CodeVerificationEvent {
  /// Проверка введённого кода верификации.
  const factory CodeVerificationEvent.verifyCode({
    required String email,
    required String code,
  }) = _VerifyCode;

  /// Повторная отправка кода верификации.
  const factory CodeVerificationEvent.resendCode({
    required String email,
  }) = _ResendCode;
}
