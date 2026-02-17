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
import '../statistics/version_statistics_entry.dart' as _i2;
import '../statistics/version_adoption_timeline_entry.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

/// Полная статистика по версиям приложения.
abstract class VersionStatisticsResponse implements _i1.SerializableModel {
  VersionStatisticsResponse._({
    required this.versions,
    required this.latestVersionAdoptionRate,
    required this.checksOnBlockedVersions,
    required this.blockedVersionsPercentage,
    required this.adoptionTimeline,
  });

  factory VersionStatisticsResponse({
    required List<_i2.VersionStatisticsEntry> versions,
    required double latestVersionAdoptionRate,
    required int checksOnBlockedVersions,
    required double blockedVersionsPercentage,
    required List<_i3.VersionAdoptionTimelineEntry> adoptionTimeline,
  }) = _VersionStatisticsResponseImpl;

  factory VersionStatisticsResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VersionStatisticsResponse(
      versions: _i4.Protocol().deserialize<List<_i2.VersionStatisticsEntry>>(
        jsonSerialization['versions'],
      ),
      latestVersionAdoptionRate:
          (jsonSerialization['latestVersionAdoptionRate'] as num).toDouble(),
      checksOnBlockedVersions:
          jsonSerialization['checksOnBlockedVersions'] as int,
      blockedVersionsPercentage:
          (jsonSerialization['blockedVersionsPercentage'] as num).toDouble(),
      adoptionTimeline: _i4.Protocol()
          .deserialize<List<_i3.VersionAdoptionTimelineEntry>>(
            jsonSerialization['adoptionTimeline'],
          ),
    );
  }

  /// Распределение проверок по версиям
  List<_i2.VersionStatisticsEntry> versions;

  /// Adoption rate последней версии (% проверок на последней версии)
  double latestVersionAdoptionRate;

  /// Количество проверок на заблокированных версиях
  int checksOnBlockedVersions;

  /// Процент проверок на заблокированных версиях
  double blockedVersionsPercentage;

  /// Динамика проверок по версиям (по дням)
  List<_i3.VersionAdoptionTimelineEntry> adoptionTimeline;

  /// Returns a shallow copy of this [VersionStatisticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionStatisticsResponse copyWith({
    List<_i2.VersionStatisticsEntry>? versions,
    double? latestVersionAdoptionRate,
    int? checksOnBlockedVersions,
    double? blockedVersionsPercentage,
    List<_i3.VersionAdoptionTimelineEntry>? adoptionTimeline,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionStatisticsResponse',
      'versions': versions.toJson(valueToJson: (v) => v.toJson()),
      'latestVersionAdoptionRate': latestVersionAdoptionRate,
      'checksOnBlockedVersions': checksOnBlockedVersions,
      'blockedVersionsPercentage': blockedVersionsPercentage,
      'adoptionTimeline': adoptionTimeline.toJson(
        valueToJson: (v) => v.toJson(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VersionStatisticsResponseImpl extends VersionStatisticsResponse {
  _VersionStatisticsResponseImpl({
    required List<_i2.VersionStatisticsEntry> versions,
    required double latestVersionAdoptionRate,
    required int checksOnBlockedVersions,
    required double blockedVersionsPercentage,
    required List<_i3.VersionAdoptionTimelineEntry> adoptionTimeline,
  }) : super._(
         versions: versions,
         latestVersionAdoptionRate: latestVersionAdoptionRate,
         checksOnBlockedVersions: checksOnBlockedVersions,
         blockedVersionsPercentage: blockedVersionsPercentage,
         adoptionTimeline: adoptionTimeline,
       );

  /// Returns a shallow copy of this [VersionStatisticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionStatisticsResponse copyWith({
    List<_i2.VersionStatisticsEntry>? versions,
    double? latestVersionAdoptionRate,
    int? checksOnBlockedVersions,
    double? blockedVersionsPercentage,
    List<_i3.VersionAdoptionTimelineEntry>? adoptionTimeline,
  }) {
    return VersionStatisticsResponse(
      versions: versions ?? this.versions.map((e0) => e0.copyWith()).toList(),
      latestVersionAdoptionRate:
          latestVersionAdoptionRate ?? this.latestVersionAdoptionRate,
      checksOnBlockedVersions:
          checksOnBlockedVersions ?? this.checksOnBlockedVersions,
      blockedVersionsPercentage:
          blockedVersionsPercentage ?? this.blockedVersionsPercentage,
      adoptionTimeline:
          adoptionTimeline ??
          this.adoptionTimeline.map((e0) => e0.copyWith()).toList(),
    );
  }
}
