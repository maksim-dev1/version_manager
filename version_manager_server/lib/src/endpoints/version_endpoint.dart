import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

class VersionEndpoint extends Endpoint {
  /// Добавление новой версии приложения.
  ///
  Future<List<AppVersion>> addVersion(
    Session session, {
    required UuidValue applicationId,
    required String version,
    required int buildNumber,
    required String changelog,
    List<Platform>? platforms,
    List<StoreLinks>? storeLinks,
  }) async {
    // Определяем платформы для создания
    List<Platform> targetPlatforms;
    if (platforms == null || platforms.isEmpty) {
      targetPlatforms = [Platform.android, Platform.ios];
    } else {
      targetPlatforms = platforms.where((p) => p != Platform.unknown).toList();
    }

    // Находим существующие версии с таким же номером версии и сборки
    final existingVersions = await AppVersion.db.find(
      session,
      where: (t) =>
          t.applicationId.equals(applicationId) &
          t.version.equals(version) &
          t.buildNumber.equals(buildNumber),
    );

    // Определяем платформы, на которых уже есть эта версия
    final existingPlatforms = existingVersions.map((v) => v.platform).toSet();

    // Фильтруем платформы - оставляем только те, на которых версии еще нет
    final availablePlatforms = targetPlatforms
        .where((p) => !existingPlatforms.contains(p))
        .toList();

    if (availablePlatforms.isEmpty) {
      final platformNames = targetPlatforms.map((p) => p.name).join(', ');
      throw Exception(
        'Версия $version ($buildNumber) уже существует для всех указанных платформ: $platformNames',
      );
    }

    // Создаем версии для доступных платформ
    final now = DateTime.now();
    final createdVersions = <AppVersion>[];

    for (final platform in availablePlatforms) {
      final newVersion = AppVersion(
        applicationId: applicationId,
        version: version,
        buildNumber: buildNumber,
        platform: platform,
        changelog: changelog,
        storeLinks: storeLinks ?? [],
        createdAt: now,
        updatedAt: now,
      );

      final created = await AppVersion.db.insertRow(session, newVersion);
      createdVersions.add(created);
    }

    return createdVersions;
  }

  /// Получение списка версий всех платформ с сортировкой по версии и сборке
  ///
  Future<List<AppVersion>> getAllVersions(Session session) async {
    final versions = await AppVersion.db.find(session);

    // Сортируем по версии и сборке
    versions.sort((a, b) {
      final versionCompare = _compareVersions(a.version, b.version);
      if (versionCompare != 0) {
        return -versionCompare; // Отрицательное для descending
      }
      // Если версии одинаковые, сортируем по buildNumber
      return b.buildNumber.compareTo(a.buildNumber); // Descending
    });

    return versions;
  }

  /// Сравнение семантических версий (1.0.0, 2.1.5, и т.д.)
  int _compareVersions(String version1, String version2) {
    final parts1 = version1.split('.').map(int.tryParse).toList();
    final parts2 = version2.split('.').map(int.tryParse).toList();

    final maxLength = parts1.length > parts2.length
        ? parts1.length
        : parts2.length;

    for (int i = 0; i < maxLength; i++) {
      final v1 = i < parts1.length ? (parts1[i] ?? 0) : 0;
      final v2 = i < parts2.length ? (parts2[i] ?? 0) : 0;

      if (v1 != v2) {
        return v1.compareTo(v2);
      }
    }

    return 0;
  }

  /// Получение списка версий по фильтрам с сортировкой
  Future<List<AppVersion>> getVersionsByFilters(
    Session session, {
    required UuidValue applicationId,
    Platform? platform,
  }) async {
    final versions = await AppVersion.db.find(
      session,
      where: (t) {
        var condition = t.applicationId.equals(applicationId);

        if (platform != null) {
          condition = condition & t.platform.equals(platform);
        }

        return condition;
      },
    );

    // Применяем ту же сортировку
    versions.sort((a, b) {
      final versionCompare = _compareVersions(a.version, b.version);
      if (versionCompare != 0) {
        return -versionCompare;
      }
      return b.buildNumber.compareTo(a.buildNumber);
    });

    return versions;
  }

  /// Обновление существующей версии приложения
  ///
  /// Все поля версии будут обновлены. Объект должен содержать валидный id.
  Future<AppVersion> updateVersion(
    Session session, {
    required AppVersion appVersion,
  }) async {
    final existing = await AppVersion.db.findById(
      session,
      appVersion.id!,
    );

    if (existing == null) {
      throw Exception(
        'AppVersion with id ${appVersion.id} does not exist.',
      );
    }

    // Обновляем поле updatedAt
    final versionToUpdate = appVersion.copyWith(
      updatedAt: DateTime.now(),
    );

    final updatedVersion = await AppVersion.db.updateRow(
      session,
      versionToUpdate,
    );

    return updatedVersion;
  }

  /// Блокирования/Разблокирование версии приложения
  ///
  Future<List<AppVersion>> blockUnblockVersion(
    Session session, {
    required int id,
    required bool isBlocked,
    required String reason,
  }) async {
    final existing = await AppVersion.db.findById(
      session,
      id,
    );

    if (existing == null) {
      throw Exception(
        'AppVersion with id $id does not exist.',
      );
    }

    final versionToUpdate = existing.copyWith(
      isBlocked: isBlocked,
      blockReason: reason,
      updatedAt: DateTime.now(),
    );

    await AppVersion.db.updateRow(session, versionToUpdate);

    final versions = await AppVersion.db.find(session);
    return versions;
  }

  /// Удаление версии приложения по id
  ///
  Future<List<AppVersion>> deleteVersion(
    Session session, {
    required AppVersion version,
  }) async {
    final existing = await AppVersion.db.findById(
      session,
      version.id!,
    );
    if (existing == null) {
      throw Exception(
        'AppVersion with id ${version.id} does not exist.',
      );
    }

    await AppVersion.db.deleteRow(session, version);

    final versions = await AppVersion.db.find(session);
    return versions;
  }
}
