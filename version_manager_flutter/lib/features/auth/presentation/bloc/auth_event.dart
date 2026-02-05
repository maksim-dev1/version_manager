part of 'auth_bloc.dart';

/// События для AuthBloc.
///
/// ВАЖНО: Все события приватные (с префиксом _), чтобы предотвратить
/// вызов событий одного блока из другого блока.
@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Событие: проверка статуса авторизации при запуске
  ///
  /// Проверяет наличие сохранённых токенов в хранилище.
  const factory AuthEvent.checkAuth() = _CheckAuth;

  /// Событие: выход из текущей сессии
  ///
  /// Токен берётся автоматически из AuthKeyProvider.
  const factory AuthEvent.logout() = _Logout;

  /// Событие: выход из всех сессий
  ///
  /// Токен берётся автоматически из AuthKeyProvider.
  const factory AuthEvent.logoutAll() = _LogoutAll;
}
