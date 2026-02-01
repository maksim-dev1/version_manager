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
import '../auth/auth_session.dart' as _i2;
import '../auth/verification_code.dart' as _i3;
import '../teams/team.dart' as _i4;
import '../teams/team_member.dart' as _i5;
import '../apps/application.dart' as _i6;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i7;

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
    this.emailVerifiedAt,
    bool? isActive,
    this.lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.sessions,
    this.verificationCodes,
    this.ownedTeams,
    this.teamMemberships,
    this.sentTeamInvites,
    this.ownedApplications,
  }) : isEmailVerified = isEmailVerified ?? false,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory User({
    _i1.UuidValue? id,
    required String email,
    required String passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    DateTime? emailVerifiedAt,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.AuthSession>? sessions,
    List<_i3.VerificationCode>? verificationCodes,
    List<_i4.Team>? ownedTeams,
    List<_i5.TeamMember>? teamMemberships,
    List<_i5.TeamMember>? sentTeamInvites,
    List<_i6.Application>? ownedApplications,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      email: jsonSerialization['email'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      displayName: jsonSerialization['displayName'] as String?,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      phone: jsonSerialization['phone'] as String?,
      isEmailVerified: jsonSerialization['isEmailVerified'] as bool?,
      emailVerifiedAt: jsonSerialization['emailVerifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['emailVerifiedAt'],
            ),
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
      sessions: jsonSerialization['sessions'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i2.AuthSession>>(
              jsonSerialization['sessions'],
            ),
      verificationCodes: jsonSerialization['verificationCodes'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i3.VerificationCode>>(
              jsonSerialization['verificationCodes'],
            ),
      ownedTeams: jsonSerialization['ownedTeams'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i4.Team>>(
              jsonSerialization['ownedTeams'],
            ),
      teamMemberships: jsonSerialization['teamMemberships'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i5.TeamMember>>(
              jsonSerialization['teamMemberships'],
            ),
      sentTeamInvites: jsonSerialization['sentTeamInvites'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i5.TeamMember>>(
              jsonSerialization['sentTeamInvites'],
            ),
      ownedApplications: jsonSerialization['ownedApplications'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.Application>>(
              jsonSerialization['ownedApplications'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  String email;

  String passwordHash;

  String? firstName;

  String? lastName;

  String? displayName;

  String? avatarUrl;

  String? phone;

  bool isEmailVerified;

  DateTime? emailVerifiedAt;

  bool isActive;

  DateTime? lastLoginAt;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.AuthSession>? sessions;

  List<_i3.VerificationCode>? verificationCodes;

  List<_i4.Team>? ownedTeams;

  List<_i5.TeamMember>? teamMemberships;

  List<_i5.TeamMember>? sentTeamInvites;

  List<_i6.Application>? ownedApplications;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    _i1.UuidValue? id,
    String? email,
    String? passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    DateTime? emailVerifiedAt,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.AuthSession>? sessions,
    List<_i3.VerificationCode>? verificationCodes,
    List<_i4.Team>? ownedTeams,
    List<_i5.TeamMember>? teamMemberships,
    List<_i5.TeamMember>? sentTeamInvites,
    List<_i6.Application>? ownedApplications,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id?.toJson(),
      'email': email,
      'passwordHash': passwordHash,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (phone != null) 'phone': phone,
      'isEmailVerified': isEmailVerified,
      if (emailVerifiedAt != null) 'emailVerifiedAt': emailVerifiedAt?.toJson(),
      'isActive': isActive,
      if (lastLoginAt != null) 'lastLoginAt': lastLoginAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (sessions != null)
        'sessions': sessions?.toJson(valueToJson: (v) => v.toJson()),
      if (verificationCodes != null)
        'verificationCodes': verificationCodes?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (ownedTeams != null)
        'ownedTeams': ownedTeams?.toJson(valueToJson: (v) => v.toJson()),
      if (teamMemberships != null)
        'teamMemberships': teamMemberships?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (sentTeamInvites != null)
        'sentTeamInvites': sentTeamInvites?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (ownedApplications != null)
        'ownedApplications': ownedApplications?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
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
    _i1.UuidValue? id,
    required String email,
    required String passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    DateTime? emailVerifiedAt,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.AuthSession>? sessions,
    List<_i3.VerificationCode>? verificationCodes,
    List<_i4.Team>? ownedTeams,
    List<_i5.TeamMember>? teamMemberships,
    List<_i5.TeamMember>? sentTeamInvites,
    List<_i6.Application>? ownedApplications,
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
         emailVerifiedAt: emailVerifiedAt,
         isActive: isActive,
         lastLoginAt: lastLoginAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
         sessions: sessions,
         verificationCodes: verificationCodes,
         ownedTeams: ownedTeams,
         teamMemberships: teamMemberships,
         sentTeamInvites: sentTeamInvites,
         ownedApplications: ownedApplications,
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
    Object? emailVerifiedAt = _Undefined,
    bool? isActive,
    Object? lastLoginAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? sessions = _Undefined,
    Object? verificationCodes = _Undefined,
    Object? ownedTeams = _Undefined,
    Object? teamMemberships = _Undefined,
    Object? sentTeamInvites = _Undefined,
    Object? ownedApplications = _Undefined,
  }) {
    return User(
      id: id is _i1.UuidValue? ? id : this.id,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      phone: phone is String? ? phone : this.phone,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      emailVerifiedAt: emailVerifiedAt is DateTime?
          ? emailVerifiedAt
          : this.emailVerifiedAt,
      isActive: isActive ?? this.isActive,
      lastLoginAt: lastLoginAt is DateTime? ? lastLoginAt : this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sessions: sessions is List<_i2.AuthSession>?
          ? sessions
          : this.sessions?.map((e0) => e0.copyWith()).toList(),
      verificationCodes: verificationCodes is List<_i3.VerificationCode>?
          ? verificationCodes
          : this.verificationCodes?.map((e0) => e0.copyWith()).toList(),
      ownedTeams: ownedTeams is List<_i4.Team>?
          ? ownedTeams
          : this.ownedTeams?.map((e0) => e0.copyWith()).toList(),
      teamMemberships: teamMemberships is List<_i5.TeamMember>?
          ? teamMemberships
          : this.teamMemberships?.map((e0) => e0.copyWith()).toList(),
      sentTeamInvites: sentTeamInvites is List<_i5.TeamMember>?
          ? sentTeamInvites
          : this.sentTeamInvites?.map((e0) => e0.copyWith()).toList(),
      ownedApplications: ownedApplications is List<_i6.Application>?
          ? ownedApplications
          : this.ownedApplications?.map((e0) => e0.copyWith()).toList(),
    );
  }
}
