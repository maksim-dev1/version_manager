part of 'session_bloc.dart';

/// Состояния для SessionBloc.
@freezed
sealed class SessionState with _$SessionState {
  /// Начальное состояние.
  const factory SessionState.initial() = Initial;

  /// Загрузка сессий.
  const factory SessionState.sessionLoading() = SessionLoading;

  /// Сессии загружены.
  const factory SessionState.sessionLoaded({
    required List<SessionInfo> sessions,
  }) = SessionLoaded;

  /// Ошибка загрузки.
  const factory SessionState.sessionError({
    required String message,
  }) = SessionError;
}
