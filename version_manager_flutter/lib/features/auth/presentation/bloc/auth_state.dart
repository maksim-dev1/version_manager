part of 'auth_bloc.dart';

/// Состояния для AuthBloc.
///
/// Минимальный набор состояний:
/// - loading: загрузка (проверка токенов, проверка email, logout)
/// - authenticated: пользователь авторизован
/// - unauthenticated: пользователь не авторизован
/// - emailChecked: результат проверки email
/// - error: ошибка
@freezed
sealed class AuthState with _$AuthState {
  /// Состояние: загрузка
  ///
  /// Используется при:
  /// - Проверке авторизации при запуске
  /// - Проверке существования email
  /// - Выходе из системы
  const factory AuthState.loading() = _Loading;

  /// Состояние: пользователь авторизован
  ///
  /// Содержит данные пользователя и токены доступа.
  const factory AuthState.authenticated({
    required UserPublic user,
    required String accessToken,
    required String refreshToken,
  }) = _Authenticated;

  /// Состояние: пользователь не авторизован
  ///
  /// Токены отсутствуют или недействительны.
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// Состояние: результат проверки email
  ///
  /// Содержит информацию о том, существует ли email в системе:
  /// - [emailExists] = true → направить на страницу входа (ввод пароля)
  /// - [emailExists] = false → направить на регистрацию (код уже отправлен)
  const factory AuthState.emailChecked({
    required String email,
    required bool emailExists,

    /// Был ли отправлен код верификации (при регистрации, когда emailExists = false)
    @Default(false) bool codeSent,

    /// Время ожидания при rate limit
    int? retryAfterSeconds,
  }) = _EmailChecked;

  /// Состояние: ошибка
  const factory AuthState.error({
    required String message,
    String? field,
  }) = _AuthError;
}
