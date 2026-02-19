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
import '../enums/platform_type.dart' as _i2;

/// Статистика по версии ОС.
abstract class OsVersionStatisticsEntry implements _i1.SerializableModel {
  OsVersionStatisticsEntry._({
    required this.platform,
    required this.osVersion,
    required this.userCount,
    required this.percentage,
  });

  factory OsVersionStatisticsEntry({
    required _i2.PlatformType platform,
    required String osVersion,
    required int userCount,
    required double percentage,
  }) = _OsVersionStatisticsEntryImpl;

  factory OsVersionStatisticsEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return OsVersionStatisticsEntry(
      platform: _i2.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      osVersion: jsonSerialization['osVersion'] as String,
      userCount: jsonSerialization['userCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  /// Платформа
  _i2.PlatformType platform;

  /// Версия ОС
  String osVersion;

  /// Количество уникальных пользователей
  int userCount;

  /// Процент от общего числа
  double percentage;

  /// Returns a shallow copy of this [OsVersionStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  OsVersionStatisticsEntry copyWith({
    _i2.PlatformType? platform,
    String? osVersion,
    int? userCount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'OsVersionStatisticsEntry',
      'platform': platform.toJson(),
      'osVersion': osVersion,
      'userCount': userCount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _OsVersionStatisticsEntryImpl extends OsVersionStatisticsEntry {
  _OsVersionStatisticsEntryImpl({
    required _i2.PlatformType platform,
    required String osVersion,
    required int userCount,
    required double percentage,
  }) : super._(
         platform: platform,
         osVersion: osVersion,
         userCount: userCount,
         percentage: percentage,
       );

  /// Returns a shallow copy of this [OsVersionStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  OsVersionStatisticsEntry copyWith({
    _i2.PlatformType? platform,
    String? osVersion,
    int? userCount,
    double? percentage,
  }) {
    return OsVersionStatisticsEntry(
      platform: platform ?? this.platform,
      osVersion: osVersion ?? this.osVersion,
      userCount: userCount ?? this.userCount,
      percentage: percentage ?? this.percentage,
    );
  }
}
