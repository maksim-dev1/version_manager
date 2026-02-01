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

abstract class VerificationCodeSentResult implements _i1.SerializableModel {
  VerificationCodeSentResult._({
    required this.verificationId,
    required this.email,
    required this.expiresAt,
    required this.attemptsLeft,
  });

  factory VerificationCodeSentResult({
    required int verificationId,
    required String email,
    required DateTime expiresAt,
    required int attemptsLeft,
  }) = _VerificationCodeSentResultImpl;

  factory VerificationCodeSentResult.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VerificationCodeSentResult(
      verificationId: jsonSerialization['verificationId'] as int,
      email: jsonSerialization['email'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      attemptsLeft: jsonSerialization['attemptsLeft'] as int,
    );
  }

  int verificationId;

  String email;

  DateTime expiresAt;

  int attemptsLeft;

  /// Returns a shallow copy of this [VerificationCodeSentResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VerificationCodeSentResult copyWith({
    int? verificationId,
    String? email,
    DateTime? expiresAt,
    int? attemptsLeft,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VerificationCodeSentResult',
      'verificationId': verificationId,
      'email': email,
      'expiresAt': expiresAt.toJson(),
      'attemptsLeft': attemptsLeft,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VerificationCodeSentResultImpl extends VerificationCodeSentResult {
  _VerificationCodeSentResultImpl({
    required int verificationId,
    required String email,
    required DateTime expiresAt,
    required int attemptsLeft,
  }) : super._(
         verificationId: verificationId,
         email: email,
         expiresAt: expiresAt,
         attemptsLeft: attemptsLeft,
       );

  /// Returns a shallow copy of this [VerificationCodeSentResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VerificationCodeSentResult copyWith({
    int? verificationId,
    String? email,
    DateTime? expiresAt,
    int? attemptsLeft,
  }) {
    return VerificationCodeSentResult(
      verificationId: verificationId ?? this.verificationId,
      email: email ?? this.email,
      expiresAt: expiresAt ?? this.expiresAt,
      attemptsLeft: attemptsLeft ?? this.attemptsLeft,
    );
  }
}
