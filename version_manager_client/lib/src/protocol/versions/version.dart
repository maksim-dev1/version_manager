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
import '../apps/application.dart' as _i2;
import '../versions/version.dart' as _i3;
import '../enums/recommendation_frequency_type.dart' as _i4;
import '../logs/version_check_log.dart' as _i5;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i6;

/// Версия приложения
abstract class Version implements _i1.SerializableModel {
  Version._({
    this.id,
    required this.applicationId,
    this.application,
    required this.versionNumber,
    required this.buildNumber,
    required this.changelog,
    bool? isBlocked,
    this.blockReason,
    this.recommendedVersionId,
    this.recommendedVersion,
    this.recommendingVersions,
    this.recommendationFrequency,
    this.recommendationEveryNthLaunch,
    this.recommendationPeriodHours,
    this.checkLogs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : isBlocked = isBlocked ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Version({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    _i3.Version? recommendedVersion,
    List<_i3.Version>? recommendingVersions,
    _i4.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    List<_i5.VersionCheckLog>? checkLogs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VersionImpl;

  factory Version.fromJson(Map<String, dynamic> jsonSerialization) {
    return Version(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      application: jsonSerialization['application'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      changelog: jsonSerialization['changelog'] as String,
      isBlocked: jsonSerialization['isBlocked'] as bool?,
      blockReason: jsonSerialization['blockReason'] as String?,
      recommendedVersionId: jsonSerialization['recommendedVersionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['recommendedVersionId'],
            ),
      recommendedVersion: jsonSerialization['recommendedVersion'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Version>(
              jsonSerialization['recommendedVersion'],
            ),
      recommendingVersions: jsonSerialization['recommendingVersions'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i3.Version>>(
              jsonSerialization['recommendingVersions'],
            ),
      recommendationFrequency:
          jsonSerialization['recommendationFrequency'] == null
          ? null
          : _i4.RecommendationFrequencyType.fromJson(
              (jsonSerialization['recommendationFrequency'] as String),
            ),
      recommendationEveryNthLaunch:
          jsonSerialization['recommendationEveryNthLaunch'] as int?,
      recommendationPeriodHours:
          jsonSerialization['recommendationPeriodHours'] as int?,
      checkLogs: jsonSerialization['checkLogs'] == null
          ? null
          : _i6.Protocol().deserialize<List<_i5.VersionCheckLog>>(
              jsonSerialization['checkLogs'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  _i2.Application? application;

  String versionNumber;

  int buildNumber;

  String changelog;

  bool isBlocked;

  String? blockReason;

  _i1.UuidValue? recommendedVersionId;

  _i3.Version? recommendedVersion;

  List<_i3.Version>? recommendingVersions;

  /// Настройки частоты показа рекомендации обновления
  _i4.RecommendationFrequencyType? recommendationFrequency;

  /// Интервал для типа "everyNthLaunch" (от 2 до 50)
  int? recommendationEveryNthLaunch;

  /// Интервал для типа "oncePer" в часах
  int? recommendationPeriodHours;

  List<_i5.VersionCheckLog>? checkLogs;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Version]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Version copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    _i3.Version? recommendedVersion,
    List<_i3.Version>? recommendingVersions,
    _i4.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    List<_i5.VersionCheckLog>? checkLogs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Version',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (recommendedVersionId != null)
        'recommendedVersionId': recommendedVersionId?.toJson(),
      if (recommendedVersion != null)
        'recommendedVersion': recommendedVersion?.toJson(),
      if (recommendingVersions != null)
        'recommendingVersions': recommendingVersions?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (recommendationFrequency != null)
        'recommendationFrequency': recommendationFrequency?.toJson(),
      if (recommendationEveryNthLaunch != null)
        'recommendationEveryNthLaunch': recommendationEveryNthLaunch,
      if (recommendationPeriodHours != null)
        'recommendationPeriodHours': recommendationPeriodHours,
      if (checkLogs != null)
        'checkLogs': checkLogs?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VersionImpl extends Version {
  _VersionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    _i3.Version? recommendedVersion,
    List<_i3.Version>? recommendingVersions,
    _i4.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    List<_i5.VersionCheckLog>? checkLogs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         changelog: changelog,
         isBlocked: isBlocked,
         blockReason: blockReason,
         recommendedVersionId: recommendedVersionId,
         recommendedVersion: recommendedVersion,
         recommendingVersions: recommendingVersions,
         recommendationFrequency: recommendationFrequency,
         recommendationEveryNthLaunch: recommendationEveryNthLaunch,
         recommendationPeriodHours: recommendationPeriodHours,
         checkLogs: checkLogs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Version]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Version copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    Object? blockReason = _Undefined,
    Object? recommendedVersionId = _Undefined,
    Object? recommendedVersion = _Undefined,
    Object? recommendingVersions = _Undefined,
    Object? recommendationFrequency = _Undefined,
    Object? recommendationEveryNthLaunch = _Undefined,
    Object? recommendationPeriodHours = _Undefined,
    Object? checkLogs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Version(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      changelog: changelog ?? this.changelog,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      recommendedVersionId: recommendedVersionId is _i1.UuidValue?
          ? recommendedVersionId
          : this.recommendedVersionId,
      recommendedVersion: recommendedVersion is _i3.Version?
          ? recommendedVersion
          : this.recommendedVersion?.copyWith(),
      recommendingVersions: recommendingVersions is List<_i3.Version>?
          ? recommendingVersions
          : this.recommendingVersions?.map((e0) => e0.copyWith()).toList(),
      recommendationFrequency:
          recommendationFrequency is _i4.RecommendationFrequencyType?
          ? recommendationFrequency
          : this.recommendationFrequency,
      recommendationEveryNthLaunch: recommendationEveryNthLaunch is int?
          ? recommendationEveryNthLaunch
          : this.recommendationEveryNthLaunch,
      recommendationPeriodHours: recommendationPeriodHours is int?
          ? recommendationPeriodHours
          : this.recommendationPeriodHours,
      checkLogs: checkLogs is List<_i5.VersionCheckLog>?
          ? checkLogs
          : this.checkLogs?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
