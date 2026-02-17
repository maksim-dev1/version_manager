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
import '../enums/platform_type.dart' as _i2;

/// Запрос проверки версии мобильного приложения.
///
/// Отправляется клиентским SDK при запуске приложения.
/// Содержит обязательные поля для идентификации приложения и версии,
/// а также опциональные поля для сбора анонимной технической статистики.
///
/// ⚠️ Все поля — исключительно технические метрики устройства (non-PII).
/// Для уникальных пользователей используется per-app instance ID:
/// — iOS: identifierForVendor (IDFV) — сбрасывается при удалении
/// — Android: App Instance ID — привязан к экземпляру приложения
/// Не требует ATT dialog, consent popup, disclosure в магазинах.
abstract class CheckVersionRequest implements _i1.SerializableModel {
  CheckVersionRequest._({
    required this.namespace,
    required this.version,
    required this.buildNumber,
    required this.platform,
    this.instanceId,
    this.osVersion,
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
  });

  factory CheckVersionRequest({
    required String namespace,
    required String version,
    required int buildNumber,
    required _i2.PlatformType platform,
    String? instanceId,
    String? osVersion,
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
  }) = _CheckVersionRequestImpl;

  factory CheckVersionRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CheckVersionRequest(
      namespace: jsonSerialization['namespace'] as String,
      version: jsonSerialization['version'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      platform: _i2.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      instanceId: jsonSerialization['instanceId'] as String?,
      osVersion: jsonSerialization['osVersion'] as String?,
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
    );
  }

  /// Уникальный идентификатор приложения (например: com.example.myapp)
  String namespace;

  /// Текущая семантическая версия приложения (MAJOR.MINOR.PATCH)
  String version;

  /// Текущий номер сборки приложения
  int buildNumber;

  /// Платформа устройства (ios, android, web, macos, windows, linux)
  _i2.PlatformType platform;

  /// Идентификатор экземпляра приложения:
  /// — iOS: identifierForVendor (IDFV)
  /// — Android: App Instance ID
  /// Опциональный — старые клиенты могут не отправлять.
  String? instanceId;

  /// Версия операционной системы (например: "17.2.1", "14")
  String? osVersion;

  /// Локаль пользователя (например: "ru_RU", "en_US")
  String? locale;

  /// Модель устройства (например: "iPhone 15 Pro", "Pixel 8")
  String? deviceModel;

  /// Ширина экрана в логических пикселях
  int? screenWidth;

  /// Высота экрана в логических пикселях
  int? screenHeight;

  /// Часовой пояс устройства (IANA, например: "Europe/Moscow")
  String? timezone;

  /// Версия фреймворка (Flutter, React Native и т.д.)
  String? frameworkVersion;

  /// Тип соединения (wifi, cellular, ethernet, none)
  String? connectionType;

  /// Тип сборки (debug, profile, release)
  String? buildType;

  /// Архитектура CPU (arm64, x86_64 и т.д.)
  String? cpuArchitecture;

  /// Общий объём оперативной памяти устройства в МБ
  int? totalRamMb;

  /// Свободное хранилище устройства в МБ
  int? freeStorageMb;

  /// Язык интерфейса устройства (ISO 639-1, например: "ru", "en")
  String? deviceLanguage;

  /// Включён ли режим энергосбережения
  bool? isLowPowerMode;

  /// Версия клиентского SDK проверки версий
  String? sdkVersion;

  /// Returns a shallow copy of this [CheckVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CheckVersionRequest copyWith({
    String? namespace,
    String? version,
    int? buildNumber,
    _i2.PlatformType? platform,
    String? instanceId,
    String? osVersion,
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
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CheckVersionRequest',
      'namespace': namespace,
      'version': version,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      if (instanceId != null) 'instanceId': instanceId,
      if (osVersion != null) 'osVersion': osVersion,
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
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CheckVersionRequestImpl extends CheckVersionRequest {
  _CheckVersionRequestImpl({
    required String namespace,
    required String version,
    required int buildNumber,
    required _i2.PlatformType platform,
    String? instanceId,
    String? osVersion,
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
  }) : super._(
         namespace: namespace,
         version: version,
         buildNumber: buildNumber,
         platform: platform,
         instanceId: instanceId,
         osVersion: osVersion,
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
       );

  /// Returns a shallow copy of this [CheckVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CheckVersionRequest copyWith({
    String? namespace,
    String? version,
    int? buildNumber,
    _i2.PlatformType? platform,
    Object? instanceId = _Undefined,
    Object? osVersion = _Undefined,
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
  }) {
    return CheckVersionRequest(
      namespace: namespace ?? this.namespace,
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
      platform: platform ?? this.platform,
      instanceId: instanceId is String? ? instanceId : this.instanceId,
      osVersion: osVersion is String? ? osVersion : this.osVersion,
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
    );
  }
}
