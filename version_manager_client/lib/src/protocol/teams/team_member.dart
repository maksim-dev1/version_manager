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
import '../enums/team_member_status_type.dart' as _i2;
import '../teams/team.dart' as _i3;
import '../auth/user.dart' as _i4;
import '../enums/team_role_type.dart' as _i5;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i6;

/// Участник команды
abstract class TeamMember implements _i1.SerializableModel {
  TeamMember._({
    this.id,
    required this.teamId,
    this.team,
    required this.userId,
    this.user,
    required this.role,
    _i2.TeamMemberStatusType? status,
    this.invitedById,
    this.invitedBy,
    DateTime? invitedAt,
    this.joinedAt,
    this.invitationExpiresAt,
  }) : status = status ?? _i2.TeamMemberStatusType.invited,
       invitedAt = invitedAt ?? DateTime.now();

  factory TeamMember({
    _i1.UuidValue? id,
    required _i1.UuidValue teamId,
    _i3.Team? team,
    required _i1.UuidValue userId,
    _i4.User? user,
    required _i5.TeamRoleType role,
    _i2.TeamMemberStatusType? status,
    _i1.UuidValue? invitedById,
    _i4.User? invitedBy,
    DateTime? invitedAt,
    DateTime? joinedAt,
    DateTime? invitationExpiresAt,
  }) = _TeamMemberImpl;

  factory TeamMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return TeamMember(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      team: jsonSerialization['team'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Team>(jsonSerialization['team']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.User>(jsonSerialization['user']),
      role: _i5.TeamRoleType.fromJson((jsonSerialization['role'] as String)),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.TeamMemberStatusType.fromJson(
              (jsonSerialization['status'] as String),
            ),
      invitedById: jsonSerialization['invitedById'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['invitedById'],
            ),
      invitedBy: jsonSerialization['invitedBy'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.User>(
              jsonSerialization['invitedBy'],
            ),
      invitedAt: jsonSerialization['invitedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['invitedAt']),
      joinedAt: jsonSerialization['joinedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
      invitationExpiresAt: jsonSerialization['invitationExpiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['invitationExpiresAt'],
            ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  _i1.UuidValue teamId;

  _i3.Team? team;

  _i1.UuidValue userId;

  _i4.User? user;

  _i5.TeamRoleType role;

  _i2.TeamMemberStatusType status;

  _i1.UuidValue? invitedById;

  _i4.User? invitedBy;

  DateTime invitedAt;

  DateTime? joinedAt;

  DateTime? invitationExpiresAt;

  /// Returns a shallow copy of this [TeamMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TeamMember copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? teamId,
    _i3.Team? team,
    _i1.UuidValue? userId,
    _i4.User? user,
    _i5.TeamRoleType? role,
    _i2.TeamMemberStatusType? status,
    _i1.UuidValue? invitedById,
    _i4.User? invitedBy,
    DateTime? invitedAt,
    DateTime? joinedAt,
    DateTime? invitationExpiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TeamMember',
      if (id != null) 'id': id?.toJson(),
      'teamId': teamId.toJson(),
      if (team != null) 'team': team?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'role': role.toJson(),
      'status': status.toJson(),
      if (invitedById != null) 'invitedById': invitedById?.toJson(),
      if (invitedBy != null) 'invitedBy': invitedBy?.toJson(),
      'invitedAt': invitedAt.toJson(),
      if (joinedAt != null) 'joinedAt': joinedAt?.toJson(),
      if (invitationExpiresAt != null)
        'invitationExpiresAt': invitationExpiresAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamMemberImpl extends TeamMember {
  _TeamMemberImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue teamId,
    _i3.Team? team,
    required _i1.UuidValue userId,
    _i4.User? user,
    required _i5.TeamRoleType role,
    _i2.TeamMemberStatusType? status,
    _i1.UuidValue? invitedById,
    _i4.User? invitedBy,
    DateTime? invitedAt,
    DateTime? joinedAt,
    DateTime? invitationExpiresAt,
  }) : super._(
         id: id,
         teamId: teamId,
         team: team,
         userId: userId,
         user: user,
         role: role,
         status: status,
         invitedById: invitedById,
         invitedBy: invitedBy,
         invitedAt: invitedAt,
         joinedAt: joinedAt,
         invitationExpiresAt: invitationExpiresAt,
       );

  /// Returns a shallow copy of this [TeamMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TeamMember copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? teamId,
    Object? team = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i5.TeamRoleType? role,
    _i2.TeamMemberStatusType? status,
    Object? invitedById = _Undefined,
    Object? invitedBy = _Undefined,
    DateTime? invitedAt,
    Object? joinedAt = _Undefined,
    Object? invitationExpiresAt = _Undefined,
  }) {
    return TeamMember(
      id: id is _i1.UuidValue? ? id : this.id,
      teamId: teamId ?? this.teamId,
      team: team is _i3.Team? ? team : this.team?.copyWith(),
      userId: userId ?? this.userId,
      user: user is _i4.User? ? user : this.user?.copyWith(),
      role: role ?? this.role,
      status: status ?? this.status,
      invitedById: invitedById is _i1.UuidValue?
          ? invitedById
          : this.invitedById,
      invitedBy: invitedBy is _i4.User?
          ? invitedBy
          : this.invitedBy?.copyWith(),
      invitedAt: invitedAt ?? this.invitedAt,
      joinedAt: joinedAt is DateTime? ? joinedAt : this.joinedAt,
      invitationExpiresAt: invitationExpiresAt is DateTime?
          ? invitationExpiresAt
          : this.invitationExpiresAt,
    );
  }
}
