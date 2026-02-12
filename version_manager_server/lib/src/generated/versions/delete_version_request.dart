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

/// Запрос на удаление версии приложения
abstract class DeleteVersionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DeleteVersionRequest._({required this.versionId});

  factory DeleteVersionRequest({required _i1.UuidValue versionId}) =
      _DeleteVersionRequestImpl;

  factory DeleteVersionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DeleteVersionRequest(
      versionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['versionId'],
      ),
    );
  }

  _i1.UuidValue versionId;

  /// Returns a shallow copy of this [DeleteVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DeleteVersionRequest copyWith({_i1.UuidValue? versionId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DeleteVersionRequest',
      'versionId': versionId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DeleteVersionRequest',
      'versionId': versionId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DeleteVersionRequestImpl extends DeleteVersionRequest {
  _DeleteVersionRequestImpl({required _i1.UuidValue versionId})
    : super._(versionId: versionId);

  /// Returns a shallow copy of this [DeleteVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DeleteVersionRequest copyWith({_i1.UuidValue? versionId}) {
    return DeleteVersionRequest(versionId: versionId ?? this.versionId);
  }
}
