import 'package:serverpod/serverpod.dart';

/// Endpoint для авторизации по логину и паролю.
class AuthEndpoint extends Endpoint {
  /// Метод для входа в систему.
  /// Проверяет логин и пароль из переменных окружения.
  Future<bool> login(Session session, String login, String password) async {
    final adminLogin = session.passwords['adminLogin'];
    final adminPassword = session.passwords['adminPassword'];

    if (adminLogin == null || adminPassword == null) {
      session.log(
        'Admin credentials are not configured',
        level: LogLevel.warning,
      );
      return false;
    }

    if (login == adminLogin && password == adminPassword) {
      session.log('User logged in successfully: $login');
      return true;
    }

    session.log(
      'Failed login attempt for user: $login',
      level: LogLevel.warning,
    );
    return false;
  }
}
