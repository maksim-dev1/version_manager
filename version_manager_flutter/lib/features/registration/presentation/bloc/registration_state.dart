part of 'registration_bloc.dart';

/// Состояния для RegistrationBloc.
///
/// Минимальный набор состояний:
/// - initial: начальное состояние
/// - loading: загрузка (проверка кода, отправка кода, регистрация)
/// - success: успешная регистрация
/// - error: ошибка
@freezed
sealed class RegistrationState with _$RegistrationState {
  /// Состояние: начальное
  ///
  /// Может содержать данные о текущем этапе регистрации.
  const factory RegistrationState.initial() = _Initial;

  /// Состояние: загрузка
  ///
  /// Используется при:
  /// - Проверке кода
  /// - Повторной отправке кода
  /// - Регистрации
  const factory RegistrationState.registrationLoading() = RegistrationLoading;

  /// Состояние: успешная регистрация
  ///
  /// Содержит данные пользователя и токены (автовход).
  /// После получения этого состояния UI должен:
  /// 1. Обновить AuthBloc состояние
  /// 2. Перенаправить на главную страницу
  const factory RegistrationState.registrationsuccess({
    required UserPublic user,
    required String accessToken,
    required String refreshToken,
  }) = RegistrationSuccess;

  const factory RegistrationState.codeConfirmated({
    required String email,
  }) = CodeConfirmated;

  /// Состояние: попытки ввода кода исчерпаны
  ///
  /// Блокирует ввод кода до повторной отправки.
  const factory RegistrationState.attemptsExhausted({
    required String message,
  }) = AttemptsExhausted;

  /// Состояние: ошибка
  const factory RegistrationState.registrationError({
    required String message,
    String? field,
  }) = RegistrationError;
}
