import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';
import 'package:version_manager_server/src/services/service_locator.dart';

/// Сервис проверки версий мобильных приложений.
///
/// Инкапсулирует бизнес-логику публичного API `/api/v1/check-version`.
/// Обрабатывает запросы от мобильных приложений, проверяет статус версии,
/// формирует рекомендации по обновлению и ведёт анонимную аналитику.
///
/// ## Хранение статистики
/// Вся статистика хранится в агрегированных таблицах:
/// — [DailyCheckSummary] — дневные счётчики по (app, date, platform, build)
/// — [DailyDimensionSummary] — дневные счётчики по измерениям (os, model, locale, hour)
/// — [AppInstance] — экземпляры приложений для уникальных пользователей
///
/// Сырые логи (version_check_logs) не используются.
///
/// ## Уникальные пользователи
/// Используется per-app instance ID:
/// — iOS: identifierForVendor (IDFV)
/// — Android: App Instance ID
/// Не требует ATT, consent popup или disclosure в магазинах.
class CheckVersionService {
  final _tokenService = Services().tokenService;

  /// Валидирует API ключ из заголовка Authorization.
  ///
  /// ### Параметры
  /// - [session] — серверная сессия Serverpod
  /// - [apiKey] — API ключ из заголовка `Authorization: Bearer {key}`
  ///
  /// ### Возвращает
  /// [Application] если ключ валиден, `null` если нет.
  Future<Application?> validateApiKey(Session session, String apiKey) async {
    // Маскируем ключ для логов (первые 8 и последние 4 символа)
    final maskedKey = apiKey.length > 12
        ? '${apiKey.substring(0, 8)}...${apiKey.substring(apiKey.length - 4)}'
        : '***';

    session.log(
      'validateApiKey: получен ключ "$maskedKey" (длина: ${apiKey.length})',
      level: LogLevel.info,
    );

    final apiKeyHash = _tokenService.hashToken(apiKey);

    session.log(
      'validateApiKey: SHA-256 хеш ключа: $apiKeyHash',
      level: LogLevel.info,
    );

    // Сначала ищем по хешу без фильтра isActive,
    // чтобы понять — ключ вообще не найден или приложение деактивировано
    final applicationAny = await Application.db.findFirstRow(
      session,
      where: (t) => t.apiKeyHash.equals(apiKeyHash),
    );

    if (applicationAny == null) {
      session.log(
        'validateApiKey: ❌ Приложение с таким хешем API ключа НЕ найдено в БД. '
        'Хеш: $apiKeyHash',
        level: LogLevel.warning,
      );

      // Дополнительно: проверим, сколько вообще приложений есть с apiKeyHash
      final totalApps = await Application.db.count(session);
      final appsWithKey = await Application.db.count(
        session,
        where: (t) => t.apiKeyHash.notEquals(null),
      );
      session.log(
        'validateApiKey: В БД всего $totalApps приложений, '
        'из них $appsWithKey имеют apiKeyHash',
        level: LogLevel.info,
      );

      // DEBUG: выводим хеши всех приложений для сравнения
      final allApps = await Application.db.find(session);
      for (final app in allApps) {
        session.log(
          'validateApiKey: [DEBUG] app="${app.namespace}" '
          'name="${app.name}" '
          'apiKeyHash="${app.apiKeyHash}" '
          'isActive=${app.isActive}',
          level: LogLevel.info,
        );
      }

      return null;
    }

    session.log(
      'validateApiKey: Найдено приложение по хешу: '
      'id=${applicationAny.id}, '
      'namespace=${applicationAny.namespace}, '
      'name=${applicationAny.name}, '
      'isActive=${applicationAny.isActive}',
      level: LogLevel.info,
    );

    if (!applicationAny.isActive) {
      session.log(
        'validateApiKey: ⚠️ Приложение найдено, но ДЕАКТИВИРОВАНО '
        '(isActive=false). namespace=${applicationAny.namespace}',
        level: LogLevel.warning,
      );
      return null;
    }

    session.log(
      'validateApiKey: ✅ API ключ валиден. '
      'Приложение: ${applicationAny.namespace} (${applicationAny.name})',
      level: LogLevel.info,
    );

    return applicationAny;
  }

  /// Находит версию приложения по номеру сборки.
  ///
  /// ### Параметры
  /// - [session] — серверная сессия Serverpod
  /// - [applicationId] — ID приложения
  /// - [buildNumber] — номер сборки из запроса
  ///
  /// ### Возвращает
  /// [Version] если найдена, `null` если нет.
  Future<Version?> findVersion(
    Session session,
    UuidValue applicationId,
    int buildNumber,
  ) async {
    return await Version.db.findFirstRow(
      session,
      where: (t) =>
          t.applicationId.equals(applicationId) &
          t.buildNumber.equals(buildNumber),
      include: Version.include(
        recommendedVersion: Version.include(),
      ),
    );
  }

  /// Получает ссылки на магазины, отфильтрованные по платформе.
  ///
  /// ### Параметры
  /// - [session] — серверная сессия Serverpod
  /// - [applicationId] — ID приложения
  /// - [platform] — платформа для фильтрации
  ///
  /// ### Возвращает
  /// Список [StoreLink] для указанной платформы.
  Future<List<StoreLink>> getStoreLinksForPlatform(
    Session session,
    UuidValue applicationId,
    PlatformType platform,
  ) async {
    return await StoreLink.db.find(
      session,
      where: (t) =>
          t.applicationId.equals(applicationId) & t.platform.equals(platform),
    );
  }

  /// Обрабатывает запрос проверки версии и формирует ответ.
  ///
  /// ### Логика обработки
  /// 1. Поиск версии по buildNumber
  /// 2. Если версия не найдена → статус error
  /// 3. Если версия заблокирована → статус blocked
  /// 4. Если есть рекомендованная версия → статус update_available
  /// 5. Иначе → статус active
  ///
  /// ### Параметры
  /// - [session] — серверная сессия Serverpod
  /// - [application] — приложение (уже валидировано)
  /// - [request] — запрос от клиента
  ///
  /// ### Возвращает
  /// [CheckVersionResponse] с информацией о статусе версии.
  Future<CheckVersionResponse> processVersionCheck(
    Session session,
    Application application,
    CheckVersionRequest request,
  ) async {
    final startTime = DateTime.now();

    // 1. Поиск версии по buildNumber
    final version = await findVersion(
      session,
      application.id!,
      request.buildNumber,
    );

    // 2. Версия не найдена — возвращаем active с предупреждением
    //    (не ошибка, т.к. версия может быть просто ещё не зарегистрирована)
    if (version == null) {
      final response = CheckVersionResponse(
        status: ResponseStatusType.active,
        isBlocked: false,
        updatePriority: null,
        recommendedVersion: null,
        message:
            'Версия ${request.version} (${request.buildNumber}) не найдена в системе. '
            'Возможно, эта версия ещё не зарегистрирована.',
        currentVersion: request.version,
        currentBuildNumber: request.buildNumber,
        serverTimestamp: DateTime.now(),
      );

      // Логируем запрос даже для ненайденной версии
      await _logVersionCheck(
        session: session,
        application: application,
        version: null,
        request: request,
        responseStatus: ResponseStatusType.active,
        updatePriority: null,
        startTime: startTime,
      );

      return response;
    }

    // 3. Версия заблокирована
    if (version.isBlocked) {
      final recommendedInfo = await _buildRecommendedVersionInfo(
        session,
        application,
        version.recommendedVersion,
        request.platform,
        currentVersion: version,
      );

      final response = CheckVersionResponse(
        status: ResponseStatusType.blocked,
        isBlocked: true,
        blockReason: version.blockReason,
        updatePriority: UpdatePriorityType.critical,
        recommendedVersion: recommendedInfo,
        message:
            version.blockReason ??
            'Эта версия приложения заблокирована. Пожалуйста, обновите приложение.',
        currentVersion: request.version,
        currentBuildNumber: request.buildNumber,
        serverTimestamp: DateTime.now(),
      );

      await _logVersionCheck(
        session: session,
        application: application,
        version: version,
        request: request,
        responseStatus: ResponseStatusType.blocked,
        updatePriority: UpdatePriorityType.critical,
        startTime: startTime,
      );

      return response;
    }

    // 4. Версия активна, проверяем рекомендованную версию
    if (version.recommendedVersion != null) {
      final recommended = version.recommendedVersion!;
      final recommendedInfo = await _buildRecommendedVersionInfo(
        session,
        application,
        recommended,
        request.platform,
        currentVersion: version,
      );

      // Определяем приоритет на основе разницы версий и наличия рекомендации
      final priority = _determineUpdatePriority(version, recommended);

      final response = CheckVersionResponse(
        status: ResponseStatusType.update_available,
        isBlocked: false,
        updatePriority: priority,
        recommendedVersion: recommendedInfo,
        message: _buildUpdateMessage(priority, recommended.versionNumber),
        currentVersion: request.version,
        currentBuildNumber: request.buildNumber,
        serverTimestamp: DateTime.now(),
      );

      await _logVersionCheck(
        session: session,
        application: application,
        version: version,
        request: request,
        responseStatus: ResponseStatusType.update_available,
        updatePriority: priority,
        startTime: startTime,
      );

      return response;
    }

    // 5. Версия актуальна
    final response = CheckVersionResponse(
      status: ResponseStatusType.active,
      isBlocked: false,
      updatePriority: null,
      recommendedVersion: null,
      message: 'Вы используете актуальную версию.',
      currentVersion: request.version,
      currentBuildNumber: request.buildNumber,
      serverTimestamp: DateTime.now(),
    );

    await _logVersionCheck(
      session: session,
      application: application,
      version: version,
      request: request,
      responseStatus: ResponseStatusType.active,
      updatePriority: null,
      startTime: startTime,
    );

    return response;
  }

  /// Формирует информацию о рекомендуемой версии для ответа.
  ///
  /// Периодичность рекомендации ([recommendationFrequency] и связанные поля)
  /// хранится на **текущей** (исходной) версии, а не на рекомендуемой.
  Future<RecommendedVersionInfo?> _buildRecommendedVersionInfo(
    Session session,
    Application application,
    Version? recommendedVersion,
    PlatformType platform, {
    Version? currentVersion,
  }) async {
    if (recommendedVersion == null) return null;

    final storeLinks = await getStoreLinksForPlatform(
      session,
      application.id!,
      platform,
    );

    return RecommendedVersionInfo(
      versionNumber: recommendedVersion.versionNumber,
      buildNumber: recommendedVersion.buildNumber,
      changelog: recommendedVersion.changelog,
      storeLinks: storeLinks
          .map(
            (link) => StoreLinkInfo(
              platform: link.platform,
              storeName: link.storeName,
              url: link.url,
            ),
          )
          .toList(),
      recommendationFrequency: currentVersion?.recommendationFrequency,
      recommendationEveryNthLaunch:
          currentVersion?.recommendationEveryNthLaunch,
      recommendationPeriodHours: currentVersion?.recommendationPeriodHours,
    );
  }

  /// Определяет приоритет обновления на основе рекомендации.
  ///
  /// Если у версии явно задана частота рекомендации, используем её
  /// для определения приоритета:
  /// - everyLaunch → high (настойчивая рекомендация)
  /// - everyNthLaunch → medium
  /// - oncePer → medium
  /// - once → low
  /// - null → medium (по умолчанию)
  UpdatePriorityType _determineUpdatePriority(
    Version currentVersion,
    Version recommendedVersion,
  ) {
    final frequency = currentVersion.recommendationFrequency;

    if (frequency == null) return UpdatePriorityType.medium;

    switch (frequency) {
      case RecommendationFrequencyType.everyLaunch:
        return UpdatePriorityType.high;
      case RecommendationFrequencyType.everyNthLaunch:
        return UpdatePriorityType.medium;
      case RecommendationFrequencyType.oncePer:
        return UpdatePriorityType.medium;
      case RecommendationFrequencyType.once:
        return UpdatePriorityType.low;
    }
  }

  /// Формирует сообщение для пользователя в зависимости от приоритета.
  String _buildUpdateMessage(
    UpdatePriorityType priority,
    String recommendedVersionNumber,
  ) {
    switch (priority) {
      case UpdatePriorityType.critical:
        return 'Эта версия больше не поддерживается. '
            'Пожалуйста, обновите приложение до версии $recommendedVersionNumber.';
      case UpdatePriorityType.high:
        return 'Доступно важное обновление до версии $recommendedVersionNumber. '
            'Рекомендуем обновиться как можно скорее.';
      case UpdatePriorityType.medium:
        return 'Доступна новая версия $recommendedVersionNumber '
            'с улучшениями и исправлениями.';
      case UpdatePriorityType.low:
        return 'Доступна новая версия $recommendedVersionNumber '
            'с незначительными улучшениями.';
    }
  }

  /// Логирует запрос проверки версии для аналитики.
  ///
  /// Агрегирует данные напрямую в summary-таблицы:
  /// — [DailyCheckSummary] — основные счётчики
  /// — [DailyDimensionSummary] — per-dimension breakdown
  /// — [AppInstance] — уникальные пользователи (если instanceId передан)
  ///
  /// Сырые логи не сохраняются.
  Future<void> _logVersionCheck({
    required Session session,
    required Application application,
    required Version? version,
    required CheckVersionRequest request,
    required ResponseStatusType responseStatus,
    required UpdatePriorityType? updatePriority,
    required DateTime startTime,
  }) async {
    try {
      final processingTimeMs = DateTime.now()
          .difference(startTime)
          .inMilliseconds;

      // 1. Upsert app instance (если instanceId передан)
      bool isNewDevice = false;
      bool isFirstCheckToday = false;

      if (request.instanceId != null && request.instanceId!.trim().isNotEmpty) {
        final result = await _upsertAppInstance(
          session: session,
          application: application,
          instanceId: request.instanceId!.trim(),
          platform: request.platform,
          buildNumber: request.buildNumber,
        );
        isNewDevice = result.isNew;
        isFirstCheckToday = result.isFirstCheckToday;
      }

      // 2. Обновляем дневную статистику
      await _updateDailyCheckSummary(
        session: session,
        application: application,
        request: request,
        responseStatus: responseStatus,
        processingTimeMs: processingTimeMs,
        isNewDevice: isNewDevice,
        isFirstCheckToday: isFirstCheckToday,
      );

      // 3. Обновляем per-dimension статистику
      await _updateDimensionSummaries(
        session: session,
        application: application,
        request: request,
        isFirstCheckToday: isFirstCheckToday,
      );
    } catch (e, stackTrace) {
      // Ошибки логирования не должны влиять на ответ клиенту
      session.log(
        'Ошибка при логировании проверки версии: $e',
        level: LogLevel.error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Upsert экземпляра приложения.
  ///
  /// Возвращает результат: новый ли это пользователь и первый ли чек за сегодня.
  Future<({bool isNew, bool isFirstCheckToday})> _upsertAppInstance({
    required Session session,
    required Application application,
    required String instanceId,
    required PlatformType platform,
    required int buildNumber,
  }) async {
    final now = DateTime.now().toUtc();
    final today = DateTime.utc(now.year, now.month, now.day);

    // Ищем существующий экземпляр
    final existing = await AppInstance.db.findFirstRow(
      session,
      where: (t) =>
          t.applicationId.equals(application.id) &
          t.instanceId.equals(instanceId),
    );

    if (existing != null) {
      // Определяем, был ли уже чек сегодня
      final existingDate = DateTime.utc(
        existing.lastActiveDate.year,
        existing.lastActiveDate.month,
        existing.lastActiveDate.day,
      );
      final isFirstToday = existingDate.isBefore(today);

      // Обновляем lastSeenAt, lastActiveDate и lastBuildNumber
      existing.lastSeenAt = now;
      existing.lastBuildNumber = buildNumber;
      if (isFirstToday) {
        existing.lastActiveDate = today;
      }
      await AppInstance.db.updateRow(session, existing);

      return (isNew: false, isFirstCheckToday: isFirstToday);
    }

    // Создаём новый экземпляр
    final instance = AppInstance(
      applicationId: application.id!,
      application: application,
      instanceId: instanceId,
      platform: platform,
      firstSeenAt: now,
      lastSeenAt: now,
      lastActiveDate: today,
      lastBuildNumber: buildNumber,
    );
    await AppInstance.db.insertRow(session, instance);
    return (isNew: true, isFirstCheckToday: true);
  }

  /// Обновляет дневную агрегированную статистику.
  ///
  /// Upsert по (app, date, platform, buildNumber).
  /// Инкрементирует uniqueDevices только при первом чеке устройства за день.
  Future<void> _updateDailyCheckSummary({
    required Session session,
    required Application application,
    required CheckVersionRequest request,
    required ResponseStatusType responseStatus,
    required int processingTimeMs,
    required bool isNewDevice,
    required bool isFirstCheckToday,
  }) async {
    try {
      final today = DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      );

      var summary = await DailyCheckSummary.db.findFirstRow(
        session,
        where: (t) =>
            t.applicationId.equals(application.id) &
            t.date.equals(today) &
            t.platform.equals(request.platform) &
            t.buildNumber.equals(request.buildNumber),
      );

      if (summary == null) {
        summary = DailyCheckSummary(
          applicationId: application.id!,
          application: application,
          date: today,
          platform: request.platform,
          buildNumber: request.buildNumber,
          versionNumber: request.version,
          uniqueDevices: isFirstCheckToday ? 1 : 0,
          newDevices: isNewDevice ? 1 : 0,
          totalChecks: 1,
          blockedChecks: responseStatus == ResponseStatusType.blocked ? 1 : 0,
          updateAvailableChecks:
              responseStatus == ResponseStatusType.update_available ? 1 : 0,
          activeChecks: responseStatus == ResponseStatusType.active ? 1 : 0,
          errorChecks: responseStatus == ResponseStatusType.error ? 1 : 0,
          avgProcessingTimeMs: processingTimeMs,
          maxProcessingTimeMs: processingTimeMs,
        );
        await DailyCheckSummary.db.insertRow(session, summary);
      } else {
        summary.totalChecks += 1;

        if (isFirstCheckToday) {
          summary.uniqueDevices += 1;
        }
        if (isNewDevice) {
          summary.newDevices += 1;
        }

        switch (responseStatus) {
          case ResponseStatusType.blocked:
            summary.blockedChecks += 1;
            break;
          case ResponseStatusType.update_available:
            summary.updateAvailableChecks += 1;
            break;
          case ResponseStatusType.active:
            summary.activeChecks += 1;
            break;
          case ResponseStatusType.error:
            summary.errorChecks += 1;
            break;
        }

        if (summary.avgProcessingTimeMs != null) {
          summary.avgProcessingTimeMs =
              ((summary.avgProcessingTimeMs! * (summary.totalChecks - 1)) +
                  processingTimeMs) ~/
              summary.totalChecks;
        } else {
          summary.avgProcessingTimeMs = processingTimeMs;
        }

        if (summary.maxProcessingTimeMs == null ||
            processingTimeMs > summary.maxProcessingTimeMs!) {
          summary.maxProcessingTimeMs = processingTimeMs;
        }

        summary.updatedAt = DateTime.now();
        await DailyCheckSummary.db.updateRow(session, summary);
      }
    } catch (e, stackTrace) {
      session.log(
        'Ошибка при обновлении дневной статистики: $e',
        level: LogLevel.error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Обновляет per-dimension дневную статистику.
  ///
  /// Записывает данные по измерениям: os_version, device_model, locale, hour.
  Future<void> _updateDimensionSummaries({
    required Session session,
    required Application application,
    required CheckVersionRequest request,
    required bool isFirstCheckToday,
  }) async {
    try {
      final now = DateTime.now().toUtc();
      final today = DateTime.utc(now.year, now.month, now.day);

      // Собираем тройки (dimensionType, dimensionValue, countAllChecks)
      // countAllChecks=true → считаем каждый запрос (для heatmap)
      // countAllChecks=false → считаем только уникальных пользователей за день
      final dimensions = <(String, String, bool)>[
        // Час суток — для heatmap: считаем ВСЕ запросы, не уникальных
        ('hour', now.hour.toString(), true),
      ];

      if (request.osVersion != null) {
        dimensions.add(('os_version', request.osVersion!, false));
      }
      if (request.deviceModel != null) {
        dimensions.add(('device_model', request.deviceModel!, false));
      }
      if (request.locale != null) {
        dimensions.add(('locale', request.locale!, false));
      }

      for (final (dimType, dimValue, countAll) in dimensions) {
        await _upsertDimensionSummary(
          session: session,
          applicationId: application.id!,
          application: application,
          date: today,
          dimensionType: dimType,
          dimensionValue: dimValue,
          platform: request.platform,
          isFirstCheckToday: isFirstCheckToday,
          countAllChecks: countAll,
        );
      }
    } catch (e, stackTrace) {
      session.log(
        'Ошибка при обновлении dimension статистики: $e',
        level: LogLevel.error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Upsert одной записи per-dimension статистики.
  ///
  /// Если [countAllChecks] = false — считает уникальных пользователей:
  /// инкрементирует userCount только при первом чеке устройства за день.
  /// Если [countAllChecks] = true — считает каждый запрос (для heatmap).
  Future<void> _upsertDimensionSummary({
    required Session session,
    required UuidValue applicationId,
    required Application application,
    required DateTime date,
    required String dimensionType,
    required String dimensionValue,
    required PlatformType platform,
    required bool isFirstCheckToday,
    bool countAllChecks = false,
  }) async {
    // Для уникальных пользователей — считаем только первый чек за день
    if (!countAllChecks && !isFirstCheckToday) return;

    var existing = await DailyDimensionSummary.db.findFirstRow(
      session,
      where: (t) =>
          t.applicationId.equals(applicationId) &
          t.date.equals(date) &
          t.dimensionType.equals(dimensionType) &
          t.dimensionValue.equals(dimensionValue) &
          t.platform.equals(platform),
    );

    if (existing != null) {
      existing.userCount += 1;
      await DailyDimensionSummary.db.updateRow(session, existing);
    } else {
      final entry = DailyDimensionSummary(
        applicationId: applicationId,
        application: application,
        date: date,
        dimensionType: dimensionType,
        dimensionValue: dimensionValue,
        platform: platform,
        userCount: 1,
      );
      await DailyDimensionSummary.db.insertRow(session, entry);
    }
  }

  /// Валидирует обязательные поля запроса.
  ///
  /// ### Возвращает
  /// Строку с описанием ошибки или `null` если всё корректно.
  static String? validateRequest(Map<String, dynamic> json) {
    // Проверяем наличие обязательных полей
    if (!json.containsKey('namespace') ||
        json['namespace'] is! String ||
        (json['namespace'] as String).trim().isEmpty) {
      return 'Поле "namespace" обязательно и не может быть пустым';
    }

    if (!json.containsKey('version') ||
        json['version'] is! String ||
        (json['version'] as String).trim().isEmpty) {
      return 'Поле "version" обязательно и не может быть пустым';
    }

    if (!json.containsKey('buildNumber') || json['buildNumber'] is! int) {
      return 'Поле "buildNumber" обязательно и должно быть целым числом';
    }

    if (!json.containsKey('platform') ||
        json['platform'] is! String ||
        (json['platform'] as String).trim().isEmpty) {
      return 'Поле "platform" обязательно и не может быть пустым';
    }

    // Валидация формата version (MAJOR.MINOR.PATCH)
    final version = json['version'] as String;
    final versionRegex = RegExp(r'^\d+\.\d+\.\d+$');
    if (!versionRegex.hasMatch(version)) {
      return 'Поле "version" должно быть в формате MAJOR.MINOR.PATCH (например: 1.2.3)';
    }

    // Валидация buildNumber
    final buildNumber = json['buildNumber'] as int;
    if (buildNumber < 1) {
      return 'Поле "buildNumber" должно быть положительным числом';
    }

    // Валидация platform
    final platform = json['platform'] as String;
    final validPlatforms = PlatformType.values.map((e) => e.name).toList();
    if (!validPlatforms.contains(platform)) {
      return 'Недопустимая платформа "$platform". '
          'Допустимые значения: ${validPlatforms.join(", ")}';
    }

    return null;
  }

  /// Парсит CheckVersionRequest из JSON Map.
  ///
  /// Поддерживает все обязательные и опциональные поля.
  /// Предполагает, что обязательные поля уже провалидированы через [validateRequest].
  static CheckVersionRequest parseRequest(Map<String, dynamic> json) {
    return CheckVersionRequest(
      namespace: normalizeNamespace(json['namespace'] as String),
      version: json['version'] as String,
      buildNumber: json['buildNumber'] as int,
      platform: PlatformType.values.firstWhere(
        (e) => e.name == json['platform'],
      ),
      // Идентификатор экземпляра (IDFV / App Instance ID)
      instanceId: json['instanceId'] as String?,
      // Опциональные поля устройства
      osVersion: json['osVersion'] as String?,
      locale: json['locale'] as String?,
      deviceModel: json['deviceModel'] as String?,
      screenWidth: json['screenWidth'] as int?,
      screenHeight: json['screenHeight'] as int?,
      timezone: json['timezone'] as String?,
      frameworkVersion: json['frameworkVersion'] as String?,
      connectionType: json['connectionType'] as String?,
      buildType: json['buildType'] as String?,
      cpuArchitecture: json['cpuArchitecture'] as String?,
      totalRamMb: json['totalRamMb'] as int?,
      freeStorageMb: json['freeStorageMb'] as int?,
      deviceLanguage: json['deviceLanguage'] as String?,
      isLowPowerMode: json['isLowPowerMode'] as bool?,
      // Метаданные SDK
      sdkVersion: json['sdkVersion'] as String?,
    );
  }

  /// Сериализует CheckVersionResponse в JSON Map.
  static Map<String, dynamic> serializeResponse(CheckVersionResponse response) {
    return {
      'status': response.status.name,
      'isBlocked': response.isBlocked,
      if (response.blockReason != null) 'blockReason': response.blockReason,
      if (response.updatePriority != null)
        'updatePriority': response.updatePriority!.name,
      if (response.recommendedVersion != null)
        'recommendedVersion': _serializeRecommendedVersionInfo(
          response.recommendedVersion!,
        ),
      'message': response.message,
      'currentVersion': response.currentVersion,
      'currentBuildNumber': response.currentBuildNumber,
      'serverTimestamp': response.serverTimestamp.toIso8601String(),
    };
  }

  /// Нормализует namespace для сравнения.
  ///
  /// Удаляет нижние подчёркивания и приводит к нижнему регистру.
  /// Например: `Com_Example_My_App` → `comexamplemyapp`.
  static String normalizeNamespace(String namespace) {
    return namespace.replaceAll('_', '').toLowerCase();
  }

  /// Сериализует RecommendedVersionInfo в JSON Map.
  static Map<String, dynamic> _serializeRecommendedVersionInfo(
    RecommendedVersionInfo info,
  ) {
    return {
      'versionNumber': info.versionNumber,
      'buildNumber': info.buildNumber,
      'changelog': info.changelog,
      'storeLinks': info.storeLinks
          .map(
            (link) => {
              'platform': link.platform.name,
              'storeName': link.storeName,
              'url': link.url,
            },
          )
          .toList(),
      if (info.recommendationFrequency != null)
        'recommendationFrequency': info.recommendationFrequency!.name,
      if (info.recommendationEveryNthLaunch != null)
        'recommendationEveryNthLaunch': info.recommendationEveryNthLaunch,
      if (info.recommendationPeriodHours != null)
        'recommendationPeriodHours': info.recommendationPeriodHours,
    };
  }

  /// Сериализует ответ ошибки в JSON Map.
  static Map<String, dynamic> serializeErrorResponse(
    CheckVersionErrorResponse error,
  ) {
    return {
      'errorCode': error.errorCode,
      'message': error.message,
      if (error.details != null) 'details': error.details,
      'serverTimestamp': error.serverTimestamp.toIso8601String(),
    };
  }
}
