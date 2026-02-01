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

abstract class CheckEmailRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CheckEmailRequest._({required this.email});

  factory CheckEmailRequest({required String email}) = _CheckEmailRequestImpl;

  factory CheckEmailRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return CheckEmailRequest(email: jsonSerialization['email'] as String);
  }

  String email;

  /// Returns a shallow copy of this [CheckEmailRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CheckEmailRequest copyWith({String? email});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CheckEmailRequest',
      'email': email,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CheckEmailRequest',
      'email': email,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CheckEmailRequestImpl extends CheckEmailRequest {
  _CheckEmailRequestImpl({required String email}) : super._(email: email);

  /// Returns a shallow copy of this [CheckEmailRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CheckEmailRequest copyWith({String? email}) {
    return CheckEmailRequest(email: email ?? this.email);
  }
}
