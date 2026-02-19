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
import '../enums/platform_type.dart' as _i2;

/// Статистика по одной платформе.
abstract class PlatformStatisticsEntry
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PlatformStatisticsEntry._({
    required this.platform,
    required this.userCount,
    required this.percentage,
  });

  factory PlatformStatisticsEntry({
    required _i2.PlatformType platform,
    required int userCount,
    required double percentage,
  }) = _PlatformStatisticsEntryImpl;

  factory PlatformStatisticsEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlatformStatisticsEntry(
      platform: _i2.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      userCount: jsonSerialization['userCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  /// Платформа
  _i2.PlatformType platform;

  /// Количество уникальных пользователей
  int userCount;

  /// Процент от общего числа
  double percentage;

  /// Returns a shallow copy of this [PlatformStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlatformStatisticsEntry copyWith({
    _i2.PlatformType? platform,
    int? userCount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlatformStatisticsEntry',
      'platform': platform.toJson(),
      'userCount': userCount,
      'percentage': percentage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlatformStatisticsEntry',
      'platform': platform.toJson(),
      'userCount': userCount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PlatformStatisticsEntryImpl extends PlatformStatisticsEntry {
  _PlatformStatisticsEntryImpl({
    required _i2.PlatformType platform,
    required int userCount,
    required double percentage,
  }) : super._(
         platform: platform,
         userCount: userCount,
         percentage: percentage,
       );

  /// Returns a shallow copy of this [PlatformStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlatformStatisticsEntry copyWith({
    _i2.PlatformType? platform,
    int? userCount,
    double? percentage,
  }) {
    return PlatformStatisticsEntry(
      platform: platform ?? this.platform,
      userCount: userCount ?? this.userCount,
      percentage: percentage ?? this.percentage,
    );
  }
}
