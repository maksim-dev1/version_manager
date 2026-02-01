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

abstract class SuccessResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SuccessResponse._({
    required this.success,
    this.message,
  });

  factory SuccessResponse({
    required bool success,
    String? message,
  }) = _SuccessResponseImpl;

  factory SuccessResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return SuccessResponse(
      success: jsonSerialization['success'] as bool,
      message: jsonSerialization['message'] as String?,
    );
  }

  bool success;

  String? message;

  /// Returns a shallow copy of this [SuccessResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SuccessResponse copyWith({
    bool? success,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SuccessResponse',
      'success': success,
      if (message != null) 'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SuccessResponse',
      'success': success,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SuccessResponseImpl extends SuccessResponse {
  _SuccessResponseImpl({
    required bool success,
    String? message,
  }) : super._(
         success: success,
         message: message,
       );

  /// Returns a shallow copy of this [SuccessResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SuccessResponse copyWith({
    bool? success,
    Object? message = _Undefined,
  }) {
    return SuccessResponse(
      success: success ?? this.success,
      message: message is String? ? message : this.message,
    );
  }
}
