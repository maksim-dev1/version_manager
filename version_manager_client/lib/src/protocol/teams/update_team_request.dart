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

/// Запрос на обновление команды
abstract class UpdateTeamRequest implements _i1.SerializableModel {
  UpdateTeamRequest._({
    required this.teamId,
    required this.name,
    this.description,
  });

  factory UpdateTeamRequest({
    required _i1.UuidValue teamId,
    required String name,
    String? description,
  }) = _UpdateTeamRequestImpl;

  factory UpdateTeamRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return UpdateTeamRequest(
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
    );
  }

  _i1.UuidValue teamId;

  String name;

  String? description;

  /// Returns a shallow copy of this [UpdateTeamRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UpdateTeamRequest copyWith({
    _i1.UuidValue? teamId,
    String? name,
    String? description,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'UpdateTeamRequest',
      'teamId': teamId.toJson(),
      'name': name,
      if (description != null) 'description': description,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UpdateTeamRequestImpl extends UpdateTeamRequest {
  _UpdateTeamRequestImpl({
    required _i1.UuidValue teamId,
    required String name,
    String? description,
  }) : super._(
         teamId: teamId,
         name: name,
         description: description,
       );

  /// Returns a shallow copy of this [UpdateTeamRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UpdateTeamRequest copyWith({
    _i1.UuidValue? teamId,
    String? name,
    Object? description = _Undefined,
  }) {
    return UpdateTeamRequest(
      teamId: teamId ?? this.teamId,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
    );
  }
}
