import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/session/domain/repository/session_repository.dart';

/// Реализация репозитория сессий.
///
/// Использует Serverpod эндпоинт [EndpointSession]
/// для управления активными сессиями пользователя.
class SessionRepositoryImpl implements SessionRepository {
  final EndpointSession _sessionEndpoint;

  SessionRepositoryImpl({
    required EndpointSession sessionEndpoint,
  }) : _sessionEndpoint = sessionEndpoint;

  @override
  Future<List<SessionInfo>> getActiveSessions() async {
    return await _sessionEndpoint.getActiveSessions();
  }

  @override
  Future<SuccessResponse> terminateSession({
    required UuidValue sessionId,
  }) async {
    return await _sessionEndpoint.terminateSession(
      request: TerminateSessionRequest(sessionId: sessionId),
    );
  }

  @override
  Future<SuccessResponse> terminateAllOtherSessions() async {
    return await _sessionEndpoint.terminateAllOtherSessions();
  }
}
