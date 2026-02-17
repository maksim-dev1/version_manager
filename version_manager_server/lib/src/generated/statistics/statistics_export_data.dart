/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../statistics/statistics_overview_response.dart' as _i2;
import '../statistics/daily_active_users_response.dart' as _i3;
import '../statistics/version_statistics_response.dart' as _i4;
import '../statistics/platform_statistics_response.dart' as _i5;
import '../statistics/geo_statistics_response.dart' as _i6;
import '../statistics/time_analytics_response.dart' as _i7;
import 'package:version_manager_server/src/generated/protocol.dart' as _i8;

/// Полный отчёт по статистике приложения (для экспорта).
abstract class StatisticsExportData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StatisticsExportData._({
    required this.overview,
    required this.dailyUsers,
    required this.versions,
    required this.platforms,
    required this.geo,
    required this.timeAnalytics,
    required this.periodFrom,
    required this.periodTo,
    required this.generatedAt,
  });

  factory StatisticsExportData({
    required _i2.StatisticsOverviewResponse overview,
    required _i3.DailyActiveUsersResponse dailyUsers,
    required _i4.VersionStatisticsResponse versions,
    required _i5.PlatformStatisticsResponse platforms,
    required _i6.GeoStatisticsResponse geo,
    required _i7.TimeAnalyticsResponse timeAnalytics,
    required DateTime periodFrom,
    required DateTime periodTo,
    required DateTime generatedAt,
  }) = _StatisticsExportDataImpl;

  factory StatisticsExportData.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StatisticsExportData(
      overview: _i8.Protocol().deserialize<_i2.StatisticsOverviewResponse>(
        jsonSerialization['overview'],
      ),
      dailyUsers: _i8.Protocol().deserialize<_i3.DailyActiveUsersResponse>(
        jsonSerialization['dailyUsers'],
      ),
      versions: _i8.Protocol().deserialize<_i4.VersionStatisticsResponse>(
        jsonSerialization['versions'],
      ),
      platforms: _i8.Protocol().deserialize<_i5.PlatformStatisticsResponse>(
        jsonSerialization['platforms'],
      ),
      geo: _i8.Protocol().deserialize<_i6.GeoStatisticsResponse>(
        jsonSerialization['geo'],
      ),
      timeAnalytics: _i8.Protocol().deserialize<_i7.TimeAnalyticsResponse>(
        jsonSerialization['timeAnalytics'],
      ),
      periodFrom: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['periodFrom'],
      ),
      periodTo: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['periodTo'],
      ),
      generatedAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['generatedAt'],
      ),
    );
  }

  /// Основные метрики
  _i2.StatisticsOverviewResponse overview;

  /// Активность по дням
  _i3.DailyActiveUsersResponse dailyUsers;

  /// Статистика по версиям
  _i4.VersionStatisticsResponse versions;

  /// Статистика по платформам
  _i5.PlatformStatisticsResponse platforms;

  /// Географическая статистика
  _i6.GeoStatisticsResponse geo;

  /// Временная аналитика
  _i7.TimeAnalyticsResponse timeAnalytics;

  /// Период отчёта
  DateTime periodFrom;

  /// Период отчёта
  DateTime periodTo;

  /// Дата генерации отчёта
  DateTime generatedAt;

  /// Returns a shallow copy of this [StatisticsExportData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StatisticsExportData copyWith({
    _i2.StatisticsOverviewResponse? overview,
    _i3.DailyActiveUsersResponse? dailyUsers,
    _i4.VersionStatisticsResponse? versions,
    _i5.PlatformStatisticsResponse? platforms,
    _i6.GeoStatisticsResponse? geo,
    _i7.TimeAnalyticsResponse? timeAnalytics,
    DateTime? periodFrom,
    DateTime? periodTo,
    DateTime? generatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StatisticsExportData',
      'overview': overview.toJson(),
      'dailyUsers': dailyUsers.toJson(),
      'versions': versions.toJson(),
      'platforms': platforms.toJson(),
      'geo': geo.toJson(),
      'timeAnalytics': timeAnalytics.toJson(),
      'periodFrom': periodFrom.toJson(),
      'periodTo': periodTo.toJson(),
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StatisticsExportData',
      'overview': overview.toJsonForProtocol(),
      'dailyUsers': dailyUsers.toJsonForProtocol(),
      'versions': versions.toJsonForProtocol(),
      'platforms': platforms.toJsonForProtocol(),
      'geo': geo.toJsonForProtocol(),
      'timeAnalytics': timeAnalytics.toJsonForProtocol(),
      'periodFrom': periodFrom.toJson(),
      'periodTo': periodTo.toJson(),
      'generatedAt': generatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _StatisticsExportDataImpl extends StatisticsExportData {
  _StatisticsExportDataImpl({
    required _i2.StatisticsOverviewResponse overview,
    required _i3.DailyActiveUsersResponse dailyUsers,
    required _i4.VersionStatisticsResponse versions,
    required _i5.PlatformStatisticsResponse platforms,
    required _i6.GeoStatisticsResponse geo,
    required _i7.TimeAnalyticsResponse timeAnalytics,
    required DateTime periodFrom,
    required DateTime periodTo,
    required DateTime generatedAt,
  }) : super._(
         overview: overview,
         dailyUsers: dailyUsers,
         versions: versions,
         platforms: platforms,
         geo: geo,
         timeAnalytics: timeAnalytics,
         periodFrom: periodFrom,
         periodTo: periodTo,
         generatedAt: generatedAt,
       );

  /// Returns a shallow copy of this [StatisticsExportData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StatisticsExportData copyWith({
    _i2.StatisticsOverviewResponse? overview,
    _i3.DailyActiveUsersResponse? dailyUsers,
    _i4.VersionStatisticsResponse? versions,
    _i5.PlatformStatisticsResponse? platforms,
    _i6.GeoStatisticsResponse? geo,
    _i7.TimeAnalyticsResponse? timeAnalytics,
    DateTime? periodFrom,
    DateTime? periodTo,
    DateTime? generatedAt,
  }) {
    return StatisticsExportData(
      overview: overview ?? this.overview.copyWith(),
      dailyUsers: dailyUsers ?? this.dailyUsers.copyWith(),
      versions: versions ?? this.versions.copyWith(),
      platforms: platforms ?? this.platforms.copyWith(),
      geo: geo ?? this.geo.copyWith(),
      timeAnalytics: timeAnalytics ?? this.timeAnalytics.copyWith(),
      periodFrom: periodFrom ?? this.periodFrom,
      periodTo: periodTo ?? this.periodTo,
      generatedAt: generatedAt ?? this.generatedAt,
    );
  }
}
