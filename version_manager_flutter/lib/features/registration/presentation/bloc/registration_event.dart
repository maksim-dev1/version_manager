part of 'registration_bloc.dart';

/// События для RegistrationBloc.
///
/// ВАЖНО: Все события приватные (с префиксом _), чтобы предотвратить
/// вызов событий одного блока из другого блока.
/// Для отправки события используйте методы-расширения ниже.
@freezed
sealed class RegistrationEvent with _$RegistrationEvent {
  /// Событие: проверка введённого кода верификации
  ///
  /// Проверяет формат кода и переводит в состояние готовности к созданию пароля.
  const factory RegistrationEvent.verifyCode({
    required String email,
    required String code,
  }) = _VerifyCode;

  /// Событие: повторная отправка кода верификации
  const factory RegistrationEvent.resendCode({
    required String email,
  }) = _ResendCode;

  /// Событие: регистрация с созданием пароля
  ///
  /// Отправляет email, код и пароль на сервер для создания аккаунта.
  const factory RegistrationEvent.register({
    required String email,
    required String password,
  }) = _Register;
}
