import 'package:version_manager_client/version_manager_client.dart';

abstract interface class VersionRepository {
  /// Добавление новой версии приложения.
  Future<List<AppVersion>> addVersion({
    required UuidValue applicationId,
    required String version,
    required int buildNumber,
    required String changelog,
    List<Platform>? platforms,
    List<StoreLinks>? storeLinks,
  });

  /// Получение списка всех версий всех приложений.
  Future<List<AppVersion>> getAllVersions();

  /// Получение списка версий по фильтрам.
  Future<List<AppVersion>> getVersionsByFilters({
    required UuidValue applicationId,
    Platform? platform,
  });

  /// Обновление информации о версии приложения.
  Future<List<AppVersion>> updateVersion({
    required AppVersion appVersion,
  });

  /// Блокировка/Разблокировка версии приложения.
  Future<List<AppVersion>> blockUnblockVersion({
    required UuidValue id,
    required bool isBlocked,
    required String reason,
  });

  /// Удаление версии приложения.
  Future<List<AppVersion>> deleteVersion({
    required AppVersion version,
  });
}
