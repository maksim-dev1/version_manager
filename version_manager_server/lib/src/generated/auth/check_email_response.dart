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

abstract class CheckEmailResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CheckEmailResponse._({required this.exists});

  factory CheckEmailResponse({required bool exists}) = _CheckEmailResponseImpl;

  factory CheckEmailResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return CheckEmailResponse(exists: jsonSerialization['exists'] as bool);
  }

  bool exists;

  /// Returns a shallow copy of this [CheckEmailResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CheckEmailResponse copyWith({bool? exists});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CheckEmailResponse',
      'exists': exists,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CheckEmailResponse',
      'exists': exists,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CheckEmailResponseImpl extends CheckEmailResponse {
  _CheckEmailResponseImpl({required bool exists}) : super._(exists: exists);

  /// Returns a shallow copy of this [CheckEmailResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CheckEmailResponse copyWith({bool? exists}) {
    return CheckEmailResponse(exists: exists ?? this.exists);
  }
}
