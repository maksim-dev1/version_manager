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
import 'package:version_manager_client/src/protocol/protocol.dart' as _i3;

abstract class AuthSession implements _i1.SerializableModel {
  AuthSession._({
    this.id,
    required this.userId,
    this.user,
    required this.tokenHash,
    required this.refreshTokenHash,
    this.deviceInfo,
    this.ipAddress,
    this.userAgent,
    required this.expiresAt,
    required this.refreshExpiresAt,
    DateTime? createdAt,
    this.lastActivityAt,
    bool? isActive,
    this.revokedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       isActive = isActive ?? true;

  factory AuthSession({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String tokenHash,
    required String refreshTokenHash,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    required DateTime expiresAt,
    required DateTime refreshExpiresAt,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isActive,
    DateTime? revokedAt,
  }) = _AuthSessionImpl;

  factory AuthSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthSession(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i3.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      tokenHash: jsonSerialization['tokenHash'] as String,
      refreshTokenHash: jsonSerialization['refreshTokenHash'] as String,
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      refreshExpiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['refreshExpiresAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastActivityAt: jsonSerialization['lastActivityAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActivityAt'],
            ),
      isActive: jsonSerialization['isActive'] as bool?,
      revokedAt: jsonSerialization['revokedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['revokedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue userId;

  _i2.User? user;

  String tokenHash;

  String refreshTokenHash;

  String? deviceInfo;

  String? ipAddress;

  String? userAgent;

  DateTime expiresAt;

  DateTime refreshExpiresAt;

  DateTime createdAt;

  DateTime? lastActivityAt;

  bool isActive;

  DateTime? revokedAt;

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthSession copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? tokenHash,
    String? refreshTokenHash,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? expiresAt,
    DateTime? refreshExpiresAt,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isActive,
    DateTime? revokedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthSession',
      if (id != null) 'id': id?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'tokenHash': tokenHash,
      'refreshTokenHash': refreshTokenHash,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'expiresAt': expiresAt.toJson(),
      'refreshExpiresAt': refreshExpiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'isActive': isActive,
      if (revokedAt != null) 'revokedAt': revokedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthSessionImpl extends AuthSession {
  _AuthSessionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue userId,
    _i2.User? user,
    required String tokenHash,
    required String refreshTokenHash,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    required DateTime expiresAt,
    required DateTime refreshExpiresAt,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isActive,
    DateTime? revokedAt,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         tokenHash: tokenHash,
         refreshTokenHash: refreshTokenHash,
         deviceInfo: deviceInfo,
         ipAddress: ipAddress,
         userAgent: userAgent,
         expiresAt: expiresAt,
         refreshExpiresAt: refreshExpiresAt,
         createdAt: createdAt,
         lastActivityAt: lastActivityAt,
         isActive: isActive,
         revokedAt: revokedAt,
       );

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthSession copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    String? tokenHash,
    String? refreshTokenHash,
    Object? deviceInfo = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    DateTime? expiresAt,
    DateTime? refreshExpiresAt,
    DateTime? createdAt,
    Object? lastActivityAt = _Undefined,
    bool? isActive,
    Object? revokedAt = _Undefined,
  }) {
    return AuthSession(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      tokenHash: tokenHash ?? this.tokenHash,
      refreshTokenHash: refreshTokenHash ?? this.refreshTokenHash,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      expiresAt: expiresAt ?? this.expiresAt,
      refreshExpiresAt: refreshExpiresAt ?? this.refreshExpiresAt,
      createdAt: createdAt ?? this.createdAt,
      lastActivityAt: lastActivityAt is DateTime?
          ? lastActivityAt
          : this.lastActivityAt,
      isActive: isActive ?? this.isActive,
      revokedAt: revokedAt is DateTime? ? revokedAt : this.revokedAt,
    );
  }
}
