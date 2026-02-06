import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/endpoints/base/logged_in_endpoint.dart';

/// Эндпоинт для управления сессиями пользователя.
///
/// Предоставляет функционал для:
/// - Просмотра всех активных сессий текущего пользователя
/// - Завершения конкретной сессии
/// - Завершения всех сессий кроме текущей
///
/// Наследуется от [LoggedInEndpoint] — авторизация через заголовок.
class SessionEndpoint extends LoggedInEndpoint {
  /// Получить список всех активных сессий текущего пользователя.
  ///
  /// Возвращает информацию о каждой сессии включая:
  /// - Устройство, браузер, IP адрес
  /// - Дату создания и последней активности
  /// - Признак текущей сессии
  /// - Геолокацию (город, страна) если доступна
  ///
  /// ### Возвращает
  /// Список [SessionInfo] со всеми активными сессиями пользователя.
  Future<List<SessionInfo>> getActiveSessions(Session session) async {
    final authInfo = session.authenticated!;
    final userId = UuidValue.fromString(authInfo.userIdentifier);
    final currentAuthSessionId = UuidValue.fromString(authInfo.authId);

    session.log(
      'getActiveSessions: получение сессий для пользователя $userId',
      level: LogLevel.info,
    );

    // Получаем все активные сессии пользователя
    final authSessions = await AuthSession.db.find(
      session,
      where: (t) => (t.userId.equals(userId)) & (t.isActive.equals(true)),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    session.log(
      'getActiveSessions: найдено ${authSessions.length} активных сессий',
      level: LogLevel.info,
    );

    // Преобразуем в SessionInfo
    return authSessions.map((authSession) {
      return SessionInfo(
        id: authSession.id!,
        deviceInfo: authSession.deviceInfo,
        ipAddress: authSession.ipAddress,
        userAgent: authSession.userAgent,
        createdAt: authSession.createdAt,
        lastActivityAt: authSession.lastActivityAt,
        isCurrent: authSession.id == currentAuthSessionId,
        city: null,
        country: null,
      );
    }).toList();
  }

  /// Завершить конкретную сессию по её ID.
  ///
  /// Помечает сессию как неактивную (`isActive = false`) и
  /// устанавливает время отзыва (`revokedAt`).
  ///
  /// Нельзя завершить текущую сессию этим методом.
  /// Для этого используйте метод `logout` из [AuthEndpoint].
  Future<SuccessResponse> terminateSession(
    Session session, {
    required TerminateSessionRequest request,
  }) async {
    final authInfo = session.authenticated!;
    final userId = UuidValue.fromString(authInfo.userIdentifier);
    final currentAuthSessionId = UuidValue.fromString(authInfo.authId);

    session.log(
      'terminateSession: завершение сессии ${request.sessionId} для пользователя $userId',
      level: LogLevel.info,
    );

    // Находим сессию
    final authSession = await AuthSession.db.findById(
      session,
      request.sessionId,
    );

    if (authSession == null || authSession.userId != userId) {
      throw InvalidDataException(
        field: 'sessionId',
        message: 'Сессия не найдена',
      );
    }

    if (authSession.id == currentAuthSessionId) {
      throw InvalidDataException(
        field: 'sessionId',
        message: 'Нельзя завершить текущую сессию. Используйте logout.',
      );
    }

    // Помечаем сессию как неактивную
    authSession.isActive = false;
    authSession.revokedAt = DateTime.now();

    await AuthSession.db.updateRow(session, authSession);

    session.log(
      'terminateSession: сессия ${request.sessionId} успешно завершена',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Сессия успешно завершена',
    );
  }

  /// Завершить все сессии пользователя кроме текущей.
  Future<SuccessResponse> terminateAllOtherSessions(Session session) async {
    final authInfo = session.authenticated!;
    final userId = UuidValue.fromString(authInfo.userIdentifier);
    final currentAuthSessionId = UuidValue.fromString(authInfo.authId);

    session.log(
      'terminateAllOtherSessions: завершение всех сессий кроме текущей для пользователя $userId',
      level: LogLevel.info,
    );

    // Находим все активные сессии кроме текущей
    final otherSessions = await AuthSession.db.find(
      session,
      where: (t) =>
          (t.userId.equals(userId)) &
          (t.isActive.equals(true)) &
          (t.id.notEquals(currentAuthSessionId)),
    );

    session.log(
      'terminateAllOtherSessions: найдено ${otherSessions.length} других сессий',
      level: LogLevel.info,
    );

    // Завершаем все найденные сессии
    final now = DateTime.now();
    for (var authSession in otherSessions) {
      authSession.isActive = false;
      authSession.revokedAt = now;
      await AuthSession.db.updateRow(session, authSession);
    }

    session.log(
      'terminateAllOtherSessions: успешно завершено ${otherSessions.length} сессий',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Завершено сессий: ${otherSessions.length}',
    );
  }
}
