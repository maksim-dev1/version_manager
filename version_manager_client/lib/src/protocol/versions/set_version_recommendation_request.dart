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

/// Запрос на установку рекомендуемой версии для обновления
abstract class SetVersionRecommendationRequest
    implements _i1.SerializableModel {
  SetVersionRecommendationRequest._({
    required this.versionId,
    this.recommendedVersionId,
    this.recommendationFrequency,
    this.recommendationEveryNthLaunch,
    this.recommendationPeriodHours,
  });

  factory SetVersionRecommendationRequest({
    required _i1.UuidValue versionId,
    _i1.UuidValue? recommendedVersionId,
    _i2.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) = _SetVersionRecommendationRequestImpl;

  factory SetVersionRecommendationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return SetVersionRecommendationRequest(
      versionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['versionId'],
      ),
      recommendedVersionId: jsonSerialization['recommendedVersionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['recommendedVersionId'],
            ),
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

  /// ID версии, для которой устанавливается рекомендация
  _i1.UuidValue versionId;

  /// ID рекомендуемой версии (null — снять рекомендацию)
  _i1.UuidValue? recommendedVersionId;

  /// Тип частоты показа рекомендации (обязателен если recommendedVersionId != null)
  _i2.RecommendationFrequencyType? recommendationFrequency;

  /// Интервал для everyNthLaunch (от 2 до 50)
  int? recommendationEveryNthLaunch;

  /// Период в часах для oncePer (24, 72, 168, 336, 720)
  int? recommendationPeriodHours;

  /// Returns a shallow copy of this [SetVersionRecommendationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SetVersionRecommendationRequest copyWith({
    _i1.UuidValue? versionId,
    _i1.UuidValue? recommendedVersionId,
    _i2.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SetVersionRecommendationRequest',
      'versionId': versionId.toJson(),
      if (recommendedVersionId != null)
        'recommendedVersionId': recommendedVersionId?.toJson(),
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

class _SetVersionRecommendationRequestImpl
    extends SetVersionRecommendationRequest {
  _SetVersionRecommendationRequestImpl({
    required _i1.UuidValue versionId,
    _i1.UuidValue? recommendedVersionId,
    _i2.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) : super._(
         versionId: versionId,
         recommendedVersionId: recommendedVersionId,
         recommendationFrequency: recommendationFrequency,
         recommendationEveryNthLaunch: recommendationEveryNthLaunch,
         recommendationPeriodHours: recommendationPeriodHours,
       );

  /// Returns a shallow copy of this [SetVersionRecommendationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SetVersionRecommendationRequest copyWith({
    _i1.UuidValue? versionId,
    Object? recommendedVersionId = _Undefined,
    Object? recommendationFrequency = _Undefined,
    Object? recommendationEveryNthLaunch = _Undefined,
    Object? recommendationPeriodHours = _Undefined,
  }) {
    return SetVersionRecommendationRequest(
      versionId: versionId ?? this.versionId,
      recommendedVersionId: recommendedVersionId is _i1.UuidValue?
          ? recommendedVersionId
          : this.recommendedVersionId,
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
