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
  const factory RegistrationEvent._verifyCode({
    required String email,
    required String code,
  }) = _VerifyCode;

  /// Событие: повторная отправка кода верификации
  const factory RegistrationEvent._resendCode({
    required String email,
  }) = _ResendCode;

  /// Событие: регистрация с созданием пароля
  ///
  /// Отправляет email, код и пароль на сервер для создания аккаунта.
  const factory RegistrationEvent._register({
    required String email,
    required String code,
    required String password,
  }) = _Register;

  /// Событие: сброс состояния блока
  const factory RegistrationEvent._reset() = _Reset;
}

/// Расширение для удобного вызова событий RegistrationBloc
extension RegistrationBlocX on RegistrationBloc {
  /// Проверить введённый код верификации
  void verifyCode({required String email, required String code}) =>
      add(RegistrationEvent._verifyCode(email: email, code: code));

  /// Повторно отправить код верификации
  void resendCode({required String email}) =>
      add(RegistrationEvent._resendCode(email: email));

  /// Зарегистрировать пользователя
  void register({
    required String email,
    required String code,
    required String password,
  }) => add(
    RegistrationEvent._register(
      email: email,
      code: code,
      password: password,
    ),
  );

  /// Сбросить состояние блока
  void reset() => add(const RegistrationEvent._reset());
}
