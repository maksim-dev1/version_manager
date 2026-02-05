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
import '../enums/team_role_type.dart' as _i2;

/// Запрос на приглашение участника
abstract class InviteTeamMemberRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  InviteTeamMemberRequest._({
    required this.teamId,
    required this.email,
    required this.role,
  });

  factory InviteTeamMemberRequest({
    required _i1.UuidValue teamId,
    required String email,
    required _i2.TeamRoleType role,
  }) = _InviteTeamMemberRequestImpl;

  factory InviteTeamMemberRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return InviteTeamMemberRequest(
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      email: jsonSerialization['email'] as String,
      role: _i2.TeamRoleType.fromJson((jsonSerialization['role'] as String)),
    );
  }

  _i1.UuidValue teamId;

  String email;

  _i2.TeamRoleType role;

  /// Returns a shallow copy of this [InviteTeamMemberRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  InviteTeamMemberRequest copyWith({
    _i1.UuidValue? teamId,
    String? email,
    _i2.TeamRoleType? role,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'InviteTeamMemberRequest',
      'teamId': teamId.toJson(),
      'email': email,
      'role': role.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'InviteTeamMemberRequest',
      'teamId': teamId.toJson(),
      'email': email,
      'role': role.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _InviteTeamMemberRequestImpl extends InviteTeamMemberRequest {
  _InviteTeamMemberRequestImpl({
    required _i1.UuidValue teamId,
    required String email,
    required _i2.TeamRoleType role,
  }) : super._(
         teamId: teamId,
         email: email,
         role: role,
       );

  /// Returns a shallow copy of this [InviteTeamMemberRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  InviteTeamMemberRequest copyWith({
    _i1.UuidValue? teamId,
    String? email,
    _i2.TeamRoleType? role,
  }) {
    return InviteTeamMemberRequest(
      teamId: teamId ?? this.teamId,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}
