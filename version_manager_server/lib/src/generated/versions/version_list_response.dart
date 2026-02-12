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
import '../apps/application.dart' as _i2;
import '../versions/version_list_item.dart' as _i3;
import 'package:version_manager_server/src/generated/protocol.dart' as _i4;

/// Ответ со списком версий приложения
abstract class VersionListResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  VersionListResponse._({
    required this.application,
    required this.versions,
  });

  factory VersionListResponse({
    required _i2.Application application,
    required List<_i3.VersionListItem> versions,
  }) = _VersionListResponseImpl;

  factory VersionListResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return VersionListResponse(
      application: _i4.Protocol().deserialize<_i2.Application>(
        jsonSerialization['application'],
      ),
      versions: _i4.Protocol().deserialize<List<_i3.VersionListItem>>(
        jsonSerialization['versions'],
      ),
    );
  }

  /// Приложение (название, иконка)
  _i2.Application application;

  /// Список версий, отсортированный по buildNumber DESC
  List<_i3.VersionListItem> versions;

  /// Returns a shallow copy of this [VersionListResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionListResponse copyWith({
    _i2.Application? application,
    List<_i3.VersionListItem>? versions,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionListResponse',
      'application': application.toJson(),
      'versions': versions.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VersionListResponse',
      'application': application.toJsonForProtocol(),
      'versions': versions.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VersionListResponseImpl extends VersionListResponse {
  _VersionListResponseImpl({
    required _i2.Application application,
    required List<_i3.VersionListItem> versions,
  }) : super._(
         application: application,
         versions: versions,
       );

  /// Returns a shallow copy of this [VersionListResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionListResponse copyWith({
    _i2.Application? application,
    List<_i3.VersionListItem>? versions,
  }) {
    return VersionListResponse(
      application: application ?? this.application.copyWith(),
      versions: versions ?? this.versions.map((e0) => e0.copyWith()).toList(),
    );
  }
}
