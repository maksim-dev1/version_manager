import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/endpoints/base/logged_in_endpoint.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';
import 'package:version_manager_server/src/services/verification_code_service.dart';

/// Эндпоинт для управления приложениями.
///
/// Предоставляет функционал для:
/// - Создания, редактирования и удаления приложений
/// - Управления API ключами (генерация, регенерация)
/// - Активации/деактивации приложений
/// - Получения списка приложений пользователя
///
/// Наследуется от [LoggedInEndpoint] — требует авторизации.
///
/// ## Владение приложением
/// - **user** — личное приложение пользователя
/// - **team** — командное приложение (доступно owner/admin команды)
class AppEndpoint extends LoggedInEndpoint {
  final _tokenService = Services().tokenService;
  final _emailService = Services().emailService;

  // ============================================================
  // ПОЛУЧЕНИЕ ПРИЛОЖЕНИЙ
  // ============================================================

  /// Получить все приложения текущего пользователя.
  ///
  /// Возвращает личные приложения пользователя и приложения
  /// команд, в которых он состоит.
  Future<List<Application>> getMyApplications(Session session) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'getMyApplications: загрузка приложений пользователя $userId',
      level: LogLevel.info,
    );

    // Личные приложения пользователя
    final personalApps = await Application.db.find(
      session,
      where: (t) =>
          (t.ownerUserId.equals(userId)) & (t.ownerType.equals(OwnerType.user)),
      include: Application.include(
        ownerUser: User.include(),
        storeLinks: StoreLink.includeList(),
      ),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    // Команды пользователя (где он активный участник)
    final memberships = await TeamMember.db.find(
      session,
      where: (t) =>
          (t.userId.equals(userId)) &
          (t.status.equals(TeamMemberStatusType.active)),
    );

    final teamIds = memberships.map((m) => m.teamId).toList();

    // Приложения команд
    final List<Application> teamApps;
    if (teamIds.isNotEmpty) {
      teamApps = await Application.db.find(
        session,
        where: (t) =>
            (t.ownerType.equals(OwnerType.team)) &
            (t.ownerTeamId.inSet(teamIds.toSet())),
        include: Application.include(
          ownerTeam: Team.include(),
          storeLinks: StoreLink.includeList(),
        ),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
      );
    } else {
      teamApps = [];
    }

    final allApps = [...personalApps, ...teamApps];

    session.log(
      'getMyApplications: найдено ${allApps.length} приложений '
      '(${personalApps.length} личных, ${teamApps.length} командных)',
      level: LogLevel.info,
    );

    return allApps;
  }

  /// Получить приложение по ID.
  ///
  /// Проверяет права доступа пользователя к приложению.
  Future<Application> getApplication(
    Session session, {
    required UuidValue applicationId,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'getApplication: загрузка приложения $applicationId',
      level: LogLevel.info,
    );

    final app = await Application.db.findById(
      session,
      applicationId,
      include: Application.include(
        ownerTeam: Team.include(),
        storeLinks: StoreLink.includeList(),
      ),
    );

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppAccess(session, app: app, userId: userId);

    return app;
  }

  // ============================================================
  // СОЗДАНИЕ ПРИЛОЖЕНИЯ
  // ============================================================

  /// Создать новое приложение.
  ///
  /// Генерирует уникальный API ключ при создании.
  /// Ключ возвращается в ответе и показывается пользователю один раз.
  Future<CreateApplicationResponse> createApplication(
    Session session, {
    required CreateApplicationRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'createApplication: создание приложения "${request.name}" '
      'пользователем $userId',
      level: LogLevel.info,
    );

    // Преобразование namespace с нижним подчеркиванием в camelCase для всех сегментов
    String processedNamespace = request.namespace.trim();
    if (processedNamespace.contains('_')) {
      final parts = processedNamespace.split('.');
      final processedParts = parts.map((part) {
        return part.replaceAllMapped(
          RegExp(r'_([a-zA-Z])'),
          (m) => m.group(1)!.toUpperCase(),
        );
      }).toList();
      processedNamespace = processedParts.join('.');
    }

    // Валидация namespace
    _validateNamespace(processedNamespace);

    // Валидация имени
    _validateName(request.name);

    // Валидация описания (если указано)
    if (request.description != null && request.description!.trim().isNotEmpty) {
      _validateDescription(request.description!);
    }

    // Валидация платформ
    if (request.platforms.isEmpty) {
      throw InvalidDataException(
        field: 'platforms',
        message: 'Необходимо выбрать хотя бы одну платформу',
      );
    }

    // Проверка уникальности namespace
    final existing = await Application.db.findFirstRow(
      session,
      where: (t) => t.namespace.equals(processedNamespace),
    );

    if (existing != null) {
      throw InvalidDataException(
        field: 'namespace',
        message: 'Приложение с таким namespace уже существует',
      );
    }

    // Проверка прав на команду (если командное приложение)
    if (request.ownerType == OwnerType.team) {
      if (request.teamId == null) {
        throw InvalidDataException(
          field: 'teamId',
          message: 'Для командного приложения необходимо указать команду',
        );
      }

      final member = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            (t.teamId.equals(request.teamId!)) &
            (t.userId.equals(userId)) &
            (t.status.equals(TeamMemberStatusType.active)),
      );

      if (member == null ||
          (member.role != TeamRoleType.owner &&
              member.role != TeamRoleType.admin)) {
        throw InvalidDataException(
          field: 'teamId',
          message: 'Недостаточно прав для создания приложения в этой команде',
        );
      }
    }

    // Генерация API ключа
    final apiKey = _tokenService.generateToken();
    final apiKeyHash = _tokenService.hashToken(apiKey);

    // Создание приложения
    final application = Application(
      namespace: processedNamespace,
      name: request.name.trim(),
      description: request.description?.trim() ?? '',
      iconUrl: request.iconUrl,
      platforms: request.platforms,
      ownerType: request.ownerType,
      ownerUserId: request.ownerType == OwnerType.user ? userId : null,
      ownerTeamId: request.ownerType == OwnerType.team ? request.teamId : null,
      isActive: true,
      apiKeyHash: apiKeyHash,
      apiKeyLast4: apiKey.substring(apiKey.length - 4),
      apiKeyCreatedAt: DateTime.now(),
    );

    final createdApp = await session.db.transaction((transaction) async {
      final created = await Application.db.insertRow(
        session,
        application,
        transaction: transaction,
      );

      // Создание ссылок на магазины
      if (request.storeLinks != null && request.storeLinks!.isNotEmpty) {
        await _createStoreLinks(
          session,
          applicationId: created.id!,
          storeLinks: request.storeLinks!,
          allowedPlatforms: request.platforms,
          transaction: transaction,
        );
      }

      return created;
    });

    // Загружаем приложение с связями
    final result = await Application.db.findById(
      session,
      createdApp.id!,
      include: Application.include(
        storeLinks: StoreLink.includeList(),
      ),
    );

    session.log(
      'createApplication: приложение создано с ID ${createdApp.id}',
      level: LogLevel.info,
    );

    return CreateApplicationResponse(
      application: result!,
      apiKey: apiKey,
    );
  }

  // ============================================================
  // РЕДАКТИРОВАНИЕ ПРИЛОЖЕНИЯ
  // ============================================================

  /// Обновить данные приложения.
  ///
  /// Позволяет изменить все поля кроме namespace.
  Future<Application> updateApplication(
    Session session, {
    required UpdateApplicationRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'updateApplication: обновление приложения ${request.applicationId}',
      level: LogLevel.info,
    );

    final app = await Application.db.findById(session, request.applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppWriteAccess(session, app: app, userId: userId);

    // Валидация и обновление namespace
    if (request.namespace != null) {
      _validateNamespace(request.namespace!);
      app.namespace = request.namespace!.trim();
    }

    // Валидация и обновление имени
    if (request.name != null) {
      _validateName(request.name!);
      app.name = request.name!.trim();
    }

    // Валидация и обновление описания
    if (request.description != null && request.description!.trim().isNotEmpty) {
      _validateDescription(request.description!);
      app.description = request.description!.trim();
    }

    // Обновление иконки
    if (request.iconUrl != null) {
      app.iconUrl = request.iconUrl;
    }

    // Обновление платформ
    if (request.platforms != null) {
      if (request.platforms!.isEmpty) {
        throw InvalidDataException(
          field: 'platforms',
          message: 'Необходимо выбрать хотя бы одну платформу',
        );
      }
      app.platforms = request.platforms!;
    }

    app.updatedAt = DateTime.now();

    await Application.db.updateRow(session, app);

    // Обновление ссылок на магазины
    if (request.storeLinks != null) {
      // Удаляем старые ссылки
      final oldLinks = await StoreLink.db.find(
        session,
        where: (t) => t.applicationId.equals(request.applicationId),
      );

      for (final link in oldLinks) {
        await StoreLink.db.deleteRow(session, link);
      }

      // Создаём новые ссылки
      if (request.storeLinks!.isNotEmpty) {
        await _createStoreLinks(
          session,
          applicationId: request.applicationId,
          storeLinks: request.storeLinks!,
          allowedPlatforms: app.platforms,
        );
      }
    }

    // Загружаем обновлённое приложение с связями
    final result = await Application.db.findById(
      session,
      request.applicationId,
      include: Application.include(
        storeLinks: StoreLink.includeList(),
      ),
    );

    session.log(
      'updateApplication: приложение ${request.applicationId} обновлено',
      level: LogLevel.info,
    );

    return result!;
  }

  // ============================================================
  // УДАЛЕНИЕ ПРИЛОЖЕНИЯ
  // ============================================================

  /// Удалить приложение.
  ///
  /// Требует подтверждение — имя приложения должно совпадать.
  /// При удалении также удаляются все версии, ссылки и логи.
  Future<SuccessResponse> deleteApplication(
    Session session, {
    required DeleteApplicationRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'deleteApplication: удаление приложения ${request.applicationId}',
      level: LogLevel.info,
    );

    final app = await Application.db.findById(session, request.applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    // Проверка владельца
    await _checkAppOwnerAccess(session, app: app, userId: userId);

    // Проверка подтверждения
    if (request.confirmationName.trim() != app.name) {
      throw InvalidDataException(
        field: 'confirmationName',
        message: 'Введённое имя не совпадает с названием приложения',
      );
    }

    await Application.db.deleteRow(session, app);

    session.log(
      'deleteApplication: приложение ${request.applicationId} удалено',
      level: LogLevel.info,
    );

    return SuccessResponse(success: true, message: 'Приложение удалено');
  }

  // ============================================================
  // УПРАВЛЕНИЕ API КЛЮЧАМИ
  // ============================================================

  /// Получить замаскированный email владельца приложения.
  ///
  /// Используется для показа пользователю, на какой адрес
  /// будет отправлен код подтверждения, до отправки кода.
  Future<String> getRegenerationTargetEmail(
    Session session, {
    required UuidValue applicationId,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    final app = await Application.db.findById(session, applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppOwnerAccess(session, app: app, userId: userId);

    final ownerEmail = await _resolveAppOwnerEmail(session, app: app);
    return _maskEmail(ownerEmail);
  }

  /// Шаг 1: Запросить код подтверждения для регенерации API ключа.
  ///
  /// Отправляет 6-значный код на email владельца приложения.
  /// Код действует 10 минут, максимум 5 попыток ввода.
  Future<RequestApiKeyRegenerationResponse> requestApiKeyRegeneration(
    Session session, {
    required RequestApiKeyRegenerationRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'requestApiKeyRegeneration: запрос кода для ${request.applicationId}',
      level: LogLevel.info,
    );

    final app = await Application.db.findById(session, request.applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppOwnerAccess(session, app: app, userId: userId);

    // Определяем email владельца приложения
    final ownerEmail = await _resolveAppOwnerEmail(session, app: app);

    // Создаём код верификации
    final codeService = VerificationCodeService(session);
    final result = await codeService.createCode(
      email: ownerEmail,
      purpose: VerificationPurposeType.regenerate_api_key,
      userId: userId,
    );

    // Маскируем email для отображения в UI
    final maskedEmail = _maskEmail(ownerEmail);

    // Rate limit
    if (result.waitTime != null) {
      session.log(
        'requestApiKeyRegeneration: rate limit для $ownerEmail, '
        'ожидание ${result.waitTime!.inSeconds}с',
        level: LogLevel.warning,
      );
      return RequestApiKeyRegenerationResponse(
        codeSent: false,
        retryAfterSeconds: result.waitTime!.inSeconds,
        maskedEmail: maskedEmail,
      );
    }

    // Отправляем email с кодом
    await _emailService.sendVerificationEmail(
      ownerEmail,
      result.code!.codeHash,
      appName: app.name,
    );

    session.log(
      'requestApiKeyRegeneration: код отправлен на $ownerEmail',
      level: LogLevel.info,
    );

    return RequestApiKeyRegenerationResponse(
      codeSent: true,
      maskedEmail: maskedEmail,
    );
  }

  /// Шаг 2: Регенерировать API ключ с подтверждением кода.
  ///
  /// Проверяет 6-значный код из email и генерирует новый API ключ.
  /// Старый ключ становится недействительным.
  /// Новый ключ показывается пользователю один раз.
  Future<RegenerateApiKeyResponse> regenerateApiKey(
    Session session, {
    required RegenerateApiKeyRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'regenerateApiKey: регенерация ключа для ${request.applicationId}',
      level: LogLevel.info,
    );

    final app = await Application.db.findById(session, request.applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppOwnerAccess(session, app: app, userId: userId);

    // Определяем email владельца приложения (тот же, на который отправлялся код)
    final ownerEmail = await _resolveAppOwnerEmail(session, app: app);

    // Проверяем код верификации
    final codeService = VerificationCodeService(session);
    final verifiedCode = await codeService.verifyCode(
      email: ownerEmail,
      code: request.code,
      purpose: VerificationPurposeType.regenerate_api_key,
    );

    if (verifiedCode == null) {
      throw InvalidDataException(
        field: 'code',
        message: 'Неверный или истёкший код подтверждения',
      );
    }

    // Генерация нового ключа
    final apiKey = _tokenService.generateToken();
    final apiKeyHash = _tokenService.hashToken(apiKey);
    final now = DateTime.now();

    app.apiKeyHash = apiKeyHash;
    app.apiKeyLast4 = apiKey.substring(apiKey.length - 4);
    app.apiKeyLastRegeneratedAt = now;
    app.updatedAt = now;

    await Application.db.updateRow(session, app);

    session.log(
      'regenerateApiKey: ключ для ${request.applicationId} обновлён',
      level: LogLevel.info,
    );

    return RegenerateApiKeyResponse(
      apiKey: apiKey,
      regeneratedAt: now,
    );
  }

  // ============================================================
  // АКТИВАЦИЯ / ДЕАКТИВАЦИЯ
  // ============================================================

  /// Активировать или деактивировать приложение.
  Future<Application> toggleApplicationStatus(
    Session session, {
    required ToggleApplicationStatusRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'toggleApplicationStatus: изменение статуса ${request.applicationId} '
      'на ${request.isActive ? "активно" : "деактивировано"}',
      level: LogLevel.info,
    );

    final app = await Application.db.findById(session, request.applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppOwnerAccess(session, app: app, userId: userId);

    app.isActive = request.isActive;
    app.updatedAt = DateTime.now();

    await Application.db.updateRow(session, app);

    final result = await Application.db.findById(
      session,
      request.applicationId,
      include: Application.include(
        storeLinks: StoreLink.includeList(),
      ),
    );

    session.log(
      'toggleApplicationStatus: статус ${request.applicationId} '
      'изменён на ${request.isActive ? "активно" : "деактивировано"}',
      level: LogLevel.info,
    );

    return result!;
  }

  // ============================================================
  // ПЕРЕДАЧА ВЛАДЕНИЯ
  // ============================================================

  /// Передать приложение другому владельцу.
  ///
  /// Поддерживает три сценария:
  /// - **user → team**: личное приложение передаётся в команду
  /// - **team → user**: командное приложение забирается в личные
  /// - **team → team**: приложение переносится из одной команды в другую
  ///
  /// ## Безопасность
  /// - **user → team**: пользователь должен быть владельцем приложения
  ///   и owner/admin целевой команды.
  /// - **team → user**: пользователь должен быть owner/admin исходной команды.
  /// - **team → team**: пользователь должен быть owner/admin в обеих командах.
  Future<SuccessResponse> transferApplicationOwnership(
    Session session, {
    required TransferApplicationOwnershipRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'transferApplicationOwnership: передача приложения '
      '${request.applicationId} → ${request.newOwnerType.name}',
      level: LogLevel.info,
    );

    // Загружаем приложение
    final app = await Application.db.findById(session, request.applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    // ── Проверка прав на текущее приложение (owner-level) ──
    await _checkAppOwnerAccess(session, app: app, userId: userId);

    // Проверяем, что передача действительно меняет владельца
    if (app.ownerType == request.newOwnerType) {
      if (request.newOwnerType == OwnerType.user) {
        throw InvalidDataException(
          field: 'newOwnerType',
          message: 'Приложение уже является личным',
        );
      }
      if (request.newOwnerType == OwnerType.team &&
          app.ownerTeamId == request.newTeamId) {
        throw InvalidDataException(
          field: 'newTeamId',
          message: 'Приложение уже принадлежит этой команде',
        );
      }
    }

    // ── Проверка прав на целевую команду (если передаём в команду) ──
    if (request.newOwnerType == OwnerType.team) {
      if (request.newTeamId == null) {
        throw InvalidDataException(
          field: 'newTeamId',
          message: 'Необходимо указать целевую команду',
        );
      }

      // Проверяем, что команда существует
      final targetTeam = await Team.db.findById(session, request.newTeamId!);
      if (targetTeam == null) {
        throw InvalidDataException(
          field: 'newTeamId',
          message: 'Целевая команда не найдена',
        );
      }

      // Проверяем, что пользователь — owner или admin целевой команды
      final targetMember = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            (t.teamId.equals(request.newTeamId!)) &
            (t.userId.equals(userId)) &
            (t.status.equals(TeamMemberStatusType.active)),
      );

      if (targetMember == null ||
          (targetMember.role != TeamRoleType.owner &&
              targetMember.role != TeamRoleType.admin)) {
        throw InvalidDataException(
          field: 'newTeamId',
          message:
              'Недостаточно прав в целевой команде. '
              'Необходима роль owner или admin',
        );
      }
    }

    // ── Выполняем передачу ──
    if (request.newOwnerType == OwnerType.user) {
      // Передаём в личные
      app.ownerType = OwnerType.user;
      app.ownerUserId = userId;
      app.ownerTeamId = null;
    } else {
      // Передаём в команду
      app.ownerType = OwnerType.team;
      app.ownerTeamId = request.newTeamId;
      app.ownerUserId = null;
    }

    app.updatedAt = DateTime.now();
    await Application.db.updateRow(session, app);

    session.log(
      'transferApplicationOwnership: приложение ${request.applicationId} '
      'передано → ${request.newOwnerType.name}'
      '${request.newTeamId != null ? ' (команда ${request.newTeamId})' : ''}',
      level: LogLevel.info,
    );

    return SuccessResponse(
      success: true,
      message: 'Владение приложением передано',
    );
  }

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ
  // ============================================================

  /// Валидация namespace.
  void _validateNamespace(String namespace) {
    final ns = namespace.trim();

    if (ns.isEmpty) {
      throw InvalidDataException(
        field: 'namespace',
        message: 'Namespace не может быть пустым',
      );
    }

    // Формат обратной доменной нотации (регистронезависимый)
    final namespaceRegex = RegExp(
      r'^[a-zA-Z][a-zA-Z0-9]*(\.[a-zA-Z][a-zA-Z0-9]*){2,}$',
    );
    if (!namespaceRegex.hasMatch(ns)) {
      throw InvalidDataException(
        field: 'namespace',
        message:
            'Namespace должен быть в формате обратной доменной нотации '
            '(например, com.example.myApp). '
            'Минимум 3 сегмента, допустимы латинские буквы, цифры и точки',
      );
    }
  }

  /// Валидация имени приложения.
  void _validateName(String name) {
    final trimmed = name.trim();

    if (trimmed.length < 3) {
      throw InvalidDataException(
        field: 'name',
        message: 'Название приложения должно содержать минимум 3 символа',
      );
    }

    if (trimmed.length > 50) {
      throw InvalidDataException(
        field: 'name',
        message: 'Название приложения не должно превышать 50 символов',
      );
    }
  }

  /// Валидация описания.
  void _validateDescription(String description) {
    final trimmed = description.trim();

    if (trimmed.length < 10) {
      throw InvalidDataException(
        field: 'description',
        message: 'Описание должно содержать минимум 10 символов',
      );
    }

    if (trimmed.length > 500) {
      throw InvalidDataException(
        field: 'description',
        message: 'Описание не должно превышать 500 символов',
      );
    }
  }

  /// Создание ссылок на магазины для приложения.
  Future<void> _createStoreLinks(
    Session session, {
    required UuidValue applicationId,
    required List<StoreLinkEntry> storeLinks,
    required List<PlatformType> allowedPlatforms,
    Transaction? transaction,
  }) async {
    for (final entry in storeLinks) {
      // Проверяем, что платформа ссылки входит в платформы приложения
      if (!allowedPlatforms.contains(entry.platform)) {
        throw InvalidDataException(
          field: 'storeLinks',
          message:
              'Ссылка на магазин для платформы ${entry.platform.name} '
              'не соответствует выбранным платформам приложения',
        );
      }

      // Валидация URL
      _validateUrl(entry.url);

      // Валидация названия магазина
      if (entry.storeName.trim().isEmpty) {
        throw InvalidDataException(
          field: 'storeLinks',
          message: 'Название магазина не может быть пустым',
        );
      }

      final storeLink = StoreLink(
        applicationId: applicationId,
        platform: entry.platform,
        storeName: entry.storeName.trim(),
        url: entry.url.trim(),
      );

      await StoreLink.db.insertRow(
        session,
        storeLink,
        transaction: transaction,
      );
    }
  }

  /// Валидация URL.
  void _validateUrl(String url) {
    final trimmed = url.trim();

    if (trimmed.isEmpty) {
      throw InvalidDataException(
        field: 'url',
        message: 'URL не может быть пустым',
      );
    }

    final uri = Uri.tryParse(trimmed);
    if (uri == null || (!uri.hasScheme) || (!uri.hasAuthority)) {
      throw InvalidDataException(
        field: 'url',
        message: 'Некорректный формат URL: $trimmed',
      );
    }
  }

  /// Проверка доступа на чтение к приложению.
  Future<void> _checkAppAccess(
    Session session, {
    required Application app,
    required UuidValue userId,
  }) async {
    if (app.ownerType == OwnerType.user) {
      if (app.ownerUserId != userId) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Нет доступа к этому приложению',
        );
      }
    } else {
      // Командное приложение — проверяем членство
      final member = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            (t.teamId.equals(app.ownerTeamId!)) &
            (t.userId.equals(userId)) &
            (t.status.equals(TeamMemberStatusType.active)),
      );

      if (member == null) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Нет доступа к этому приложению',
        );
      }
    }
  }

  /// Проверка доступа на запись к приложению.
  ///
  /// Для личных — только владелец.
  /// Для командных — owner или admin команды.
  Future<void> _checkAppWriteAccess(
    Session session, {
    required Application app,
    required UuidValue userId,
  }) async {
    if (app.ownerType == OwnerType.user) {
      if (app.ownerUserId != userId) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Нет прав на редактирование этого приложения',
        );
      }
    } else {
      final member = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            (t.teamId.equals(app.ownerTeamId!)) &
            (t.userId.equals(userId)) &
            (t.status.equals(TeamMemberStatusType.active)),
      );

      if (member == null ||
          (member.role != TeamRoleType.owner &&
              member.role != TeamRoleType.admin &&
              member.role != TeamRoleType.developer)) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Недостаточно прав для редактирования этого приложения',
        );
      }
    }
  }

  /// Маскирует email для безопасного отображения в UI.
  ///
  /// Пример: `user@example.com` → `us**@example.com`
  /// Пример: `maksim.dev@gmail.com` → `maks******@gmail.com`
  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return '***';
    final local = parts[0];
    final domain = parts[1];
    if (local.length <= 2) return '$local***@$domain';
    // Показываем первую половину, но не менее 2 и не более 5 символов
    final visibleCount = (local.length / 2).ceil().clamp(2, 5);
    final masked =
        local.substring(0, visibleCount) + '*' * (local.length - visibleCount);
    return '$masked@$domain';
  }

  /// Проверка доступа владельца к приложению.
  ///
  /// Для личных — email владельца-пользователя.
  /// Для командных — email владельца (owner) команды.
  Future<String> _resolveAppOwnerEmail(
    Session session, {
    required Application app,
  }) async {
    if (app.ownerType == OwnerType.user) {
      final user = await User.db.findById(session, app.ownerUserId!);
      if (user == null) {
        throw InvalidDataException(
          field: 'user',
          message: 'Владелец приложения не найден',
        );
      }
      return user.email;
    } else {
      // Для командного приложения — ищем владельца команды
      final teamOwner = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            t.teamId.equals(app.ownerTeamId!) &
            t.role.equals(TeamRoleType.owner) &
            t.status.equals(TeamMemberStatusType.active),
        include: TeamMember.include(user: User.include()),
      );

      if (teamOwner?.user == null) {
        throw InvalidDataException(
          field: 'team',
          message: 'Владелец команды не найден',
        );
      }
      return teamOwner!.user!.email;
    }
  }

  /// Проверяет права доступа к приложению.
  ///
  /// Для личных — только владелец.
  /// Для командных — только owner или admin команды.
  Future<void> _checkAppOwnerAccess(
    Session session, {
    required Application app,
    required UuidValue userId,
  }) async {
    if (app.ownerType == OwnerType.user) {
      if (app.ownerUserId != userId) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Нет прав на управление этим приложением',
        );
      }
    } else {
      final member = await TeamMember.db.findFirstRow(
        session,
        where: (t) =>
            (t.teamId.equals(app.ownerTeamId!)) &
            (t.userId.equals(userId)) &
            (t.status.equals(TeamMemberStatusType.active)),
      );

      if (member == null ||
          (member.role != TeamRoleType.owner &&
              member.role != TeamRoleType.admin)) {
        throw InvalidDataException(
          field: 'applicationId',
          message: 'Недостаточно прав для управления этим приложением',
        );
      }
    }
  }
}
