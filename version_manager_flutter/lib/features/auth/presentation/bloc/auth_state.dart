part of 'auth_bloc.dart';

/// Состояния для AuthBloc.
///
/// Управляет только глобальным состоянием авторизации:
/// - loading: проверка авторизации (при запуске, refresh, logout)
/// - authenticated: пользователь авторизован
/// - unauthenticated: пользователь не авторизован
@freezed
sealed class AuthState with _$AuthState {
  /// Состояние: загрузка
  ///
  /// Используется при:
  /// - Проверке авторизации при запуске приложения
  /// - Обновлении токенов (refresh)
  /// - Выходе из системы (logout)
  const factory AuthState.loading() = Loading;

  /// Состояние: пользователь авторизован
  ///
  /// Содержит данные пользователя и токены доступа.
  const factory AuthState.authenticated() = Authenticated;

  /// Состояние: пользователь не авторизован
  ///
  /// Токены отсутствуют или недействительны.
  /// Показывается экран входа/регистрации.
  const factory AuthState.unauthenticated() = Unauthenticated;
}
