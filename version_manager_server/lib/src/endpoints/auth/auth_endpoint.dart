import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/auth_service.dart';
import 'package:version_manager_server/src/services/email_service.dart';

/// Endpoint для авторизации пользователей.
///
/// Поддерживает:
/// - Регистрацию через email с кодом подтверждения
/// - Вход по email и паролю
/// - Сброс пароля
/// - Управление сессиями
class AuthEndpoint extends Endpoint {
  late final AuthService _authService;

  AuthEndpoint() {
    _authService = AuthService(
      emailService: EmailService(provider: EmailProvider.google),
    );
  }

  // ==================== ПРОВЕРКА EMAIL ====================

  /// Проверяет существование email в системе.
  ///
  /// Возвращает:
  /// - exists: true если email уже зарегистрирован
  /// - canResendCode: true если можно отправить код (прошел cooldown)
  /// - resendAvailableAt: когда можно будет отправить код повторно
  Future<EmailCheckResult> checkEmail(Session session, String email) async {
    return await _authService.checkEmail(session, email);
  }

  // ==================== РЕГИСТРАЦИЯ ====================

  /// Начинает процесс регистрации.
  ///
  /// Отправляет код подтверждения на указанный email.
  /// Код действителен 10 минут, максимум 5 попыток ввода.
  ///
  /// Throws InvalidDataException если:
  /// - email невалидный
  /// - email уже зарегистрирован
  /// - не прошел cooldown (1 минута)
  Future<VerificationCodeSentResult> startRegistration(
    Session session,
    String email,
  ) async {
    return await _authService.startRegistration(session, email);
  }

  /// Завершает регистрацию.
  ///
  /// Проверяет код и создает нового пользователя.
  /// При успехе возвращает токены авторизации.
  ///
  /// [verificationId] - ID из startRegistration
  /// [code] - 6-значный код из email
  /// [password] - пароль (минимум 8 символов, буквы и цифры)
  Future<AuthResponse> completeRegistration(
    Session session, {
    required int verificationId,
    required String code,
    required String password,
  }) async {
    return await _authService.completeRegistration(
      session,
      verificationId: verificationId,
      code: code,
      password: password,
    );
  }

  // ==================== ВХОД ====================

  /// Вход по email и паролю.
  ///
  /// При успехе возвращает токены авторизации.
  Future<AuthResponse> login(
    Session session, {
    required String email,
    required String password,
    String? deviceInfo,
  }) async {
    return await _authService.login(
      session,
      email: email,
      password: password,
      deviceInfo: deviceInfo,
    );
  }

  // ==================== СБРОС ПАРОЛЯ ====================

  /// Начинает процесс сброса пароля.
  ///
  /// Отправляет код на email для сброса пароля.
  Future<VerificationCodeSentResult> startPasswordReset(
    Session session,
    String email,
  ) async {
    return await _authService.startPasswordReset(session, email);
  }

  /// Завершает сброс пароля.
  ///
  /// Устанавливает новый пароль и возвращает новые токены.
  /// Все старые сессии будут деактивированы.
  Future<AuthResponse> completePasswordReset(
    Session session, {
    required int verificationId,
    required String code,
    required String newPassword,
  }) async {
    return await _authService.completePasswordReset(
      session,
      verificationId: verificationId,
      code: code,
      newPassword: newPassword,
    );
  }

  // ==================== УПРАВЛЕНИЕ СЕССИЯМИ ====================

  /// Проверяет токен и возвращает текущего пользователя.
  ///
  /// Используется для проверки авторизации на клиенте.
  Future<User?> validateToken(Session session, String token) async {
    return await _authService.validateToken(session, token);
  }

  /// Обновляет токен используя refresh token.
  ///
  /// Возвращает новую пару токенов.
  Future<AuthResponse> refreshToken(
    Session session,
    String refreshToken,
  ) async {
    return await _authService.refreshToken(session, refreshToken);
  }

  /// Выход из системы.
  ///
  /// Деактивирует текущую сессию.
  Future<void> logout(Session session, String token) async {
    await _authService.logout(session, token);
  }

  /// Выход со всех устройств.
  ///
  /// Деактивирует все сессии текущего пользователя.
  Future<void> logoutAll(Session session, String token) async {
    final user = await _authService.validateToken(session, token);
    if (user != null) {
      await _authService.logoutAll(session, user.id!);
    }
  }
}
