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
import '../enums/owner_type.dart' as _i3;
import '../apps/store_link_entry.dart' as _i4;
import 'package:version_manager_server/src/generated/protocol.dart' as _i5;

/// Запрос на создание приложения
abstract class CreateApplicationRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateApplicationRequest._({
    required this.namespace,
    required this.name,
    this.description,
    this.iconUrl,
    required this.platforms,
    required this.ownerType,
    this.teamId,
    this.storeLinks,
  });

  factory CreateApplicationRequest({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<_i2.PlatformType> platforms,
    required _i3.OwnerType ownerType,
    _i1.UuidValue? teamId,
    List<_i4.StoreLinkEntry>? storeLinks,
  }) = _CreateApplicationRequestImpl;

  factory CreateApplicationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateApplicationRequest(
      namespace: jsonSerialization['namespace'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      platforms: _i5.Protocol().deserialize<List<_i2.PlatformType>>(
        jsonSerialization['platforms'],
      ),
      ownerType: _i3.OwnerType.fromJson(
        (jsonSerialization['ownerType'] as String),
      ),
      teamId: jsonSerialization['teamId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      storeLinks: jsonSerialization['storeLinks'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.StoreLinkEntry>>(
              jsonSerialization['storeLinks'],
            ),
    );
  }

  String namespace;

  String name;

  String? description;

  String? iconUrl;

  List<_i2.PlatformType> platforms;

  _i3.OwnerType ownerType;

  _i1.UuidValue? teamId;

  List<_i4.StoreLinkEntry>? storeLinks;

  /// Returns a shallow copy of this [CreateApplicationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateApplicationRequest copyWith({
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<_i2.PlatformType>? platforms,
    _i3.OwnerType? ownerType,
    _i1.UuidValue? teamId,
    List<_i4.StoreLinkEntry>? storeLinks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateApplicationRequest',
      'namespace': namespace,
      'name': name,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'platforms': platforms.toJson(valueToJson: (v) => v.toJson()),
      'ownerType': ownerType.toJson(),
      if (teamId != null) 'teamId': teamId?.toJson(),
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateApplicationRequest',
      'namespace': namespace,
      'name': name,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'platforms': platforms.toJson(valueToJson: (v) => v.toJson()),
      'ownerType': ownerType.toJson(),
      if (teamId != null) 'teamId': teamId?.toJson(),
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CreateApplicationRequestImpl extends CreateApplicationRequest {
  _CreateApplicationRequestImpl({
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<_i2.PlatformType> platforms,
    required _i3.OwnerType ownerType,
    _i1.UuidValue? teamId,
    List<_i4.StoreLinkEntry>? storeLinks,
  }) : super._(
         namespace: namespace,
         name: name,
         description: description,
         iconUrl: iconUrl,
         platforms: platforms,
         ownerType: ownerType,
         teamId: teamId,
         storeLinks: storeLinks,
       );

  /// Returns a shallow copy of this [CreateApplicationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateApplicationRequest copyWith({
    String? namespace,
    String? name,
    Object? description = _Undefined,
    Object? iconUrl = _Undefined,
    List<_i2.PlatformType>? platforms,
    _i3.OwnerType? ownerType,
    Object? teamId = _Undefined,
    Object? storeLinks = _Undefined,
  }) {
    return CreateApplicationRequest(
      namespace: namespace ?? this.namespace,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      platforms: platforms ?? this.platforms.map((e0) => e0).toList(),
      ownerType: ownerType ?? this.ownerType,
      teamId: teamId is _i1.UuidValue? ? teamId : this.teamId,
      storeLinks: storeLinks is List<_i4.StoreLinkEntry>?
          ? storeLinks
          : this.storeLinks?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
