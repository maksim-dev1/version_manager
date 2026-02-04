part of 'email_check_bloc.dart';

/// Состояния для EmailCheckBloc.
@freezed
sealed class EmailCheckState with _$EmailCheckState {
  /// Состояние: начальное
  ///
  /// Пользователь еще не начал проверку email.
  const factory EmailCheckState.initial() = Initial;

  /// Состояние: загрузка
  ///
  /// Идет проверка email на сервере.
  const factory EmailCheckState.emailCheckLoading() = EmailCheckLoading;

  /// Состояние: результат проверки email
  ///
  /// Содержит информацию о том, существует ли email в системе:
  /// - [emailExists] = true → направить на страницу входа (ввод пароля)
  /// - [emailExists] = false → направить на регистрацию (код уже отправлен)
  const factory EmailCheckState.emailCheckSuccess({
    required String email,
    required bool emailExists,

    /// Время ожидания при rate limit
    int? retryAfterSeconds,
  }) = EmailCheckSuccess;

  /// Состояние: ошибка
  const factory EmailCheckState.emailCheckError({
    required String message,
  }) = EmailCheckError;
}
