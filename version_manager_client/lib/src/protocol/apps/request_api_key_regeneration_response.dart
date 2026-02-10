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

/// Ответ на запрос кода подтверждения для регенерации API ключа
abstract class RequestApiKeyRegenerationResponse
    implements _i1.SerializableModel {
  RequestApiKeyRegenerationResponse._({
    required this.codeSent,
    this.retryAfterSeconds,
    this.maskedEmail,
  });

  factory RequestApiKeyRegenerationResponse({
    required bool codeSent,
    int? retryAfterSeconds,
    String? maskedEmail,
  }) = _RequestApiKeyRegenerationResponseImpl;

  factory RequestApiKeyRegenerationResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RequestApiKeyRegenerationResponse(
      codeSent: jsonSerialization['codeSent'] as bool,
      retryAfterSeconds: jsonSerialization['retryAfterSeconds'] as int?,
      maskedEmail: jsonSerialization['maskedEmail'] as String?,
    );
  }

  bool codeSent;

  int? retryAfterSeconds;

  String? maskedEmail;

  /// Returns a shallow copy of this [RequestApiKeyRegenerationResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequestApiKeyRegenerationResponse copyWith({
    bool? codeSent,
    int? retryAfterSeconds,
    String? maskedEmail,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestApiKeyRegenerationResponse',
      'codeSent': codeSent,
      if (retryAfterSeconds != null) 'retryAfterSeconds': retryAfterSeconds,
      if (maskedEmail != null) 'maskedEmail': maskedEmail,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RequestApiKeyRegenerationResponseImpl
    extends RequestApiKeyRegenerationResponse {
  _RequestApiKeyRegenerationResponseImpl({
    required bool codeSent,
    int? retryAfterSeconds,
    String? maskedEmail,
  }) : super._(
         codeSent: codeSent,
         retryAfterSeconds: retryAfterSeconds,
         maskedEmail: maskedEmail,
       );

  /// Returns a shallow copy of this [RequestApiKeyRegenerationResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequestApiKeyRegenerationResponse copyWith({
    bool? codeSent,
    Object? retryAfterSeconds = _Undefined,
    Object? maskedEmail = _Undefined,
  }) {
    return RequestApiKeyRegenerationResponse(
      codeSent: codeSent ?? this.codeSent,
      retryAfterSeconds: retryAfterSeconds is int?
          ? retryAfterSeconds
          : this.retryAfterSeconds,
      maskedEmail: maskedEmail is String? ? maskedEmail : this.maskedEmail,
    );
  }
}
