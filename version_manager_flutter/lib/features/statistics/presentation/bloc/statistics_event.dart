part of 'statistics_bloc.dart';

@freezed
sealed class StatisticsEvent with _$StatisticsEvent {
  /// Загрузить всю статистику для приложения.
  const factory StatisticsEvent.loadAll({
    required UuidValue applicationId,
    DateTime? dateFrom,
    DateTime? dateTo,
    PlatformType? platform,
  }) = _LoadAll;

  /// Обновить фильтр периода.
  const factory StatisticsEvent.updateFilter({
    DateTime? dateFrom,
    DateTime? dateTo,
    PlatformType? platform,
  }) = _UpdateFilter;
}
