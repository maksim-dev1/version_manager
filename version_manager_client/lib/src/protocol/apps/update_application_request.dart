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
import '../apps/store_link_entry.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

/// Запрос на обновление приложения
abstract class UpdateApplicationRequest implements _i1.SerializableModel {
  UpdateApplicationRequest._({
    required this.applicationId,
    this.namespace,
    this.name,
    this.description,
    this.iconUrl,
    this.platforms,
    this.storeLinks,
  });

  factory UpdateApplicationRequest({
    required _i1.UuidValue applicationId,
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<_i2.PlatformType>? platforms,
    List<_i3.StoreLinkEntry>? storeLinks,
  }) = _UpdateApplicationRequestImpl;

  factory UpdateApplicationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateApplicationRequest(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      namespace: jsonSerialization['namespace'] as String?,
      name: jsonSerialization['name'] as String?,
      description: jsonSerialization['description'] as String?,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      platforms: jsonSerialization['platforms'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i2.PlatformType>>(
              jsonSerialization['platforms'],
            ),
      storeLinks: jsonSerialization['storeLinks'] == null
          ? null
          : _i4.Protocol().deserialize<List<_i3.StoreLinkEntry>>(
              jsonSerialization['storeLinks'],
            ),
    );
  }

  _i1.UuidValue applicationId;

  String? namespace;

  String? name;

  String? description;

  String? iconUrl;

  List<_i2.PlatformType>? platforms;

  List<_i3.StoreLinkEntry>? storeLinks;

  /// Returns a shallow copy of this [UpdateApplicationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateApplicationRequest copyWith({
    _i1.UuidValue? applicationId,
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<_i2.PlatformType>? platforms,
    List<_i3.StoreLinkEntry>? storeLinks,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateApplicationRequest',
      'applicationId': applicationId.toJson(),
      if (namespace != null) 'namespace': namespace,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      if (platforms != null)
        'platforms': platforms?.toJson(valueToJson: (v) => v.toJson()),
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateApplicationRequestImpl extends UpdateApplicationRequest {
  _UpdateApplicationRequestImpl({
    required _i1.UuidValue applicationId,
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<_i2.PlatformType>? platforms,
    List<_i3.StoreLinkEntry>? storeLinks,
  }) : super._(
         applicationId: applicationId,
         namespace: namespace,
         name: name,
         description: description,
         iconUrl: iconUrl,
         platforms: platforms,
         storeLinks: storeLinks,
       );

  /// Returns a shallow copy of this [UpdateApplicationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateApplicationRequest copyWith({
    _i1.UuidValue? applicationId,
    Object? namespace = _Undefined,
    Object? name = _Undefined,
    Object? description = _Undefined,
    Object? iconUrl = _Undefined,
    Object? platforms = _Undefined,
    Object? storeLinks = _Undefined,
  }) {
    return UpdateApplicationRequest(
      applicationId: applicationId ?? this.applicationId,
      namespace: namespace is String? ? namespace : this.namespace,
      name: name is String? ? name : this.name,
      description: description is String? ? description : this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      platforms: platforms is List<_i2.PlatformType>?
          ? platforms
          : this.platforms?.map((e0) => e0).toList(),
      storeLinks: storeLinks is List<_i3.StoreLinkEntry>?
          ? storeLinks
          : this.storeLinks?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
