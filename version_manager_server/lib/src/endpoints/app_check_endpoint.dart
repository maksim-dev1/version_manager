import 'package:serverpod/serverpod.dart';
import 'package:version_manager_server/src/generated/protocol.dart';

class AppCheckEndpoint extends Endpoint {
  /// Проверка версии приложения клиента
  ///
  /// Принимает информацию о текущей версии клиента и возвращает:
  /// - Заблокирована ли эта версия
  /// - Информацию о последней доступной версии
  /// - Ссылки на магазины для обновления
  Future<AppCheckResponse> checkVersion(
    Session session, {
    required String packageName,
    required String currentVersion,
    required String currentBuildNumber,
    required Platform platform,
  }) async {
    print('=== checkVersion ENTERED ===');
    print('PackageName: $packageName');
    print('CurrentVersion: $currentVersion');
    print('BuildNumber (raw): $currentBuildNumber');
    print('Platform: $platform');

    try {
      // Конвертируем buildNumber из строки в число
      final buildNumber = int.tryParse(currentBuildNumber);
      if (buildNumber == null) {
        print('!!! Failed to parse buildNumber: $currentBuildNumber');
        throw ArgumentError('Invalid build number: $currentBuildNumber');
      }

      print('BuildNumber (parsed): $buildNumber');

      // Логируем входящий запрос
      session.log(
        'checkVersion called with: packageName="$packageName", '
        'version="$currentVersion", '
        'buildNumber=$buildNumber, '
        'platform=${platform.name}',
        level: LogLevel.info,
      );

      // Валидация входных данных
      if (packageName.trim().isEmpty) {
        session.log(
          'Validation failed: Package name is empty',
          level: LogLevel.warning,
        );
        throw ArgumentError('Package name cannot be empty');
      }

      if (currentVersion.trim().isEmpty) {
        session.log(
          'Validation failed: Current version is empty',
          level: LogLevel.warning,
        );
        throw ArgumentError('Current version cannot be empty');
      }

      if (buildNumber < 0) {
        session.log(
          'Validation failed: Build number is negative ($buildNumber)',
          level: LogLevel.warning,
        );
        throw ArgumentError('Build number must be non-negative');
      }

      session.log(
        'Validation passed, searching for application...',
        level: LogLevel.debug,
      );

      // Находим приложение по packageName
      final applications = await Application.db.find(
        session,
        where: (t) => t.packageName.equals(packageName),
      );

      session.log(
        'Found ${applications.length} applications with packageName="$packageName"',
        level: LogLevel.debug,
      );

      if (applications.isEmpty) {
        session.log(
          'Application not found for packageName="$packageName"',
          level: LogLevel.warning,
        );
        throw StateError(
          'Application with package name $packageName not found',
        );
      }

      final application = applications.first;

      session.log(
        'Application found: id=${application.id}, '
        'name="${application.appName}", '
        'isActive=${application.isActive}',
        level: LogLevel.debug,
      );

      // Проверяем активно ли приложение
      if (!application.isActive) {
        session.log(
          'Application is inactive, returning blocked response',
          level: LogLevel.info,
        );
        return AppCheckResponse(
          isBlocked: true,
          blockReason: 'Приложение более не поддерживается',
          forceUpdate: true,
        );
      }

      session.log(
        'Fetching versions for applicationId=${application.id}, platform=${platform.name}',
        level: LogLevel.debug,
      );

      // Получаем все версии для данного приложения и платформы
      final versions = await AppVersion.db.find(
        session,
        where: (t) =>
            t.applicationId.equals(application.id!) &
            t.platform.equals(platform),
      );

      session.log(
        'Found ${versions.length} versions for platform ${platform.name}',
        level: LogLevel.debug,
      );

      if (versions.isEmpty) {
        session.log(
          'No versions found for platform ${platform.name}, returning neutral response',
          level: LogLevel.info,
        );
        // Нет доступных версий для данной платформы
        return AppCheckResponse(
          isBlocked: false,
          blockReason: null,
          forceUpdate: false,
        );
      }

      // Сортируем версии по версии и buildNumber (от новых к старым)
      versions.sort((a, b) {
        final versionCompare = _compareVersions(a.version, b.version);
        if (versionCompare != 0) {
          return -versionCompare;
        }
        return b.buildNumber.compareTo(a.buildNumber);
      });

      // Последняя версия - первая в отсортированном списке
      final latestVersion = versions.first;

      session.log(
        'Latest version: ${latestVersion.version} (${latestVersion.buildNumber}), '
        'isBlocked=${latestVersion.isBlocked}, '
        'recommendedUpdate=${latestVersion.recommendedUpdate}',
        level: LogLevel.debug,
      );

      // Проверяем, заблокирована ли текущая версия клиента
      final currentVersionInfo = versions.firstWhere(
        (v) => v.version == currentVersion && v.buildNumber == buildNumber,
        orElse: () => AppVersion(
          applicationId: application.id!,
          version: currentVersion,
          buildNumber: buildNumber,
          platform: platform,
          changelog: '',
          isBlocked: false,
          storeLinks: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );

      session.log(
        'Current version info: version=${currentVersionInfo.version}, '
        'buildNumber=${currentVersionInfo.buildNumber}, '
        'isBlocked=${currentVersionInfo.isBlocked}',
        level: LogLevel.debug,
      );

      // Проверяем, есть ли более новая версия
      final hasNewerVersion =
          _compareVersions(
                latestVersion.version,
                currentVersion,
              ) >
              0 ||
          (latestVersion.version == currentVersion &&
              latestVersion.buildNumber > buildNumber);

      session.log(
        'Version comparison: hasNewerVersion=$hasNewerVersion',
        level: LogLevel.debug,
      );

      // Формируем ответ
      final response = AppCheckResponse(
        isBlocked: currentVersionInfo.isBlocked,
        blockReason: currentVersionInfo.blockReason,
        latestVersion: hasNewerVersion ? latestVersion.version : null,
        latestBuildNumber: hasNewerVersion ? latestVersion.buildNumber : null,
        forceUpdate:
            currentVersionInfo.isBlocked || latestVersion.recommendedUpdate,
        storeLinks: hasNewerVersion ? latestVersion.storeLinks : null,
        changelog: hasNewerVersion ? latestVersion.changelog : null,
      );

      session.log(
        'Returning response: isBlocked=${response.isBlocked}, '
        'forceUpdate=${response.forceUpdate}, '
        'latestVersion=${response.latestVersion}',
        level: LogLevel.info,
      );

      return response;
    } on ArgumentError catch (e, stackTrace) {
      print('!!! ArgumentError caught: $e');
      print('StackTrace: $stackTrace');
      session.log(
        'Validation error in checkVersion: $e',
        level: LogLevel.warning,
        exception: e,
        stackTrace: stackTrace,
      );
      rethrow;
    } on StateError catch (e, stackTrace) {
      print('!!! StateError caught: $e');
      print('StackTrace: $stackTrace');
      session.log(
        'State error in checkVersion: $e',
        level: LogLevel.warning,
        exception: e,
        stackTrace: stackTrace,
      );
      rethrow;
    } on TypeError catch (e, stackTrace) {
      print('!!! TypeError caught: $e');
      print('StackTrace: $stackTrace');
      session.log(
        'Type error in checkVersion: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      rethrow;
    } catch (e, stackTrace) {
      print('!!! Unexpected error caught: $e');
      print('StackTrace: $stackTrace');
      session.log(
        'Unexpected error in checkVersion: $e',
        level: LogLevel.error,
        exception: e,
        stackTrace: stackTrace,
      );
      throw Exception('Failed to check version: ${e.toString()}');
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
}
