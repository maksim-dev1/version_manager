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

/// Ссылка на магазин
abstract class StoreLink implements _i1.SerializableModel {
  StoreLink._({
    this.id,
    required this.applicationId,
    this.application,
    required this.platform,
    required this.storeName,
    required this.url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory StoreLink({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required _i3.PlatformType platform,
    required String storeName,
    required String url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _StoreLinkImpl;

  factory StoreLink.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoreLink(
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
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      storeName: jsonSerialization['storeName'] as String,
      url: jsonSerialization['url'] as String,
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

  _i2.Application? application;

  _i3.PlatformType platform;

  String storeName;

  String url;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [StoreLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoreLink copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    _i3.PlatformType? platform,
    String? storeName,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoreLink',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'platform': platform.toJson(),
      'storeName': storeName,
      'url': url,
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

class _StoreLinkImpl extends StoreLink {
  _StoreLinkImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required _i3.PlatformType platform,
    required String storeName,
    required String url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         platform: platform,
         storeName: storeName,
         url: url,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoreLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoreLink copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    _i3.PlatformType? platform,
    String? storeName,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoreLink(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      platform: platform ?? this.platform,
      storeName: storeName ?? this.storeName,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
