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

abstract class UserPublic
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UserPublic._({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.displayName,
    this.avatarUrl,
    required this.isEmailVerified,
    required this.createdAt,
  });

  factory UserPublic({
    required _i1.UuidValue id,
    required String email,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    required bool isEmailVerified,
    required DateTime createdAt,
  }) = _UserPublicImpl;

  factory UserPublic.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserPublic(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      email: jsonSerialization['email'] as String,
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      displayName: jsonSerialization['displayName'] as String?,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      isEmailVerified: jsonSerialization['isEmailVerified'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  _i1.UuidValue id;

  String email;

  String? firstName;

  String? lastName;

  String? displayName;

  String? avatarUrl;

  bool isEmailVerified;

  DateTime createdAt;

  /// Returns a shallow copy of this [UserPublic]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserPublic copyWith({
    _i1.UuidValue? id,
    String? email,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    bool? isEmailVerified,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UserPublic',
      'id': id.toJson(),
      'email': email,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'isEmailVerified': isEmailVerified,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UserPublic',
      'id': id.toJson(),
      'email': email,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      'isEmailVerified': isEmailVerified,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserPublicImpl extends UserPublic {
  _UserPublicImpl({
    required _i1.UuidValue id,
    required String email,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    required bool isEmailVerified,
    required DateTime createdAt,
  }) : super._(
         id: id,
         email: email,
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         avatarUrl: avatarUrl,
         isEmailVerified: isEmailVerified,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [UserPublic]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserPublic copyWith({
    _i1.UuidValue? id,
    String? email,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? displayName = _Undefined,
    Object? avatarUrl = _Undefined,
    bool? isEmailVerified,
    DateTime? createdAt,
  }) {
    return UserPublic(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
