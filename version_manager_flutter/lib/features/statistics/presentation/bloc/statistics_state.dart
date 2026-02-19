part of 'statistics_bloc.dart';

@freezed
sealed class StatisticsState with _$StatisticsState {
  const factory StatisticsState.initial() = StatisticsInitial;

  const factory StatisticsState.loading() = StatisticsLoading;

  const factory StatisticsState.loaded({
    required StatisticsOverviewResponse overview,
    required DailyActiveUsersResponse dailyUsers,
    required VersionStatisticsResponse versions,
    required PlatformStatisticsResponse platforms,
    required GeoStatisticsResponse geo,
    required TimeAnalyticsResponse timeAnalytics,
    required StatisticsFilter filter,
  }) = StatisticsLoaded;

  const factory StatisticsState.error({
    required String message,
  }) = StatisticsError;
}
