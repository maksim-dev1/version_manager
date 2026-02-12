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
import '../api/store_link_info.dart' as _i2;
import '../enums/recommendation_frequency_type.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

/// Информация о рекомендуемой версии для обновления.
///
/// Содержит все данные, необходимые клиентскому приложению
/// для показа диалога обновления: номер версии, ссылки на магазины,
/// описание изменений и настройки частоты показа.
abstract class RecommendedVersionInfo implements _i1.SerializableModel {
  RecommendedVersionInfo._({
    required this.versionNumber,
    required this.buildNumber,
    required this.changelog,
    required this.storeLinks,
    this.recommendationFrequency,
    this.recommendationEveryNthLaunch,
    this.recommendationPeriodHours,
  });

  factory RecommendedVersionInfo({
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    required List<_i2.StoreLinkInfo> storeLinks,
    _i3.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) = _RecommendedVersionInfoImpl;

  factory RecommendedVersionInfo.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RecommendedVersionInfo(
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      changelog: jsonSerialization['changelog'] as String,
      storeLinks: _i4.Protocol().deserialize<List<_i2.StoreLinkInfo>>(
        jsonSerialization['storeLinks'],
      ),
      recommendationFrequency:
          jsonSerialization['recommendationFrequency'] == null
          ? null
          : _i3.RecommendationFrequencyType.fromJson(
              (jsonSerialization['recommendationFrequency'] as String),
            ),
      recommendationEveryNthLaunch:
          jsonSerialization['recommendationEveryNthLaunch'] as int?,
      recommendationPeriodHours:
          jsonSerialization['recommendationPeriodHours'] as int?,
    );
  }

  /// Семантическая версия (MAJOR.MINOR.PATCH)
  String versionNumber;

  /// Номер сборки
  int buildNumber;

  /// Описание изменений (changelog)
  String changelog;

  /// Ссылки на магазины для текущей платформы.
  /// Отфильтрованы по платформе из запроса.
  List<_i2.StoreLinkInfo> storeLinks;

  /// Настройки частоты показа рекомендации обновления.
  /// Позволяют клиенту управлять навязчивостью уведомлений:
  /// - everyLaunch: каждый запуск
  /// - everyNthLaunch: каждый N-й запуск
  /// - oncePer: раз в заданный период
  /// - once: показать один раз
  _i3.RecommendationFrequencyType? recommendationFrequency;

  /// Интервал для типа everyNthLaunch (от 2 до 50)
  int? recommendationEveryNthLaunch;

  /// Период в часах для типа oncePer
  int? recommendationPeriodHours;

  /// Returns a shallow copy of this [RecommendedVersionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RecommendedVersionInfo copyWith({
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    List<_i2.StoreLinkInfo>? storeLinks,
    _i3.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RecommendedVersionInfo',
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'storeLinks': storeLinks.toJson(valueToJson: (v) => v.toJson()),
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

class _RecommendedVersionInfoImpl extends RecommendedVersionInfo {
  _RecommendedVersionInfoImpl({
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    required List<_i2.StoreLinkInfo> storeLinks,
    _i3.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
  }) : super._(
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         changelog: changelog,
         storeLinks: storeLinks,
         recommendationFrequency: recommendationFrequency,
         recommendationEveryNthLaunch: recommendationEveryNthLaunch,
         recommendationPeriodHours: recommendationPeriodHours,
       );

  /// Returns a shallow copy of this [RecommendedVersionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RecommendedVersionInfo copyWith({
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    List<_i2.StoreLinkInfo>? storeLinks,
    Object? recommendationFrequency = _Undefined,
    Object? recommendationEveryNthLaunch = _Undefined,
    Object? recommendationPeriodHours = _Undefined,
  }) {
    return RecommendedVersionInfo(
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      changelog: changelog ?? this.changelog,
      storeLinks:
          storeLinks ?? this.storeLinks.map((e0) => e0.copyWith()).toList(),
      recommendationFrequency:
          recommendationFrequency is _i3.RecommendationFrequencyType?
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
