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
import 'application.dart' as _i2;
import 'version.dart' as _i3;
import 'enums/platform_type.dart' as _i4;
import 'enums/response_status_type.dart' as _i5;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i6;

/// Лог проверки версии приложения с информацией об устройстве
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
    this.ipAddress,
    required this.responseStatus,
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
    String? ipAddress,
    required _i5.ResponseStatusType responseStatus,
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
          : _i6.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      versionId: jsonSerialization['versionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['versionId']),
      version: jsonSerialization['version'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Version>(
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
      ipAddress: jsonSerialization['ipAddress'] as String?,
      responseStatus: _i5.ResponseStatusType.fromJson(
        (jsonSerialization['responseStatus'] as String),
      ),
      checkedAt: jsonSerialization['checkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['checkedAt']),
    );
  }

  /// Уникальный идентификатор записи лога
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  _i1.UuidValue? versionId;

  /// Версия (может быть NULL если версия не найдена)
  _i3.Version? version;

  /// Номер версии из запроса
  String versionNumber;

  /// Номер сборки из запроса
  int buildNumber;

  /// Платформа устройства
  _i4.PlatformType platform;

  /// Версия операционной системы
  String? osVersion;

  /// Уникальный идентификатор устройства
  String? deviceId;

  /// Локаль пользователя (например, en_US, ru_RU)
  String? locale;

  /// Модель устройства
  String? deviceModel;

  /// IP адрес запроса
  String? ipAddress;

  /// Статус ответа на проверку версии
  _i5.ResponseStatusType responseStatus;

  /// Дата и время проверки
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
    String? ipAddress,
    _i5.ResponseStatusType? responseStatus,
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
      if (ipAddress != null) 'ipAddress': ipAddress,
      'responseStatus': responseStatus.toJson(),
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
    String? ipAddress,
    required _i5.ResponseStatusType responseStatus,
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
         ipAddress: ipAddress,
         responseStatus: responseStatus,
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
    Object? ipAddress = _Undefined,
    _i5.ResponseStatusType? responseStatus,
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
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      responseStatus: responseStatus ?? this.responseStatus,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }
}
