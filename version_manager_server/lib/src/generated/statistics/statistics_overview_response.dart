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

/// Общая статистика приложения — основные метрики.
///
/// Включает как количество запросов (checks), так и уникальных
/// пользователей (по анонимному device fingerprint).
abstract class StatisticsOverviewResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StatisticsOverviewResponse._({
    required this.totalChecks,
    required this.dailyChecks,
    required this.weeklyChecks,
    required this.monthlyChecks,
    required this.totalChecksInPeriod,
    required this.totalUniqueUsers,
    required this.dailyActiveUsers,
    required this.weeklyActiveUsers,
    required this.monthlyActiveUsers,
    required this.newUsersInPeriod,
    required this.blockedVersionsCount,
    required this.activeVersionsCount,
    this.avgProcessingTimeMs,
  });

  factory StatisticsOverviewResponse({
    required int totalChecks,
    required int dailyChecks,
    required int weeklyChecks,
    required int monthlyChecks,
    required int totalChecksInPeriod,
    required int totalUniqueUsers,
    required int dailyActiveUsers,
    required int weeklyActiveUsers,
    required int monthlyActiveUsers,
    required int newUsersInPeriod,
    required int blockedVersionsCount,
    required int activeVersionsCount,
    int? avgProcessingTimeMs,
  }) = _StatisticsOverviewResponseImpl;

  factory StatisticsOverviewResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return StatisticsOverviewResponse(
      totalChecks: jsonSerialization['totalChecks'] as int,
      dailyChecks: jsonSerialization['dailyChecks'] as int,
      weeklyChecks: jsonSerialization['weeklyChecks'] as int,
      monthlyChecks: jsonSerialization['monthlyChecks'] as int,
      totalChecksInPeriod: jsonSerialization['totalChecksInPeriod'] as int,
      totalUniqueUsers: jsonSerialization['totalUniqueUsers'] as int,
      dailyActiveUsers: jsonSerialization['dailyActiveUsers'] as int,
      weeklyActiveUsers: jsonSerialization['weeklyActiveUsers'] as int,
      monthlyActiveUsers: jsonSerialization['monthlyActiveUsers'] as int,
      newUsersInPeriod: jsonSerialization['newUsersInPeriod'] as int,
      blockedVersionsCount: jsonSerialization['blockedVersionsCount'] as int,
      activeVersionsCount: jsonSerialization['activeVersionsCount'] as int,
      avgProcessingTimeMs: jsonSerialization['avgProcessingTimeMs'] as int?,
    );
  }

  /// Общее количество проверок за всё время
  int totalChecks;

  /// Проверки за последние 24 часа
  int dailyChecks;

  /// Проверки за последние 7 дней
  int weeklyChecks;

  /// Проверки за последние 30 дней
  int monthlyChecks;

  /// Общее количество проверок за выбранный период
  int totalChecksInPeriod;

  /// Уникальных пользователей за всё время (по fingerprint)
  int totalUniqueUsers;

  /// Уникальных пользователей за последние 24 часа (DAU)
  int dailyActiveUsers;

  /// Уникальных пользователей за последние 7 дней (WAU)
  int weeklyActiveUsers;

  /// Уникальных пользователей за последние 30 дней (MAU)
  int monthlyActiveUsers;

  /// Новых пользователей за выбранный период
  int newUsersInPeriod;

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
    int? totalChecks,
    int? dailyChecks,
    int? weeklyChecks,
    int? monthlyChecks,
    int? totalChecksInPeriod,
    int? totalUniqueUsers,
    int? dailyActiveUsers,
    int? weeklyActiveUsers,
    int? monthlyActiveUsers,
    int? newUsersInPeriod,
    int? blockedVersionsCount,
    int? activeVersionsCount,
    int? avgProcessingTimeMs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StatisticsOverviewResponse',
      'totalChecks': totalChecks,
      'dailyChecks': dailyChecks,
      'weeklyChecks': weeklyChecks,
      'monthlyChecks': monthlyChecks,
      'totalChecksInPeriod': totalChecksInPeriod,
      'totalUniqueUsers': totalUniqueUsers,
      'dailyActiveUsers': dailyActiveUsers,
      'weeklyActiveUsers': weeklyActiveUsers,
      'monthlyActiveUsers': monthlyActiveUsers,
      'newUsersInPeriod': newUsersInPeriod,
      'blockedVersionsCount': blockedVersionsCount,
      'activeVersionsCount': activeVersionsCount,
      if (avgProcessingTimeMs != null)
        'avgProcessingTimeMs': avgProcessingTimeMs,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StatisticsOverviewResponse',
      'totalChecks': totalChecks,
      'dailyChecks': dailyChecks,
      'weeklyChecks': weeklyChecks,
      'monthlyChecks': monthlyChecks,
      'totalChecksInPeriod': totalChecksInPeriod,
      'totalUniqueUsers': totalUniqueUsers,
      'dailyActiveUsers': dailyActiveUsers,
      'weeklyActiveUsers': weeklyActiveUsers,
      'monthlyActiveUsers': monthlyActiveUsers,
      'newUsersInPeriod': newUsersInPeriod,
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
    required int totalChecks,
    required int dailyChecks,
    required int weeklyChecks,
    required int monthlyChecks,
    required int totalChecksInPeriod,
    required int totalUniqueUsers,
    required int dailyActiveUsers,
    required int weeklyActiveUsers,
    required int monthlyActiveUsers,
    required int newUsersInPeriod,
    required int blockedVersionsCount,
    required int activeVersionsCount,
    int? avgProcessingTimeMs,
  }) : super._(
         totalChecks: totalChecks,
         dailyChecks: dailyChecks,
         weeklyChecks: weeklyChecks,
         monthlyChecks: monthlyChecks,
         totalChecksInPeriod: totalChecksInPeriod,
         totalUniqueUsers: totalUniqueUsers,
         dailyActiveUsers: dailyActiveUsers,
         weeklyActiveUsers: weeklyActiveUsers,
         monthlyActiveUsers: monthlyActiveUsers,
         newUsersInPeriod: newUsersInPeriod,
         blockedVersionsCount: blockedVersionsCount,
         activeVersionsCount: activeVersionsCount,
         avgProcessingTimeMs: avgProcessingTimeMs,
       );

  /// Returns a shallow copy of this [StatisticsOverviewResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StatisticsOverviewResponse copyWith({
    int? totalChecks,
    int? dailyChecks,
    int? weeklyChecks,
    int? monthlyChecks,
    int? totalChecksInPeriod,
    int? totalUniqueUsers,
    int? dailyActiveUsers,
    int? weeklyActiveUsers,
    int? monthlyActiveUsers,
    int? newUsersInPeriod,
    int? blockedVersionsCount,
    int? activeVersionsCount,
    Object? avgProcessingTimeMs = _Undefined,
  }) {
    return StatisticsOverviewResponse(
      totalChecks: totalChecks ?? this.totalChecks,
      dailyChecks: dailyChecks ?? this.dailyChecks,
      weeklyChecks: weeklyChecks ?? this.weeklyChecks,
      monthlyChecks: monthlyChecks ?? this.monthlyChecks,
      totalChecksInPeriod: totalChecksInPeriod ?? this.totalChecksInPeriod,
      totalUniqueUsers: totalUniqueUsers ?? this.totalUniqueUsers,
      dailyActiveUsers: dailyActiveUsers ?? this.dailyActiveUsers,
      weeklyActiveUsers: weeklyActiveUsers ?? this.weeklyActiveUsers,
      monthlyActiveUsers: monthlyActiveUsers ?? this.monthlyActiveUsers,
      newUsersInPeriod: newUsersInPeriod ?? this.newUsersInPeriod,
      blockedVersionsCount: blockedVersionsCount ?? this.blockedVersionsCount,
      activeVersionsCount: activeVersionsCount ?? this.activeVersionsCount,
      avgProcessingTimeMs: avgProcessingTimeMs is int?
          ? avgProcessingTimeMs
          : this.avgProcessingTimeMs,
    );
  }
}
