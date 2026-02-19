import 'package:version_manager_client/version_manager_client.dart';

/// Репозиторий для получения статистики приложений.
abstract interface class StatisticsRepository {
  /// Общая статистика приложения.
  Future<StatisticsOverviewResponse> getOverview({
    required StatisticsFilter filter,
  });

  /// Активность по дням.
  Future<DailyActiveUsersResponse> getDailyActiveUsers({
    required StatisticsFilter filter,
  });

  /// Статистика по версиям.
  Future<VersionStatisticsResponse> getVersionStatistics({
    required StatisticsFilter filter,
  });

  /// Статистика по платформам.
  Future<PlatformStatisticsResponse> getPlatformStatistics({
    required StatisticsFilter filter,
  });

  /// Статистика по локалям.
  Future<GeoStatisticsResponse> getGeoStatistics({
    required StatisticsFilter filter,
  });

  /// Временная аналитика (тепловая карта).
  Future<TimeAnalyticsResponse> getTimeAnalytics({
    required StatisticsFilter filter,
  });

  /// Полный экспорт статистики.
  Future<StatisticsExportData> getExportData({
    required StatisticsFilter filter,
  });
}
