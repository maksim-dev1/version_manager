import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для управления сессиями пользователя.
///
/// Отвечает за:
/// - Получение списка активных сессий
/// - Завершение конкретной сессии
/// - Завершение всех сессий кроме текущей
abstract interface class SessionRepository {
  /// Получает список активных сессий пользователя.
  Future<List<SessionInfo>> getActiveSessions();

  /// Завершает конкретную сессию по ID.
  Future<SuccessResponse> terminateSession({
    required UuidValue sessionId,
  });

  /// Завершает все сессии кроме текущей.
  Future<SuccessResponse> terminateAllOtherSessions();
}
