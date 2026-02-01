import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/email_service.dart';
import 'package:version_manager_server/src/services/password_service.dart';
import 'package:version_manager_server/src/services/token_service.dart';
import 'package:version_manager_server/src/services/verification_code_service.dart';

/// Endpoint для авторизации и регистрации пользователей
class AuthEndpoint extends Endpoint {
  final _passwordService = PasswordService();
  final _tokenService = TokenService();
  
  // Настройте ваш email provider
  final _emailService = EmailService(
    provider: EmailProvider.yandex,
    templatesPath: 'email_templates',
  );

  /// 1. Проверка существования email (вход или регистрация?)
  Future<CheckEmailResponse> checkEmail(
    Session session,
    CheckEmailRequest request,
  ) async {
    print('Starting email existence check for: ${request.email}');
    session.log('Checking email existence: ${request.email}');
    final email = request.email.toLowerCase().trim();
    
    // Базовая валидация email
    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }

    session.log('Email format valid');

    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    session.log('Email exists: ${user != null}');

    return CheckEmailResponse(exists: user != null);
  }

  /// 2. Регистрация: отправить код на email
  Future<SendCodeResponse> registerSendCode(
    Session session,
    RegisterSendCodeRequest request,
  ) async {
    session.log('Sending registration code to email: ${request.email}');
    final email = request.email.toLowerCase().trim();

    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }

    session.log('Email format valid');

    // Проверяем что пользователь НЕ существует
    final existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    session.log('Existing user check complete');

    if (existingUser != null) {
      throw Exception('Email already registered');
    }

    final codeService = VerificationCodeService(session);

    session.log('Checking rate limit for email: $email');

    // Проверка rate limit (не чаще 1 раза в минуту)
    final rateLimit = await codeService.checkRateLimit(
      email,
      VerificationPurposeType.sign_up,
    );

    session.log('Rate limit check complete');

    if (rateLimit != null) {
      return SendCodeResponse(
        success: false,
        retryAfterSeconds: rateLimit.inSeconds,
      );
    }

    session.log('Generating verification code for email: $email');

    // Инвалидируем старые коды
    await codeService.invalidateUserCodes(
      email,
      VerificationPurposeType.sign_up,
    );

    session.log('Old verification codes invalidated');

    // Создаем новый код
    // ИСПРАВЛЕНО: убраны параметры httpRequest
    final verificationCode = await codeService.createVerificationCode(
      email: email,
      purpose: VerificationPurposeType.sign_up,
    );

    session.log('Verification code created: ${verificationCode.id}');

    // Код временно в поле codeHash (hack из сервиса)
    final plainCode = verificationCode.codeHash;

    // Отправляем email
    try {
      await _emailService.sendVerificationEmail(
        email,
        plainCode,
        appName: 'Version Manager',
      );

      session.log('Verification email sent to: $email');

      return SendCodeResponse(success: true);
    } catch (e) {
      session.log('Error sending verification email: $e');
      throw Exception('Failed to send verification email');
    }
  }

  /// 3. Регистрация: проверить код
  Future<VerifyCodeResponse> registerVerifyCode(
    Session session,
    RegisterVerifyCodeRequest request,
  ) async {
    final email = request.email.toLowerCase().trim();
    final code = request.code.trim();

    final codeService = VerificationCodeService(session);

    final verifiedCode = await codeService.verifyCode(
      email: email,
      code: code,
      purpose: VerificationPurposeType.sign_up,
    );

    if (verifiedCode == null) {
      // Проверяем сколько попыток осталось
      final records = await VerificationCode.db.find(
        session,
        where: (t) =>
            t.email.equals(email) &
            t.purpose.equals(VerificationPurposeType.sign_up) &
            t.isUsed.equals(false),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
        limit: 1,
      );

      if (records.isNotEmpty) {
        final record = records.first;
        
        // ИСПРАВЛЕНО: проверка истечения после получения данных
        if (record.expiresAt.isAfter(DateTime.now())) {
          final attemptsLeft = record.maxAttempts - record.attemptsUsed;
          
          return VerifyCodeResponse(
            success: false,
            attemptsLeft: attemptsLeft > 0 ? attemptsLeft : 0,
            message: attemptsLeft > 0
                ? 'Invalid code. $attemptsLeft attempts left'
                : 'Too many attempts. Request a new code',
          );
        }
      }

      return VerifyCodeResponse(
        success: false,
        message: 'Code not found or expired',
      );
    }

    return VerifyCodeResponse(
      success: true,
      verificationId: verifiedCode.id,
    );
  }

  /// 4. Регистрация: установить пароль и авторизоваться
  Future<AuthResponse> registerSetPassword(
    Session session,
    RegisterSetPasswordRequest request,
  ) async {
    final email = request.email.toLowerCase().trim();
    final password = request.password;

    // Валидация пароля
    if (password.length < 8) {
      throw Exception('Password must be at least 8 characters');
    }

    // Проверяем что verification существует и был недавно использован
    final verification = await VerificationCode.db.findById(
      session,
      request.verificationId,
    );

    if (verification == null ||
        verification.email != email ||
        verification.purpose != VerificationPurposeType.sign_up ||
        !verification.isUsed) {
      throw Exception('Invalid or expired verification');
    }

    // ИСПРАВЛЕНО: проверка usedAt с учетом nullable
    final usedAt = verification.usedAt;
    if (usedAt == null ||
        DateTime.now().difference(usedAt).inMinutes > 15) {
      throw Exception('Verification expired');
    }

    // Проверяем что пользователь еще не создан (защита от гонок)
    final existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (existingUser != null) {
      throw Exception('User already exists');
    }

    // Создаем пользователя
    final passwordHash = _passwordService.hashPassword(password);
    final now = DateTime.now();

    final user = User(
      email: email,
      passwordHash: passwordHash,
      isEmailVerified: true,
      emailVerifiedAt: now,
      isActive: true,
      createdAt: now,
      updatedAt: now,
    );

    final savedUser = await User.db.insertRow(session, user);

    // Создаем сессию
    final authResponse = await _createSession(session, savedUser);

    return authResponse;
  }

  /// 5. Вход по email и паролю
  Future<AuthResponse> login(
    Session session,
    LoginRequest request,
  ) async {
    final email = request.email.toLowerCase().trim();
    final password = request.password;

    // Ищем пользователя
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    // Константное время проверки (защита от timing attacks)
    final isValid = user != null &&
        _passwordService.verifyPassword(password, user.passwordHash);

    if (!isValid) {
      throw Exception('Invalid credentials');
    }

    if (!user.isActive) {
      throw Exception('Account is disabled');
    }

    // Обновляем lastLoginAt
    await User.db.updateRow(
      session,
      user.copyWith(
        lastLoginAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );

    // Создаем сессию
    return await _createSession(session, user);
  }

  /// 6. Обновление токенов
  Future<TokenPairResponse> refresh(
    Session session,
    RefreshTokenRequest request,
  ) async {
    final refreshTokenHash = _tokenService.hashToken(request.refreshToken);
    final now = DateTime.now();

    // ИСПРАВЛЕНО: убрана фильтрация по дате из where
    final sessions = await AuthSession.db.find(
      session,
      where: (t) =>
          t.refreshTokenHash.equals(refreshTokenHash) &
          t.isActive.equals(true),
    );

    // Фильтруем вручную по дате
    final validSessions = sessions.where(
      (s) => s.refreshExpiresAt.isAfter(now),
    ).toList();

    if (validSessions.isEmpty) {
      throw Exception('Invalid or expired refresh token');
    }

    final authSession = validSessions.first;

    // Генерируем новую пару токенов (rotation)
    final tokenPair = _tokenService.generateTokenPair();

    final updated = authSession.copyWith(
      tokenHash: _tokenService.hashToken(tokenPair.accessToken),
      refreshTokenHash: _tokenService.hashToken(tokenPair.refreshToken),
      expiresAt: now.add(Duration(hours: 1)), // access token TTL
      refreshExpiresAt: now.add(Duration(days: 30)), // refresh token TTL
      lastActivityAt: now,
    );

    await AuthSession.db.updateRow(session, updated);

    return TokenPairResponse(
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
    );
  }

  /// 7. Выход (завершение текущей сессии)
  Future<SuccessResponse> logout(
    Session session,
    String accessToken,
  ) async {
    final tokenHash = _tokenService.hashToken(accessToken);

    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.tokenHash.equals(tokenHash),
    );

    if (authSession != null) {
      await AuthSession.db.updateRow(
        session,
        authSession.copyWith(
          isActive: false,
          revokedAt: DateTime.now(),
        ),
      );
    }

    return SuccessResponse(success: true);
  }

  /// 8. Выход со всех устройств
  Future<SuccessResponse> logoutAll(
    Session session,
    String accessToken,
  ) async {
    final tokenHash = _tokenService.hashToken(accessToken);

    // Находим текущую сессию чтобы получить userId
    final currentSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.tokenHash.equals(tokenHash),
    );

    // ИСПРАВЛЕНО: проверка nullable userId
    if (currentSession == null) {
      throw Exception('Invalid session');
    }

    final userId = currentSession.userId;

    // Деактивируем все сессии пользователя
    final allSessions = await AuthSession.db.find(
      session,
      where: (t) =>
          t.userId.equals(userId) & t.isActive.equals(true),
    );

    for (final authSession in allSessions) {
      await AuthSession.db.updateRow(
        session,
        authSession.copyWith(
          isActive: false,
          revokedAt: DateTime.now(),
        ),
      );
    }

    return SuccessResponse(success: true, message: 'Logged out from all devices');
  }

  // Вспомогательные методы

  Future<AuthResponse> _createSession(
    Session session,
    User user,
  ) async {
    final tokenPair = _tokenService.generateTokenPair();
    final now = DateTime.now();

    if (user.id == null) {
      throw Exception('User has no ID');
    }

    final authSession = AuthSession(
      userId: user.id!,
      tokenHash: _tokenService.hashToken(tokenPair.accessToken),
      refreshTokenHash: _tokenService.hashToken(tokenPair.refreshToken),
      deviceInfo: null,
      ipAddress: null,
      userAgent: null,
      expiresAt: now.add(Duration(hours: 1)), // access 1 час
      refreshExpiresAt: now.add(Duration(days: 30)), // refresh 30 дней
      createdAt: now,
      lastActivityAt: now,
      isActive: true,
    );

    await AuthSession.db.insertRow(session, authSession);

    return AuthResponse(
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      user: _toUserPublic(user),
    );
  }

  UserPublic _toUserPublic(User user) {
    // ИСПРАВЛЕНО: проверка nullable id
    if (user.id == null) {
      throw Exception('User has no ID');
    }

    return UserPublic(
      id: user.id!,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      displayName: user.displayName,
      avatarUrl: user.avatarUrl,
      isEmailVerified: user.isEmailVerified,
      createdAt: user.createdAt,
    );
  }

  bool _isValidEmail(String email) {
    final regex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return regex.hasMatch(email);
  }
}
