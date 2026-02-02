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

abstract class CheckEmailAndSendCodeResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CheckEmailAndSendCodeResponse._({
    required this.existsEmail,
    required this.codeSent,
    this.retryAfterSeconds,
  });

  factory CheckEmailAndSendCodeResponse({
    required bool existsEmail,
    required bool codeSent,
    int? retryAfterSeconds,
  }) = _CheckEmailAndSendCodeResponseImpl;

  factory CheckEmailAndSendCodeResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CheckEmailAndSendCodeResponse(
      existsEmail: jsonSerialization['existsEmail'] as bool,
      codeSent: jsonSerialization['codeSent'] as bool,
      retryAfterSeconds: jsonSerialization['retryAfterSeconds'] as int?,
    );
  }

  bool existsEmail;

  bool codeSent;

  int? retryAfterSeconds;

  /// Returns a shallow copy of this [CheckEmailAndSendCodeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CheckEmailAndSendCodeResponse copyWith({
    bool? existsEmail,
    bool? codeSent,
    int? retryAfterSeconds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CheckEmailAndSendCodeResponse',
      'existsEmail': existsEmail,
      'codeSent': codeSent,
      if (retryAfterSeconds != null) 'retryAfterSeconds': retryAfterSeconds,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CheckEmailAndSendCodeResponse',
      'existsEmail': existsEmail,
      'codeSent': codeSent,
      if (retryAfterSeconds != null) 'retryAfterSeconds': retryAfterSeconds,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CheckEmailAndSendCodeResponseImpl extends CheckEmailAndSendCodeResponse {
  _CheckEmailAndSendCodeResponseImpl({
    required bool existsEmail,
    required bool codeSent,
    int? retryAfterSeconds,
  }) : super._(
         existsEmail: existsEmail,
         codeSent: codeSent,
         retryAfterSeconds: retryAfterSeconds,
       );

  /// Returns a shallow copy of this [CheckEmailAndSendCodeResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CheckEmailAndSendCodeResponse copyWith({
    bool? existsEmail,
    bool? codeSent,
    Object? retryAfterSeconds = _Undefined,
  }) {
    return CheckEmailAndSendCodeResponse(
      existsEmail: existsEmail ?? this.existsEmail,
      codeSent: codeSent ?? this.codeSent,
      retryAfterSeconds: retryAfterSeconds is int?
          ? retryAfterSeconds
          : this.retryAfterSeconds,
    );
  }
}
