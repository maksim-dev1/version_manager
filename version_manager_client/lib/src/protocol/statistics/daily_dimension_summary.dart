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
import '../enums/platform_type.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

/// Дневная статистика по измерениям (dimensions).
///
/// Хранит количество проверок за день, разбитое по различным измерениям:
/// — os_version: распределение по версиям ОС
/// — device_model: распределение по моделям устройств
/// — locale: распределение по локалям
/// — hour: распределение по часам суток (для heatmap)
///
/// Заполняется автоматически при каждом запросе check-version.
/// Заменяет необходимость хранения сырых логов (version_check_logs).
///
/// Retention policy: хранить бессрочно (~100 байт/запись).
abstract class DailyDimensionSummary implements _i1.SerializableModel {
  DailyDimensionSummary._({
    this.id,
    required this.applicationId,
    this.application,
    required this.date,
    required this.dimensionType,
    required this.dimensionValue,
    required this.platform,
    int? checkCount,
  }) : checkCount = checkCount ?? 0;

  factory DailyDimensionSummary({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required String dimensionType,
    required String dimensionValue,
    required _i3.PlatformType platform,
    int? checkCount,
  }) = _DailyDimensionSummaryImpl;

  factory DailyDimensionSummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DailyDimensionSummary(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      application: jsonSerialization['application'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      dimensionType: jsonSerialization['dimensionType'] as String,
      dimensionValue: jsonSerialization['dimensionValue'] as String,
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      checkCount: jsonSerialization['checkCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Дата агрегации (начало дня UTC)
  DateTime date;

  /// Тип измерения: "os_version", "device_model", "locale", "hour"
  String dimensionType;

  /// Значение измерения (например: "17.2.1", "iPhone 15", "ru_RU", "14")
  String dimensionValue;

  /// Платформа (для os_version и device_model — платформа запроса;
  /// для locale и hour — платформа запроса для per-platform breakdown)
  _i3.PlatformType platform;

  /// Количество проверок
  int checkCount;

  /// Returns a shallow copy of this [DailyDimensionSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyDimensionSummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    DateTime? date,
    String? dimensionType,
    String? dimensionValue,
    _i3.PlatformType? platform,
    int? checkCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyDimensionSummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'date': date.toJson(),
      'dimensionType': dimensionType,
      'dimensionValue': dimensionValue,
      'platform': platform.toJson(),
      'checkCount': checkCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DailyDimensionSummaryImpl extends DailyDimensionSummary {
  _DailyDimensionSummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required String dimensionType,
    required String dimensionValue,
    required _i3.PlatformType platform,
    int? checkCount,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         date: date,
         dimensionType: dimensionType,
         dimensionValue: dimensionValue,
         platform: platform,
         checkCount: checkCount,
       );

  /// Returns a shallow copy of this [DailyDimensionSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyDimensionSummary copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    DateTime? date,
    String? dimensionType,
    String? dimensionValue,
    _i3.PlatformType? platform,
    int? checkCount,
  }) {
    return DailyDimensionSummary(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      date: date ?? this.date,
      dimensionType: dimensionType ?? this.dimensionType,
      dimensionValue: dimensionValue ?? this.dimensionValue,
      platform: platform ?? this.platform,
      checkCount: checkCount ?? this.checkCount,
    );
  }
}
