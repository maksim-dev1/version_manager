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

/// Запрос на изменение роли участника
abstract class UpdateMemberRoleRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  UpdateMemberRoleRequest._({
    required this.memberId,
    required this.newRole,
  });

  factory UpdateMemberRoleRequest({
    required _i1.UuidValue memberId,
    required _i2.TeamRoleType newRole,
  }) = _UpdateMemberRoleRequestImpl;

  factory UpdateMemberRoleRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return UpdateMemberRoleRequest(
      memberId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
      newRole: _i2.TeamRoleType.fromJson(
        (jsonSerialization['newRole'] as String),
      ),
    );
  }

  _i1.UuidValue memberId;

  _i2.TeamRoleType newRole;

  /// Returns a shallow copy of this [UpdateMemberRoleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateMemberRoleRequest copyWith({
    _i1.UuidValue? memberId,
    _i2.TeamRoleType? newRole,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateMemberRoleRequest',
      'memberId': memberId.toJson(),
      'newRole': newRole.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'UpdateMemberRoleRequest',
      'memberId': memberId.toJson(),
      'newRole': newRole.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UpdateMemberRoleRequestImpl extends UpdateMemberRoleRequest {
  _UpdateMemberRoleRequestImpl({
    required _i1.UuidValue memberId,
    required _i2.TeamRoleType newRole,
  }) : super._(
         memberId: memberId,
         newRole: newRole,
       );

  /// Returns a shallow copy of this [UpdateMemberRoleRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateMemberRoleRequest copyWith({
    _i1.UuidValue? memberId,
    _i2.TeamRoleType? newRole,
  }) {
    return UpdateMemberRoleRequest(
      memberId: memberId ?? this.memberId,
      newRole: newRole ?? this.newRole,
    );
  }
}
