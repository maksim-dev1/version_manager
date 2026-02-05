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

/// Запрос на выход из команды
abstract class LeaveTeamRequest implements _i1.SerializableModel {
  LeaveTeamRequest._({required this.teamId});

  factory LeaveTeamRequest({required _i1.UuidValue teamId}) =
      _LeaveTeamRequestImpl;

  factory LeaveTeamRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return LeaveTeamRequest(
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
    );
  }

  _i1.UuidValue teamId;

  /// Returns a shallow copy of this [LeaveTeamRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LeaveTeamRequest copyWith({_i1.UuidValue? teamId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LeaveTeamRequest',
      'teamId': teamId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LeaveTeamRequestImpl extends LeaveTeamRequest {
  _LeaveTeamRequestImpl({required _i1.UuidValue teamId})
    : super._(teamId: teamId);

  /// Returns a shallow copy of this [LeaveTeamRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LeaveTeamRequest copyWith({_i1.UuidValue? teamId}) {
    return LeaveTeamRequest(teamId: teamId ?? this.teamId);
  }
}
