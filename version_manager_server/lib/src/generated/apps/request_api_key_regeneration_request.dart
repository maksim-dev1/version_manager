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

/// Запрос на отправку кода подтверждения для регенерации API ключа
abstract class RequestApiKeyRegenerationRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RequestApiKeyRegenerationRequest._({required this.applicationId});

  factory RequestApiKeyRegenerationRequest({
    required _i1.UuidValue applicationId,
  }) = _RequestApiKeyRegenerationRequestImpl;

  factory RequestApiKeyRegenerationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RequestApiKeyRegenerationRequest(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
    );
  }

  _i1.UuidValue applicationId;

  /// Returns a shallow copy of this [RequestApiKeyRegenerationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RequestApiKeyRegenerationRequest copyWith({_i1.UuidValue? applicationId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RequestApiKeyRegenerationRequest',
      'applicationId': applicationId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RequestApiKeyRegenerationRequest',
      'applicationId': applicationId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RequestApiKeyRegenerationRequestImpl
    extends RequestApiKeyRegenerationRequest {
  _RequestApiKeyRegenerationRequestImpl({required _i1.UuidValue applicationId})
    : super._(applicationId: applicationId);

  /// Returns a shallow copy of this [RequestApiKeyRegenerationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RequestApiKeyRegenerationRequest copyWith({_i1.UuidValue? applicationId}) {
    return RequestApiKeyRegenerationRequest(
      applicationId: applicationId ?? this.applicationId,
    );
  }
}
