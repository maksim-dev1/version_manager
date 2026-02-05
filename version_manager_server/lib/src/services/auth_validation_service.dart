import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';

/// Сервис для проверки аутентификации в эндпоинтах.
///
/// Используется для извлечения информации о текущей сессии
/// на основе access token, переданного клиентом.
class AuthValidationService {
  final _tokenService = Services().tokenService;

  /// Проверяет access token и возвращает информацию о сессии.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД
  /// - [accessToken] — JWT access token от клиента
  ///
  /// ### Возвращает
  /// Кортеж (userId, authSession) если токен валиден, иначе выбрасывает исключение.
  ///
  /// ### Исключения
  /// - [InvalidDataException] если токен невалиден или сессия неактивна
  Future<({UuidValue userId, AuthSession authSession})> validateToken(
    Session session,
    String accessToken,
  ) async {
    final tokenHash = _tokenService.hashToken(accessToken);

    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => (t.tokenHash.equals(tokenHash)) & (t.isActive.equals(true)),
    );

    if (authSession == null) {
      throw InvalidDataException(
        field: 'accessToken',
        message: 'Сессия не найдена или недействительна',
      );
    }

    // Проверяем срок действия
    if (authSession.expiresAt.isBefore(DateTime.now())) {
      throw InvalidDataException(
        field: 'accessToken',
        message: 'Токен истёк',
      );
    }

    // Обновляем время последней активности
    authSession.lastActivityAt = DateTime.now();
    await AuthSession.db.updateRow(session, authSession);

    return (userId: authSession.userId, authSession: authSession);
  }

  /// Проверяет access token и возвращает только userId.
  ///
  /// Упрощённая версия [validateToken] для случаев,
  /// когда нужен только ID пользователя.
  Future<UuidValue> getUserId(Session session, String accessToken) async {
    final result = await validateToken(session, accessToken);
    return result.userId;
  }
}
