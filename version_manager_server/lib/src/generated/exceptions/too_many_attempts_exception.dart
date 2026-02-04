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

abstract class TooManyAttemptsException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  TooManyAttemptsException._({
    required this.message,
    this.retryAfterSeconds,
    this.stackTrace,
  });

  factory TooManyAttemptsException({
    required String message,
    int? retryAfterSeconds,
    String? stackTrace,
  }) = _TooManyAttemptsExceptionImpl;

  factory TooManyAttemptsException.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TooManyAttemptsException(
      message: jsonSerialization['message'] as String,
      retryAfterSeconds: jsonSerialization['retryAfterSeconds'] as int?,
      stackTrace: jsonSerialization['stackTrace'] as String?,
    );
  }

  String message;

  int? retryAfterSeconds;

  String? stackTrace;

  /// Returns a shallow copy of this [TooManyAttemptsException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TooManyAttemptsException copyWith({
    String? message,
    int? retryAfterSeconds,
    String? stackTrace,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TooManyAttemptsException',
      'message': message,
      if (retryAfterSeconds != null) 'retryAfterSeconds': retryAfterSeconds,
      if (stackTrace != null) 'stackTrace': stackTrace,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TooManyAttemptsException',
      'message': message,
      if (retryAfterSeconds != null) 'retryAfterSeconds': retryAfterSeconds,
      if (stackTrace != null) 'stackTrace': stackTrace,
    };
  }

  @override
  String toString() {
    return 'TooManyAttemptsException(message: $message, retryAfterSeconds: $retryAfterSeconds, stackTrace: $stackTrace)';
  }
}

class _Undefined {}

class _TooManyAttemptsExceptionImpl extends TooManyAttemptsException {
  _TooManyAttemptsExceptionImpl({
    required String message,
    int? retryAfterSeconds,
    String? stackTrace,
  }) : super._(
         message: message,
         retryAfterSeconds: retryAfterSeconds,
         stackTrace: stackTrace,
       );

  /// Returns a shallow copy of this [TooManyAttemptsException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TooManyAttemptsException copyWith({
    String? message,
    Object? retryAfterSeconds = _Undefined,
    Object? stackTrace = _Undefined,
  }) {
    return TooManyAttemptsException(
      message: message ?? this.message,
      retryAfterSeconds: retryAfterSeconds is int?
          ? retryAfterSeconds
          : this.retryAfterSeconds,
      stackTrace: stackTrace is String? ? stackTrace : this.stackTrace,
    );
  }
}
