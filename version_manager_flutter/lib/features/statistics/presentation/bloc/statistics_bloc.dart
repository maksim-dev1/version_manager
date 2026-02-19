import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:version_manager_client/version_manager_client.dart';
import 'package:version_manager_flutter/features/statistics/domain/repository/statistics_repository.dart';

part 'statistics_bloc.freezed.dart';
part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  final StatisticsRepository _statisticsRepository;
  UuidValue? _applicationId;

  StatisticsBloc({
    required StatisticsRepository statisticsRepository,
  }) : _statisticsRepository = statisticsRepository,
       super(const StatisticsState.initial()) {
    on<StatisticsEvent>(
      (event, emit) => switch (event) {
        _LoadAll(
          :final applicationId,
          :final dateFrom,
          :final dateTo,
          :final platform,
        ) =>
          _onLoadAll(
            applicationId: applicationId,
            dateFrom: dateFrom,
            dateTo: dateTo,
            platform: platform,
            emit: emit,
          ),
        _UpdateFilter(:final dateFrom, :final dateTo, :final platform) =>
          _onUpdateFilter(
            dateFrom: dateFrom,
            dateTo: dateTo,
            platform: platform,
            emit: emit,
          ),
      },
    );
  }

  Future<void> _onLoadAll({
    required UuidValue applicationId,
    DateTime? dateFrom,
    DateTime? dateTo,
    PlatformType? platform,
    required Emitter<StatisticsState> emit,
  }) async {
    _applicationId = applicationId;

    if (state is! StatisticsLoaded) {
      emit(const StatisticsState.loading());
    }

    try {
      final filter = StatisticsFilter(
        applicationId: applicationId,
        dateFrom: dateFrom ?? DateTime.now().subtract(const Duration(days: 30)),
        dateTo: dateTo ?? DateTime.now(),
        platform: platform,
      );

      final results = await Future.wait([
        _statisticsRepository.getOverview(filter: filter),
        _statisticsRepository.getDailyActiveUsers(filter: filter),
        _statisticsRepository.getVersionStatistics(filter: filter),
        _statisticsRepository.getPlatformStatistics(filter: filter),
        _statisticsRepository.getGeoStatistics(filter: filter),
        _statisticsRepository.getTimeAnalytics(filter: filter),
      ]);

      emit(
        StatisticsState.loaded(
          overview: results[0] as StatisticsOverviewResponse,
          dailyUsers: results[1] as DailyActiveUsersResponse,
          versions: results[2] as VersionStatisticsResponse,
          platforms: results[3] as PlatformStatisticsResponse,
          geo: results[4] as GeoStatisticsResponse,
          timeAnalytics: results[5] as TimeAnalyticsResponse,
          filter: filter,
        ),
      );
    } catch (e) {
      emit(StatisticsState.error(message: e.toString()));
    }
  }

  Future<void> _onUpdateFilter({
    DateTime? dateFrom,
    DateTime? dateTo,
    PlatformType? platform,
    required Emitter<StatisticsState> emit,
  }) async {
    if (_applicationId == null) return;

    await _onLoadAll(
      applicationId: _applicationId!,
      dateFrom: dateFrom,
      dateTo: dateTo,
      platform: platform,
      emit: emit,
    );
  }
}
