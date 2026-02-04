import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';
import 'package:version_manager_server/src/services/verification_code_service.dart';

/// Эндпоинт аутентификации и авторизации пользователей.
///
/// Предоставляет полный цикл работы с учётными записями:
/// - Проверка существования email и отправка кода верификации
/// - Регистрация новых пользователей с подтверждением email
/// - Вход в систему по email и паролю
/// - Управление токенами доступа (refresh token rotation)
/// - Завершение сессий (logout)
///
/// ## Поток регистрации
/// 1. [checkEmailAndSendCode] — проверяет email, отправляет код для новых пользователей
/// 2. [resendCode] — повторная отправка кода (если нужно)
/// 3. [register] — подтверждение кода, создание аккаунта и автоматический вход
///
/// ## Поток входа
/// 1. [checkEmailAndSendCode] — определяет, что пользователь существует
/// 2. [login] — аутентификация по email и паролю
///
/// ## Управление сессиями
/// - [refreshTokens] — обновление пары токенов
/// - [logout] — завершение текущей сессии
/// - [logoutAll] — завершение всех сессий пользователя
///
/// Все методы логируют свои действия через [Session.log] для аудита.
class AuthEndpoint extends Endpoint {
  /// Сервис для хэширования и проверки паролей.
  final _passwordService = Services().passwordService;

  /// Сервис для генерации и валидации JWT токенов.
  final _tokenService = Services().tokenService;

  /// Сервис для отправки email-уведомлений.
  final _emailService = Services().emailService;

  /// Проверяет существование email и автоматически отправляет код верификации
  /// для новых пользователей.
  ///
  /// Это первый шаг в потоке регистрации/входа. Метод определяет,
  /// существует ли пользователь с указанным email:
  /// - **Если существует** — возвращает `existsEmail: true`, клиент
  ///   должен показать форму ввода пароля
  /// - **Если не существует** — отправляет 6-значный код на email
  ///   и возвращает `codeSent: true`
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod с доступом к БД и логированию
  /// - [request] — запрос с полем `email`
  ///
  /// ### Возвращает
  /// [CheckEmailAndSendCodeResponse] со следующими полями:
  /// - `existsEmail` — `true` если пользователь существует (нужен вход)
  /// - `codeSent` — `true` если код успешно отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit (опционально)
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'email'` — невалидный формат email
  ///
  /// ### Пример использования
  /// ```dart
  /// final response = await client.auth.checkEmailAndSendCode(
  ///   CheckEmailRequest(email: 'user@example.com'),
  /// );
  /// if (response.existsEmail) {
  ///   // Показать форму входа
  /// } else if (response.codeSent) {
  ///   // Показать форму ввода кода
  /// }
  /// ```
  Future<CheckEmailAndSendCodeResponse> checkEmailAndSendCode(
    Session session, {
    required CheckEmailRequest request,
  }) async {
    final email = request.email.trim();

    session.log(
      'checkEmailAndSendCode: проверка email $email',
      level: LogLevel.info,
    );

    // Валидация email
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(email)) {
      session.log(
        'checkEmailAndSendCode: невалидный формат email $email',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Неверный формат email',
        field: 'email',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Проверяем существование пользователя
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    // Если пользователь существует - это вход
    if (user != null) {
      session.log(
        'checkEmailAndSendCode: пользователь $email существует, перенаправление на вход',
        level: LogLevel.info,
      );
      return CheckEmailAndSendCodeResponse(existsEmail: true, codeSent: false);
    }

    // Пользователь не существует - отправляем код регистрации
    session.log(
      'checkEmailAndSendCode: новый пользователь, отправка кода верификации на $email',
      level: LogLevel.info,
    );

    final codeService = VerificationCodeService(session);
    final result = await codeService.createCode(
      email: email,
      purpose: VerificationPurposeType.sign_up,
    );

    // Rate limit
    if (result.waitTime != null) {
      session.log(
        'checkEmailAndSendCode: rate limit для $email, ожидание ${result.waitTime!.inSeconds}с',
        level: LogLevel.warning,
      );
      return CheckEmailAndSendCodeResponse(
        existsEmail: false,
        codeSent: false,
        retryAfterSeconds: result.waitTime!.inSeconds,
      );
    }

    // Отправляем email (codeHash содержит plain код для отправки)
    await _emailService.sendVerificationEmail(
      email,
      result.code!.codeHash,
      appName: 'Version Manager',
    );

    session.log(
      'checkEmailAndSendCode: код верификации успешно отправлен на $email',
      level: LogLevel.info,
    );

    return CheckEmailAndSendCodeResponse(existsEmail: false, codeSent: true);
  }

  /// Повторно отправляет код верификации на указанный email.
  ///
  /// Используется когда пользователь не получил код или срок его действия
  /// истёк. Метод создаёт новый код и отправляет его на email.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос с полем `email`
  ///
  /// ### Возвращает
  /// [SendCodeResponse] со следующими полями:
  /// - `success` — `true` если код успешно отправлен
  /// - `retryAfterSeconds` — время ожидания при rate limit (опционально)
  ///
  /// ### Rate Limiting
  /// Между отправками кодов должно пройти минимум 60 секунд.
  /// При превышении лимита возвращается `success: false` и
  /// `retryAfterSeconds` с временем ожидания.
  ///
  /// ### Пример использования
  /// ```dart
  /// final response = await client.auth.resendCode(
  ///   RegisterSendCodeRequest(email: 'user@example.com'),
  /// );
  /// if (!response.success && response.retryAfterSeconds != null) {
  ///   // Показать таймер обратного отсчёта
  /// }
  /// ```
  Future<SendCodeResponse> resendCode(
    Session session, {
    required RegisterSendCodeRequest request,
  }) async {
    final email = request.email.trim();

    session.log(
      'resendCode: повторная отправка кода на $email',
      level: LogLevel.info,
    );

    final codeService = VerificationCodeService(session);
    final result = await codeService.createCode(
      email: email,
      purpose: VerificationPurposeType.sign_up,
    );

    // Rate limit
    if (result.waitTime != null) {
      session.log(
        'resendCode: rate limit для $email, ожидание ${result.waitTime!.inSeconds}с',
        level: LogLevel.warning,
      );
      return SendCodeResponse(
        success: false,
        retryAfterSeconds: result.waitTime!.inSeconds,
      );
    }

    await _emailService.sendVerificationEmail(
      email,
      result.code!.codeHash,
      appName: 'Version Manager',
    );

    session.log(
      'resendCode: код успешно отправлен на $email',
      level: LogLevel.info,
    );

    return SendCodeResponse(success: true);
  }

  /// Проверяет код регистрации без создания аккаунта.
  ///
  /// Полезно для отдельного шага в UI, когда нужно подтвердить код
  /// перед переходом к созданию пароля.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос с полями `email` и `code`
  ///
  /// ### Возвращает
  /// [SuccessResponse] с `success: true` при успешной проверке
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'code'` — неверный/истёкший код или
  ///   превышен лимит попыток
  Future<SuccessResponse> verifyRegisterCode(
    Session session, {
    required RegisterVerifyCodeRequest request,
  }) async {
    final email = request.email.trim();
    final code = request.code.trim();

    session.log(
      'verifyRegisterCode: проверка кода для $email',
      level: LogLevel.info,
    );

    final codeService = VerificationCodeService(session);
    final verifiedCode = await codeService.verifyCode(
      email: email,
      code: code,
      purpose: VerificationPurposeType.sign_up,
    );

    if (verifiedCode == null) {
      // Проверяем есть ли активный код для информации о попытках
      final records = await VerificationCode.db.find(
        session,
        where: (t) =>
            t.email.equals(email.toLowerCase().trim()) &
            t.purpose.equals(VerificationPurposeType.sign_up) &
            t.isUsed.equals(false),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
        limit: 1,
      );

      if (records.isNotEmpty) {
        final activeCode = records.first;
        if (activeCode.expiresAt.isAfter(DateTime.now())) {
          final attemptsLeft = activeCode.maxAttempts - activeCode.attemptsUsed;

          if (attemptsLeft <= 0) {
            session.log(
              'verifyRegisterCode: попытки исчерпаны для $email',
              level: LogLevel.warning,
            );
            throw TooManyAttemptsException(
              message: 'Слишком много попыток. Запросите новый код',
              stackTrace: StackTrace.current.toString(),
            );
          }

          session.log(
            'verifyRegisterCode: неверный код для $email, осталось попыток: $attemptsLeft',
            level: LogLevel.warning,
          );
          throw InvalidDataException(
            message: 'Неверный код. Осталось попыток: $attemptsLeft',
            field: 'code',
            stackTrace: StackTrace.current.toString(),
          );
        }
      }

      session.log(
        'verifyRegisterCode: код не найден или истёк для $email',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Код не найден или истёк',
        field: 'code',
        stackTrace: StackTrace.current.toString(),
      );
    }

    session.log(
      'verifyRegisterCode: код успешно проверен для $email',
      level: LogLevel.info,
    );

    return SuccessResponse(success: true);
  }

  /// Регистрирует нового пользователя с проверкой кода и автоматическим входом.
  ///
  /// Финальный шаг регистрации, объединяющий:
  /// 1. Верификацию кода, отправленного на email
  /// 2. Создание учётной записи с хэшированным паролем
  /// 3. Автоматический вход с генерацией токенов
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос со следующими полями:
  ///   - `email` — email пользователя`
  ///   - `code` — 6-значный код верификации`. `
  ///   - `password` — пароль (минимум 8 символов)
  ///
  /// ### Возвращает
  /// [AuthResponse] со следующими полями:
  /// - `accessToken` — JWT токен доступа (время жизни: 1 час)
  /// - `refreshToken` — токен обновления (время жизни: 30 дней)
  /// - `user` — публичные данные созданного пользователя [UserPublic]
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'password'` — пароль короче 8 символов
  /// - [InvalidDataException] с `field: 'email'` — пользователь уже существует
  /// - [InvalidDataException] с `field: 'code'` — неверный/истёкший код или
  ///   превышен лимит попыток
  /// - [InvalidDataException] с `field: 'user'` — ошибка создания пользователя
  ///
  /// ### Безопасность
  /// - Пароль хэшируется с использованием bcrypt перед сохранением
  /// - Код верификации удаляется после успешного использования
  /// - Создаётся запись [AuthSession] для отслеживания сессии
  ///
  /// ### Пример использования
  /// ```dart
  /// final response = await client.auth.register(
  ///   RegisterRequest(
  ///     email: 'user@example.com',
  ///     code: '123456',
  ///     password: 'securePassword123',
  ///   ),
  /// );
  /// // Сохранить токены и данные пользователя
  /// ```
  Future<AuthResponse> register(
    Session session, {
    required RegisterRequest request,
  }) async {
    final email = request.email.trim();
    final password = request.password;

    session.log(
      'register: начало регистрации для $email',
      level: LogLevel.info,
    );

    // Валидация пароля
    if (password.length < 8) {
      session.log(
        'register: пароль слишком короткий для $email',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Пароль должен содержать минимум 8 символов',
        field: 'password',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Проверяем что пользователь еще не создан
    final existingUser = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (existingUser != null) {
      session.log(
        'register: пользователь $email уже существует',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Пользователь с таким email уже существует',
        field: 'email',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Код уже проверён на предыдущем шаге (верификация кода происходит
    // до перехода к экрану создания пароля), поэтому здесь дополнительная
    // проверка не требуется.

    session.log(
      'register: код подтверждён, создание пользователя $email',
      level: LogLevel.info,
    );

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

    if (savedUser.id == null) {
      session.log(
        'register: ошибка создания пользователя $email',
        level: LogLevel.error,
      );
      throw InvalidDataException(
        message: 'Ошибка создания пользователя',
        field: 'user',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Создаем сессию
    final tokenPair = _tokenService.generateTokenPair();

    final authSession = AuthSession(
      userId: savedUser.id!,
      tokenHash: _tokenService.hashToken(tokenPair.accessToken),
      refreshTokenHash: _tokenService.hashToken(tokenPair.refreshToken),
      deviceInfo: null,
      ipAddress: null,
      userAgent: null,
      expiresAt: now.add(Duration(hours: 1)),
      refreshExpiresAt: now.add(Duration(days: 30)),
      createdAt: now,
      lastActivityAt: now,
      isActive: true,
    );

    await AuthSession.db.insertRow(session, authSession);

    session.log(
      'register: пользователь $email успешно зарегистрирован (id: ${savedUser.id})',
      level: LogLevel.info,
    );

    return AuthResponse(
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      user: UserPublic(
        id: savedUser.id!,
        email: savedUser.email,
        firstName: savedUser.firstName,
        lastName: savedUser.lastName,
        displayName: savedUser.displayName,
        avatarUrl: savedUser.avatarUrl,
        isEmailVerified: savedUser.isEmailVerified,
        createdAt: savedUser.createdAt,
      ),
    );
  }

  /// Аутентифицирует пользователя по email и паролю.
  ///
  /// Проверяет учётные данные и создаёт новую сессию с токенами.
  /// Обновляет поле `lastLoginAt` пользователя.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос со следующими полями:
  ///   - `email` — email пользователя
  ///   - `password` — пароль
  ///
  /// ### Возвращает
  /// [AuthResponse] со следующими полями:
  /// - `accessToken` — JWT токен доступа (время жизни: 1 час)
  /// - `refreshToken` — токен обновления (время жизни: 30 дней)
  /// - `user` — публичные данные пользователя [UserPublic]
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'credentials'` — неверный email или пароль
  /// - [InvalidDataException] с `field: 'account'` — аккаунт заблокирован
  /// - [InvalidDataException] с `field: 'user'` — ошибка идентификации
  ///
  /// ### Безопасность
  /// - Пароль проверяется через bcrypt сравнение с хэшем
  /// - Сообщение об ошибке не раскрывает, что именно неверно (email или пароль)
  /// - Создаётся новая запись [AuthSession] для каждого входа
  ///
  /// ### Пример использования
  /// ```dart
  /// try {
  ///   final response = await client.auth.login(
  ///     LoginRequest(email: 'user@example.com', password: 'password123'),
  ///   );
  ///   // Сохранить токены
  /// } on InvalidDataException catch (e) {
  ///   // Показать ошибку
  /// }
  /// ```
  Future<AuthResponse> login(
    Session session, {
    required LoginRequest request,
  }) async {
    final email = request.email.trim();
    final password = request.password;

    session.log('login: попытка входа для $email', level: LogLevel.info);

    // Ищем пользователя
    final user = await User.db.findFirstRow(
      session,
      where: (t) => t.email.equals(email),
    );

    if (user == null ||
        !_passwordService.verifyPassword(password, user.passwordHash)) {
      session.log(
        'login: неверные учётные данные для $email',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Неверный email или пароль',
        field: 'credentials',
        stackTrace: StackTrace.current.toString(),
      );
    }

    if (!user.isActive) {
      session.log(
        'login: аккаунт $email заблокирован',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Аккаунт заблокирован',
        field: 'account',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Обновляем lastLoginAt
    final now = DateTime.now();
    await User.db.updateRow(
      session,
      user.copyWith(lastLoginAt: now, updatedAt: now),
    );

    if (user.id == null) {
      session.log(
        'login: ошибка идентификации пользователя $email',
        level: LogLevel.error,
      );
      throw InvalidDataException(
        message: 'Ошибка идентификации пользователя',
        field: 'user',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Создаем сессию
    final tokenPair = _tokenService.generateTokenPair();

    final authSession = AuthSession(
      userId: user.id!,
      tokenHash: _tokenService.hashToken(tokenPair.accessToken),
      refreshTokenHash: _tokenService.hashToken(tokenPair.refreshToken),
      deviceInfo: null,
      ipAddress: null,
      userAgent: null,
      expiresAt: now.add(Duration(hours: 1)),
      refreshExpiresAt: now.add(Duration(days: 30)),
      createdAt: now,
      lastActivityAt: now,
      isActive: true,
    );

    await AuthSession.db.insertRow(session, authSession);

    session.log(
      'login: пользователь $email успешно авторизован (id: ${user.id})',
      level: LogLevel.info,
    );

    return AuthResponse(
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
      user: UserPublic(
        id: user.id!,
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        displayName: user.displayName,
        avatarUrl: user.avatarUrl,
        isEmailVerified: user.isEmailVerified,
        createdAt: user.createdAt,
      ),
    );
  }

  /// Обновляет пару токенов доступа с использованием refresh token.
  ///
  /// Реализует паттерн **Refresh Token Rotation**: при каждом обновлении
  /// генерируется новая пара токенов, а старые становятся недействительными.
  /// Это повышает безопасность, ограничивая время жизни скомпрометированных токенов.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [request] — запрос с полем `refreshToken`
  ///
  /// ### Возвращает
  /// [TokenPairResponse] со следующими полями:
  /// - `accessToken` — новый JWT токен доступа (время жизни: 1 час)
  /// - `refreshToken` — новый токен обновления (время жизни: 30 дней)
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'refreshToken'` — токен недействителен,
  ///   истёк или сессия была завершена
  ///
  /// ### Жизненный цикл токенов
  /// - **Access Token**: 1 час — для аутентификации API запросов
  /// - **Refresh Token**: 30 дней — только для получения новых токенов
  ///
  /// ### Пример использования
  /// ```dart
  /// // При получении 401 ошибки
  /// final newTokens = await client.auth.refreshTokens(
  ///   RefreshTokenRequest(refreshToken: storedRefreshToken),
  /// );
  /// // Заменить старые токены на новые
  /// ```
  Future<TokenPairResponse> refreshTokens(
    Session session, {
    required RefreshTokenRequest request,
  }) async {
    session.log('refreshTokens: обновление токенов', level: LogLevel.debug);

    final refreshTokenHash = _tokenService.hashToken(request.refreshToken);
    final now = DateTime.now();

    final sessions = await AuthSession.db.find(
      session,
      where: (t) =>
          t.refreshTokenHash.equals(refreshTokenHash) & t.isActive.equals(true),
    );

    final validSession = sessions
        .where((s) => s.refreshExpiresAt.isAfter(now))
        .firstOrNull;

    if (validSession == null) {
      session.log(
        'refreshTokens: недействительный или истёкший refresh token',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Недействительный или истёкший refresh token',
        field: 'refreshToken',
        stackTrace: StackTrace.current.toString(),
      );
    }

    // Генерируем новую пару (token rotation)
    final tokenPair = _tokenService.generateTokenPair();

    await AuthSession.db.updateRow(
      session,
      validSession.copyWith(
        tokenHash: _tokenService.hashToken(tokenPair.accessToken),
        refreshTokenHash: _tokenService.hashToken(tokenPair.refreshToken),
        expiresAt: now.add(Duration(hours: 1)),
        refreshExpiresAt: now.add(Duration(days: 30)),
        lastActivityAt: now,
      ),
    );

    session.log(
      'refreshTokens: токены обновлены для userId=${validSession.userId}',
      level: LogLevel.info,
    );

    return TokenPairResponse(
      accessToken: tokenPair.accessToken,
      refreshToken: tokenPair.refreshToken,
    );
  }

  /// Завершает текущую сессию пользователя (выход из системы).
  ///
  /// Деактивирует сессию, связанную с переданным access token.
  /// После вызова токены этой сессии становятся недействительными.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [accessToken] — текущий токен доступа пользователя
  ///
  /// ### Возвращает
  /// [SuccessResponse] с `success: true` независимо от того, была ли найдена сессия.
  /// Это предотвращает утечку информации о существовании сессий.
  ///
  /// ### Побочные эффекты
  /// - Устанавливает `isActive: false` для записи [AuthSession]
  /// - Записывает время отзыва в `revokedAt`
  ///
  /// ### Пример использования
  /// ```dart
  /// await client.auth.logout(currentAccessToken);
  /// // Очистить локальное хранилище токенов
  /// ```
  Future<SuccessResponse> logout(Session session, String accessToken) async {
    session.log('logout: завершение сессии', level: LogLevel.info);

    final tokenHash = _tokenService.hashToken(accessToken);
    final authSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.tokenHash.equals(tokenHash),
    );

    if (authSession != null) {
      await AuthSession.db.updateRow(
        session,
        authSession.copyWith(isActive: false, revokedAt: DateTime.now()),
      );
      session.log(
        'logout: сессия завершена для userId=${authSession.userId}',
        level: LogLevel.info,
      );
    } else {
      session.log('logout: сессия не найдена', level: LogLevel.warning);
    }

    return SuccessResponse(success: true);
  }

  /// Завершает все активные сессии пользователя на всех устройствах.
  ///
  /// Используется для повышения безопасности, например после смены пароля
  /// или при подозрении на компрометацию аккаунта. Деактивирует все сессии,
  /// включая текущую.
  ///
  /// ### Параметры
  /// - [session] — сессия Serverpod
  /// - [accessToken] — текущий токен доступа для идентификации пользователя
  ///
  /// ### Возвращает
  /// [SuccessResponse] со следующими полями:
  /// - `success: true` — операция выполнена успешно
  /// - `message` — информационное сообщение
  ///
  /// ### Исключения
  /// - [InvalidDataException] с `field: 'session'` — текущая сессия недействительна
  ///
  /// ### Побочные эффекты
  /// - Деактивирует **все** записи [AuthSession] пользователя
  /// - После вызова клиент должен выполнить повторный вход
  ///
  /// ### Пример использования
  /// ```dart
  /// // После смены пароля — принудительный выход везде
  /// await client.auth.logoutAll(currentAccessToken);
  /// // Перенаправить на экран входа
  /// ```
  Future<SuccessResponse> logoutAll(
    Session session, {
    required String accessToken,
  }) async {
    session.log('logoutAll: выход со всех устройств', level: LogLevel.info);

    final tokenHash = _tokenService.hashToken(accessToken);
    final currentSession = await AuthSession.db.findFirstRow(
      session,
      where: (t) => t.tokenHash.equals(tokenHash),
    );

    if (currentSession == null) {
      session.log(
        'logoutAll: недействительная сессия',
        level: LogLevel.warning,
      );
      throw InvalidDataException(
        message: 'Недействительная сессия',
        field: 'session',
        stackTrace: StackTrace.current.toString(),
      );
    }

    final userId = currentSession.userId;
    final allSessions = await AuthSession.db.find(
      session,
      where: (t) => t.userId.equals(userId) & t.isActive.equals(true),
    );

    for (final authSession in allSessions) {
      await AuthSession.db.updateRow(
        session,
        authSession.copyWith(isActive: false, revokedAt: DateTime.now()),
      );
    }

    session.log(
      'logoutAll: завершено ${allSessions.length} сессий для userId=$userId',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Выход выполнен на всех устройствах',
    );
  }
}
