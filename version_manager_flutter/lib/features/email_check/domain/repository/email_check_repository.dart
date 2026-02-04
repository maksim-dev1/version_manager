import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для проверки email.
///
/// Отвечает за:
/// - Проверку существования email в системе
/// - Отправку кода верификации при регистрации
abstract interface class EmailCheckRepository {
  /// Проверяет существование email в системе.
  ///
  /// Это первый шаг в потоке регистрации/входа. Метод определяет,
  /// существует ли пользователь с указанным email:
  /// - **Если существует** — возвращает `existsEmail: true`
  /// - **Если не существует** — возвращает `existsEmail: false`, `codeSent: true`
  ///   (код верификации отправлен автоматически)
  ///
  /// ### Параметры
  /// - [email] — адрес электронной почты пользователя
  ///
  /// ### Возвращает
  /// [CheckEmailAndSendCodeResponse] со следующими полями:
  /// - `existsEmail` — `true` если пользователь существует
  /// - `codeSent` — `true` если код верификации отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'email'` — невалидный формат email
  Future<CheckEmailAndSendCodeResponse> checkEmail({
    required String email,
  });
}
