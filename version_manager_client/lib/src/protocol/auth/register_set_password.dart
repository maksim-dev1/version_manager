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

abstract class RegisterSetPasswordRequest implements _i1.SerializableModel {
  RegisterSetPasswordRequest._({
    required this.email,
    required this.verificationId,
    required this.password,
  });

  factory RegisterSetPasswordRequest({
    required String email,
    required _i1.UuidValue verificationId,
    required String password,
  }) = _RegisterSetPasswordRequestImpl;

  factory RegisterSetPasswordRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RegisterSetPasswordRequest(
      email: jsonSerialization['email'] as String,
      verificationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['verificationId'],
      ),
      password: jsonSerialization['password'] as String,
    );
  }

  String email;

  _i1.UuidValue verificationId;

  String password;

  /// Returns a shallow copy of this [RegisterSetPasswordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RegisterSetPasswordRequest copyWith({
    String? email,
    _i1.UuidValue? verificationId,
    String? password,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegisterSetPasswordRequest',
      'email': email,
      'verificationId': verificationId.toJson(),
      'password': password,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RegisterSetPasswordRequestImpl extends RegisterSetPasswordRequest {
  _RegisterSetPasswordRequestImpl({
    required String email,
    required _i1.UuidValue verificationId,
    required String password,
  }) : super._(
         email: email,
         verificationId: verificationId,
         password: password,
       );

  /// Returns a shallow copy of this [RegisterSetPasswordRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RegisterSetPasswordRequest copyWith({
    String? email,
    _i1.UuidValue? verificationId,
    String? password,
  }) {
    return RegisterSetPasswordRequest(
      email: email ?? this.email,
      verificationId: verificationId ?? this.verificationId,
      password: password ?? this.password,
    );
  }
}
