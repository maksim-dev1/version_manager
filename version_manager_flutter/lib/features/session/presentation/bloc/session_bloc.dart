import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/session/domain/repository/session_repository.dart';

part 'session_bloc.freezed.dart';
part 'session_event.dart';
part 'session_state.dart';

/// BLoC для управления сессиями пользователя.
///
/// Отвечает за:
/// - Загрузку списка активных сессий
/// - Завершение конкретной сессии
/// - Завершение всех сессий кроме текущей
class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SessionRepository _sessionRepository;

  SessionBloc({
    required SessionRepository sessionRepository,
  }) : _sessionRepository = sessionRepository,
       super(const SessionState.initial()) {
    on<SessionEvent>(
      (event, emit) => switch (event) {
        _LoadSessions() => _onLoadSessions(emit: emit),
        _TerminateSession(:final sessionId) => _onTerminateSession(
          sessionId: sessionId,
          emit: emit,
        ),
        _TerminateAllOther() => _onTerminateAllOther(emit: emit),
      },
    );
  }

  /// Загружает список активных сессий.
  Future<void> _onLoadSessions({
    required Emitter<SessionState> emit,
  }) async {
    emit(const SessionState.sessionLoading());
    try {
      final sessions = await _sessionRepository.getActiveSessions();
      emit(SessionState.sessionLoaded(sessions: sessions));
    } catch (e) {
      emit(SessionState.sessionError(message: e.toString()));
    }
  }

  /// Завершает конкретную сессию.
  Future<void> _onTerminateSession({
    required UuidValue sessionId,
    required Emitter<SessionState> emit,
  }) async {
    final currentState = state;
    try {
      await _sessionRepository.terminateSession(sessionId: sessionId);

      if (currentState is SessionLoaded) {
        final updatedSessions = currentState.sessions
            .where((s) => s.id != sessionId)
            .toList();
        emit(SessionState.sessionLoaded(sessions: updatedSessions));
      } else {
        add(const SessionEvent.loadSessions());
      }
    } catch (e) {
      emit(SessionState.sessionError(message: e.toString()));
    }
  }

  /// Завершает все сессии кроме текущей.
  Future<void> _onTerminateAllOther({
    required Emitter<SessionState> emit,
  }) async {
    try {
      await _sessionRepository.terminateAllOtherSessions();

      final sessions = await _sessionRepository.getActiveSessions();
      emit(SessionState.sessionLoaded(sessions: sessions));
    } catch (e) {
      emit(SessionState.sessionError(message: e.toString()));
    }
  }
}
