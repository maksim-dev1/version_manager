import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

/// Сервис аналитики и статистики приложений.
///
/// Все метрики вычисляются из агрегированных таблиц:
/// — [DailyCheckSummary] — дневная статистика по (app, date, platform, build)
/// — [DailyDimensionSummary] — per-dimension breakdown (os_version, device_model, locale, hour)
/// — [AppInstance] — уникальные пользователи (IDFV / App Instance ID)
///
/// Сырые логи не используются.
///
/// ## Privacy (Zero-Disclosure)
/// Все данные анонимные (non-PII). Не используются:
/// — deviceId (не собирается)
/// — IP-адрес (не собирается → нет географии по IP)
/// — User-Agent (не собирается)
/// Уникальные пользователи считаются по IDFV (iOS) / App Instance ID (Android).
class StatisticsService {
  // ============================================================
  // ОБЩАЯ СТАТИСТИКА
  // ============================================================

  /// Возвращает основные метрики приложения.
  ///
  /// Включает:
  /// — Уникальных пользователей (DAU/WAU/MAU по IDFV / App Instance ID)
  /// — Общее количество запросов (входов) за разные периоды
  /// — Версии и производительность
  Future<StatisticsOverviewResponse> getOverview(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final appId = filter.applicationId;
    final now = DateTime.now().toUtc();
    final day1 = now.subtract(const Duration(hours: 24));
    final day7 = now.subtract(const Duration(days: 7));
    final day30 = now.subtract(const Duration(days: 30));

    // ---- Уникальные пользователи (из AppInstance) ----
    final totalUsers = await AppInstance.db.count(
      session,
      where: (t) => t.applicationId.equals(appId),
    );

    final dailyUsers = await AppInstance.db.count(
      session,
      where: (t) => t.applicationId.equals(appId) & (t.lastSeenAt > day1),
    );

    final weeklyUsers = await AppInstance.db.count(
      session,
      where: (t) => t.applicationId.equals(appId) & (t.lastSeenAt > day7),
    );

    final monthlyUsers = await AppInstance.db.count(
      session,
      where: (t) => t.applicationId.equals(appId) & (t.lastSeenAt > day30),
    );

    // Уникальных пользователей за выбранный период (из AppInstance)
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;
    final totalUsersInPeriod = await AppInstance.db.count(
      session,
      where: (t) =>
          t.applicationId.equals(appId) &
          (t.lastSeenAt >= dateFrom) &
          (t.lastSeenAt <= dateTo),
    );

    final newUsersInPeriod = await AppInstance.db.count(
      session,
      where: (t) =>
          t.applicationId.equals(appId) &
          (t.firstSeenAt >= dateFrom) &
          (t.firstSeenAt <= dateTo),
    );

    // ---- Общее количество запросов (из DailyCheckSummary) ----
    final allSummaries = await DailyCheckSummary.db.find(
      session,
      where: (t) => t.applicationId.equals(appId),
    );

    final totalChecks = allSummaries.fold<int>(
      0,
      (s, r) => s + r.totalChecks,
    );

    final dailyChecks = allSummaries
        .where((s) => s.date.isAfter(day1))
        .fold<int>(0, (s, r) => s + r.totalChecks);

    final weeklyChecks = allSummaries
        .where((s) => s.date.isAfter(day7))
        .fold<int>(0, (s, r) => s + r.totalChecks);

    final monthlyChecks = allSummaries
        .where((s) => s.date.isAfter(day30))
        .fold<int>(0, (s, r) => s + r.totalChecks);

    final periodSummaries = await _getFilteredSummaries(session, filter);
    final totalChecksInPeriod = periodSummaries.fold<int>(
      0,
      (s, r) => s + r.totalChecks,
    );

    // ---- Версии ----
    final versions = await Version.db.find(
      session,
      where: (t) => t.applicationId.equals(appId),
    );
    final blockedVersionsCount = versions.where((v) => v.isBlocked).length;
    final activeVersionsCount = versions.where((v) => !v.isBlocked).length;

    // ---- Среднее время обработки ----
    int? avgProcessingTimeMs;
    if (periodSummaries.isNotEmpty) {
      final validSummaries = periodSummaries
          .where((s) => s.avgProcessingTimeMs != null)
          .toList();
      if (validSummaries.isNotEmpty) {
        final totalTime = validSummaries.fold<int>(
          0,
          (sum, s) => sum + s.avgProcessingTimeMs! * s.totalChecks,
        );
        final total = validSummaries.fold<int>(
          0,
          (sum, s) => sum + s.totalChecks,
        );
        if (total > 0) {
          avgProcessingTimeMs = totalTime ~/ total;
        }
      }
    }

    return StatisticsOverviewResponse(
      totalUsers: totalUsers,
      dailyUsers: dailyUsers,
      weeklyUsers: weeklyUsers,
      monthlyUsers: monthlyUsers,
      totalUsersInPeriod: totalUsersInPeriod,
      newUsersInPeriod: newUsersInPeriod,
      totalChecks: totalChecks,
      dailyChecks: dailyChecks,
      weeklyChecks: weeklyChecks,
      monthlyChecks: monthlyChecks,
      totalChecksInPeriod: totalChecksInPeriod,
      blockedVersionsCount: blockedVersionsCount,
      activeVersionsCount: activeVersionsCount,
      avgProcessingTimeMs: avgProcessingTimeMs,
    );
  }

  // ============================================================
  // АКТИВНОСТЬ ПО ДНЯМ
  // ============================================================

  /// Возвращает данные активности по дням за период.
  ///
  /// Включает:
  /// — Количество запросов (входов) по дням (из DailyCheckSummary.totalChecks)
  /// — Уникальных пользователей по дням (из DailyCheckSummary.uniqueDevices)
  /// — Новых пользователей по дням (из DailyCheckSummary.newDevices)
  /// — Кумулятивный рост: накопленные запросы и уникальные пользователи
  Future<DailyActiveUsersResponse> getDailyActiveUsers(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final appId = filter.applicationId;
    final now = DateTime.now().toUtc();
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;

    // Получаем summaries за период
    final summaries = await _getFilteredSummaries(session, filter);

    // Группируем по дню: totalChecks, uniqueDevices, newDevices
    final Map<String, int> dailyChecks = {};
    final Map<String, int> dailyUnique = {};
    final Map<String, int> dailyNew = {};

    for (final s in summaries) {
      final key = _dayKey(s.date);
      dailyChecks[key] = (dailyChecks[key] ?? 0) + s.totalChecks;
      dailyUnique[key] = (dailyUnique[key] ?? 0) + s.uniqueDevices;
      dailyNew[key] = (dailyNew[key] ?? 0) + s.newDevices;
    }

    // Генерируем записи для каждого дня периода (включая пустые)
    final entries = <DailyActiveUsersEntry>[];
    var current = DateTime.utc(dateFrom.year, dateFrom.month, dateFrom.day);
    final end = DateTime.utc(dateTo.year, dateTo.month, dateTo.day);

    while (!current.isAfter(end)) {
      final key = _dayKey(current);
      entries.add(
        DailyActiveUsersEntry(
          date: current,
          totalChecks: dailyChecks[key] ?? 0,
          uniqueUsers: dailyUnique[key] ?? 0,
          newUsers: dailyNew[key] ?? 0,
        ),
      );
      current = current.add(const Duration(days: 1));
    }

    // Кумулятивный рост: считаем по AppInstance.firstSeenAt
    final instances = await AppInstance.db.find(
      session,
      where: (t) => t.applicationId.equals(appId) & (t.firstSeenAt <= dateTo),
      orderBy: (t) => t.firstSeenAt,
    );

    // Считаем новых пользователей по дням (из AppInstance.firstSeenAt)
    final Map<String, int> newUsersByDay = {};
    for (final inst in instances) {
      final key = _dayKey(inst.firstSeenAt);
      newUsersByDay[key] = (newUsersByDay[key] ?? 0) + 1;
    }

    // Считаем кумулятивы ДО dateFrom для начальных значений
    final allSummaries = await DailyCheckSummary.db.find(
      session,
      where: (t) => t.applicationId.equals(appId) & (t.date < dateFrom),
    );
    int cumulativeChecksTotal = allSummaries.fold<int>(
      0,
      (s, r) => s + r.totalChecks,
    );
    int cumulativeUsers = instances
        .where((inst) => inst.firstSeenAt.isBefore(dateFrom))
        .length;

    final cumulativeGrowth = <CumulativeUsersEntry>[];
    current = DateTime.utc(dateFrom.year, dateFrom.month, dateFrom.day);

    while (!current.isAfter(end)) {
      final key = _dayKey(current);
      cumulativeChecksTotal += dailyChecks[key] ?? 0;
      cumulativeUsers += newUsersByDay[key] ?? 0;
      cumulativeGrowth.add(
        CumulativeUsersEntry(
          date: current,
          totalChecks: cumulativeChecksTotal,
          totalUniqueUsers: cumulativeUsers,
        ),
      );
      current = current.add(const Duration(days: 1));
    }

    return DailyActiveUsersResponse(
      entries: entries,
      cumulativeGrowth: cumulativeGrowth,
    );
  }

  // ============================================================
  // СТАТИСТИКА ПО ВЕРСИЯМ
  // ============================================================

  /// Статистика по версиям приложения.
  ///
  /// Включает:
  /// — Распределение пользователей по ТЕКУЩИМ версиям (из AppInstance.lastBuildNumber)
  /// — Adoption rate последней версии
  /// — Пользователи на заблокированных версиях
  /// — Динамика проверок по дням для каждой версии (из DailyCheckSummary)
  ///
  /// Если пользователь обновился на новую версию, он считается
  /// только в статистике новой версии.
  Future<VersionStatisticsResponse> getVersionStatistics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final appId = filter.applicationId;
    final now = DateTime.now().toUtc();
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;

    // Все версии приложения
    final versions = await Version.db.find(
      session,
      where: (t) => t.applicationId.equals(appId),
      orderBy: (t) => t.buildNumber,
      orderDescending: true,
    );
    final versionsByBuild = {
      for (final v in versions) v.buildNumber: v,
    };

    // ---- Пользователи по ТЕКУЩЕЙ версии (из AppInstance) ----
    // Берём только пользователей, которые были активны в выбранном периоде
    // и считаем их по lastBuildNumber (текущая версия)
    final activeInstances = await AppInstance.db.find(
      session,
      where: (t) =>
          t.applicationId.equals(appId) &
          (t.lastSeenAt >= dateFrom) &
          (t.lastSeenAt <= dateTo) &
          t.lastBuildNumber.notEquals(null),
    );

    // Группируем пользователей по текущему buildNumber
    final Map<int, int> usersByBuild = {};
    for (final inst in activeInstances) {
      final build = inst.lastBuildNumber!;
      usersByBuild[build] = (usersByBuild[build] ?? 0) + 1;
    }

    final totalUsers = activeInstances.length;

    // Подтягиваем метаданные для билдов, которых нет в списке версий
    final unknownBuilds = usersByBuild.keys
        .where((b) => !versionsByBuild.containsKey(b))
        .toList();
    final Map<int, String> unknownVersionNumbers = {};
    final Map<int, DateTime> unknownCreatedAt = {};
    if (unknownBuilds.isNotEmpty) {
      final unknownSummaries = await DailyCheckSummary.db.find(
        session,
        where: (t) =>
            t.applicationId.equals(appId) &
            t.buildNumber.inSet(unknownBuilds.toSet()),
        orderBy: (t) => t.date,
      );
      for (final s in unknownSummaries) {
        unknownVersionNumbers.putIfAbsent(
          s.buildNumber,
          () => s.versionNumber,
        );
        unknownCreatedAt.putIfAbsent(s.buildNumber, () => s.date);
      }
    }

    // Формируем статистику по версиям
    final versionEntries = <VersionStatisticsEntry>[];
    int usersOnBlockedVersions = 0;

    for (final version in versions) {
      final users = usersByBuild[version.buildNumber] ?? 0;
      final percentage = totalUsers > 0 ? (users / totalUsers * 100) : 0.0;
      final ageDays = now.difference(version.createdAt).inDays;

      versionEntries.add(
        VersionStatisticsEntry(
          versionId: version.id!,
          versionNumber: version.versionNumber,
          buildNumber: version.buildNumber,
          userCount: users,
          percentage: _round2(percentage),
          isBlocked: version.isBlocked,
          isRegistered: true,
          createdAt: version.createdAt,
          ageDays: ageDays,
        ),
      );

      if (version.isBlocked) {
        usersOnBlockedVersions += users;
      }
    }

    // Добавляем версии, которых нет в списке версий
    for (final build in unknownBuilds) {
      final users = usersByBuild[build] ?? 0;
      final percentage = totalUsers > 0 ? (users / totalUsers * 100) : 0.0;
      final createdAt = unknownCreatedAt[build] ?? now;
      final ageDays = now.difference(createdAt).inDays;
      final versionNumber = unknownVersionNumbers[build] ?? 'unknown';

      versionEntries.add(
        VersionStatisticsEntry(
          versionId: null,
          versionNumber: versionNumber,
          buildNumber: build,
          userCount: users,
          percentage: _round2(percentage),
          isBlocked: false,
          isRegistered: false,
          createdAt: createdAt,
          ageDays: ageDays,
        ),
      );
    }

    // Adoption rate последней версии
    final latestVersion = versions.isNotEmpty ? versions.first : null;
    double latestVersionAdoptionRate = 0.0;
    if (latestVersion != null && totalUsers > 0) {
      final latestUsers = usersByBuild[latestVersion.buildNumber] ?? 0;
      latestVersionAdoptionRate = _round2(latestUsers / totalUsers * 100);
    }

    final blockedPercentage = totalUsers > 0
        ? _round2(usersOnBlockedVersions / totalUsers * 100)
        : 0.0;

    // Adoption timeline — данные по дням для каждой версии
    // Используем DailyCheckSummary для исторических данных по дням
    final summaries = await _getFilteredSummaries(session, filter);
    final adoptionTimeline = <VersionAdoptionTimelineEntry>[];

    // Группируем summaries по дню+buildNumber
    final Map<String, Map<int, ({int count, String version})>>
    dailyVersionUsers = {};
    final Map<String, int> dailyAllUsers = {};

    for (final s in summaries) {
      final dayKey = _dayKey(s.date);
      dailyAllUsers[dayKey] = (dailyAllUsers[dayKey] ?? 0) + s.uniqueDevices;
      final versionMap = dailyVersionUsers.putIfAbsent(dayKey, () => {});
      final existing = versionMap[s.buildNumber];
      if (existing == null) {
        versionMap[s.buildNumber] = (
          count: s.uniqueDevices,
          version: s.versionNumber,
        );
      } else {
        versionMap[s.buildNumber] = (
          count: existing.count + s.uniqueDevices,
          version: existing.version,
        );
      }
    }

    // Формируем timeline для каждого дня
    var current = DateTime.utc(dateFrom.year, dateFrom.month, dateFrom.day);
    final end = DateTime.utc(dateTo.year, dateTo.month, dateTo.day);

    while (!current.isAfter(end)) {
      final dayKey = _dayKey(current);
      final totalForDay = dailyAllUsers[dayKey] ?? 0;
      final versionMap = dailyVersionUsers[dayKey] ?? {};

      for (final entry in versionMap.entries) {
        final buildNumber = entry.key;
        final users = entry.value.count;
        final versionNumber = entry.value.version;

        adoptionTimeline.add(
          VersionAdoptionTimelineEntry(
            date: current,
            versionNumber: versionNumber,
            buildNumber: buildNumber,
            userCount: users,
            percentage: totalForDay > 0
                ? _round2(users / totalForDay * 100)
                : 0.0,
          ),
        );
      }

      current = current.add(const Duration(days: 1));
    }

    return VersionStatisticsResponse(
      versions: versionEntries,
      latestVersionAdoptionRate: latestVersionAdoptionRate,
      usersOnBlockedVersions: usersOnBlockedVersions,
      blockedVersionsPercentage: blockedPercentage,
      adoptionTimeline: adoptionTimeline,
    );
  }

  // ============================================================
  // СТАТИСТИКА ПО ПЛАТФОРМАМ
  // ============================================================

  /// Статистика по платформам.
  ///
  /// Использует:
  /// — [DailyCheckSummary] для распределения по платформам
  /// — [DailyDimensionSummary] для os_version и device_model
  Future<PlatformStatisticsResponse> getPlatformStatistics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final summaries = await _getFilteredSummaries(session, filter);
    final totalUsers = summaries.fold<int>(
      0,
      (sum, s) => sum + s.uniqueDevices,
    );

    // Распределение по платформам (из DailyCheckSummary)
    final Map<PlatformType, int> platformUsers = {};
    for (final s in summaries) {
      platformUsers[s.platform] =
          (platformUsers[s.platform] ?? 0) + s.uniqueDevices;
    }

    final platformEntries = platformUsers.entries.map((e) {
      return PlatformStatisticsEntry(
        platform: e.key,
        userCount: e.value,
        percentage: totalUsers > 0 ? _round2(e.value / totalUsers * 100) : 0.0,
      );
    }).toList()..sort((a, b) => b.userCount.compareTo(a.userCount));

    // Распределение по версиям ОС (из DailyDimensionSummary)
    final osDimensions = await _getFilteredDimensions(
      session,
      filter,
      dimensionType: 'os_version',
    );

    final Map<String, int> osVersionUsers = {};
    final Map<String, PlatformType> osVersionPlatform = {};

    for (final d in osDimensions) {
      final key = '${d.platform.name}:${d.dimensionValue}';
      osVersionUsers[key] = (osVersionUsers[key] ?? 0) + d.userCount;
      osVersionPlatform[key] = d.platform;
    }

    final osVersionEntries = osVersionUsers.entries.map((e) {
      return OsVersionStatisticsEntry(
        platform: osVersionPlatform[e.key]!,
        osVersion: e.key.split(':').last,
        userCount: e.value,
        percentage: totalUsers > 0 ? _round2(e.value / totalUsers * 100) : 0.0,
      );
    }).toList()..sort((a, b) => b.userCount.compareTo(a.userCount));

    // Топ-10 моделей устройств (из DailyDimensionSummary)
    final modelDimensions = await _getFilteredDimensions(
      session,
      filter,
      dimensionType: 'device_model',
    );

    final Map<String, int> modelUsers = {};
    final Map<String, PlatformType> modelPlatform = {};

    for (final d in modelDimensions) {
      final normalizedModel = _normalizeDeviceModel(
        d.dimensionValue,
        d.platform,
      );
      final key = '${d.platform.name}:$normalizedModel';
      modelUsers[key] = (modelUsers[key] ?? 0) + d.userCount;
      modelPlatform[key] = d.platform;
    }

    final topDeviceModels =
        (modelUsers.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)))
            .take(10)
            .map((e) {
              return DeviceModelStatisticsEntry(
                deviceModel: e.key.split(':').last,
                platform: modelPlatform[e.key]!,
                userCount: e.value,
                percentage: totalUsers > 0
                    ? _round2(e.value / totalUsers * 100)
                    : 0.0,
              );
            })
            .toList();

    return PlatformStatisticsResponse(
      platforms: platformEntries,
      osVersions: osVersionEntries,
      topDeviceModels: topDeviceModels,
    );
  }

  // ============================================================
  // ГЕОГРАФИЧЕСКАЯ СТАТИСТИКА
  // ============================================================

  /// Статистика по локалям.
  ///
  /// Данные из [DailyDimensionSummary] с dimensionType = 'locale'.
  Future<GeoStatisticsResponse> getGeoStatistics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final localeDimensions = await _getFilteredDimensions(
      session,
      filter,
      dimensionType: 'locale',
    );

    // Суммируем по locale (агрегация по дням + платформам)
    final Map<String, int> localeUsers = {};
    for (final d in localeDimensions) {
      localeUsers[d.dimensionValue] =
          (localeUsers[d.dimensionValue] ?? 0) + d.userCount;
    }

    final totalUsers = localeUsers.values.fold<int>(0, (s, v) => s + v);

    final localeEntries =
        (localeUsers.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value)))
            .map((e) {
              return LocaleStatisticsEntry(
                locale: e.key,
                userCount: e.value,
                percentage: totalUsers > 0
                    ? _round2(e.value / totalUsers * 100)
                    : 0.0,
              );
            })
            .toList();

    return GeoStatisticsResponse(
      locales: localeEntries,
    );
  }

  // ============================================================
  // ВРЕМЕННАЯ АНАЛИТИКА
  // ============================================================

  /// Временная аналитика.
  ///
  /// Тепловая карта активности (дата × час).
  /// Данные из [DailyDimensionSummary] с dimensionType = 'hour'.
  Future<TimeAnalyticsResponse> getTimeAnalytics(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final now = DateTime.now().toUtc();
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;

    final hourDimensions = await _getFilteredDimensions(
      session,
      filter,
      dimensionType: 'hour',
    );

    // Группируем по (date, hour)
    final Map<String, int> heatmapCounts = {};
    for (final d in hourDimensions) {
      final dateKey = _dayKey(d.date);
      final hour = int.tryParse(d.dimensionValue) ?? 0;
      final key = '$dateKey:$hour';
      heatmapCounts[key] = (heatmapCounts[key] ?? 0) + d.userCount;
    }

    final heatmap = <HeatmapEntry>[];
    var current = DateTime.utc(dateFrom.year, dateFrom.month, dateFrom.day);
    final end = DateTime.utc(dateTo.year, dateTo.month, dateTo.day);
    while (!current.isAfter(end)) {
      final dateKey = _dayKey(current);
      for (int hour = 0; hour < 24; hour++) {
        final key = '$dateKey:$hour';
        heatmap.add(
          HeatmapEntry(
            date: current,
            hour: hour,
            count: heatmapCounts[key] ?? 0,
          ),
        );
      }
      current = current.add(const Duration(days: 1));
    }

    return TimeAnalyticsResponse(
      heatmap: heatmap,
    );
  }

  // ============================================================
  // ЭКСПОРТ ДАННЫХ
  // ============================================================

  /// Полный отчёт по статистике приложения (для экспорта).
  Future<StatisticsExportData> getExportData(
    Session session, {
    required StatisticsFilter filter,
  }) async {
    final now = DateTime.now().toUtc();
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;

    final overview = await getOverview(session, filter: filter);
    final dailyUsers = await getDailyActiveUsers(session, filter: filter);
    final versions = await getVersionStatistics(session, filter: filter);
    final platforms = await getPlatformStatistics(session, filter: filter);
    final geo = await getGeoStatistics(session, filter: filter);
    final timeAnalytics = await getTimeAnalytics(session, filter: filter);

    return StatisticsExportData(
      overview: overview,
      dailyUsers: dailyUsers,
      versions: versions,
      platforms: platforms,
      geo: geo,
      timeAnalytics: timeAnalytics,
      periodFrom: dateFrom,
      periodTo: dateTo,
      generatedAt: now,
    );
  }

  // ============================================================
  // ПРИВАТНЫЕ МЕТОДЫ: ФИЛЬТРАЦИЯ И ЗАПРОСЫ
  // ============================================================

  /// Получает daily check summaries, применяя все фильтры.
  Future<List<DailyCheckSummary>> _getFilteredSummaries(
    Session session,
    StatisticsFilter filter,
  ) async {
    final now = DateTime.now().toUtc();
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;

    return await DailyCheckSummary.db.find(
      session,
      where: (t) {
        var condition =
            t.applicationId.equals(filter.applicationId) &
            (t.date >= dateFrom) &
            (t.date <= dateTo);

        if (filter.platform != null) {
          condition = condition & t.platform.equals(filter.platform);
        }
        if (filter.buildNumber != null) {
          condition = condition & t.buildNumber.equals(filter.buildNumber);
        }

        return condition;
      },
      orderBy: (t) => t.date,
    );
  }

  /// Получает daily dimension summaries для указанного dimensionType.
  Future<List<DailyDimensionSummary>> _getFilteredDimensions(
    Session session,
    StatisticsFilter filter, {
    required String dimensionType,
  }) async {
    final now = DateTime.now().toUtc();
    final dateFrom = filter.dateFrom ?? now.subtract(const Duration(days: 30));
    final dateTo = filter.dateTo ?? now;

    return await DailyDimensionSummary.db.find(
      session,
      where: (t) {
        var condition =
            t.applicationId.equals(filter.applicationId) &
            t.dimensionType.equals(dimensionType) &
            (t.date >= dateFrom) &
            (t.date <= dateTo);

        if (filter.platform != null) {
          condition = condition & t.platform.equals(filter.platform);
        }

        return condition;
      },
      orderBy: (t) => t.date,
    );
  }

  // ============================================================
  // УТИЛИТЫ
  // ============================================================

  /// Ключ дня в формате "YYYY-MM-DD".
  String _dayKey(DateTime dt) {
    final utc = dt.toUtc();
    return '${utc.year}-${utc.month.toString().padLeft(2, '0')}-${utc.day.toString().padLeft(2, '0')}';
  }

  /// Округляет double до 2 знаков после запятой.
  double _round2(double value) {
    return (value * 100).roundToDouble() / 100;
  }

  /// Нормализует название модели устройства (например, iPhone17,5 → iPhone 16e).
  String _normalizeDeviceModel(String raw, PlatformType platform) {
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return raw;
    if (platform == PlatformType.ios) {
      return _iosDeviceName(trimmed);
    }
    return trimmed;
  }

  String _iosDeviceName(String identifier) {
    final key = identifier.replaceAll(' ', '');
    final mapped = _iosDeviceMap[key];
    if (mapped != null) return mapped;
    if (key.startsWith('iPhone')) return 'iPhone ($key)';
    if (key.startsWith('iPad')) return 'iPad ($key)';
    if (key.startsWith('iPod')) return 'iPod ($key)';
    return identifier;
  }

  static const Map<String, String> _iosDeviceMap = {
    // iPhone 16 line
    'iPhone17,1': 'iPhone 16 Pro',
    'iPhone17,2': 'iPhone 16 Pro Max',
    'iPhone17,3': 'iPhone 16',
    'iPhone17,4': 'iPhone 16 Plus',
    'iPhone17,5': 'iPhone 16e',
    // iPhone 15 line
    'iPhone16,1': 'iPhone 15 Pro',
    'iPhone16,2': 'iPhone 15 Pro Max',
    'iPhone15,4': 'iPhone 15',
    'iPhone15,5': 'iPhone 15 Plus',
    // iPhone 14 line
    'iPhone15,2': 'iPhone 14 Pro',
    'iPhone15,3': 'iPhone 14 Pro Max',
    'iPhone14,7': 'iPhone 14',
    'iPhone14,8': 'iPhone 14 Plus',
    // iPhone 13 line
    'iPhone14,2': 'iPhone 13 Pro',
    'iPhone14,3': 'iPhone 13 Pro Max',
    'iPhone14,5': 'iPhone 13',
    'iPhone14,4': 'iPhone 13 mini',
    // iPhone 12 line
    'iPhone13,1': 'iPhone 12 mini',
    'iPhone13,2': 'iPhone 12',
    'iPhone13,3': 'iPhone 12 Pro',
    'iPhone13,4': 'iPhone 12 Pro Max',
    // iPhone 11 line
    'iPhone12,1': 'iPhone 11',
    'iPhone12,3': 'iPhone 11 Pro',
    'iPhone12,5': 'iPhone 11 Pro Max',
    // iPhone SE
    'iPhone14,6': 'iPhone SE (3rd gen)',
    'iPhone12,8': 'iPhone SE (2nd gen)',
  };
}
