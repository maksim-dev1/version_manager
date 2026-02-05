import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';

/// Эндпоинт для управления сессиями пользователя.
///
/// Предоставляет функционал для:
/// - Просмотра всех активных сессий текущего пользователя
/// - Завершения конкретной сессии
/// - Завершения всех сессий кроме текущей
///
/// Все методы требуют передачи валидного access token.
class SessionEndpoint extends Endpoint {
  final _tokenService = Services().tokenService;
  final _authService = Services().authValidationService;

  /// Получить список всех активных сессий текущего пользователя.
  ///
  /// Возвращает информацию о каждой сессии включая:
  /// - Устройство, браузер, IP адрес
  /// - Дату создания и последней активности
  /// - Признак текущей сессии
  /// - Геолокацию (город, страна) если доступна
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД
  /// - [accessToken] — текущий access token пользователя
  ///
  /// ### Возвращает
  /// Список [SessionInfo] со всеми активными сессиями пользователя.
  ///
  /// ### Пример использования
  /// ```dart
  /// final sessions = await client.session.getActiveSessions(accessToken);
  /// for (var s in sessions) {
  ///   print('${s.deviceInfo} - ${s.isCurrent ? "Текущая" : ""}');
  /// }
  /// ```
  Future<List<SessionInfo>> getActiveSessions(
    Session session,
    String accessToken,
  ) async {
    final authResult = await _authService.validateToken(session, accessToken);
    final userId = authResult.userId;

    session.log(
      'getActiveSessions: получение сессий для пользователя $userId',
      level: LogLevel.info,
    );

    // Получаем текущий токен для определения текущей сессии
    final currentTokenHash = _tokenService.hashToken(accessToken);

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
        isCurrent: authSession.tokenHash == currentTokenHash,
        city: null, // TODO: можно добавить геолокацию позже
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
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД
  /// - [accessToken] — текущий access token пользователя
  /// - [request] — запрос с ID сессии для завершения
  ///
  /// ### Возвращает
  /// [SuccessResponse] с результатом операции.
  ///
  /// ### Исключения
  /// - [InvalidDataException] если сессия не найдена или не принадлежит пользователю
  /// - [InvalidDataException] если попытка завершить текущую сессию
  ///
  /// ### Пример использования
  /// ```dart
  /// await client.session.terminateSession(
  ///   accessToken,
  ///   TerminateSessionRequest(sessionId: sessionId),
  /// );
  /// ```
  Future<SuccessResponse> terminateSession(
    Session session,
    String accessToken, {
    required TerminateSessionRequest request,
  }) async {
    final authResult = await _authService.validateToken(session, accessToken);
    final userId = authResult.userId;

    session.log(
      'terminateSession: завершение сессии ${request.sessionId} для пользователя $userId',
      level: LogLevel.info,
    );

    // Проверяем, что это не текущая сессия
    final currentTokenHash = _tokenService.hashToken(accessToken);

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

    if (authSession.tokenHash == currentTokenHash) {
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
  ///
  /// Полезно для:
  /// - Выхода со всех устройств при утере одного из них
  /// - Обеспечения безопасности при подозрении на компрометацию
  /// - Принудительного выхода из всех старых сессий
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД
  /// - [accessToken] — текущий access token пользователя
  ///
  /// ### Возвращает
  /// [SuccessResponse] с информацией о количестве завершённых сессий.
  ///
  /// ### Пример использования
  /// ```dart
  /// final result = await client.session.terminateAllOtherSessions(accessToken);
  /// print('Завершено сессий: ${result.message}');
  /// ```
  Future<SuccessResponse> terminateAllOtherSessions(
    Session session,
    String accessToken,
  ) async {
    final authResult = await _authService.validateToken(session, accessToken);
    final userId = authResult.userId;

    session.log(
      'terminateAllOtherSessions: завершение всех сессий кроме текущей для пользователя $userId',
      level: LogLevel.info,
    );

    // Получаем текущий токен
    final currentTokenHash = _tokenService.hashToken(accessToken);

    // Находим все активные сессии кроме текущей
    final otherSessions = await AuthSession.db.find(
      session,
      where: (t) =>
          (t.userId.equals(userId)) &
          (t.isActive.equals(true)) &
          (t.tokenHash.notEquals(currentTokenHash)),
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
