part of 'auth_bloc.dart';

/// События для AuthBloc.
///
/// ВАЖНО: Все события приватные (с префиксом _), чтобы предотвратить
/// вызов событий одного блока из другого блока.
/// Для отправки события используйте методы-расширения ниже.
@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Событие: проверка статуса авторизации при запуске
  ///
  /// Проверяет наличие сохранённых токенов в хранилище.
  const factory AuthEvent.checkAuth() = _CheckAuth;

  /// Событие: проверка существования email в системе
  ///
  /// Отправляет запрос на сервер для определения,
  /// зарегистрирован ли пользователь с данным email.
  const factory AuthEvent.checkEmail({
    required String email,
  }) = _CheckEmail;

  /// Событие: обновление токенов
  ///
  /// Использует refresh token для получения новой пары токенов.
  const factory AuthEvent.refreshTokens({
    required String refreshToken,
  }) = _RefreshTokens;

  /// Событие: выход из текущей сессии
  const factory AuthEvent.logout({
    required String accessToken,
  }) = _Logout;

  /// Событие: выход из всех сессий
  const factory AuthEvent.logoutAll({
    required String accessToken,
  }) = _LogoutAll;
}
