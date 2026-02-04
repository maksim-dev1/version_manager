part of 'login_bloc.dart';

/// Состояния для LoginBloc.
///
/// Описывает все возможные состояния процесса входа:
/// - initial: начальное состояние (готов к вводу пароля)
/// - loading: отправка запроса на сервер
/// - success: успешный вход
/// - error: ошибка входа
@freezed
sealed class LoginState with _$LoginState {
  /// Состояние: начальное (готов к вводу пароля)
  const factory LoginState.initial() = _Initial;

  /// Состояние: загрузка (отправка запроса на сервер)
  const factory LoginState.loginLoading() = LoginLoading;

  /// Состояние: успешный вход
  ///
  /// Содержит данные пользователя и токены.
  /// После получения этого состояния UI должен:
  /// 1. Вызвать AuthBloc.setAuthenticated()
  /// 2. Перенаправить на главную страницу
  const factory LoginState.loginSuccess({
    required UserPublic user,
    required String accessToken,
    required String refreshToken,
  }) = LoginSuccess;

  /// Состояние: ошибка
  const factory LoginState.loginError({
    required String message,
    String? field,
  }) = LoginError;
}
