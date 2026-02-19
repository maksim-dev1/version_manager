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

/// Экземпляр приложения для подсчёта уникальных пользователей.
///
/// Хранит идентификатор экземпляра приложения:
/// — iOS: identifierForVendor (IDFV) — уникален для приложения, сбрасывается при удалении
/// — Android: App Instance ID — генерируется для конкретного экземпляра
///
/// Это НЕ персональные данные (not PII):
/// — Привязан только к приложению, не к устройству глобально
/// — Не позволяет отслеживать пользователя между приложениями
/// — Сбрасывается при переустановке приложения
/// — Не требует ATT dialog, consent popup, disclosure в магазинах
///
/// Используется для:
/// — Подсчёта уникальных пользователей (DAU/WAU/MAU)
/// — Определения новых пользователей (firstSeenAt)
/// — Кумулятивного роста пользовательской базы
abstract class AppInstance implements _i1.SerializableModel {
  AppInstance._({
    this.id,
    required this.applicationId,
    this.application,
    required this.instanceId,
    required this.platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    this.lastBuildNumber,
  }) : firstSeenAt = firstSeenAt ?? DateTime.now(),
       lastSeenAt = lastSeenAt ?? DateTime.now(),
       lastActiveDate = lastActiveDate ?? DateTime.now();

  factory AppInstance({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String instanceId,
    required _i3.PlatformType platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    int? lastBuildNumber,
  }) = _AppInstanceImpl;

  factory AppInstance.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppInstance(
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
      instanceId: jsonSerialization['instanceId'] as String,
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      firstSeenAt: jsonSerialization['firstSeenAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['firstSeenAt'],
            ),
      lastSeenAt: jsonSerialization['lastSeenAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastSeenAt']),
      lastActiveDate: jsonSerialization['lastActiveDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveDate'],
            ),
      lastBuildNumber: jsonSerialization['lastBuildNumber'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Идентификатор экземпляра (IDFV на iOS / App Instance ID на Android)
  String instanceId;

  /// Платформа
  _i3.PlatformType platform;

  /// Дата первого появления
  DateTime firstSeenAt;

  /// Дата последнего появления
  DateTime lastSeenAt;

  /// Дата последней активности (только дата, без времени, UTC)
  /// Используется для точного подсчёта уникальных устройств за день.
  DateTime lastActiveDate;

  /// Последний номер сборки, на которой был пользователь.
  /// Используется для подсчёта пользователей по текущей версии.
  int? lastBuildNumber;

  /// Returns a shallow copy of this [AppInstance]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppInstance copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    String? instanceId,
    _i3.PlatformType? platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    int? lastBuildNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppInstance',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'instanceId': instanceId,
      'platform': platform.toJson(),
      'firstSeenAt': firstSeenAt.toJson(),
      'lastSeenAt': lastSeenAt.toJson(),
      'lastActiveDate': lastActiveDate.toJson(),
      if (lastBuildNumber != null) 'lastBuildNumber': lastBuildNumber,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppInstanceImpl extends AppInstance {
  _AppInstanceImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String instanceId,
    required _i3.PlatformType platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    int? lastBuildNumber,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         instanceId: instanceId,
         platform: platform,
         firstSeenAt: firstSeenAt,
         lastSeenAt: lastSeenAt,
         lastActiveDate: lastActiveDate,
         lastBuildNumber: lastBuildNumber,
       );

  /// Returns a shallow copy of this [AppInstance]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppInstance copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    String? instanceId,
    _i3.PlatformType? platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    Object? lastBuildNumber = _Undefined,
  }) {
    return AppInstance(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      instanceId: instanceId ?? this.instanceId,
      platform: platform ?? this.platform,
      firstSeenAt: firstSeenAt ?? this.firstSeenAt,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      lastBuildNumber: lastBuildNumber is int?
          ? lastBuildNumber
          : this.lastBuildNumber,
    );
  }
}
