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

abstract class InvalidDataException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  InvalidDataException._({
    required this.message,
    this.field,
    this.stackTrace,
  });

  factory InvalidDataException({
    required String message,
    String? field,
    String? stackTrace,
  }) = _InvalidDataExceptionImpl;

  factory InvalidDataException.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return InvalidDataException(
      message: jsonSerialization['message'] as String,
      field: jsonSerialization['field'] as String?,
      stackTrace: jsonSerialization['stackTrace'] as String?,
    );
  }

  String message;

  String? field;

  String? stackTrace;

  /// Returns a shallow copy of this [InvalidDataException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InvalidDataException copyWith({
    String? message,
    String? field,
    String? stackTrace,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InvalidDataException',
      'message': message,
      if (field != null) 'field': field,
      if (stackTrace != null) 'stackTrace': stackTrace,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InvalidDataException',
      'message': message,
      if (field != null) 'field': field,
      if (stackTrace != null) 'stackTrace': stackTrace,
    };
  }

  @override
  String toString() {
    return 'InvalidDataException(message: $message, field: $field, stackTrace: $stackTrace)';
  }
}

class _Undefined {}

class _InvalidDataExceptionImpl extends InvalidDataException {
  _InvalidDataExceptionImpl({
    required String message,
    String? field,
    String? stackTrace,
  }) : super._(
         message: message,
         field: field,
         stackTrace: stackTrace,
       );

  /// Returns a shallow copy of this [InvalidDataException]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InvalidDataException copyWith({
    String? message,
    Object? field = _Undefined,
    Object? stackTrace = _Undefined,
  }) {
    return InvalidDataException(
      message: message ?? this.message,
      field: field is String? ? field : this.field,
      stackTrace: stackTrace is String? ? stackTrace : this.stackTrace,
    );
  }
}
