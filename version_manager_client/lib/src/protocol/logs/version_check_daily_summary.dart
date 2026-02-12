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

/// Агрегированная дневная статистика проверок версий.
///
/// Содержит преагрегированные метрики за один день для одного приложения,
/// одной платформы и одной версии. Используется для:
/// — быстрых дашбордов без тяжёлых запросов к version_check_logs
/// — хранения исторических данных после удаления детальных логов
/// — аналитики трендов по дням
///
/// Заполняется автоматически при каждом запросе check-version
/// (инкрементальное обновление) или через периодическую задачу (cron).
///
/// Retention policy: хранить бессрочно (компактные данные ~200 байт/запись).
abstract class VersionCheckDailySummary implements _i1.SerializableModel {
  VersionCheckDailySummary._({
    this.id,
    required this.applicationId,
    this.application,
    required this.date,
    required this.platform,
    required this.buildNumber,
    required this.versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    this.avgProcessingTimeMs,
    this.maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : totalChecks = totalChecks ?? 0,
       uniqueDevices = uniqueDevices ?? 0,
       blockedChecks = blockedChecks ?? 0,
       updateAvailableChecks = updateAvailableChecks ?? 0,
       activeChecks = activeChecks ?? 0,
       errorChecks = errorChecks ?? 0,
       newInstalls = newInstalls ?? 0,
       upgrades = upgrades ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory VersionCheckDailySummary({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VersionCheckDailySummaryImpl;

  factory VersionCheckDailySummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VersionCheckDailySummary(
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
      totalChecks: jsonSerialization['totalChecks'] as int?,
      uniqueDevices: jsonSerialization['uniqueDevices'] as int?,
      blockedChecks: jsonSerialization['blockedChecks'] as int?,
      updateAvailableChecks: jsonSerialization['updateAvailableChecks'] as int?,
      activeChecks: jsonSerialization['activeChecks'] as int?,
      errorChecks: jsonSerialization['errorChecks'] as int?,
      newInstalls: jsonSerialization['newInstalls'] as int?,
      upgrades: jsonSerialization['upgrades'] as int?,
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

  /// Дата агрегации (без времени, начало дня UTC)
  DateTime date;

  /// Платформа
  _i3.PlatformType platform;

  /// Номер сборки
  int buildNumber;

  /// Номер версии (для отображения)
  String versionNumber;

  /// Общее количество проверок за день
  int totalChecks;

  /// Количество уникальных устройств
  int uniqueDevices;

  /// Проверки со статусом blocked
  int blockedChecks;

  /// Проверки со статусом update_available
  int updateAvailableChecks;

  /// Проверки со статусом active
  int activeChecks;

  /// Проверки со статусом error
  int errorChecks;

  /// Количество первых проверок (новые устройства)
  int newInstalls;

  /// Количество обновлений (устройство сменило версию)
  int upgrades;

  /// Среднее время обработки запроса (мс)
  int? avgProcessingTimeMs;

  /// Максимальное время обработки (мс)
  int? maxProcessingTimeMs;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [VersionCheckDailySummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionCheckDailySummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionCheckDailySummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'date': date.toJson(),
      'platform': platform.toJson(),
      'buildNumber': buildNumber,
      'versionNumber': versionNumber,
      'totalChecks': totalChecks,
      'uniqueDevices': uniqueDevices,
      'blockedChecks': blockedChecks,
      'updateAvailableChecks': updateAvailableChecks,
      'activeChecks': activeChecks,
      'errorChecks': errorChecks,
      'newInstalls': newInstalls,
      'upgrades': upgrades,
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

class _VersionCheckDailySummaryImpl extends VersionCheckDailySummary {
  _VersionCheckDailySummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
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
         totalChecks: totalChecks,
         uniqueDevices: uniqueDevices,
         blockedChecks: blockedChecks,
         updateAvailableChecks: updateAvailableChecks,
         activeChecks: activeChecks,
         errorChecks: errorChecks,
         newInstalls: newInstalls,
         upgrades: upgrades,
         avgProcessingTimeMs: avgProcessingTimeMs,
         maxProcessingTimeMs: maxProcessingTimeMs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [VersionCheckDailySummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionCheckDailySummary copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    Object? avgProcessingTimeMs = _Undefined,
    Object? maxProcessingTimeMs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VersionCheckDailySummary(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      date: date ?? this.date,
      platform: platform ?? this.platform,
      buildNumber: buildNumber ?? this.buildNumber,
      versionNumber: versionNumber ?? this.versionNumber,
      totalChecks: totalChecks ?? this.totalChecks,
      uniqueDevices: uniqueDevices ?? this.uniqueDevices,
      blockedChecks: blockedChecks ?? this.blockedChecks,
      updateAvailableChecks:
          updateAvailableChecks ?? this.updateAvailableChecks,
      activeChecks: activeChecks ?? this.activeChecks,
      errorChecks: errorChecks ?? this.errorChecks,
      newInstalls: newInstalls ?? this.newInstalls,
      upgrades: upgrades ?? this.upgrades,
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
