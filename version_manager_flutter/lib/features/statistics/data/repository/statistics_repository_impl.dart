import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/statistics/domain/repository/statistics_repository.dart';

/// Реализация репозитория статистики.
///
/// Использует Serverpod эндпоинт [EndpointStatistics].
class StatisticsRepositoryImpl implements StatisticsRepository {
  final EndpointStatistics _statisticsEndpoint;

  StatisticsRepositoryImpl({
    required EndpointStatistics statisticsEndpoint,
  }) : _statisticsEndpoint = statisticsEndpoint;

  @override
  Future<StatisticsOverviewResponse> getOverview({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getOverview(filter: filter);
  }

  @override
  Future<DailyActiveUsersResponse> getDailyActiveUsers({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getDailyActiveUsers(filter: filter);
  }

  @override
  Future<VersionStatisticsResponse> getVersionStatistics({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getVersionStatistics(filter: filter);
  }

  @override
  Future<PlatformStatisticsResponse> getPlatformStatistics({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getPlatformStatistics(filter: filter);
  }

  @override
  Future<GeoStatisticsResponse> getGeoStatistics({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getGeoStatistics(filter: filter);
  }

  @override
  Future<TimeAnalyticsResponse> getTimeAnalytics({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getTimeAnalytics(filter: filter);
  }

  @override
  Future<StatisticsExportData> getExportData({
    required StatisticsFilter filter,
  }) async {
    return await _statisticsEndpoint.getExportData(filter: filter);
  }
}
