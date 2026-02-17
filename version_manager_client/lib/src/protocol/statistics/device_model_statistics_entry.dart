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

/// Статистика по модели устройства.
abstract class DeviceModelStatisticsEntry implements _i1.SerializableModel {
  DeviceModelStatisticsEntry._({
    required this.deviceModel,
    required this.platform,
    required this.checkCount,
    required this.percentage,
  });

  factory DeviceModelStatisticsEntry({
    required String deviceModel,
    required _i2.PlatformType platform,
    required int checkCount,
    required double percentage,
  }) = _DeviceModelStatisticsEntryImpl;

  factory DeviceModelStatisticsEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DeviceModelStatisticsEntry(
      deviceModel: jsonSerialization['deviceModel'] as String,
      platform: _i2.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      checkCount: jsonSerialization['checkCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  /// Модель устройства
  String deviceModel;

  /// Платформа
  _i2.PlatformType platform;

  /// Количество проверок
  int checkCount;

  /// Процент от общего числа
  double percentage;

  /// Returns a shallow copy of this [DeviceModelStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DeviceModelStatisticsEntry copyWith({
    String? deviceModel,
    _i2.PlatformType? platform,
    int? checkCount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DeviceModelStatisticsEntry',
      'deviceModel': deviceModel,
      'platform': platform.toJson(),
      'checkCount': checkCount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DeviceModelStatisticsEntryImpl extends DeviceModelStatisticsEntry {
  _DeviceModelStatisticsEntryImpl({
    required String deviceModel,
    required _i2.PlatformType platform,
    required int checkCount,
    required double percentage,
  }) : super._(
         deviceModel: deviceModel,
         platform: platform,
         checkCount: checkCount,
         percentage: percentage,
       );

  /// Returns a shallow copy of this [DeviceModelStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DeviceModelStatisticsEntry copyWith({
    String? deviceModel,
    _i2.PlatformType? platform,
    int? checkCount,
    double? percentage,
  }) {
    return DeviceModelStatisticsEntry(
      deviceModel: deviceModel ?? this.deviceModel,
      platform: platform ?? this.platform,
      checkCount: checkCount ?? this.checkCount,
      percentage: percentage ?? this.percentage,
    );
  }
}
