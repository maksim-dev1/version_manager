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

abstract class SendCodeResponse implements _i1.SerializableModel {
  SendCodeResponse._({
    required this.success,
    this.retryAfterSeconds,
  });

  factory SendCodeResponse({
    required bool success,
    int? retryAfterSeconds,
  }) = _SendCodeResponseImpl;

  factory SendCodeResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return SendCodeResponse(
      success: jsonSerialization['success'] as bool,
      retryAfterSeconds: jsonSerialization['retryAfterSeconds'] as int?,
    );
  }

  bool success;

  int? retryAfterSeconds;

  /// Returns a shallow copy of this [SendCodeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SendCodeResponse copyWith({
    bool? success,
    int? retryAfterSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SendCodeResponse',
      'success': success,
      if (retryAfterSeconds != null) 'retryAfterSeconds': retryAfterSeconds,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SendCodeResponseImpl extends SendCodeResponse {
  _SendCodeResponseImpl({
    required bool success,
    int? retryAfterSeconds,
  }) : super._(
         success: success,
         retryAfterSeconds: retryAfterSeconds,
       );

  /// Returns a shallow copy of this [SendCodeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SendCodeResponse copyWith({
    bool? success,
    Object? retryAfterSeconds = _Undefined,
  }) {
    return SendCodeResponse(
      success: success ?? this.success,
      retryAfterSeconds: retryAfterSeconds is int?
          ? retryAfterSeconds
          : this.retryAfterSeconds,
    );
  }
}
