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
import '../statistics/platform_statistics_entry.dart' as _i2;
import '../statistics/os_version_statistics_entry.dart' as _i3;
import '../statistics/device_model_statistics_entry.dart' as _i4;
import 'package:version_manager_server/src/generated/protocol.dart' as _i5;

/// Полная статистика по платформам.
abstract class PlatformStatisticsResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PlatformStatisticsResponse._({
    required this.platforms,
    required this.osVersions,
    required this.topDeviceModels,
  });

  factory PlatformStatisticsResponse({
    required List<_i2.PlatformStatisticsEntry> platforms,
    required List<_i3.OsVersionStatisticsEntry> osVersions,
    required List<_i4.DeviceModelStatisticsEntry> topDeviceModels,
  }) = _PlatformStatisticsResponseImpl;

  factory PlatformStatisticsResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return PlatformStatisticsResponse(
      platforms: _i5.Protocol().deserialize<List<_i2.PlatformStatisticsEntry>>(
        jsonSerialization['platforms'],
      ),
      osVersions: _i5.Protocol()
          .deserialize<List<_i3.OsVersionStatisticsEntry>>(
            jsonSerialization['osVersions'],
          ),
      topDeviceModels: _i5.Protocol()
          .deserialize<List<_i4.DeviceModelStatisticsEntry>>(
            jsonSerialization['topDeviceModels'],
          ),
    );
  }

  /// Распределение по платформам
  List<_i2.PlatformStatisticsEntry> platforms;

  /// Распределение по версиям ОС
  List<_i3.OsVersionStatisticsEntry> osVersions;

  /// Топ моделей устройств
  List<_i4.DeviceModelStatisticsEntry> topDeviceModels;

  /// Returns a shallow copy of this [PlatformStatisticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PlatformStatisticsResponse copyWith({
    List<_i2.PlatformStatisticsEntry>? platforms,
    List<_i3.OsVersionStatisticsEntry>? osVersions,
    List<_i4.DeviceModelStatisticsEntry>? topDeviceModels,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'PlatformStatisticsResponse',
      'platforms': platforms.toJson(valueToJson: (v) => v.toJson()),
      'osVersions': osVersions.toJson(valueToJson: (v) => v.toJson()),
      'topDeviceModels': topDeviceModels.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'PlatformStatisticsResponse',
      'platforms': platforms.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'osVersions': osVersions.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'topDeviceModels': topDeviceModels.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PlatformStatisticsResponseImpl extends PlatformStatisticsResponse {
  _PlatformStatisticsResponseImpl({
    required List<_i2.PlatformStatisticsEntry> platforms,
    required List<_i3.OsVersionStatisticsEntry> osVersions,
    required List<_i4.DeviceModelStatisticsEntry> topDeviceModels,
  }) : super._(
         platforms: platforms,
         osVersions: osVersions,
         topDeviceModels: topDeviceModels,
       );

  /// Returns a shallow copy of this [PlatformStatisticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PlatformStatisticsResponse copyWith({
    List<_i2.PlatformStatisticsEntry>? platforms,
    List<_i3.OsVersionStatisticsEntry>? osVersions,
    List<_i4.DeviceModelStatisticsEntry>? topDeviceModels,
  }) {
    return PlatformStatisticsResponse(
      platforms:
          platforms ?? this.platforms.map((e0) => e0.copyWith()).toList(),
      osVersions:
          osVersions ?? this.osVersions.map((e0) => e0.copyWith()).toList(),
      topDeviceModels:
          topDeviceModels ??
          this.topDeviceModels.map((e0) => e0.copyWith()).toList(),
    );
  }
}
