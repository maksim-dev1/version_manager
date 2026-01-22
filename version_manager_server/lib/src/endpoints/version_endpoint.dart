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
    try {
      // Валидация входных данных
      if (version.trim().isEmpty) {
        throw ArgumentError('Version cannot be empty');
      }

      if (buildNumber < 0) {
        throw ArgumentError('Build number must be non-negative');
      }

      if (changelog.trim().isEmpty) {
        throw ArgumentError('Changelog cannot be empty');
      }

      // Определяем платформы для создания
      List<Platform> targetPlatforms;
      if (platforms == null || platforms.isEmpty) {
        targetPlatforms = [Platform.android, Platform.ios];
      } else {
        targetPlatforms = platforms
            .where((p) => p != Platform.unknown)
            .toList();
      }

      if (targetPlatforms.isEmpty) {
        throw ArgumentError('At least one valid platform must be specified');
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
        throw StateError(
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
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in addVersion: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log('State error in addVersion: $e', level: LogLevel.warning);
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in addVersion: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to add version: ${e.toString()}');
    }
  }

  /// Получение списка версий всех платформ с сортировкой по версии и сборке
  ///
  Future<List<AppVersion>> getAllVersions(Session session) async {
    try {
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
    } catch (e, stackTrace) {
      session.log(
        'Error fetching all versions: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to fetch versions: ${e.toString()}');
    }
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
    try {
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
    } catch (e, stackTrace) {
      session.log(
        'Error fetching versions by filters: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to fetch versions by filters: ${e.toString()}');
    }
  }

  /// Обновление существующей версии приложения
  ///
  /// Все поля версии будут обновлены. Объект должен содержать валидный id.
  Future<AppVersion> updateVersion(
    Session session, {
    required AppVersion appVersion,
  }) async {
    try {
      // Валидация входных данных
      if (appVersion.id == null) {
        throw ArgumentError('Version ID cannot be null');
      }

      if (appVersion.version.trim().isEmpty) {
        throw ArgumentError('Version cannot be empty');
      }

      if (appVersion.buildNumber < 0) {
        throw ArgumentError('Build number must be non-negative');
      }

      final existing = await AppVersion.db.findById(
        session,
        appVersion.id!,
      );

      if (existing == null) {
        throw StateError(
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
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in updateVersion: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log('State error in updateVersion: $e', level: LogLevel.warning);
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in updateVersion: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to update version: ${e.toString()}');
    }
  }

  /// Блокирования/Разблокирование версии приложения
  ///
  Future<List<AppVersion>> blockUnblockVersion(
    Session session, {
    required int id,
    required bool isBlocked,
    required String reason,
  }) async {
    try {
      // Валидация входных данных
      if (isBlocked && reason.trim().isEmpty) {
        throw ArgumentError(
          'Block reason cannot be empty when blocking a version',
        );
      }

      final existing = await AppVersion.db.findById(
        session,
        id,
      );

      if (existing == null) {
        throw StateError(
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
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in blockUnblockVersion: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log(
        'State error in blockUnblockVersion: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in blockUnblockVersion: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to block/unblock version: ${e.toString()}');
    }
  }

  /// Удаление версии приложения по id
  ///
  Future<List<AppVersion>> deleteVersion(
    Session session, {
    required AppVersion version,
  }) async {
    try {
      // Валидация входных данных
      if (version.id == null) {
        throw ArgumentError('Version ID cannot be null');
      }

      final existing = await AppVersion.db.findById(
        session,
        version.id!,
      );

      if (existing == null) {
        throw StateError(
          'AppVersion with id ${version.id} does not exist.',
        );
      }

      await AppVersion.db.deleteRow(session, version);

      final versions = await AppVersion.db.find(session);
      return versions;
    } on ArgumentError catch (e) {
      session.log(
        'Validation error in deleteVersion: $e',
        level: LogLevel.warning,
      );
      rethrow;
    } on StateError catch (e) {
      session.log('State error in deleteVersion: $e', level: LogLevel.warning);
      rethrow;
    } catch (e, stackTrace) {
      session.log(
        'Unexpected error in deleteVersion: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to delete version: ${e.toString()}');
    }
  }
}
