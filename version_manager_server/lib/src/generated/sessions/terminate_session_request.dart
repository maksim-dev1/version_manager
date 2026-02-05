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

/// Запрос на завершение сессии
abstract class TerminateSessionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TerminateSessionRequest._({required this.sessionId});

  factory TerminateSessionRequest({required _i1.UuidValue sessionId}) =
      _TerminateSessionRequestImpl;

  factory TerminateSessionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TerminateSessionRequest(
      sessionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['sessionId'],
      ),
    );
  }

  _i1.UuidValue sessionId;

  /// Returns a shallow copy of this [TerminateSessionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TerminateSessionRequest copyWith({_i1.UuidValue? sessionId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TerminateSessionRequest',
      'sessionId': sessionId.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TerminateSessionRequest',
      'sessionId': sessionId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TerminateSessionRequestImpl extends TerminateSessionRequest {
  _TerminateSessionRequestImpl({required _i1.UuidValue sessionId})
    : super._(sessionId: sessionId);

  /// Returns a shallow copy of this [TerminateSessionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TerminateSessionRequest copyWith({_i1.UuidValue? sessionId}) {
    return TerminateSessionRequest(sessionId: sessionId ?? this.sessionId);
  }
}
