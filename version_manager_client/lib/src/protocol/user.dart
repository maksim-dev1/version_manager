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

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.email,
    required this.passwordHash,
    this.firstName,
    this.lastName,
    this.displayName,
    this.avatarUrl,
    this.phone,
    bool? isEmailVerified,
    bool? isActive,
    this.lastLoginAt,
    DateTime? createdAt,
    this.updatedAt,
  }) : isEmailVerified = isEmailVerified ?? false,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now();

  factory User({
    int? id,
    required String email,
    required String passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      displayName: jsonSerialization['displayName'] as String?,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      phone: jsonSerialization['phone'] as String?,
      isEmailVerified: jsonSerialization['isEmailVerified'] as bool?,
      isActive: jsonSerialization['isActive'] as bool?,
      lastLoginAt: jsonSerialization['lastLoginAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastLoginAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  String passwordHash;

  String? firstName;

  String? lastName;

  String? displayName;

  String? avatarUrl;

  String? phone;

  bool isEmailVerified;

  bool isActive;

  DateTime? lastLoginAt;

  DateTime createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    String? email,
    String? passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id,
      'email': email,
      'passwordHash': passwordHash,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (phone != null) 'phone': phone,
      'isEmailVerified': isEmailVerified,
      'isActive': isActive,
      if (lastLoginAt != null) 'lastLoginAt': lastLoginAt?.toJson(),
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required String email,
    required String passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         email: email,
         passwordHash: passwordHash,
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         avatarUrl: avatarUrl,
         phone: phone,
         isEmailVerified: isEmailVerified,
         isActive: isActive,
         lastLoginAt: lastLoginAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? passwordHash,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? displayName = _Undefined,
    Object? avatarUrl = _Undefined,
    Object? phone = _Undefined,
    bool? isEmailVerified,
    bool? isActive,
    Object? lastLoginAt = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      phone: phone is String? ? phone : this.phone,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isActive: isActive ?? this.isActive,
      lastLoginAt: lastLoginAt is DateTime? ? lastLoginAt : this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
