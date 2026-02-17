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

/// Фильтры для запросов статистики.
abstract class StatisticsFilter
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  StatisticsFilter._({
    required this.applicationId,
    this.dateFrom,
    this.dateTo,
    this.platform,
    this.buildNumber,
  });

  factory StatisticsFilter({
    required _i1.UuidValue applicationId,
    DateTime? dateFrom,
    DateTime? dateTo,
    _i2.PlatformType? platform,
    int? buildNumber,
  }) = _StatisticsFilterImpl;

  factory StatisticsFilter.fromJson(Map<String, dynamic> jsonSerialization) {
    return StatisticsFilter(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      dateFrom: jsonSerialization['dateFrom'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateFrom']),
      dateTo: jsonSerialization['dateTo'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dateTo']),
      platform: jsonSerialization['platform'] == null
          ? null
          : _i2.PlatformType.fromJson(
              (jsonSerialization['platform'] as String),
            ),
      buildNumber: jsonSerialization['buildNumber'] as int?,
    );
  }

  /// ID приложения
  _i1.UuidValue applicationId;

  /// Начало периода (включительно)
  DateTime? dateFrom;

  /// Конец периода (включительно)
  DateTime? dateTo;

  /// Фильтр по платформе
  _i2.PlatformType? platform;

  /// Фильтр по номеру сборки версии
  int? buildNumber;

  /// Returns a shallow copy of this [StatisticsFilter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StatisticsFilter copyWith({
    _i1.UuidValue? applicationId,
    DateTime? dateFrom,
    DateTime? dateTo,
    _i2.PlatformType? platform,
    int? buildNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StatisticsFilter',
      'applicationId': applicationId.toJson(),
      if (dateFrom != null) 'dateFrom': dateFrom?.toJson(),
      if (dateTo != null) 'dateTo': dateTo?.toJson(),
      if (platform != null) 'platform': platform?.toJson(),
      if (buildNumber != null) 'buildNumber': buildNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StatisticsFilter',
      'applicationId': applicationId.toJson(),
      if (dateFrom != null) 'dateFrom': dateFrom?.toJson(),
      if (dateTo != null) 'dateTo': dateTo?.toJson(),
      if (platform != null) 'platform': platform?.toJson(),
      if (buildNumber != null) 'buildNumber': buildNumber,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StatisticsFilterImpl extends StatisticsFilter {
  _StatisticsFilterImpl({
    required _i1.UuidValue applicationId,
    DateTime? dateFrom,
    DateTime? dateTo,
    _i2.PlatformType? platform,
    int? buildNumber,
  }) : super._(
         applicationId: applicationId,
         dateFrom: dateFrom,
         dateTo: dateTo,
         platform: platform,
         buildNumber: buildNumber,
       );

  /// Returns a shallow copy of this [StatisticsFilter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StatisticsFilter copyWith({
    _i1.UuidValue? applicationId,
    Object? dateFrom = _Undefined,
    Object? dateTo = _Undefined,
    Object? platform = _Undefined,
    Object? buildNumber = _Undefined,
  }) {
    return StatisticsFilter(
      applicationId: applicationId ?? this.applicationId,
      dateFrom: dateFrom is DateTime? ? dateFrom : this.dateFrom,
      dateTo: dateTo is DateTime? ? dateTo : this.dateTo,
      platform: platform is _i2.PlatformType? ? platform : this.platform,
      buildNumber: buildNumber is int? ? buildNumber : this.buildNumber,
    );
  }
}
