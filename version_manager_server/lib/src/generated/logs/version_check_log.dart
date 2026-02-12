/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../apps/application.dart' as _i2;
import '../versions/version.dart' as _i3;
import '../enums/platform_type.dart' as _i4;
import '../enums/response_status_type.dart' as _i5;
import '../enums/update_priority_type.dart' as _i6;
import 'package:version_manager_server/src/generated/protocol.dart' as _i7;

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
abstract class VersionCheckLog
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
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

  static final t = VersionCheckLogTable();

  static const db = VersionCheckLogRepository._();

  @override
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

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VersionCheckLog',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      if (versionId != null) 'versionId': versionId?.toJson(),
      if (version != null) 'version': version?.toJsonForProtocol(),
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

  static VersionCheckLogInclude include({
    _i2.ApplicationInclude? application,
    _i3.VersionInclude? version,
  }) {
    return VersionCheckLogInclude._(
      application: application,
      version: version,
    );
  }

  static VersionCheckLogIncludeList includeList({
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    VersionCheckLogInclude? include,
  }) {
    return VersionCheckLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VersionCheckLog.t),
      include: include,
    );
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

class VersionCheckLogUpdateTable extends _i1.UpdateTable<VersionCheckLogTable> {
  VersionCheckLogUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> versionId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.versionId,
    value,
  );

  _i1.ColumnValue<String, String> versionNumber(String value) =>
      _i1.ColumnValue(
        table.versionNumber,
        value,
      );

  _i1.ColumnValue<int, int> buildNumber(int value) => _i1.ColumnValue(
    table.buildNumber,
    value,
  );

  _i1.ColumnValue<_i4.PlatformType, _i4.PlatformType> platform(
    _i4.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> osVersion(String? value) => _i1.ColumnValue(
    table.osVersion,
    value,
  );

  _i1.ColumnValue<String, String> deviceId(String? value) => _i1.ColumnValue(
    table.deviceId,
    value,
  );

  _i1.ColumnValue<String, String> locale(String? value) => _i1.ColumnValue(
    table.locale,
    value,
  );

  _i1.ColumnValue<String, String> deviceModel(String? value) => _i1.ColumnValue(
    table.deviceModel,
    value,
  );

  _i1.ColumnValue<int, int> screenWidth(int? value) => _i1.ColumnValue(
    table.screenWidth,
    value,
  );

  _i1.ColumnValue<int, int> screenHeight(int? value) => _i1.ColumnValue(
    table.screenHeight,
    value,
  );

  _i1.ColumnValue<String, String> timezone(String? value) => _i1.ColumnValue(
    table.timezone,
    value,
  );

  _i1.ColumnValue<String, String> frameworkVersion(String? value) =>
      _i1.ColumnValue(
        table.frameworkVersion,
        value,
      );

  _i1.ColumnValue<String, String> connectionType(String? value) =>
      _i1.ColumnValue(
        table.connectionType,
        value,
      );

  _i1.ColumnValue<String, String> buildType(String? value) => _i1.ColumnValue(
    table.buildType,
    value,
  );

  _i1.ColumnValue<String, String> cpuArchitecture(String? value) =>
      _i1.ColumnValue(
        table.cpuArchitecture,
        value,
      );

  _i1.ColumnValue<int, int> totalRamMb(int? value) => _i1.ColumnValue(
    table.totalRamMb,
    value,
  );

  _i1.ColumnValue<int, int> freeStorageMb(int? value) => _i1.ColumnValue(
    table.freeStorageMb,
    value,
  );

  _i1.ColumnValue<String, String> deviceLanguage(String? value) =>
      _i1.ColumnValue(
        table.deviceLanguage,
        value,
      );

  _i1.ColumnValue<bool, bool> isLowPowerMode(bool? value) => _i1.ColumnValue(
    table.isLowPowerMode,
    value,
  );

  _i1.ColumnValue<String, String> sdkVersion(String? value) => _i1.ColumnValue(
    table.sdkVersion,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<String, String> userAgent(String? value) => _i1.ColumnValue(
    table.userAgent,
    value,
  );

  _i1.ColumnValue<String, String> country(String? value) => _i1.ColumnValue(
    table.country,
    value,
  );

  _i1.ColumnValue<_i5.ResponseStatusType, _i5.ResponseStatusType>
  responseStatus(_i5.ResponseStatusType value) => _i1.ColumnValue(
    table.responseStatus,
    value,
  );

  _i1.ColumnValue<_i6.UpdatePriorityType, _i6.UpdatePriorityType>
  updatePriority(_i6.UpdatePriorityType? value) => _i1.ColumnValue(
    table.updatePriority,
    value,
  );

  _i1.ColumnValue<int, int> processingTimeMs(int? value) => _i1.ColumnValue(
    table.processingTimeMs,
    value,
  );

  _i1.ColumnValue<bool, bool> isFirstCheck(bool? value) => _i1.ColumnValue(
    table.isFirstCheck,
    value,
  );

  _i1.ColumnValue<bool, bool> isNewVersion(bool? value) => _i1.ColumnValue(
    table.isNewVersion,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> checkedAt(DateTime value) =>
      _i1.ColumnValue(
        table.checkedAt,
        value,
      );
}

class VersionCheckLogTable extends _i1.Table<_i1.UuidValue?> {
  VersionCheckLogTable({super.tableRelation})
    : super(tableName: 'version_check_logs') {
    updateTable = VersionCheckLogUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    versionId = _i1.ColumnUuid(
      'versionId',
      this,
    );
    versionNumber = _i1.ColumnString(
      'versionNumber',
      this,
    );
    buildNumber = _i1.ColumnInt(
      'buildNumber',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    osVersion = _i1.ColumnString(
      'osVersion',
      this,
    );
    deviceId = _i1.ColumnString(
      'deviceId',
      this,
    );
    locale = _i1.ColumnString(
      'locale',
      this,
    );
    deviceModel = _i1.ColumnString(
      'deviceModel',
      this,
    );
    screenWidth = _i1.ColumnInt(
      'screenWidth',
      this,
    );
    screenHeight = _i1.ColumnInt(
      'screenHeight',
      this,
    );
    timezone = _i1.ColumnString(
      'timezone',
      this,
    );
    frameworkVersion = _i1.ColumnString(
      'frameworkVersion',
      this,
    );
    connectionType = _i1.ColumnString(
      'connectionType',
      this,
    );
    buildType = _i1.ColumnString(
      'buildType',
      this,
    );
    cpuArchitecture = _i1.ColumnString(
      'cpuArchitecture',
      this,
    );
    totalRamMb = _i1.ColumnInt(
      'totalRamMb',
      this,
    );
    freeStorageMb = _i1.ColumnInt(
      'freeStorageMb',
      this,
    );
    deviceLanguage = _i1.ColumnString(
      'deviceLanguage',
      this,
    );
    isLowPowerMode = _i1.ColumnBool(
      'isLowPowerMode',
      this,
    );
    sdkVersion = _i1.ColumnString(
      'sdkVersion',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    userAgent = _i1.ColumnString(
      'userAgent',
      this,
    );
    country = _i1.ColumnString(
      'country',
      this,
    );
    responseStatus = _i1.ColumnEnum(
      'responseStatus',
      this,
      _i1.EnumSerialization.byName,
    );
    updatePriority = _i1.ColumnEnum(
      'updatePriority',
      this,
      _i1.EnumSerialization.byName,
    );
    processingTimeMs = _i1.ColumnInt(
      'processingTimeMs',
      this,
    );
    isFirstCheck = _i1.ColumnBool(
      'isFirstCheck',
      this,
    );
    isNewVersion = _i1.ColumnBool(
      'isNewVersion',
      this,
    );
    checkedAt = _i1.ColumnDateTime(
      'checkedAt',
      this,
      hasDefault: true,
    );
  }

  late final VersionCheckLogUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  /// Приложение, для которого выполнена проверка
  _i2.ApplicationTable? _application;

  late final _i1.ColumnUuid versionId;

  /// Найденная версия (null если версия не найдена в БД)
  _i3.VersionTable? _version;

  /// Версия приложения из запроса
  late final _i1.ColumnString versionNumber;

  /// Номер сборки из запроса
  late final _i1.ColumnInt buildNumber;

  /// Платформа из запроса
  late final _i1.ColumnEnum<_i4.PlatformType> platform;

  /// Версия ОС
  late final _i1.ColumnString osVersion;

  /// Анонимный идентификатор устройства
  late final _i1.ColumnString deviceId;

  /// Локаль пользователя
  late final _i1.ColumnString locale;

  /// Модель устройства
  late final _i1.ColumnString deviceModel;

  /// Ширина экрана
  late final _i1.ColumnInt screenWidth;

  /// Высота экрана
  late final _i1.ColumnInt screenHeight;

  /// Часовой пояс (IANA)
  late final _i1.ColumnString timezone;

  /// Версия фреймворка (Flutter, React Native и т.д.)
  late final _i1.ColumnString frameworkVersion;

  /// Тип соединения (wifi, cellular, ethernet, none)
  late final _i1.ColumnString connectionType;

  /// Тип сборки (debug, profile, release)
  late final _i1.ColumnString buildType;

  /// Архитектура CPU
  late final _i1.ColumnString cpuArchitecture;

  /// Общий объём RAM в МБ
  late final _i1.ColumnInt totalRamMb;

  /// Свободное хранилище в МБ
  late final _i1.ColumnInt freeStorageMb;

  /// Язык интерфейса устройства (ISO 639-1)
  late final _i1.ColumnString deviceLanguage;

  /// Включён ли режим энергосбережения
  late final _i1.ColumnBool isLowPowerMode;

  /// Версия клиентского SDK
  late final _i1.ColumnString sdkVersion;

  /// IP-адрес клиента (из заголовков, анонимизируется)
  late final _i1.ColumnString ipAddress;

  /// User-Agent клиента
  late final _i1.ColumnString userAgent;

  /// Страна по IP (GeoIP lookup, если доступно)
  late final _i1.ColumnString country;

  /// Статус ответа (blocked, update_available, active, error)
  late final _i1.ColumnEnum<_i5.ResponseStatusType> responseStatus;

  /// Приоритет обновления в ответе
  late final _i1.ColumnEnum<_i6.UpdatePriorityType> updatePriority;

  /// Время обработки запроса на сервере в мс
  late final _i1.ColumnInt processingTimeMs;

  /// Первая ли это проверка с данного устройства для этого приложения
  late final _i1.ColumnBool isFirstCheck;

  /// Новая ли это версия (не встречалась ранее для этого deviceId)
  late final _i1.ColumnBool isNewVersion;

  /// Время выполнения проверки
  late final _i1.ColumnDateTime checkedAt;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: VersionCheckLog.t.applicationId,
      foreignField: _i2.Application.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ApplicationTable(tableRelation: foreignTableRelation),
    );
    return _application!;
  }

  _i3.VersionTable get version {
    if (_version != null) return _version!;
    _version = _i1.createRelationTable(
      relationFieldName: 'version',
      field: VersionCheckLog.t.versionId,
      foreignField: _i3.Version.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VersionTable(tableRelation: foreignTableRelation),
    );
    return _version!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    applicationId,
    versionId,
    versionNumber,
    buildNumber,
    platform,
    osVersion,
    deviceId,
    locale,
    deviceModel,
    screenWidth,
    screenHeight,
    timezone,
    frameworkVersion,
    connectionType,
    buildType,
    cpuArchitecture,
    totalRamMb,
    freeStorageMb,
    deviceLanguage,
    isLowPowerMode,
    sdkVersion,
    ipAddress,
    userAgent,
    country,
    responseStatus,
    updatePriority,
    processingTimeMs,
    isFirstCheck,
    isNewVersion,
    checkedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'application') {
      return application;
    }
    if (relationField == 'version') {
      return version;
    }
    return null;
  }
}

class VersionCheckLogInclude extends _i1.IncludeObject {
  VersionCheckLogInclude._({
    _i2.ApplicationInclude? application,
    _i3.VersionInclude? version,
  }) {
    _application = application;
    _version = version;
  }

  _i2.ApplicationInclude? _application;

  _i3.VersionInclude? _version;

  @override
  Map<String, _i1.Include?> get includes => {
    'application': _application,
    'version': _version,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => VersionCheckLog.t;
}

class VersionCheckLogIncludeList extends _i1.IncludeList {
  VersionCheckLogIncludeList._({
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VersionCheckLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => VersionCheckLog.t;
}

class VersionCheckLogRepository {
  const VersionCheckLogRepository._();

  final attachRow = const VersionCheckLogAttachRowRepository._();

  final detachRow = const VersionCheckLogDetachRowRepository._();

  /// Returns a list of [VersionCheckLog]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<VersionCheckLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    _i1.Transaction? transaction,
    VersionCheckLogInclude? include,
  }) async {
    return session.db.find<VersionCheckLog>(
      where: where?.call(VersionCheckLog.t),
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderByList: orderByList?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [VersionCheckLog] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<VersionCheckLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    _i1.Transaction? transaction,
    VersionCheckLogInclude? include,
  }) async {
    return session.db.findFirstRow<VersionCheckLog>(
      where: where?.call(VersionCheckLog.t),
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderByList: orderByList?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VersionCheckLog] by its [id] or null if no such row exists.
  Future<VersionCheckLog?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VersionCheckLogInclude? include,
  }) async {
    return session.db.findById<VersionCheckLog>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [VersionCheckLog]s in the list and returns the inserted rows.
  ///
  /// The returned [VersionCheckLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VersionCheckLog>> insert(
    _i1.Session session,
    List<VersionCheckLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VersionCheckLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VersionCheckLog] and returns the inserted row.
  ///
  /// The returned [VersionCheckLog] will have its `id` field set.
  Future<VersionCheckLog> insertRow(
    _i1.Session session,
    VersionCheckLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VersionCheckLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VersionCheckLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VersionCheckLog>> update(
    _i1.Session session,
    List<VersionCheckLog> rows, {
    _i1.ColumnSelections<VersionCheckLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VersionCheckLog>(
      rows,
      columns: columns?.call(VersionCheckLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VersionCheckLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VersionCheckLog> updateRow(
    _i1.Session session,
    VersionCheckLog row, {
    _i1.ColumnSelections<VersionCheckLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VersionCheckLog>(
      row,
      columns: columns?.call(VersionCheckLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VersionCheckLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VersionCheckLog?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<VersionCheckLogUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VersionCheckLog>(
      id,
      columnValues: columnValues(VersionCheckLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VersionCheckLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VersionCheckLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VersionCheckLogUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<VersionCheckLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VersionCheckLog>(
      columnValues: columnValues(VersionCheckLog.t.updateTable),
      where: where(VersionCheckLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderByList: orderByList?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VersionCheckLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VersionCheckLog>> delete(
    _i1.Session session,
    List<VersionCheckLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VersionCheckLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VersionCheckLog].
  Future<VersionCheckLog> deleteRow(
    _i1.Session session,
    VersionCheckLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VersionCheckLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VersionCheckLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VersionCheckLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VersionCheckLog>(
      where: where(VersionCheckLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VersionCheckLog>(
      where: where?.call(VersionCheckLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VersionCheckLogAttachRowRepository {
  const VersionCheckLogAttachRowRepository._();

  /// Creates a relation between the given [VersionCheckLog] and [Application]
  /// by setting the [VersionCheckLog]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    VersionCheckLog versionCheckLog,
    _i2.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckLog.id == null) {
      throw ArgumentError.notNull('versionCheckLog.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $versionCheckLog = versionCheckLog.copyWith(
      applicationId: application.id,
    );
    await session.db.updateRow<VersionCheckLog>(
      $versionCheckLog,
      columns: [VersionCheckLog.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [VersionCheckLog] and [Version]
  /// by setting the [VersionCheckLog]'s foreign key `versionId` to refer to the [Version].
  Future<void> version(
    _i1.Session session,
    VersionCheckLog versionCheckLog,
    _i3.Version version, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckLog.id == null) {
      throw ArgumentError.notNull('versionCheckLog.id');
    }
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $versionCheckLog = versionCheckLog.copyWith(versionId: version.id);
    await session.db.updateRow<VersionCheckLog>(
      $versionCheckLog,
      columns: [VersionCheckLog.t.versionId],
      transaction: transaction,
    );
  }
}

class VersionCheckLogDetachRowRepository {
  const VersionCheckLogDetachRowRepository._();

  /// Detaches the relation between this [VersionCheckLog] and the [Version] set in `version`
  /// by setting the [VersionCheckLog]'s foreign key `versionId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> version(
    _i1.Session session,
    VersionCheckLog versionCheckLog, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckLog.id == null) {
      throw ArgumentError.notNull('versionCheckLog.id');
    }

    var $versionCheckLog = versionCheckLog.copyWith(versionId: null);
    await session.db.updateRow<VersionCheckLog>(
      $versionCheckLog,
      columns: [VersionCheckLog.t.versionId],
      transaction: transaction,
    );
  }
}
