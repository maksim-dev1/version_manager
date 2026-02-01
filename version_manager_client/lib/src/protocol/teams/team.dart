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
import '../teams/team_member.dart' as _i3;
import '../apps/application.dart' as _i4;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i5;

/// Команда пользователей
abstract class Team implements _i1.SerializableModel {
  Team._({
    this.id,
    required this.name,
    this.description,
    required this.ownerId,
    this.owner,
    this.members,
    this.applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Team({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required _i1.UuidValue ownerId,
    _i2.User? owner,
    List<_i3.TeamMember>? members,
    List<_i4.Application>? applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TeamImpl;

  factory Team.fromJson(Map<String, dynamic> jsonSerialization) {
    return Team(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      ownerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['ownerId'],
      ),
      owner: jsonSerialization['owner'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.User>(jsonSerialization['owner']),
      members: jsonSerialization['members'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.TeamMember>>(
              jsonSerialization['members'],
            ),
      applications: jsonSerialization['applications'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.Application>>(
              jsonSerialization['applications'],
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
  _i1.UuidValue? id;

  String name;

  String? description;

  _i1.UuidValue ownerId;

  _i2.User? owner;

  List<_i3.TeamMember>? members;

  List<_i4.Application>? applications;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Team]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Team copyWith({
    _i1.UuidValue? id,
    String? name,
    String? description,
    _i1.UuidValue? ownerId,
    _i2.User? owner,
    List<_i3.TeamMember>? members,
    List<_i4.Application>? applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Team',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'ownerId': ownerId.toJson(),
      if (owner != null) 'owner': owner?.toJson(),
      if (members != null)
        'members': members?.toJson(valueToJson: (v) => v.toJson()),
      if (applications != null)
        'applications': applications?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamImpl extends Team {
  _TeamImpl({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required _i1.UuidValue ownerId,
    _i2.User? owner,
    List<_i3.TeamMember>? members,
    List<_i4.Application>? applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         ownerId: ownerId,
         owner: owner,
         members: members,
         applications: applications,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Team]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Team copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    _i1.UuidValue? ownerId,
    Object? owner = _Undefined,
    Object? members = _Undefined,
    Object? applications = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Team(
      id: id is _i1.UuidValue? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.User? ? owner : this.owner?.copyWith(),
      members: members is List<_i3.TeamMember>?
          ? members
          : this.members?.map((e0) => e0.copyWith()).toList(),
      applications: applications is List<_i4.Application>?
          ? applications
          : this.applications?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
