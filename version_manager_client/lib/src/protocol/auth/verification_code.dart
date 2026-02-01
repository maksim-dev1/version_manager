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
import '../auth/user.dart' as _i2;
import '../enums/verification_putpose_type.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

abstract class VerificationCode implements _i1.SerializableModel {
  VerificationCode._({
    this.id,
    this.userId,
    this.user,
    required this.email,
    required this.purpose,
    required this.codeHash,
    required this.expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    this.usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    this.resendAvailableAt,
    this.ipAddress,
    this.userAgent,
  }) : createdAt = createdAt ?? DateTime.now(),
       isUsed = isUsed ?? false,
       attemptsUsed = attemptsUsed ?? 0,
       maxAttempts = maxAttempts ?? 5;

  factory VerificationCode({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    required String email,
    required _i3.VerificationPurposeType purpose,
    required String codeHash,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    DateTime? usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    DateTime? resendAvailableAt,
    String? ipAddress,
    String? userAgent,
  }) = _VerificationCodeImpl;

  factory VerificationCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return VerificationCode(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: jsonSerialization['userId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      email: jsonSerialization['email'] as String,
      purpose: _i3.VerificationPurposeType.fromJson(
        (jsonSerialization['purpose'] as String),
      ),
      codeHash: jsonSerialization['codeHash'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isUsed: jsonSerialization['isUsed'] as bool?,
      usedAt: jsonSerialization['usedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['usedAt']),
      attemptsUsed: jsonSerialization['attemptsUsed'] as int?,
      maxAttempts: jsonSerialization['maxAttempts'] as int?,
      resendAvailableAt: jsonSerialization['resendAvailableAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['resendAvailableAt'],
            ),
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue? userId;

  _i2.User? user;

  String email;

  _i3.VerificationPurposeType purpose;

  String codeHash;

  DateTime expiresAt;

  DateTime createdAt;

  bool isUsed;

  DateTime? usedAt;

  int attemptsUsed;

  int maxAttempts;

  DateTime? resendAvailableAt;

  String? ipAddress;

  String? userAgent;

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VerificationCode copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? email,
    _i3.VerificationPurposeType? purpose,
    String? codeHash,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    DateTime? usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    DateTime? resendAvailableAt,
    String? ipAddress,
    String? userAgent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VerificationCode',
      if (id != null) 'id': id?.toJson(),
      if (userId != null) 'userId': userId?.toJson(),
      if (user != null) 'user': user?.toJson(),
      'email': email,
      'purpose': purpose.toJson(),
      'codeHash': codeHash,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isUsed': isUsed,
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
      'attemptsUsed': attemptsUsed,
      'maxAttempts': maxAttempts,
      if (resendAvailableAt != null)
        'resendAvailableAt': resendAvailableAt?.toJson(),
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
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
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    required String email,
    required _i3.VerificationPurposeType purpose,
    required String codeHash,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    DateTime? usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    DateTime? resendAvailableAt,
    String? ipAddress,
    String? userAgent,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         email: email,
         purpose: purpose,
         codeHash: codeHash,
         expiresAt: expiresAt,
         createdAt: createdAt,
         isUsed: isUsed,
         usedAt: usedAt,
         attemptsUsed: attemptsUsed,
         maxAttempts: maxAttempts,
         resendAvailableAt: resendAvailableAt,
         ipAddress: ipAddress,
         userAgent: userAgent,
       );

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VerificationCode copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    Object? user = _Undefined,
    String? email,
    _i3.VerificationPurposeType? purpose,
    String? codeHash,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    Object? usedAt = _Undefined,
    int? attemptsUsed,
    int? maxAttempts,
    Object? resendAvailableAt = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
  }) {
    return VerificationCode(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId is _i1.UuidValue? ? userId : this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      email: email ?? this.email,
      purpose: purpose ?? this.purpose,
      codeHash: codeHash ?? this.codeHash,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      isUsed: isUsed ?? this.isUsed,
      usedAt: usedAt is DateTime? ? usedAt : this.usedAt,
      attemptsUsed: attemptsUsed ?? this.attemptsUsed,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      resendAvailableAt: resendAvailableAt is DateTime?
          ? resendAvailableAt
          : this.resendAvailableAt,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
    );
  }
}
