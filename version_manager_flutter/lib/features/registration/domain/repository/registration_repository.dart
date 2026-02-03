import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для регистрации новых пользователей.
///
/// Отвечает ТОЛЬКО за:
/// - Повторную отправку кода верификации
/// - Регистрацию нового пользователя
///
/// ПРИМЕЧАНИЕ: Первая отправка кода происходит автоматически
/// при проверке email в AuthRepository.checkEmail().
abstract interface class RegistrationRepository {
  /// Повторно отправляет код верификации на email.
  ///
  /// ### Параметры
  /// - [email] — адрес электронной почты пользователя
  ///
  /// ### Возвращает
  /// [SendCodeResponse] со следующими полями:
  /// - `success` — `true` если код успешно отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit
  Future<SendCodeResponse> resendCode({
    required String email,
  });

  /// Регистрирует нового пользователя.
  ///
  /// Проверяет код верификации, создаёт аккаунт и выполняет автовход.
  ///
  /// ### Параметры
  /// - [email] — адрес электронной почты
  /// - [code] — 6-значный код верификации
  /// - [password] — пароль (минимум 8 символов)
  ///
  /// ### Возвращает
  /// [AuthResponse] с данными пользователя и токенами
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'code'` — неверный код
  /// - [InvalidDataException] с `field: 'password'` — слабый пароль
  /// - [InvalidDataException] с `field: 'email'` — email уже занят
  Future<AuthResponse> register({
    required String email,
    required String code,
    required String password,
  });
}
