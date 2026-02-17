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

/// Дневная агрегированная статистика проверок версий.
///
/// Содержит преагрегированные метрики за один день для одного приложения,
/// одной платформы и одной версии (buildNumber). Используется для:
/// — быстрых дашбордов без тяжёлых запросов
/// — хранения исторических данных
/// — аналитики трендов по дням
///
/// Заполняется автоматически при каждом запросе check-version
/// (инкрементальное обновление).
///
/// Retention policy: хранить бессрочно (~200 байт/запись).
abstract class DailyCheckSummary implements _i1.SerializableModel {
  DailyCheckSummary._({
    this.id,
    required this.applicationId,
    this.application,
    required this.date,
    required this.platform,
    required this.buildNumber,
    required this.versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    this.avgProcessingTimeMs,
    this.maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : uniqueDevices = uniqueDevices ?? 0,
       newDevices = newDevices ?? 0,
       totalChecks = totalChecks ?? 0,
       blockedChecks = blockedChecks ?? 0,
       updateAvailableChecks = updateAvailableChecks ?? 0,
       activeChecks = activeChecks ?? 0,
       errorChecks = errorChecks ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory DailyCheckSummary({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DailyCheckSummaryImpl;

  factory DailyCheckSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailyCheckSummary(
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
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      buildNumber: jsonSerialization['buildNumber'] as int,
      versionNumber: jsonSerialization['versionNumber'] as String,
      uniqueDevices: jsonSerialization['uniqueDevices'] as int?,
      newDevices: jsonSerialization['newDevices'] as int?,
      totalChecks: jsonSerialization['totalChecks'] as int?,
      blockedChecks: jsonSerialization['blockedChecks'] as int?,
      updateAvailableChecks: jsonSerialization['updateAvailableChecks'] as int?,
      activeChecks: jsonSerialization['activeChecks'] as int?,
      errorChecks: jsonSerialization['errorChecks'] as int?,
      avgProcessingTimeMs: jsonSerialization['avgProcessingTimeMs'] as int?,
      maxProcessingTimeMs: jsonSerialization['maxProcessingTimeMs'] as int?,
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

  /// Приложение
  _i2.Application? application;

  /// Дата агрегации (начало дня UTC)
  DateTime date;

  /// Платформа
  _i3.PlatformType platform;

  /// Номер сборки
  int buildNumber;

  /// Номер версии (для отображения)
  String versionNumber;

  /// Уникальные устройства за день (по instanceId, точный подсчёт)
  int uniqueDevices;

  /// Новые устройства за день (firstSeenAt = сегодня)
  int newDevices;

  /// Общее количество проверок за день
  int totalChecks;

  /// Проверки со статусом blocked
  int blockedChecks;

  /// Проверки со статусом update_available
  int updateAvailableChecks;

  /// Проверки со статусом active
  int activeChecks;

  /// Проверки со статусом error
  int errorChecks;

  /// Среднее время обработки запроса (мс)
  int? avgProcessingTimeMs;

  /// Максимальное время обработки (мс)
  int? maxProcessingTimeMs;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [DailyCheckSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyCheckSummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyCheckSummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'date': date.toJson(),
      'platform': platform.toJson(),
      'buildNumber': buildNumber,
      'versionNumber': versionNumber,
      'uniqueDevices': uniqueDevices,
      'newDevices': newDevices,
      'totalChecks': totalChecks,
      'blockedChecks': blockedChecks,
      'updateAvailableChecks': updateAvailableChecks,
      'activeChecks': activeChecks,
      'errorChecks': errorChecks,
      if (avgProcessingTimeMs != null)
        'avgProcessingTimeMs': avgProcessingTimeMs,
      if (maxProcessingTimeMs != null)
        'maxProcessingTimeMs': maxProcessingTimeMs,
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

class _DailyCheckSummaryImpl extends DailyCheckSummary {
  _DailyCheckSummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         date: date,
         platform: platform,
         buildNumber: buildNumber,
         versionNumber: versionNumber,
         uniqueDevices: uniqueDevices,
         newDevices: newDevices,
         totalChecks: totalChecks,
         blockedChecks: blockedChecks,
         updateAvailableChecks: updateAvailableChecks,
         activeChecks: activeChecks,
         errorChecks: errorChecks,
         avgProcessingTimeMs: avgProcessingTimeMs,
         maxProcessingTimeMs: maxProcessingTimeMs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [DailyCheckSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyCheckSummary copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    Object? avgProcessingTimeMs = _Undefined,
    Object? maxProcessingTimeMs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DailyCheckSummary(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      date: date ?? this.date,
      platform: platform ?? this.platform,
      buildNumber: buildNumber ?? this.buildNumber,
      versionNumber: versionNumber ?? this.versionNumber,
      uniqueDevices: uniqueDevices ?? this.uniqueDevices,
      newDevices: newDevices ?? this.newDevices,
      totalChecks: totalChecks ?? this.totalChecks,
      blockedChecks: blockedChecks ?? this.blockedChecks,
      updateAvailableChecks:
          updateAvailableChecks ?? this.updateAvailableChecks,
      activeChecks: activeChecks ?? this.activeChecks,
      errorChecks: errorChecks ?? this.errorChecks,
      avgProcessingTimeMs: avgProcessingTimeMs is int?
          ? avgProcessingTimeMs
          : this.avgProcessingTimeMs,
      maxProcessingTimeMs: maxProcessingTimeMs is int?
          ? maxProcessingTimeMs
          : this.maxProcessingTimeMs,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
