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

/// Назначение OTP/кода
enum VerificationPurposeType implements _i1.SerializableModel {
  sign_up,
  login,
  reset_password,
  change_email,
  regenerate_api_key;

  static VerificationPurposeType fromJson(String name) {
    switch (name) {
      case 'sign_up':
        return VerificationPurposeType.sign_up;
      case 'login':
        return VerificationPurposeType.login;
      case 'reset_password':
        return VerificationPurposeType.reset_password;
      case 'change_email':
        return VerificationPurposeType.change_email;
      case 'regenerate_api_key':
        return VerificationPurposeType.regenerate_api_key;
      default:
        throw ArgumentError(
          'Value "$name" cannot be converted to "VerificationPurposeType"',
        );
    }
  }

  @override
  String toJson() => name;

  @override
  String toString() => name;
}
