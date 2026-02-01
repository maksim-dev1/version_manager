import 'dart:convert';
import 'dart:math';
import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/email_service.dart';
import 'package:version_manager_server/src/services/password_service.dart';
import 'package:version_manager_server/src/utils/code_generator.dart';
import 'package:version_manager_server/src/utils/validators.dart';

/// Константы авторизации
class AuthConstants {
  /// Время жизни кода верификации
  static const verificationCodeLifetime = Duration(minutes: 10);

  /// Максимальное количество попыток ввода кода
  static const maxCodeAttempts = 5;

  /// Минимальный интервал между отправками кода
  static const resendCodeCooldown = Duration(minutes: 1);

  /// Время жизни access токена
  static const accessTokenLifetime = Duration(hours: 24);

  /// Время жизни refresh токена
  static const refreshTokenLifetime = Duration(days: 30);

  /// Длина токена в байтах
  static const tokenLength = 64;
}

/// Сервис авторизации - вся бизнес-логика аутентификации.
class AuthService {
  final EmailService _emailService;

  static final _random = Random.secure();

  AuthService({required EmailService emailService})
    : _emailService = emailService;

  // ==================== ПРОВЕРКА EMAIL ====================

  /// Проверяет существование email и возможность отправки кода.
  Future<EmailCheckResult> checkEmail(Session session, String email) async {
    final normalizedEmail = email.toLowerCase().trim();

    // Валидация формата
    if (!Validators.isValidEmail(normalizedEmail)) {
      throw InvalidDataException(
        message: 'Неверный формат email',
        field: 'email',
      );
    }

    // Проверяем существование пользователя
    final existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalizedEmail),
    );

    // Проверяем последний код для cooldown
    final lastCode = await VerificationCode.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalizedEmail) & t.isUsed.equals(false),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    DateTime? resendAvailableAt;
    bool canResend = true;

    if (lastCode != null) {
      final timeSinceLastCode = DateTime.now().difference(lastCode.createdAt);
      if (timeSinceLastCode < AuthConstants.resendCodeCooldown) {
        canResend = false;
        resendAvailableAt = lastCode.createdAt.add(
          AuthConstants.resendCodeCooldown,
        );
      }
    }

    return EmailCheckResult(
      exists: existingUser != null,
      canResendCode: canResend,
      resendAvailableAt: resendAvailableAt,
    );
  }

  // ==================== РЕГИСТРАЦИЯ ====================

  /// Начинает процесс регистрации - отправляет код на email.
  Future<VerificationCodeSentResult> startRegistration(
    Session session,
    String email,
  ) async {
    final normalizedEmail = email.toLowerCase().trim();

    // Валидация
    if (!Validators.isValidEmail(normalizedEmail)) {
      throw InvalidDataException(
        message: 'Неверный формат email',
        field: 'email',
      );
    }

    // Проверяем что email не занят
    final existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalizedEmail),
    );

    if (existingUser != null) {
      throw InvalidDataException(
        message: 'Email уже зарегистрирован',
        field: 'email',
      );
    }

    // Проверяем cooldown
    final recentCodes = await VerificationCode.db.find(
      session,
      where: (t) => t.email.equals(normalizedEmail) & t.isUsed.equals(false),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 10,
    );

    // Фильтруем по типу в коде (enum не поддерживает equals в SQL)
    final lastCode = recentCodes
        .where((c) => c.type == VerificationCodeType.registration)
        .firstOrNull;

    if (lastCode != null) {
      final timeSinceLastCode = DateTime.now().difference(lastCode.createdAt);
      if (timeSinceLastCode < AuthConstants.resendCodeCooldown) {
        throw InvalidDataException(
          message: 'Подождите перед повторной отправкой кода',
          field: 'email',
        );
      }
    }

    // Деактивируем старые коды
    await _invalidateOldCodes(
      session,
      normalizedEmail,
      VerificationCodeType.registration,
    );

    // Генерируем новый код
    final code = CodeGenerator.generateVerificationCode(length: 6);
    final expiresAt = DateTime.now().add(
      AuthConstants.verificationCodeLifetime,
    );

    // Сохраняем в базу
    final verificationCode = await VerificationCode.db.insertRow(
      session,
      VerificationCode(
        email: normalizedEmail,
        code: code,
        type: VerificationCodeType.registration,
        expiresAt: expiresAt,
        maxAttempts: AuthConstants.maxCodeAttempts,
      ),
    );

    // Отправляем email
    await _emailService.sendVerificationEmail(
      normalizedEmail,
      code,
      appName: 'Version Manager',
    );

    return VerificationCodeSentResult(
      verificationId: verificationCode.id!,
      email: normalizedEmail,
      expiresAt: expiresAt,
      attemptsLeft: AuthConstants.maxCodeAttempts,
    );
  }

  /// Завершает регистрацию - проверяет код и создает пользователя.
  Future<AuthResponse> completeRegistration(
    Session session, {
    required int verificationId,
    required String code,
    required String password,
  }) async {
    // Валидация пароля
    if (!Validators.isValidPassword(password)) {
      throw InvalidDataException(
        message:
            'Пароль должен содержать минимум 8 символов, включая буквы и цифры',
        field: 'password',
      );
    }

    // Получаем код верификации
    final verification = await VerificationCode.db.findById(
      session,
      verificationId,
    );

    if (verification == null) {
      throw InvalidDataException(
        message: 'Код верификации не найден',
        field: 'verificationId',
      );
    }

    // Проверяем что код не использован
    if (verification.isUsed) {
      throw InvalidDataException(
        message: 'Код уже использован',
        field: 'code',
      );
    }

    // Проверяем срок действия
    if (DateTime.now().isAfter(verification.expiresAt)) {
      throw InvalidDataException(
        message: 'Код верификации истек',
        field: 'code',
      );
    }

    // Проверяем количество попыток
    if (verification.attempts >= verification.maxAttempts) {
      throw InvalidDataException(
        message: 'Превышено количество попыток ввода кода',
        field: 'code',
      );
    }

    // Увеличиваем счетчик попыток
    verification.attempts += 1;
    await VerificationCode.db.updateRow(session, verification);

    // Проверяем код
    if (verification.code != code) {
      final attemptsLeft = verification.maxAttempts - verification.attempts;
      throw InvalidDataException(
        message: 'Неверный код. Осталось попыток: $attemptsLeft',
        field: 'code',
      );
    }

    // Код верный! Помечаем как использованный
    verification.isUsed = true;
    await VerificationCode.db.updateRow(session, verification);

    // Создаем пользователя
    final passwordHash = PasswordService.hashPassword(password);

    final user = await User.db.insertRow(
      session,
      User(
        email: verification.email,
        passwordHash: passwordHash,
        isEmailVerified: true,
        isActive: true,
        createdAt: DateTime.now(),
      ),
    );

    // Создаем сессию
    return await _createSession(session, user);
  }

  // ==================== ВХОД ====================

  /// Вход по email и паролю.
  Future<AuthResponse> login(
    Session session, {
    required String email,
    required String password,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
  }) async {
    final normalizedEmail = email.toLowerCase().trim();

    // Ищем пользователя
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalizedEmail),
    );

    if (user == null) {
      throw InvalidDataException(
        message: 'Неверный email или пароль',
        field: 'credentials',
      );
    }

    // Проверяем что аккаунт активен
    if (!user.isActive) {
      throw InvalidDataException(
        message: 'Аккаунт заблокирован',
        field: 'account',
      );
    }

    // Проверяем пароль
    if (!PasswordService.verifyPassword(password, user.passwordHash)) {
      throw InvalidDataException(
        message: 'Неверный email или пароль',
        field: 'credentials',
      );
    }

    // Обновляем время последнего входа
    user.lastLoginAt = DateTime.now();
    await User.db.updateRow(session, user);

    // Создаем сессию
    return await _createSession(
      session,
      user,
      deviceInfo: deviceInfo,
      ipAddress: ipAddress,
      userAgent: userAgent,
    );
  }

  // ==================== СБРОС ПАРОЛЯ ====================

  /// Начинает процесс сброса пароля.
  Future<VerificationCodeSentResult> startPasswordReset(
    Session session,
    String email,
  ) async {
    final normalizedEmail = email.toLowerCase().trim();

    // Ищем пользователя
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalizedEmail),
    );

    if (user == null) {
      // Не раскрываем информацию о существовании аккаунта
      // Возвращаем "успех" даже если пользователь не найден
      throw InvalidDataException(
        message: 'Если email зарегистрирован, код будет отправлен',
        field: 'email',
      );
    }

    // Проверяем cooldown
    final recentResetCodes = await VerificationCode.db.find(
      session,
      where: (t) => t.email.equals(normalizedEmail) & t.isUsed.equals(false),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 10,
    );

    // Фильтруем по типу в коде
    final lastCode = recentResetCodes
        .where((c) => c.type == VerificationCodeType.passwordReset)
        .firstOrNull;

    if (lastCode != null) {
      final timeSinceLastCode = DateTime.now().difference(lastCode.createdAt);
      if (timeSinceLastCode < AuthConstants.resendCodeCooldown) {
        throw InvalidDataException(
          message: 'Подождите перед повторной отправкой кода',
          field: 'email',
        );
      }
    }

    // Деактивируем старые коды
    await _invalidateOldCodes(
      session,
      normalizedEmail,
      VerificationCodeType.passwordReset,
    );

    // Генерируем новый код
    final code = CodeGenerator.generateVerificationCode(length: 6);
    final expiresAt = DateTime.now().add(
      AuthConstants.verificationCodeLifetime,
    );

    // Сохраняем в базу
    final verificationCode = await VerificationCode.db.insertRow(
      session,
      VerificationCode(
        userId: user.id,
        email: normalizedEmail,
        code: code,
        type: VerificationCodeType.passwordReset,
        expiresAt: expiresAt,
        maxAttempts: AuthConstants.maxCodeAttempts,
      ),
    );

    // Отправляем email
    await _emailService.sendPasswordResetEmail(
      normalizedEmail,
      code,
      username: user.displayName ?? user.firstName,
      appName: 'Version Manager',
    );

    return VerificationCodeSentResult(
      verificationId: verificationCode.id!,
      email: normalizedEmail,
      expiresAt: expiresAt,
      attemptsLeft: AuthConstants.maxCodeAttempts,
    );
  }

  /// Завершает сброс пароля.
  Future<AuthResponse> completePasswordReset(
    Session session, {
    required int verificationId,
    required String code,
    required String newPassword,
  }) async {
    // Валидация пароля
    if (!Validators.isValidPassword(newPassword)) {
      throw InvalidDataException(
        message:
            'Пароль должен содержать минимум 8 символов, включая буквы и цифры',
        field: 'password',
      );
    }

    // Получаем код верификации
    final verification = await VerificationCode.db.findById(
      session,
      verificationId,
    );

    if (verification == null ||
        verification.type != VerificationCodeType.passwordReset) {
      throw InvalidDataException(
        message: 'Код верификации не найден',
        field: 'verificationId',
      );
    }

    // Те же проверки что и при регистрации
    if (verification.isUsed) {
      throw InvalidDataException(
        message: 'Код уже использован',
        field: 'code',
      );
    }

    if (DateTime.now().isAfter(verification.expiresAt)) {
      throw InvalidDataException(
        message: 'Код верификации истек',
        field: 'code',
      );
    }

    if (verification.attempts >= verification.maxAttempts) {
      throw InvalidDataException(
        message: 'Превышено количество попыток ввода кода',
        field: 'code',
      );
    }

    verification.attempts += 1;
    await VerificationCode.db.updateRow(session, verification);

    if (verification.code != code) {
      final attemptsLeft = verification.maxAttempts - verification.attempts;
      throw InvalidDataException(
        message: 'Неверный код. Осталось попыток: $attemptsLeft',
        field: 'code',
      );
    }

    // Код верный!
    verification.isUsed = true;
    await VerificationCode.db.updateRow(session, verification);

    // Обновляем пароль пользователя
    final user = await User.db.findById(session, verification.userId!);
    if (user == null) {
      throw InvalidDataException(
        message: 'Пользователь не найден',
        field: 'user',
      );
    }

    user.passwordHash = PasswordService.hashPassword(newPassword);
    user.updatedAt = DateTime.now();
    await User.db.updateRow(session, user);

    // Инвалидируем все старые сессии
    await _invalidateAllSessions(session, user.id!);

    // Создаем новую сессию
    return await _createSession(session, user);
  }

  // ==================== УПРАВЛЕНИЕ СЕССИЯМИ ====================

  /// Проверяет токен и возвращает пользователя.
  Future<User?> validateToken(Session session, String token) async {
    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token) & t.isActive.equals(true),
    );

    if (authSession == null) {
      return null;
    }

    // Проверяем срок действия
    if (DateTime.now().isAfter(authSession.expiresAt)) {
      authSession.isActive = false;
      await AuthSession.db.updateRow(session, authSession);
      return null;
    }

    // Обновляем время активности
    authSession.lastActivityAt = DateTime.now();
    await AuthSession.db.updateRow(session, authSession);

    return await User.db.findById(session, authSession.userId);
  }

  /// Обновляет токен используя refresh token.
  Future<AuthResponse> refreshToken(
    Session session,
    String refreshToken,
  ) async {
    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) =>
          t.refreshToken.equals(refreshToken) & t.isActive.equals(true),
    );

    if (authSession == null) {
      throw InvalidDataException(
        message: 'Сессия не найдена',
        field: 'refreshToken',
      );
    }

    // Проверяем срок действия refresh токена
    if (DateTime.now().isAfter(authSession.refreshExpiresAt)) {
      authSession.isActive = false;
      await AuthSession.db.updateRow(session, authSession);
      throw InvalidDataException(
        message: 'Сессия истекла, необходимо войти заново',
        field: 'refreshToken',
      );
    }

    final user = await User.db.findById(session, authSession.userId);
    if (user == null || !user.isActive) {
      throw InvalidDataException(
        message: 'Пользователь не найден или заблокирован',
        field: 'user',
      );
    }

    // Деактивируем старую сессию
    authSession.isActive = false;
    await AuthSession.db.updateRow(session, authSession);

    // Создаем новую сессию
    return await _createSession(
      session,
      user,
      deviceInfo: authSession.deviceInfo,
      ipAddress: authSession.ipAddress,
      userAgent: authSession.userAgent,
    );
  }

  /// Выход - деактивация текущей сессии.
  Future<void> logout(Session session, String token) async {
    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.token.equals(token),
    );

    if (authSession != null) {
      authSession.isActive = false;
      await AuthSession.db.updateRow(session, authSession);
    }
  }

  /// Выход со всех устройств.
  Future<void> logoutAll(Session session, int userId) async {
    await _invalidateAllSessions(session, userId);
  }

  // ==================== ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ ====================

  /// Создает новую сессию для пользователя.
  Future<AuthResponse> _createSession(
    Session session,
    User user, {
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
  }) async {
    final token = _generateToken();
    final refreshToken = _generateToken();
    final now = DateTime.now();
    final expiresAt = now.add(AuthConstants.accessTokenLifetime);
    final refreshExpiresAt = now.add(AuthConstants.refreshTokenLifetime);

    await AuthSession.db.insertRow(
      session,
      AuthSession(
        userId: user.id!,
        token: token,
        refreshToken: refreshToken,
        deviceInfo: deviceInfo,
        ipAddress: ipAddress,
        userAgent: userAgent,
        expiresAt: expiresAt,
        refreshExpiresAt: refreshExpiresAt,
        isActive: true,
        lastActivityAt: now,
      ),
    );

    return AuthResponse(
      user: user,
      token: token,
      refreshToken: refreshToken,
      expiresAt: expiresAt,
    );
  }

  /// Генерирует случайный токен.
  String _generateToken() {
    final bytes = List<int>.generate(
      AuthConstants.tokenLength,
      (_) => _random.nextInt(256),
    );
    return base64Url.encode(bytes);
  }

  /// Деактивирует старые коды верификации.
  Future<void> _invalidateOldCodes(
    Session session,
    String email,
    VerificationCodeType type,
  ) async {
    final allCodes = await VerificationCode.db.find(
      session,
      where: (t) => t.email.equals(email) & t.isUsed.equals(false),
    );

    // Фильтруем по типу в коде
    final oldCodes = allCodes.where((c) => c.type == type);

    for (final code in oldCodes) {
      code.isUsed = true;
      await VerificationCode.db.updateRow(session, code);
    }
  }

  /// Деактивирует все сессии пользователя.
  Future<void> _invalidateAllSessions(Session session, int userId) async {
    final sessions = await AuthSession.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.isActive.equals(true),
    );

    for (final s in sessions) {
      s.isActive = false;
      await AuthSession.db.updateRow(session, s);
    }
  }
}
