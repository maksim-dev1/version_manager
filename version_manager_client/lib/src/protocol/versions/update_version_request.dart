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
import '../enums/recommendation_frequency_type.dart' as _i2;

/// Запрос на обновление версии приложения
abstract class UpdateVersionRequest implements _i1.SerializableModel {
  UpdateVersionRequest._({
    required this.versionId,
    this.versionNumber,
    this.buildNumber,
    this.changelog,
    this.isBlocked,
    this.blockReason,
    this.recommendedVersionId,
    bool? clearRecommendation,
    this.recommendationFrequency,
    this.recommendationEveryNthLaunch,
    this.recommendationPeriodHours,
  }) : clearRecommendation = clearRecommendation ?? false;

  factory UpdateVersionRequest({
    required _i1.UuidValue versionId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    bool? clearRecommendation,
    _i2.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) = _UpdateVersionRequestImpl;

  factory UpdateVersionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateVersionRequest(
      versionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['versionId'],
      ),
      versionNumber: jsonSerialization['versionNumber'] as String?,
      buildNumber: jsonSerialization['buildNumber'] as int?,
      changelog: jsonSerialization['changelog'] as String?,
      isBlocked: jsonSerialization['isBlocked'] as bool?,
      blockReason: jsonSerialization['blockReason'] as String?,
      recommendedVersionId: jsonSerialization['recommendedVersionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['recommendedVersionId'],
            ),
      clearRecommendation: jsonSerialization['clearRecommendation'] as bool?,
      recommendationFrequency:
          jsonSerialization['recommendationFrequency'] == null
          ? null
          : _i2.RecommendationFrequencyType.fromJson(
              (jsonSerialization['recommendationFrequency'] as String),
            ),
      recommendationEveryNthLaunch:
          jsonSerialization['recommendationEveryNthLaunch'] as int?,
      recommendationPeriodHours:
          jsonSerialization['recommendationPeriodHours'] as int?,
    );
  }

  _i1.UuidValue versionId;

  /// Семантическая версия в формате MAJOR.MINOR.PATCH
  String? versionNumber;

  /// Целое положительное число, уникальное для приложения
  int? buildNumber;

  /// Описание изменений (changelog), от 10 до 2000 символов
  String? changelog;

  /// Заблокировать версию (доступно если не самая новая)
  bool? isBlocked;

  /// Причина блокировки (обязательна если isBlocked = true), от 10 до 500 символов
  String? blockReason;

  /// ID рекомендуемой версии для обновления (только с большим buildNumber)
  _i1.UuidValue? recommendedVersionId;

  /// Снять рекомендацию (если true — очистить recommendedVersionId)
  bool? clearRecommendation;

  /// Тип частоты показа рекомендации
  _i2.RecommendationFrequencyType? recommendationFrequency;

  /// Интервал для everyNthLaunch (от 2 до 50)
  int? recommendationEveryNthLaunch;

  /// Период в часах для oncePer (24, 72, 168, 336, 720)
  int? recommendationPeriodHours;

  /// Returns a shallow copy of this [UpdateVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateVersionRequest copyWith({
    _i1.UuidValue? versionId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    bool? clearRecommendation,
    _i2.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateVersionRequest',
      'versionId': versionId.toJson(),
      if (versionNumber != null) 'versionNumber': versionNumber,
      if (buildNumber != null) 'buildNumber': buildNumber,
      if (changelog != null) 'changelog': changelog,
      if (isBlocked != null) 'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (recommendedVersionId != null)
        'recommendedVersionId': recommendedVersionId?.toJson(),
      if (clearRecommendation != null)
        'clearRecommendation': clearRecommendation,
      if (recommendationFrequency != null)
        'recommendationFrequency': recommendationFrequency?.toJson(),
      if (recommendationEveryNthLaunch != null)
        'recommendationEveryNthLaunch': recommendationEveryNthLaunch,
      if (recommendationPeriodHours != null)
        'recommendationPeriodHours': recommendationPeriodHours,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateVersionRequestImpl extends UpdateVersionRequest {
  _UpdateVersionRequestImpl({
    required _i1.UuidValue versionId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    bool? clearRecommendation,
    _i2.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) : super._(
         versionId: versionId,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         changelog: changelog,
         isBlocked: isBlocked,
         blockReason: blockReason,
         recommendedVersionId: recommendedVersionId,
         clearRecommendation: clearRecommendation,
         recommendationFrequency: recommendationFrequency,
         recommendationEveryNthLaunch: recommendationEveryNthLaunch,
         recommendationPeriodHours: recommendationPeriodHours,
       );

  /// Returns a shallow copy of this [UpdateVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateVersionRequest copyWith({
    _i1.UuidValue? versionId,
    Object? versionNumber = _Undefined,
    Object? buildNumber = _Undefined,
    Object? changelog = _Undefined,
    Object? isBlocked = _Undefined,
    Object? blockReason = _Undefined,
    Object? recommendedVersionId = _Undefined,
    Object? clearRecommendation = _Undefined,
    Object? recommendationFrequency = _Undefined,
    Object? recommendationEveryNthLaunch = _Undefined,
    Object? recommendationPeriodHours = _Undefined,
  }) {
    return UpdateVersionRequest(
      versionId: versionId ?? this.versionId,
      versionNumber: versionNumber is String?
          ? versionNumber
          : this.versionNumber,
      buildNumber: buildNumber is int? ? buildNumber : this.buildNumber,
      changelog: changelog is String? ? changelog : this.changelog,
      isBlocked: isBlocked is bool? ? isBlocked : this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      recommendedVersionId: recommendedVersionId is _i1.UuidValue?
          ? recommendedVersionId
          : this.recommendedVersionId,
      clearRecommendation: clearRecommendation is bool?
          ? clearRecommendation
          : this.clearRecommendation,
      recommendationFrequency:
          recommendationFrequency is _i2.RecommendationFrequencyType?
          ? recommendationFrequency
          : this.recommendationFrequency,
      recommendationEveryNthLaunch: recommendationEveryNthLaunch is int?
          ? recommendationEveryNthLaunch
          : this.recommendationEveryNthLaunch,
      recommendationPeriodHours: recommendationPeriodHours is int?
          ? recommendationPeriodHours
          : this.recommendationPeriodHours,
    );
  }
}
