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

/// Ответ с ошибкой для публичного API check-version.
///
/// Используется для стандартизированных ошибок REST API:
/// — 400 Bad Request (невалидные данные)
/// — 401 Unauthorized (неверный API ключ)
/// — 404 Not Found (приложение или версия не найдены)
/// — 429 Too Many Requests (rate limit)
/// — 500 Internal Server Error
abstract class CheckVersionErrorResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CheckVersionErrorResponse._({
    required this.errorCode,
    required this.message,
    this.details,
    required this.serverTimestamp,
  });

  factory CheckVersionErrorResponse({
    required String errorCode,
    required String message,
    String? details,
    required DateTime serverTimestamp,
  }) = _CheckVersionErrorResponseImpl;

  factory CheckVersionErrorResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CheckVersionErrorResponse(
      errorCode: jsonSerialization['errorCode'] as String,
      message: jsonSerialization['message'] as String,
      details: jsonSerialization['details'] as String?,
      serverTimestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['serverTimestamp'],
      ),
    );
  }

  /// Код ошибки для программной обработки клиентом.
  /// Примеры: "invalid_api_key", "app_not_found", "version_not_found",
  /// "invalid_request", "rate_limit_exceeded", "internal_error"
  String errorCode;

  /// Человекочитаемое сообщение об ошибке
  String message;

  /// Дополнительные детали ошибки (поле с ошибкой, лимит и т.д.)
  String? details;

  /// Время обработки запроса на сервере
  DateTime serverTimestamp;

  /// Returns a shallow copy of this [CheckVersionErrorResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CheckVersionErrorResponse copyWith({
    String? errorCode,
    String? message,
    String? details,
    DateTime? serverTimestamp,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CheckVersionErrorResponse',
      'errorCode': errorCode,
      'message': message,
      if (details != null) 'details': details,
      'serverTimestamp': serverTimestamp.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CheckVersionErrorResponse',
      'errorCode': errorCode,
      'message': message,
      if (details != null) 'details': details,
      'serverTimestamp': serverTimestamp.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CheckVersionErrorResponseImpl extends CheckVersionErrorResponse {
  _CheckVersionErrorResponseImpl({
    required String errorCode,
    required String message,
    String? details,
    required DateTime serverTimestamp,
  }) : super._(
         errorCode: errorCode,
         message: message,
         details: details,
         serverTimestamp: serverTimestamp,
       );

  /// Returns a shallow copy of this [CheckVersionErrorResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CheckVersionErrorResponse copyWith({
    String? errorCode,
    String? message,
    Object? details = _Undefined,
    DateTime? serverTimestamp,
  }) {
    return CheckVersionErrorResponse(
      errorCode: errorCode ?? this.errorCode,
      message: message ?? this.message,
      details: details is String? ? details : this.details,
      serverTimestamp: serverTimestamp ?? this.serverTimestamp,
    );
  }
}
