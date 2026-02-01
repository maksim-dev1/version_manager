import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

/// Эндпоинт для управления профилем пользователя.
/// Требует валидной сессии авторизации.
class ProfileEndpoint extends Endpoint {
  /// Получить профиль текущего пользователя по токену.
  Future<User?> getProfile(Session session, String token) async {
    // Проверяем сессию по токену
    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token) & t.isActive.equals(true),
    );

    if (authSession == null) {
      throw InvalidDataException(message: 'Недействительный токен');
    }

    // Проверяем срок действия
    if (authSession.expiresAt.isBefore(DateTime.now())) {
      throw InvalidDataException(message: 'Токен истёк');
    }

    // Получаем пользователя
    final user = await User.db.findById(session, authSession.userId);
    if (user == null) {
      throw InvalidDataException(message: 'Пользователь не найден');
    }

    return user;
  }

  /// Обновить профиль текущего пользователя.
  Future<User> updateProfile(
    Session session,
    String token, {
    String? firstName,
    String? lastName,
    String? displayName,
    String? phone,
  }) async {
    // Проверяем сессию по токену
    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token) & t.isActive.equals(true),
    );

    if (authSession == null) {
      throw InvalidDataException(message: 'Недействительный токен');
    }

    // Проверяем срок действия
    if (authSession.expiresAt.isBefore(DateTime.now())) {
      throw InvalidDataException(message: 'Токен истёк');
    }

    // Получаем пользователя
    final user = await User.db.findById(session, authSession.userId);
    if (user == null) {
      throw InvalidDataException(message: 'Пользователь не найден');
    }

    // Обновляем поля профиля
    if (firstName != null) user.firstName = firstName;
    if (lastName != null) user.lastName = lastName;
    if (displayName != null) user.displayName = displayName;
    if (phone != null) user.phone = phone;
    user.updatedAt = DateTime.now();

    // Сохраняем изменения
    await User.db.updateRow(session, user);

    return user;
  }
}
