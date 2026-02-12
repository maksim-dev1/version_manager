import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/endpoints/base/logged_in_endpoint.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

/// Эндпоинт для управления версиями приложений.
///
/// Предоставляет функционал для:
/// - Получения списка версий приложения
/// - Создания, редактирования и удаления версий
/// - Быстрой блокировки/разблокировки версий
/// - Установки рекомендуемой версии для обновления
/// - Получения детальной информации о версии
/// - Получения следующего номера сборки
///
/// Наследуется от [LoggedInEndpoint] — требует авторизации.
class VersionEndpoint extends LoggedInEndpoint {
  // ============================================================
  // ПОЛУЧЕНИЕ ВЕРСИЙ
  // ============================================================

  /// Получить список всех версий приложения.
  ///
  /// Возвращает приложение с информацией и список версий,
  /// отсортированный по номеру сборки по убыванию (самая новая сверху).
  /// Для каждой версии подсчитывается количество активных пользователей.
  Future<VersionListResponse> getVersions(
    Session session, {
    required UuidValue applicationId,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'getVersions: загрузка версий приложения $applicationId',
      level: LogLevel.info,
    );

    // Проверяем доступ к приложению
    final app = await _getAppWithAccessCheck(
      session,
      applicationId: applicationId,
      userId: userId,
    );

    // Загружаем все версии приложения
    final versions = await Version.db.find(
      session,
      where: (t) => t.applicationId.equals(applicationId),
      include: Version.include(
        recommendedVersion: Version.include(),
      ),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );

    // Определяем максимальный buildNumber
    final maxBuildNumber = versions.isNotEmpty ? versions.first.buildNumber : 0;

    // Формируем список элементов
    final items = <VersionListItem>[];
    for (final version in versions) {
      final activeUsersCount = await _getActiveUsersCount(
        session,
        versionId: version.id!,
      );

      items.add(
        VersionListItem(
          id: version.id!,
          versionNumber: version.versionNumber,
          buildNumber: version.buildNumber,
          changelog: version.changelog,
          isBlocked: version.isBlocked,
          blockReason: version.blockReason,
          recommendedVersionNumber: version.recommendedVersion?.versionNumber,
          activeUsersCount: activeUsersCount,
          isLatest: version.buildNumber == maxBuildNumber,
          createdAt: version.createdAt,
        ),
      );
    }

    session.log(
      'getVersions: найдено ${items.length} версий для приложения $applicationId',
      level: LogLevel.info,
    );

    return VersionListResponse(
      application: app,
      versions: items,
    );
  }

  /// Получить детальную информацию о версии (для редактирования).
  ///
  /// Возвращает полную информацию о версии, включая:
  /// - Является ли версия самой новой
  /// - Список более новых версий (для выбора рекомендуемой)
  /// - Количество активных пользователей
  /// - Количество версий, рекомендующих обновление на эту
  Future<VersionDetailResponse> getVersionDetail(
    Session session, {
    required UuidValue versionId,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'getVersionDetail: загрузка детальной информации о версии $versionId',
      level: LogLevel.info,
    );

    final version = await Version.db.findById(
      session,
      versionId,
      include: Version.include(
        application: Application.include(),
        recommendedVersion: Version.include(),
      ),
    );

    if (version == null) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Версия не найдена',
      );
    }

    // Проверяем доступ к приложению
    await _getAppWithAccessCheck(
      session,
      applicationId: version.applicationId,
      userId: userId,
    );

    // Определяем максимальный buildNumber для данного приложения
    final maxBuildVersion = await Version.db.findFirstRow(
      session,
      where: (t) => t.applicationId.equals(version.applicationId),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );

    final isLatest =
        maxBuildVersion != null && maxBuildVersion.id == version.id;

    // Список версий с большим buildNumber (для выбора рекомендуемой)
    final newerVersions = await Version.db.find(
      session,
      where: (t) =>
          (t.applicationId.equals(version.applicationId)) &
          (t.buildNumber > version.buildNumber),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );

    // Количество активных пользователей
    final activeUsersCount = await _getActiveUsersCount(
      session,
      versionId: version.id!,
    );

    // Количество версий, рекомендующих обновление на эту
    final recommendingVersionsCount = await Version.db.count(
      session,
      where: (t) => t.recommendedVersionId.equals(version.id!),
    );

    session.log(
      'getVersionDetail: версия ${version.versionNumber} '
      '(isLatest: $isLatest, activeUsers: $activeUsersCount, '
      'recommendingCount: $recommendingVersionsCount)',
      level: LogLevel.info,
    );

    return VersionDetailResponse(
      version: version,
      isLatest: isLatest,
      newerVersions: newerVersions,
      activeUsersCount: activeUsersCount,
      recommendingVersionsCount: recommendingVersionsCount,
    );
  }

  /// Получить следующий рекомендуемый номер сборки.
  ///
  /// Возвращает текущий максимальный номер сборки и предложенный следующий.
  Future<NextBuildNumberResponse> getNextBuildNumber(
    Session session, {
    required UuidValue applicationId,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'getNextBuildNumber: получение следующего номера сборки '
      'для приложения $applicationId',
      level: LogLevel.info,
    );

    // Проверяем доступ к приложению
    await _getAppWithAccessCheck(
      session,
      applicationId: applicationId,
      userId: userId,
    );

    // Находим максимальный номер сборки
    final maxBuildVersion = await Version.db.findFirstRow(
      session,
      where: (t) => t.applicationId.equals(applicationId),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );

    final currentMax = maxBuildVersion?.buildNumber ?? 0;

    return NextBuildNumberResponse(
      nextBuildNumber: currentMax + 1,
      currentMaxBuildNumber: currentMax,
    );
  }

  // ============================================================
  // СОЗДАНИЕ ВЕРСИИ
  // ============================================================

  /// Создать новую версию приложения.
  ///
  /// Принимает только базовые поля:
  /// - Номер версии (формат MAJOR.MINOR.PATCH)
  /// - Номер сборки (уникальное положительное число)
  /// - Описание изменений (changelog)
  ///
  /// Блокировка, рекомендации и настройки частоты при создании недоступны.
  Future<Version> createVersion(
    Session session, {
    required CreateVersionRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'createVersion: создание версии ${request.versionNumber} '
      '(build ${request.buildNumber}) для приложения ${request.applicationId}',
      level: LogLevel.info,
    );

    // Проверяем доступ к приложению (запись)
    await _getAppWithWriteAccessCheck(
      session,
      applicationId: request.applicationId,
      userId: userId,
    );

    // Валидация номера версии (формат MAJOR.MINOR.PATCH)
    _validateVersionNumber(request.versionNumber);

    // Валидация номера сборки
    _validateBuildNumber(request.buildNumber);

    // Валидация changelog
    _validateChangelog(request.changelog);

    // Проверка уникальности номера версии для данного приложения
    final existingByVersion = await Version.db.findFirstRow(
      session,
      where: (t) =>
          (t.applicationId.equals(request.applicationId)) &
          (t.versionNumber.equals(request.versionNumber.trim())),
    );

    if (existingByVersion != null) {
      throw InvalidDataException(
        field: 'versionNumber',
        message:
            'Версия с номером ${request.versionNumber} уже существует '
            'для этого приложения',
      );
    }

    // Проверка уникальности номера сборки для данного приложения
    final existingByBuild = await Version.db.findFirstRow(
      session,
      where: (t) =>
          (t.applicationId.equals(request.applicationId)) &
          (t.buildNumber.equals(request.buildNumber)),
    );

    if (existingByBuild != null) {
      throw InvalidDataException(
        field: 'buildNumber',
        message:
            'Версия с номером сборки ${request.buildNumber} уже существует '
            'для этого приложения',
      );
    }

    // Проверка что номер сборки больше всех существующих
    final maxBuildVersion = await Version.db.findFirstRow(
      session,
      where: (t) => t.applicationId.equals(request.applicationId),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );

    if (maxBuildVersion != null &&
        request.buildNumber <= maxBuildVersion.buildNumber) {
      throw InvalidDataException(
        field: 'buildNumber',
        message:
            'Номер сборки должен быть больше текущего максимального '
            '(${maxBuildVersion.buildNumber})',
      );
    }

    // Проверка что номер версии не ниже максимального существующего
    if (maxBuildVersion != null) {
      final newParts = request.versionNumber
          .trim()
          .split('.')
          .map(int.parse)
          .toList();
      final latestParts = maxBuildVersion.versionNumber
          .split('.')
          .map(int.parse)
          .toList();

      final comparison = _compareVersionParts(newParts, latestParts);
      if (comparison < 0) {
        throw InvalidDataException(
          field: 'versionNumber',
          message:
              'Номер версии (${request.versionNumber}) не может быть ниже '
              'текущей максимальной версии (${maxBuildVersion.versionNumber})',
        );
      }
    }

    // Создание версии
    final version = Version(
      applicationId: request.applicationId,
      versionNumber: request.versionNumber.trim(),
      buildNumber: request.buildNumber,
      changelog: request.changelog.trim(),
      isBlocked: false,
    );

    final created = await Version.db.insertRow(session, version);

    session.log(
      'createVersion: версия создана с ID ${created.id}',
      level: LogLevel.info,
    );

    return created;
  }

  // ============================================================
  // РЕДАКТИРОВАНИЕ ВЕРСИИ
  // ============================================================

  /// Обновить данные версии.
  ///
  /// Базовые поля (versionNumber, buildNumber, changelog) доступны всегда.
  /// Дополнительные поля (блокировка, рекомендация, частота) доступны
  /// только если версия не является самой новой.
  Future<Version> updateVersion(
    Session session, {
    required UpdateVersionRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'updateVersion: обновление версии ${request.versionId}',
      level: LogLevel.info,
    );

    final version = await Version.db.findById(session, request.versionId);

    if (version == null) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Версия не найдена',
      );
    }

    // Проверяем доступ к приложению (запись)
    await _getAppWithWriteAccessCheck(
      session,
      applicationId: version.applicationId,
      userId: userId,
    );

    // Определяем, является ли версия самой новой
    final isLatest = await _isLatestVersion(session, version: version);

    // === Базовые поля ===

    // Обновление номера версии
    if (request.versionNumber != null) {
      _validateVersionNumber(request.versionNumber!);

      // Проверка уникальности (исключая текущую версию)
      final existingByVersion = await Version.db.findFirstRow(
        session,
        where: (t) =>
            (t.applicationId.equals(version.applicationId)) &
            (t.versionNumber.equals(request.versionNumber!.trim())) &
            (t.id.notEquals(version.id!)),
      );

      if (existingByVersion != null) {
        throw InvalidDataException(
          field: 'versionNumber',
          message:
              'Версия с номером ${request.versionNumber} уже существует '
              'для этого приложения',
        );
      }

      version.versionNumber = request.versionNumber!.trim();
    }

    // Обновление номера сборки
    if (request.buildNumber != null) {
      _validateBuildNumber(request.buildNumber!);

      // Проверка уникальности (исключая текущую версию)
      final existingByBuild = await Version.db.findFirstRow(
        session,
        where: (t) =>
            (t.applicationId.equals(version.applicationId)) &
            (t.buildNumber.equals(request.buildNumber!)) &
            (t.id.notEquals(version.id!)),
      );

      if (existingByBuild != null) {
        throw InvalidDataException(
          field: 'buildNumber',
          message:
              'Версия с номером сборки ${request.buildNumber} уже существует '
              'для этого приложения',
        );
      }

      version.buildNumber = request.buildNumber!;
    }

    // Обновление changelog
    if (request.changelog != null) {
      _validateChangelog(request.changelog!);
      version.changelog = request.changelog!.trim();
    }

    // === Дополнительные поля (только если не самая новая) ===

    if (!isLatest) {
      // Блокировка версии
      if (request.isBlocked != null) {
        version.isBlocked = request.isBlocked!;

        if (request.isBlocked!) {
          // При блокировке причина обязательна
          if (request.blockReason == null ||
              request.blockReason!.trim().isEmpty) {
            throw InvalidDataException(
              field: 'blockReason',
              message: 'Причина блокировки обязательна при блокировке версии',
            );
          }
          _validateBlockReason(request.blockReason!);
          version.blockReason = request.blockReason!.trim();
        } else {
          // При разблокировке очищаем причину
          version.blockReason = null;
        }
      } else if (request.blockReason != null) {
        // Обновление причины блокировки без смены статуса
        _validateBlockReason(request.blockReason!);
        version.blockReason = request.blockReason!.trim();
      }

      // Снятие рекомендации
      if (request.clearRecommendation == true) {
        version.recommendedVersionId = null;
        version.recommendationFrequency = null;
        version.recommendationEveryNthLaunch = null;
        version.recommendationPeriodHours = null;
      }
      // Установка рекомендуемой версии
      else if (request.recommendedVersionId != null) {
        await _validateRecommendation(
          session,
          version: version,
          recommendedVersionId: request.recommendedVersionId!,
        );

        version.recommendedVersionId = request.recommendedVersionId;

        // Настройки частоты показа
        _validateAndApplyFrequencySettings(
          version: version,
          frequency: request.recommendationFrequency,
          everyNthLaunch: request.recommendationEveryNthLaunch,
          periodHours: request.recommendationPeriodHours,
        );
      }
      // Обновление настроек частоты без смены рекомендуемой версии
      else if (request.recommendationFrequency != null &&
          version.recommendedVersionId != null) {
        _validateAndApplyFrequencySettings(
          version: version,
          frequency: request.recommendationFrequency,
          everyNthLaunch: request.recommendationEveryNthLaunch,
          periodHours: request.recommendationPeriodHours,
        );
      }
    } else {
      // Если версия самая новая — блокировка и рекомендации недоступны
      if (request.isBlocked != null ||
          request.recommendedVersionId != null ||
          request.recommendationFrequency != null) {
        throw InvalidDataException(
          field: 'versionId',
          message:
              'Это самая новая версия приложения. '
              'Блокировка и рекомендация станут доступны после '
              'создания более новой версии',
        );
      }
    }

    version.updatedAt = DateTime.now();
    await Version.db.updateRow(session, version);

    // Загружаем обновлённую версию с связями
    final result = await Version.db.findById(
      session,
      version.id!,
      include: Version.include(
        recommendedVersion: Version.include(),
      ),
    );

    session.log(
      'updateVersion: версия ${request.versionId} обновлена',
      level: LogLevel.info,
    );

    return result!;
  }

  // ============================================================
  // БЫСТРАЯ БЛОКИРОВКА
  // ============================================================

  /// Быстрая блокировка/разблокировка версии.
  ///
  /// Переключатель в карточке/строке версии.
  /// Недоступна для самой новой версии.
  Future<Version> toggleVersionBlock(
    Session session, {
    required ToggleVersionBlockRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'toggleVersionBlock: ${request.isBlocked ? "блокировка" : "разблокировка"} '
      'версии ${request.versionId}',
      level: LogLevel.info,
    );

    final version = await Version.db.findById(session, request.versionId);

    if (version == null) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Версия не найдена',
      );
    }

    // Проверяем доступ к приложению (запись)
    await _getAppWithWriteAccessCheck(
      session,
      applicationId: version.applicationId,
      userId: userId,
    );

    // Нельзя блокировать самую новую версию
    final isLatest = await _isLatestVersion(session, version: version);
    if (isLatest) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Нельзя заблокировать самую новую версию приложения',
      );
    }

    // Валидация причины блокировки
    if (request.isBlocked) {
      if (request.blockReason == null || request.blockReason!.trim().isEmpty) {
        throw InvalidDataException(
          field: 'blockReason',
          message: 'Причина блокировки обязательна',
        );
      }
      _validateBlockReason(request.blockReason!);
    }

    version.isBlocked = request.isBlocked;
    version.blockReason = request.isBlocked
        ? request.blockReason!.trim()
        : null;
    version.updatedAt = DateTime.now();

    await Version.db.updateRow(session, version);

    session.log(
      'toggleVersionBlock: версия ${request.versionId} '
      '${request.isBlocked ? "заблокирована" : "разблокирована"}',
      level: LogLevel.info,
    );

    return version;
  }

  // ============================================================
  // УСТАНОВКА РЕКОМЕНДАЦИИ
  // ============================================================

  /// Установить или снять рекомендуемую версию для обновления.
  ///
  /// Позволяет указать рекомендуемую версию и настройки частоты показа.
  /// Доступно только если версия не самая новая.
  Future<Version> setVersionRecommendation(
    Session session, {
    required SetVersionRecommendationRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'setVersionRecommendation: установка рекомендации для версии '
      '${request.versionId} → ${request.recommendedVersionId ?? "снять"}',
      level: LogLevel.info,
    );

    final version = await Version.db.findById(session, request.versionId);

    if (version == null) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Версия не найдена',
      );
    }

    // Проверяем доступ к приложению (запись)
    await _getAppWithWriteAccessCheck(
      session,
      applicationId: version.applicationId,
      userId: userId,
    );

    // Нельзя устанавливать рекомендацию для самой новой версии
    final isLatest = await _isLatestVersion(session, version: version);
    if (isLatest) {
      throw InvalidDataException(
        field: 'versionId',
        message:
            'Нельзя установить рекомендацию для самой новой версии. '
            'Рекомендация станет доступна после создания более новой версии',
      );
    }

    if (request.recommendedVersionId == null) {
      // Снятие рекомендации
      version.recommendedVersionId = null;
      version.recommendationFrequency = null;
      version.recommendationEveryNthLaunch = null;
      version.recommendationPeriodHours = null;
    } else {
      // Установка рекомендации
      await _validateRecommendation(
        session,
        version: version,
        recommendedVersionId: request.recommendedVersionId!,
      );

      version.recommendedVersionId = request.recommendedVersionId;

      // Настройки частоты показа (обязательны при установке рекомендации)
      if (request.recommendationFrequency == null) {
        // Если частота не указана — по умолчанию "раз в неделю"
        version.recommendationFrequency = RecommendationFrequencyType.oncePer;
        version.recommendationPeriodHours = 168; // 7 дней
        version.recommendationEveryNthLaunch = null;
      } else {
        _validateAndApplyFrequencySettings(
          version: version,
          frequency: request.recommendationFrequency,
          everyNthLaunch: request.recommendationEveryNthLaunch,
          periodHours: request.recommendationPeriodHours,
        );
      }
    }

    version.updatedAt = DateTime.now();
    await Version.db.updateRow(session, version);

    // Загружаем обновлённую версию с связями
    final result = await Version.db.findById(
      session,
      version.id!,
      include: Version.include(
        recommendedVersion: Version.include(),
      ),
    );

    session.log(
      'setVersionRecommendation: рекомендация для версии ${request.versionId} '
      '${request.recommendedVersionId != null ? "установлена" : "снята"}',
      level: LogLevel.info,
    );

    return result!;
  }

  // ============================================================
  // УДАЛЕНИЕ ВЕРСИИ
  // ============================================================

  /// Удалить версию приложения.
  ///
  /// Ограничения:
  /// - Нельзя удалить последнюю оставшуюся версию приложения
  /// - При удалении версии, которая рекомендуется другим, возвращается
  ///   предупреждение (но удаление проходит, т.к. onDelete=SetNull)
  Future<SuccessResponse> deleteVersion(
    Session session, {
    required DeleteVersionRequest request,
  }) async {
    final userId = UuidValue.fromString(session.authenticated!.userIdentifier);

    session.log(
      'deleteVersion: удаление версии ${request.versionId}',
      level: LogLevel.info,
    );

    final version = await Version.db.findById(session, request.versionId);

    if (version == null) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Версия не найдена',
      );
    }

    // Проверяем доступ к приложению (запись)
    await _getAppWithWriteAccessCheck(
      session,
      applicationId: version.applicationId,
      userId: userId,
    );

    // Нельзя удалить последнюю версию
    final totalVersions = await Version.db.count(
      session,
      where: (t) => t.applicationId.equals(version.applicationId),
    );

    if (totalVersions <= 1) {
      throw InvalidDataException(
        field: 'versionId',
        message: 'Нельзя удалить последнюю оставшуюся версию приложения',
      );
    }

    // Проверяем, рекомендуется ли эта версия другими
    final recommendingCount = await Version.db.count(
      session,
      where: (t) => t.recommendedVersionId.equals(version.id!),
    );

    String message;
    if (recommendingCount > 0) {
      message =
          'Версия ${version.versionNumber} удалена. '
          'Внимание: $recommendingCount версий ссылались на неё как рекомендуемую — '
          'рекомендации были сброшены';
    } else {
      message = 'Версия ${version.versionNumber} удалена';
    }

    await Version.db.deleteRow(session, version);

    session.log(
      'deleteVersion: версия ${request.versionId} удалена '
      '(recommendingCount: $recommendingCount)',
      level: LogLevel.info,
    );

    return SuccessResponse(success: true, message: message);
  }

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ: ПРОВЕРКИ ДОСТУПА
  // ============================================================

  /// Получить приложение с проверкой прав на чтение.
  Future<Application> _getAppWithAccessCheck(
    Session session, {
    required UuidValue applicationId,
    required UuidValue userId,
  }) async {
    final app = await Application.db.findById(
      session,
      applicationId,
      include: Application.include(
        ownerUser: User.include(),
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

  /// Получить приложение с проверкой прав на запись.
  Future<Application> _getAppWithWriteAccessCheck(
    Session session, {
    required UuidValue applicationId,
    required UuidValue userId,
  }) async {
    final app = await Application.db.findById(session, applicationId);

    if (app == null) {
      throw InvalidDataException(
        field: 'applicationId',
        message: 'Приложение не найдено',
      );
    }

    await _checkAppWriteAccess(session, app: app, userId: userId);

    return app;
  }

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

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ: ВАЛИДАЦИЯ
  // ============================================================

  /// Валидация номера версии (формат MAJOR.MINOR.PATCH).
  void _validateVersionNumber(String versionNumber) {
    final trimmed = versionNumber.trim();

    if (trimmed.isEmpty) {
      throw InvalidDataException(
        field: 'versionNumber',
        message: 'Номер версии не может быть пустым',
      );
    }

    final versionRegex = RegExp(r'^\d+\.\d+\.\d+$');
    if (!versionRegex.hasMatch(trimmed)) {
      throw InvalidDataException(
        field: 'versionNumber',
        message:
            'Номер версии должен быть в формате MAJOR.MINOR.PATCH '
            '(например, 1.0.0, 2.1.3)',
      );
    }

    // Проверяем что каждая часть — допустимое число
    final parts = trimmed.split('.');
    for (final part in parts) {
      final num = int.tryParse(part);
      if (num == null || num < 0) {
        throw InvalidDataException(
          field: 'versionNumber',
          message:
              'Каждая часть номера версии должна быть неотрицательным числом',
        );
      }
    }
  }

  /// Валидация номера сборки.
  void _validateBuildNumber(int buildNumber) {
    if (buildNumber <= 0) {
      throw InvalidDataException(
        field: 'buildNumber',
        message: 'Номер сборки должен быть положительным числом',
      );
    }
  }

  /// Сравнение двух версий по частям (MAJOR.MINOR.PATCH).
  ///
  /// Возвращает отрицательное число если [a] < [b],
  /// ноль если равны, положительное если [a] > [b].
  int _compareVersionParts(List<int> a, List<int> b) {
    for (var i = 0; i < a.length && i < b.length; i++) {
      if (a[i] != b[i]) return a[i] - b[i];
    }
    return a.length - b.length;
  }

  /// Валидация changelog (от 10 до 2000 символов).
  void _validateChangelog(String changelog) {
    final trimmed = changelog.trim();

    if (trimmed.length < 10) {
      throw InvalidDataException(
        field: 'changelog',
        message: 'Описание изменений должно содержать минимум 10 символов',
      );
    }

    if (trimmed.length > 2000) {
      throw InvalidDataException(
        field: 'changelog',
        message: 'Описание изменений не должно превышать 2000 символов',
      );
    }
  }

  /// Валидация причины блокировки (от 10 до 500 символов).
  void _validateBlockReason(String blockReason) {
    final trimmed = blockReason.trim();

    if (trimmed.length < 10) {
      throw InvalidDataException(
        field: 'blockReason',
        message: 'Причина блокировки должна содержать минимум 10 символов',
      );
    }

    if (trimmed.length > 500) {
      throw InvalidDataException(
        field: 'blockReason',
        message: 'Причина блокировки не должна превышать 500 символов',
      );
    }
  }

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ: РЕКОМЕНДАЦИИ
  // ============================================================

  /// Валидация рекомендуемой версии.
  ///
  /// Проверяет:
  /// - Рекомендуемая версия существует
  /// - Рекомендуемая версия принадлежит тому же приложению
  /// - Рекомендуемая версия имеет больший buildNumber
  /// - Нет циклических рекомендаций
  Future<void> _validateRecommendation(
    Session session, {
    required Version version,
    required UuidValue recommendedVersionId,
  }) async {
    // Нельзя рекомендовать саму себя
    if (version.id == recommendedVersionId) {
      throw InvalidDataException(
        field: 'recommendedVersionId',
        message: 'Версия не может рекомендовать саму себя',
      );
    }

    final recommended = await Version.db.findById(
      session,
      recommendedVersionId,
    );

    if (recommended == null) {
      throw InvalidDataException(
        field: 'recommendedVersionId',
        message: 'Рекомендуемая версия не найдена',
      );
    }

    // Проверка что версия принадлежит тому же приложению
    if (recommended.applicationId != version.applicationId) {
      throw InvalidDataException(
        field: 'recommendedVersionId',
        message: 'Рекомендуемая версия должна принадлежать тому же приложению',
      );
    }

    // Рекомендовать можно только версии с большим номером сборки
    if (recommended.buildNumber <= version.buildNumber) {
      throw InvalidDataException(
        field: 'recommendedVersionId',
        message:
            'Рекомендовать можно только версии с большим номером сборки. '
            'Текущая сборка: ${version.buildNumber}, '
            'рекомендуемая: ${recommended.buildNumber}',
      );
    }

    // Проверка циклических рекомендаций
    await _checkCircularRecommendation(
      session,
      startVersionId: recommendedVersionId,
      targetVersionId: version.id!,
    );
  }

  /// Проверка циклических рекомендаций.
  ///
  /// Проходит по цепочке рекомендаций от startVersionId
  /// и проверяет, не ведёт ли она обратно к targetVersionId.
  Future<void> _checkCircularRecommendation(
    Session session, {
    required UuidValue startVersionId,
    required UuidValue targetVersionId,
    int maxDepth = 50,
  }) async {
    var currentId = startVersionId;
    final visited = <UuidValue>{};

    for (var i = 0; i < maxDepth; i++) {
      if (visited.contains(currentId)) break;
      visited.add(currentId);

      final current = await Version.db.findById(session, currentId);
      if (current == null || current.recommendedVersionId == null) break;

      if (current.recommendedVersionId == targetVersionId) {
        throw InvalidDataException(
          field: 'recommendedVersionId',
          message:
              'Обнаружена циклическая рекомендация. '
              'Нельзя создать цепочку рекомендаций, '
              'которая ведёт обратно к этой версии',
        );
      }

      currentId = current.recommendedVersionId!;
    }
  }

  /// Валидация и применение настроек частоты показа рекомендации.
  void _validateAndApplyFrequencySettings({
    required Version version,
    required RecommendationFrequencyType? frequency,
    required int? everyNthLaunch,
    required int? periodHours,
  }) {
    if (frequency == null) {
      throw InvalidDataException(
        field: 'recommendationFrequency',
        message: 'Тип частоты показа рекомендации обязателен',
      );
    }

    version.recommendationFrequency = frequency;

    switch (frequency) {
      case RecommendationFrequencyType.everyLaunch:
        // Каждый запуск — дополнительные параметры не нужны
        version.recommendationEveryNthLaunch = null;
        version.recommendationPeriodHours = null;
        break;

      case RecommendationFrequencyType.everyNthLaunch:
        // Каждый N-й запуск
        if (everyNthLaunch == null) {
          throw InvalidDataException(
            field: 'recommendationEveryNthLaunch',
            message: 'Для типа "Каждый N-й запуск" необходимо указать интервал',
          );
        }
        if (everyNthLaunch < 2 || everyNthLaunch > 50) {
          throw InvalidDataException(
            field: 'recommendationEveryNthLaunch',
            message: 'Интервал должен быть от 2 до 50',
          );
        }
        version.recommendationEveryNthLaunch = everyNthLaunch;
        version.recommendationPeriodHours = null;
        break;

      case RecommendationFrequencyType.oncePer:
        // Раз в период
        if (periodHours == null) {
          throw InvalidDataException(
            field: 'recommendationPeriodHours',
            message:
                'Для типа "Раз в период" необходимо указать период в часах',
          );
        }
        // Допустимые значения: 24, 72, 168, 336, 720
        const allowedPeriods = [24, 72, 168, 336, 720];
        if (!allowedPeriods.contains(periodHours)) {
          throw InvalidDataException(
            field: 'recommendationPeriodHours',
            message:
                'Допустимые значения периода: '
                '24 (день), 72 (3 дня), 168 (неделя), '
                '336 (2 недели), 720 (месяц)',
          );
        }
        version.recommendationPeriodHours = periodHours;
        version.recommendationEveryNthLaunch = null;
        break;

      case RecommendationFrequencyType.once:
        // Один раз — дополнительные параметры не нужны
        version.recommendationEveryNthLaunch = null;
        version.recommendationPeriodHours = null;
        break;
    }
  }

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ: УТИЛИТЫ
  // ============================================================

  /// Проверяет, является ли версия самой новой для данного приложения.
  Future<bool> _isLatestVersion(
    Session session, {
    required Version version,
  }) async {
    final maxBuildVersion = await Version.db.findFirstRow(
      session,
      where: (t) => t.applicationId.equals(version.applicationId),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );

    return maxBuildVersion != null && maxBuildVersion.id == version.id;
  }

  /// Подсчитывает количество уникальных активных пользователей (по deviceId)
  /// на данной версии за последние 30 дней.
  Future<int> _getActiveUsersCount(
    Session session, {
    required UuidValue versionId,
  }) async {
    final thirtyDaysAgo = DateTime.now().subtract(Duration(days: 30));

    final logs = await VersionCheckLog.db.find(
      session,
      where: (t) =>
          (t.versionId.equals(versionId)) &
          (t.checkedAt > thirtyDaysAgo) &
          t.deviceId.notEquals(null),
    );

    // Подсчитываем уникальные deviceId
    final uniqueDevices = logs.map((l) => l.deviceId).toSet();
    return uniqueDevices.length;
  }
}
