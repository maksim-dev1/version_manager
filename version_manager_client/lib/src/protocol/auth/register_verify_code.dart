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

abstract class RegisterVerifyCodeRequest implements _i1.SerializableModel {
  RegisterVerifyCodeRequest._({
    required this.email,
    required this.code,
  });

  factory RegisterVerifyCodeRequest({
    required String email,
    required String code,
  }) = _RegisterVerifyCodeRequestImpl;

  factory RegisterVerifyCodeRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RegisterVerifyCodeRequest(
      email: jsonSerialization['email'] as String,
      code: jsonSerialization['code'] as String,
    );
  }

  String email;

  String code;

  /// Returns a shallow copy of this [RegisterVerifyCodeRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RegisterVerifyCodeRequest copyWith({
    String? email,
    String? code,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegisterVerifyCodeRequest',
      'email': email,
      'code': code,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RegisterVerifyCodeRequestImpl extends RegisterVerifyCodeRequest {
  _RegisterVerifyCodeRequestImpl({
    required String email,
    required String code,
  }) : super._(
         email: email,
         code: code,
       );

  /// Returns a shallow copy of this [RegisterVerifyCodeRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RegisterVerifyCodeRequest copyWith({
    String? email,
    String? code,
  }) {
    return RegisterVerifyCodeRequest(
      email: email ?? this.email,
      code: code ?? this.code,
    );
  }
}
