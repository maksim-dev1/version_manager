part of 'session_bloc.dart';

/// События для SessionBloc.
@freezed
sealed class SessionEvent with _$SessionEvent {
  /// Загрузить активные сессии.
  const factory SessionEvent.loadSessions() = _LoadSessions;

  /// Завершить конкретную сессию.
  const factory SessionEvent.terminateSession({
    required UuidValue sessionId,
  }) = _TerminateSession;

  /// Завершить все сессии кроме текущей.
  const factory SessionEvent.terminateAllOther() = _TerminateAllOther;
}
