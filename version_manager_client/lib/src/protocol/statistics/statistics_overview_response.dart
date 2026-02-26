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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Общая статистика приложения — основные метрики.
///
/// Содержит как уникальных пользователей (по IDFV / App Instance ID),
/// так и общее количество запросов (входов).
abstract class StatisticsOverviewResponse implements _i1.SerializableModel {
  StatisticsOverviewResponse._({
    required this.totalUsers,
    required this.dailyUsers,
    required this.weeklyUsers,
    required this.monthlyUsers,
    required this.totalUsersInPeriod,
    required this.newUsersInPeriod,
    required this.totalChecks,
    required this.dailyChecks,
    required this.weeklyChecks,
    required this.monthlyChecks,
    required this.totalChecksInPeriod,
    required this.blockedVersionsCount,
    required this.activeVersionsCount,
    this.avgProcessingTimeMs,
  });

  factory StatisticsOverviewResponse({
    required int totalUsers,
    required int dailyUsers,
    required int weeklyUsers,
    required int monthlyUsers,
    required int totalUsersInPeriod,
    required int newUsersInPeriod,
    required int totalChecks,
    required int dailyChecks,
    required int weeklyChecks,
    required int monthlyChecks,
    required int totalChecksInPeriod,
    required int blockedVersionsCount,
    required int activeVersionsCount,
    int? avgProcessingTimeMs,
  }) = _StatisticsOverviewResponseImpl;

  factory StatisticsOverviewResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StatisticsOverviewResponse(
      totalUsers: jsonSerialization['totalUsers'] as int,
      dailyUsers: jsonSerialization['dailyUsers'] as int,
      weeklyUsers: jsonSerialization['weeklyUsers'] as int,
      monthlyUsers: jsonSerialization['monthlyUsers'] as int,
      totalUsersInPeriod: jsonSerialization['totalUsersInPeriod'] as int,
      newUsersInPeriod: jsonSerialization['newUsersInPeriod'] as int,
      totalChecks: jsonSerialization['totalChecks'] as int,
      dailyChecks: jsonSerialization['dailyChecks'] as int,
      weeklyChecks: jsonSerialization['weeklyChecks'] as int,
      monthlyChecks: jsonSerialization['monthlyChecks'] as int,
      totalChecksInPeriod: jsonSerialization['totalChecksInPeriod'] as int,
      blockedVersionsCount: jsonSerialization['blockedVersionsCount'] as int,
      activeVersionsCount: jsonSerialization['activeVersionsCount'] as int,
      avgProcessingTimeMs: jsonSerialization['avgProcessingTimeMs'] as int?,
    );
  }

  /// ─── Уникальные пользователи ───
  /// Уникальных пользователей за всё время
  int totalUsers;

  /// Уникальных пользователей за последние 24 часа (DAU)
  int dailyUsers;

  /// Уникальных пользователей за последние 7 дней (WAU)
  int weeklyUsers;

  /// Уникальных пользователей за последние 30 дней (MAU)
  int monthlyUsers;

  /// Уникальных пользователей за выбранный период
  int totalUsersInPeriod;

  /// Новых пользователей за выбранный период
  int newUsersInPeriod;

  /// ─── Общее количество запросов (входов) ───
  /// Всего запросов за всё время
  int totalChecks;

  /// Запросов за последние 24 часа
  int dailyChecks;

  /// Запросов за последние 7 дней
  int weeklyChecks;

  /// Запросов за последние 30 дней
  int monthlyChecks;

  /// Запросов за выбранный период
  int totalChecksInPeriod;

  /// ─── Прочее ───
  /// Количество заблокированных версий
  int blockedVersionsCount;

  /// Количество активных версий
  int activeVersionsCount;

  /// Среднее время обработки запроса (мс)
  int? avgProcessingTimeMs;

  /// Returns a shallow copy of this [StatisticsOverviewResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StatisticsOverviewResponse copyWith({
    int? totalUsers,
    int? dailyUsers,
    int? weeklyUsers,
    int? monthlyUsers,
    int? totalUsersInPeriod,
    int? newUsersInPeriod,
    int? totalChecks,
    int? dailyChecks,
    int? weeklyChecks,
    int? monthlyChecks,
    int? totalChecksInPeriod,
    int? blockedVersionsCount,
    int? activeVersionsCount,
    int? avgProcessingTimeMs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StatisticsOverviewResponse',
      'totalUsers': totalUsers,
      'dailyUsers': dailyUsers,
      'weeklyUsers': weeklyUsers,
      'monthlyUsers': monthlyUsers,
      'totalUsersInPeriod': totalUsersInPeriod,
      'newUsersInPeriod': newUsersInPeriod,
      'totalChecks': totalChecks,
      'dailyChecks': dailyChecks,
      'weeklyChecks': weeklyChecks,
      'monthlyChecks': monthlyChecks,
      'totalChecksInPeriod': totalChecksInPeriod,
      'blockedVersionsCount': blockedVersionsCount,
      'activeVersionsCount': activeVersionsCount,
      if (avgProcessingTimeMs != null)
        'avgProcessingTimeMs': avgProcessingTimeMs,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StatisticsOverviewResponseImpl extends StatisticsOverviewResponse {
  _StatisticsOverviewResponseImpl({
    required int totalUsers,
    required int dailyUsers,
    required int weeklyUsers,
    required int monthlyUsers,
    required int totalUsersInPeriod,
    required int newUsersInPeriod,
    required int totalChecks,
    required int dailyChecks,
    required int weeklyChecks,
    required int monthlyChecks,
    required int totalChecksInPeriod,
    required int blockedVersionsCount,
    required int activeVersionsCount,
    int? avgProcessingTimeMs,
  }) : super._(
         totalUsers: totalUsers,
         dailyUsers: dailyUsers,
         weeklyUsers: weeklyUsers,
         monthlyUsers: monthlyUsers,
         totalUsersInPeriod: totalUsersInPeriod,
         newUsersInPeriod: newUsersInPeriod,
         totalChecks: totalChecks,
         dailyChecks: dailyChecks,
         weeklyChecks: weeklyChecks,
         monthlyChecks: monthlyChecks,
         totalChecksInPeriod: totalChecksInPeriod,
         blockedVersionsCount: blockedVersionsCount,
         activeVersionsCount: activeVersionsCount,
         avgProcessingTimeMs: avgProcessingTimeMs,
       );

  /// Returns a shallow copy of this [StatisticsOverviewResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StatisticsOverviewResponse copyWith({
    int? totalUsers,
    int? dailyUsers,
    int? weeklyUsers,
    int? monthlyUsers,
    int? totalUsersInPeriod,
    int? newUsersInPeriod,
    int? totalChecks,
    int? dailyChecks,
    int? weeklyChecks,
    int? monthlyChecks,
    int? totalChecksInPeriod,
    int? blockedVersionsCount,
    int? activeVersionsCount,
    Object? avgProcessingTimeMs = _Undefined,
  }) {
    return StatisticsOverviewResponse(
      totalUsers: totalUsers ?? this.totalUsers,
      dailyUsers: dailyUsers ?? this.dailyUsers,
      weeklyUsers: weeklyUsers ?? this.weeklyUsers,
      monthlyUsers: monthlyUsers ?? this.monthlyUsers,
      totalUsersInPeriod: totalUsersInPeriod ?? this.totalUsersInPeriod,
      newUsersInPeriod: newUsersInPeriod ?? this.newUsersInPeriod,
      totalChecks: totalChecks ?? this.totalChecks,
      dailyChecks: dailyChecks ?? this.dailyChecks,
      weeklyChecks: weeklyChecks ?? this.weeklyChecks,
      monthlyChecks: monthlyChecks ?? this.monthlyChecks,
      totalChecksInPeriod: totalChecksInPeriod ?? this.totalChecksInPeriod,
      blockedVersionsCount: blockedVersionsCount ?? this.blockedVersionsCount,
      activeVersionsCount: activeVersionsCount ?? this.activeVersionsCount,
      avgProcessingTimeMs: avgProcessingTimeMs is int?
          ? avgProcessingTimeMs
          : this.avgProcessingTimeMs,
    );
  }
}
