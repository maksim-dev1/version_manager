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

abstract class VerifyCodeResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  VerifyCodeResponse._({
    required this.success,
    this.verificationId,
    this.attemptsLeft,
    this.message,
  });

  factory VerifyCodeResponse({
    required bool success,
    _i1.UuidValue? verificationId,
    int? attemptsLeft,
    String? message,
  }) = _VerifyCodeResponseImpl;

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return VerifyCodeResponse(
      success: jsonSerialization['success'] as bool,
      verificationId: jsonSerialization['verificationId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['verificationId'],
            ),
      attemptsLeft: jsonSerialization['attemptsLeft'] as int?,
      message: jsonSerialization['message'] as String?,
    );
  }

  bool success;

  _i1.UuidValue? verificationId;

  int? attemptsLeft;

  String? message;

  /// Returns a shallow copy of this [VerifyCodeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VerifyCodeResponse copyWith({
    bool? success,
    _i1.UuidValue? verificationId,
    int? attemptsLeft,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VerifyCodeResponse',
      'success': success,
      if (verificationId != null) 'verificationId': verificationId?.toJson(),
      if (attemptsLeft != null) 'attemptsLeft': attemptsLeft,
      if (message != null) 'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VerifyCodeResponse',
      'success': success,
      if (verificationId != null) 'verificationId': verificationId?.toJson(),
      if (attemptsLeft != null) 'attemptsLeft': attemptsLeft,
      if (message != null) 'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VerifyCodeResponseImpl extends VerifyCodeResponse {
  _VerifyCodeResponseImpl({
    required bool success,
    _i1.UuidValue? verificationId,
    int? attemptsLeft,
    String? message,
  }) : super._(
         success: success,
         verificationId: verificationId,
         attemptsLeft: attemptsLeft,
         message: message,
       );

  /// Returns a shallow copy of this [VerifyCodeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VerifyCodeResponse copyWith({
    bool? success,
    Object? verificationId = _Undefined,
    Object? attemptsLeft = _Undefined,
    Object? message = _Undefined,
  }) {
    return VerifyCodeResponse(
      success: success ?? this.success,
      verificationId: verificationId is _i1.UuidValue?
          ? verificationId
          : this.verificationId,
      attemptsLeft: attemptsLeft is int? ? attemptsLeft : this.attemptsLeft,
      message: message is String? ? message : this.message,
    );
  }
}
