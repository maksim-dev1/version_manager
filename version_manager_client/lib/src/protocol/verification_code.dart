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
import 'enums/verification_code_type.dart' as _i2;

abstract class VerificationCode implements _i1.SerializableModel {
  VerificationCode._({
    this.id,
    this.userId,
    required this.email,
    required this.code,
    required this.type,
    int? attempts,
    int? maxAttempts,
    required this.expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) : attempts = attempts ?? 0,
       maxAttempts = maxAttempts ?? 5,
       createdAt = createdAt ?? DateTime.now(),
       isUsed = isUsed ?? false;

  factory VerificationCode({
    int? id,
    int? userId,
    required String email,
    required String code,
    required _i2.VerificationCodeType type,
    int? attempts,
    int? maxAttempts,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) = _VerificationCodeImpl;

  factory VerificationCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return VerificationCode(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      email: jsonSerialization['email'] as String,
      code: jsonSerialization['code'] as String,
      type: _i2.VerificationCodeType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      attempts: jsonSerialization['attempts'] as int?,
      maxAttempts: jsonSerialization['maxAttempts'] as int?,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isUsed: jsonSerialization['isUsed'] as bool?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? userId;

  String email;

  String code;

  _i2.VerificationCodeType type;

  int attempts;

  int maxAttempts;

  DateTime expiresAt;

  DateTime createdAt;

  bool isUsed;

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VerificationCode copyWith({
    int? id,
    int? userId,
    String? email,
    String? code,
    _i2.VerificationCodeType? type,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VerificationCode',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'email': email,
      'code': code,
      'type': type.toJson(),
      'attempts': attempts,
      'maxAttempts': maxAttempts,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isUsed': isUsed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VerificationCodeImpl extends VerificationCode {
  _VerificationCodeImpl({
    int? id,
    int? userId,
    required String email,
    required String code,
    required _i2.VerificationCodeType type,
    int? attempts,
    int? maxAttempts,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) : super._(
         id: id,
         userId: userId,
         email: email,
         code: code,
         type: type,
         attempts: attempts,
         maxAttempts: maxAttempts,
         expiresAt: expiresAt,
         createdAt: createdAt,
         isUsed: isUsed,
       );

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VerificationCode copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    String? email,
    String? code,
    _i2.VerificationCodeType? type,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) {
    return VerificationCode(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      email: email ?? this.email,
      code: code ?? this.code,
      type: type ?? this.type,
      attempts: attempts ?? this.attempts,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      isUsed: isUsed ?? this.isUsed,
    );
  }
}
