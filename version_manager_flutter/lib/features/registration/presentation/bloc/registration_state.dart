part of 'registration_bloc.dart';

/// Состояния для RegistrationBloc.
///
/// Минимальный набор состояний:
/// - initial: начальное состояние
/// - loading: загрузка (регистрация)
/// - success: успешная регистрация
/// - error: ошибка
@freezed
sealed class RegistrationState with _$RegistrationState {
  /// Состояние: начальное
  const factory RegistrationState.initial() = _Initial;

  /// Состояние: загрузка
  const factory RegistrationState.registrationLoading() = RegistrationLoading;

  /// Состояние: успешная регистрация
  ///
  /// Содержит данные пользователя и токены (автовход).
  const factory RegistrationState.registrationsuccess({
    required UserPublic user,
    required String accessToken,
    required String refreshToken,
  }) = RegistrationSuccess;

  /// Состояние: ошибка
  const factory RegistrationState.registrationError({
    required String message,
    String? field,
  }) = RegistrationError;
}
