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

abstract class EmailCheckResult implements _i1.SerializableModel {
  EmailCheckResult._({
    required this.exists,
    required this.canResendCode,
    this.resendAvailableAt,
  });

  factory EmailCheckResult({
    required bool exists,
    required bool canResendCode,
    DateTime? resendAvailableAt,
  }) = _EmailCheckResultImpl;

  factory EmailCheckResult.fromJson(Map<String, dynamic> jsonSerialization) {
    return EmailCheckResult(
      exists: jsonSerialization['exists'] as bool,
      canResendCode: jsonSerialization['canResendCode'] as bool,
      resendAvailableAt: jsonSerialization['resendAvailableAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['resendAvailableAt'],
            ),
    );
  }

  bool exists;

  bool canResendCode;

  DateTime? resendAvailableAt;

  /// Returns a shallow copy of this [EmailCheckResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  EmailCheckResult copyWith({
    bool? exists,
    bool? canResendCode,
    DateTime? resendAvailableAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'EmailCheckResult',
      'exists': exists,
      'canResendCode': canResendCode,
      if (resendAvailableAt != null)
        'resendAvailableAt': resendAvailableAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmailCheckResultImpl extends EmailCheckResult {
  _EmailCheckResultImpl({
    required bool exists,
    required bool canResendCode,
    DateTime? resendAvailableAt,
  }) : super._(
         exists: exists,
         canResendCode: canResendCode,
         resendAvailableAt: resendAvailableAt,
       );

  /// Returns a shallow copy of this [EmailCheckResult]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  EmailCheckResult copyWith({
    bool? exists,
    bool? canResendCode,
    Object? resendAvailableAt = _Undefined,
  }) {
    return EmailCheckResult(
      exists: exists ?? this.exists,
      canResendCode: canResendCode ?? this.canResendCode,
      resendAvailableAt: resendAvailableAt is DateTime?
          ? resendAvailableAt
          : this.resendAvailableAt,
    );
  }
}
