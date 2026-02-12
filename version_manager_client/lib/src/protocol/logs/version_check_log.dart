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
import '../enums/platform_type.dart' as _i4;
import '../enums/response_status_type.dart' as _i5;
import '../enums/update_priority_type.dart' as _i6;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i7;

/// Лог проверки версии мобильного приложения.
///
/// Подробная запись каждого запроса check-version.
/// Используется для аналитики, мониторинга и отладки.
///
/// Все собираемые данные — анонимные технические метрики (non-PII).
/// Правовое основание: GDPR Art. 6(1)(f) — legitimate interest.
/// IP-адреса анонимизируются (обрезаются до подсети /24).
/// deviceId — анонимный идентификатор (vendor ID), не привязан к аккаунту.
///
/// Retention policy: рекомендуется удалять записи старше 90 дней
/// и переносить агрегированные данные в version_check_daily_summaries.
abstract class VersionCheckLog implements _i1.SerializableModel {
  VersionCheckLog._({
    this.id,
    required this.applicationId,
    this.application,
    this.versionId,
    this.version,
    required this.versionNumber,
    required this.buildNumber,
    required this.platform,
    this.osVersion,
    this.deviceId,
    this.locale,
    this.deviceModel,
    this.screenWidth,
    this.screenHeight,
    this.timezone,
    this.frameworkVersion,
    this.connectionType,
    this.buildType,
    this.cpuArchitecture,
    this.totalRamMb,
    this.freeStorageMb,
    this.deviceLanguage,
    this.isLowPowerMode,
    this.sdkVersion,
    this.ipAddress,
    this.userAgent,
    this.country,
    required this.responseStatus,
    this.updatePriority,
    this.processingTimeMs,
    this.isFirstCheck,
    this.isNewVersion,
    DateTime? checkedAt,
  }) : checkedAt = checkedAt ?? DateTime.now();

  factory VersionCheckLog({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    _i1.UuidValue? versionId,
    _i3.Version? version,
    required String versionNumber,
    required int buildNumber,
    required _i4.PlatformType platform,
    String? osVersion,
    String? deviceId,
    String? locale,
    String? deviceModel,
    int? screenWidth,
    int? screenHeight,
    String? timezone,
    String? frameworkVersion,
    String? connectionType,
    String? buildType,
    String? cpuArchitecture,
    int? totalRamMb,
    int? freeStorageMb,
    String? deviceLanguage,
    bool? isLowPowerMode,
    String? sdkVersion,
    String? ipAddress,
    String? userAgent,
    String? country,
    required _i5.ResponseStatusType responseStatus,
    _i6.UpdatePriorityType? updatePriority,
    int? processingTimeMs,
    bool? isFirstCheck,
    bool? isNewVersion,
    DateTime? checkedAt,
  }) = _VersionCheckLogImpl;

  factory VersionCheckLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return VersionCheckLog(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      application: jsonSerialization['application'] == null
          ? null
          : _i7.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      versionId: jsonSerialization['versionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['versionId']),
      version: jsonSerialization['version'] == null
          ? null
          : _i7.Protocol().deserialize<_i3.Version>(
              jsonSerialization['version'],
            ),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      platform: _i4.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      osVersion: jsonSerialization['osVersion'] as String?,
      deviceId: jsonSerialization['deviceId'] as String?,
      locale: jsonSerialization['locale'] as String?,
      deviceModel: jsonSerialization['deviceModel'] as String?,
      screenWidth: jsonSerialization['screenWidth'] as int?,
      screenHeight: jsonSerialization['screenHeight'] as int?,
      timezone: jsonSerialization['timezone'] as String?,
      frameworkVersion: jsonSerialization['frameworkVersion'] as String?,
      connectionType: jsonSerialization['connectionType'] as String?,
      buildType: jsonSerialization['buildType'] as String?,
      cpuArchitecture: jsonSerialization['cpuArchitecture'] as String?,
      totalRamMb: jsonSerialization['totalRamMb'] as int?,
      freeStorageMb: jsonSerialization['freeStorageMb'] as int?,
      deviceLanguage: jsonSerialization['deviceLanguage'] as String?,
      isLowPowerMode: jsonSerialization['isLowPowerMode'] as bool?,
      sdkVersion: jsonSerialization['sdkVersion'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      country: jsonSerialization['country'] as String?,
      responseStatus: _i5.ResponseStatusType.fromJson(
        (jsonSerialization['responseStatus'] as String),
      ),
      updatePriority: jsonSerialization['updatePriority'] == null
          ? null
          : _i6.UpdatePriorityType.fromJson(
              (jsonSerialization['updatePriority'] as String),
            ),
      processingTimeMs: jsonSerialization['processingTimeMs'] as int?,
      isFirstCheck: jsonSerialization['isFirstCheck'] as bool?,
      isNewVersion: jsonSerialization['isNewVersion'] as bool?,
      checkedAt: jsonSerialization['checkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['checkedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение, для которого выполнена проверка
  _i2.Application? application;

  _i1.UuidValue? versionId;

  /// Найденная версия (null если версия не найдена в БД)
  _i3.Version? version;

  /// Версия приложения из запроса
  String versionNumber;

  /// Номер сборки из запроса
  int buildNumber;

  /// Платформа из запроса
  _i4.PlatformType platform;

  /// Версия ОС
  String? osVersion;

  /// Анонимный идентификатор устройства
  String? deviceId;

  /// Локаль пользователя
  String? locale;

  /// Модель устройства
  String? deviceModel;

  /// Ширина экрана
  int? screenWidth;

  /// Высота экрана
  int? screenHeight;

  /// Часовой пояс (IANA)
  String? timezone;

  /// Версия фреймворка (Flutter, React Native и т.д.)
  String? frameworkVersion;

  /// Тип соединения (wifi, cellular, ethernet, none)
  String? connectionType;

  /// Тип сборки (debug, profile, release)
  String? buildType;

  /// Архитектура CPU
  String? cpuArchitecture;

  /// Общий объём RAM в МБ
  int? totalRamMb;

  /// Свободное хранилище в МБ
  int? freeStorageMb;

  /// Язык интерфейса устройства (ISO 639-1)
  String? deviceLanguage;

  /// Включён ли режим энергосбережения
  bool? isLowPowerMode;

  /// Версия клиентского SDK
  String? sdkVersion;

  /// IP-адрес клиента (из заголовков, анонимизируется)
  String? ipAddress;

  /// User-Agent клиента
  String? userAgent;

  /// Страна по IP (GeoIP lookup, если доступно)
  String? country;

  /// Статус ответа (blocked, update_available, active, error)
  _i5.ResponseStatusType responseStatus;

  /// Приоритет обновления в ответе
  _i6.UpdatePriorityType? updatePriority;

  /// Время обработки запроса на сервере в мс
  int? processingTimeMs;

  /// Первая ли это проверка с данного устройства для этого приложения
  bool? isFirstCheck;

  /// Новая ли это версия (не встречалась ранее для этого deviceId)
  bool? isNewVersion;

  /// Время выполнения проверки
  DateTime checkedAt;

  /// Returns a shallow copy of this [VersionCheckLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionCheckLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    _i1.UuidValue? versionId,
    _i3.Version? version,
    String? versionNumber,
    int? buildNumber,
    _i4.PlatformType? platform,
    String? osVersion,
    String? deviceId,
    String? locale,
    String? deviceModel,
    int? screenWidth,
    int? screenHeight,
    String? timezone,
    String? frameworkVersion,
    String? connectionType,
    String? buildType,
    String? cpuArchitecture,
    int? totalRamMb,
    int? freeStorageMb,
    String? deviceLanguage,
    bool? isLowPowerMode,
    String? sdkVersion,
    String? ipAddress,
    String? userAgent,
    String? country,
    _i5.ResponseStatusType? responseStatus,
    _i6.UpdatePriorityType? updatePriority,
    int? processingTimeMs,
    bool? isFirstCheck,
    bool? isNewVersion,
    DateTime? checkedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionCheckLog',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      if (versionId != null) 'versionId': versionId?.toJson(),
      if (version != null) 'version': version?.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      if (osVersion != null) 'osVersion': osVersion,
      if (deviceId != null) 'deviceId': deviceId,
      if (locale != null) 'locale': locale,
      if (deviceModel != null) 'deviceModel': deviceModel,
      if (screenWidth != null) 'screenWidth': screenWidth,
      if (screenHeight != null) 'screenHeight': screenHeight,
      if (timezone != null) 'timezone': timezone,
      if (frameworkVersion != null) 'frameworkVersion': frameworkVersion,
      if (connectionType != null) 'connectionType': connectionType,
      if (buildType != null) 'buildType': buildType,
      if (cpuArchitecture != null) 'cpuArchitecture': cpuArchitecture,
      if (totalRamMb != null) 'totalRamMb': totalRamMb,
      if (freeStorageMb != null) 'freeStorageMb': freeStorageMb,
      if (deviceLanguage != null) 'deviceLanguage': deviceLanguage,
      if (isLowPowerMode != null) 'isLowPowerMode': isLowPowerMode,
      if (sdkVersion != null) 'sdkVersion': sdkVersion,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      if (country != null) 'country': country,
      'responseStatus': responseStatus.toJson(),
      if (updatePriority != null) 'updatePriority': updatePriority?.toJson(),
      if (processingTimeMs != null) 'processingTimeMs': processingTimeMs,
      if (isFirstCheck != null) 'isFirstCheck': isFirstCheck,
      if (isNewVersion != null) 'isNewVersion': isNewVersion,
      'checkedAt': checkedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VersionCheckLogImpl extends VersionCheckLog {
  _VersionCheckLogImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    _i1.UuidValue? versionId,
    _i3.Version? version,
    required String versionNumber,
    required int buildNumber,
    required _i4.PlatformType platform,
    String? osVersion,
    String? deviceId,
    String? locale,
    String? deviceModel,
    int? screenWidth,
    int? screenHeight,
    String? timezone,
    String? frameworkVersion,
    String? connectionType,
    String? buildType,
    String? cpuArchitecture,
    int? totalRamMb,
    int? freeStorageMb,
    String? deviceLanguage,
    bool? isLowPowerMode,
    String? sdkVersion,
    String? ipAddress,
    String? userAgent,
    String? country,
    required _i5.ResponseStatusType responseStatus,
    _i6.UpdatePriorityType? updatePriority,
    int? processingTimeMs,
    bool? isFirstCheck,
    bool? isNewVersion,
    DateTime? checkedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         versionId: versionId,
         version: version,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         platform: platform,
         osVersion: osVersion,
         deviceId: deviceId,
         locale: locale,
         deviceModel: deviceModel,
         screenWidth: screenWidth,
         screenHeight: screenHeight,
         timezone: timezone,
         frameworkVersion: frameworkVersion,
         connectionType: connectionType,
         buildType: buildType,
         cpuArchitecture: cpuArchitecture,
         totalRamMb: totalRamMb,
         freeStorageMb: freeStorageMb,
         deviceLanguage: deviceLanguage,
         isLowPowerMode: isLowPowerMode,
         sdkVersion: sdkVersion,
         ipAddress: ipAddress,
         userAgent: userAgent,
         country: country,
         responseStatus: responseStatus,
         updatePriority: updatePriority,
         processingTimeMs: processingTimeMs,
         isFirstCheck: isFirstCheck,
         isNewVersion: isNewVersion,
         checkedAt: checkedAt,
       );

  /// Returns a shallow copy of this [VersionCheckLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionCheckLog copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    Object? versionId = _Undefined,
    Object? version = _Undefined,
    String? versionNumber,
    int? buildNumber,
    _i4.PlatformType? platform,
    Object? osVersion = _Undefined,
    Object? deviceId = _Undefined,
    Object? locale = _Undefined,
    Object? deviceModel = _Undefined,
    Object? screenWidth = _Undefined,
    Object? screenHeight = _Undefined,
    Object? timezone = _Undefined,
    Object? frameworkVersion = _Undefined,
    Object? connectionType = _Undefined,
    Object? buildType = _Undefined,
    Object? cpuArchitecture = _Undefined,
    Object? totalRamMb = _Undefined,
    Object? freeStorageMb = _Undefined,
    Object? deviceLanguage = _Undefined,
    Object? isLowPowerMode = _Undefined,
    Object? sdkVersion = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    Object? country = _Undefined,
    _i5.ResponseStatusType? responseStatus,
    Object? updatePriority = _Undefined,
    Object? processingTimeMs = _Undefined,
    Object? isFirstCheck = _Undefined,
    Object? isNewVersion = _Undefined,
    DateTime? checkedAt,
  }) {
    return VersionCheckLog(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      versionId: versionId is _i1.UuidValue? ? versionId : this.versionId,
      version: version is _i3.Version? ? version : this.version?.copyWith(),
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      platform: platform ?? this.platform,
      osVersion: osVersion is String? ? osVersion : this.osVersion,
      deviceId: deviceId is String? ? deviceId : this.deviceId,
      locale: locale is String? ? locale : this.locale,
      deviceModel: deviceModel is String? ? deviceModel : this.deviceModel,
      screenWidth: screenWidth is int? ? screenWidth : this.screenWidth,
      screenHeight: screenHeight is int? ? screenHeight : this.screenHeight,
      timezone: timezone is String? ? timezone : this.timezone,
      frameworkVersion: frameworkVersion is String?
          ? frameworkVersion
          : this.frameworkVersion,
      connectionType: connectionType is String?
          ? connectionType
          : this.connectionType,
      buildType: buildType is String? ? buildType : this.buildType,
      cpuArchitecture: cpuArchitecture is String?
          ? cpuArchitecture
          : this.cpuArchitecture,
      totalRamMb: totalRamMb is int? ? totalRamMb : this.totalRamMb,
      freeStorageMb: freeStorageMb is int? ? freeStorageMb : this.freeStorageMb,
      deviceLanguage: deviceLanguage is String?
          ? deviceLanguage
          : this.deviceLanguage,
      isLowPowerMode: isLowPowerMode is bool?
          ? isLowPowerMode
          : this.isLowPowerMode,
      sdkVersion: sdkVersion is String? ? sdkVersion : this.sdkVersion,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      country: country is String? ? country : this.country,
      responseStatus: responseStatus ?? this.responseStatus,
      updatePriority: updatePriority is _i6.UpdatePriorityType?
          ? updatePriority
          : this.updatePriority,
      processingTimeMs: processingTimeMs is int?
          ? processingTimeMs
          : this.processingTimeMs,
      isFirstCheck: isFirstCheck is bool? ? isFirstCheck : this.isFirstCheck,
      isNewVersion: isNewVersion is bool? ? isNewVersion : this.isNewVersion,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }
}
