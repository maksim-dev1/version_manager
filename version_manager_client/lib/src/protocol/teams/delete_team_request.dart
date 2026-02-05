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

/// Запрос на удаление команды с выбором действия
abstract class DeleteTeamRequest implements _i1.SerializableModel {
  DeleteTeamRequest._({
    required this.teamId,
    required this.transferAppsToOwner,
    required this.confirmationName,
  });

  factory DeleteTeamRequest({
    required _i1.UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
  }) = _DeleteTeamRequestImpl;

  factory DeleteTeamRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return DeleteTeamRequest(
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      transferAppsToOwner: jsonSerialization['transferAppsToOwner'] as bool,
      confirmationName: jsonSerialization['confirmationName'] as String,
    );
  }

  _i1.UuidValue teamId;

  bool transferAppsToOwner;

  String confirmationName;

  /// Returns a shallow copy of this [DeleteTeamRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DeleteTeamRequest copyWith({
    _i1.UuidValue? teamId,
    bool? transferAppsToOwner,
    String? confirmationName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DeleteTeamRequest',
      'teamId': teamId.toJson(),
      'transferAppsToOwner': transferAppsToOwner,
      'confirmationName': confirmationName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DeleteTeamRequestImpl extends DeleteTeamRequest {
  _DeleteTeamRequestImpl({
    required _i1.UuidValue teamId,
    required bool transferAppsToOwner,
    required String confirmationName,
  }) : super._(
         teamId: teamId,
         transferAppsToOwner: transferAppsToOwner,
         confirmationName: confirmationName,
       );

  /// Returns a shallow copy of this [DeleteTeamRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DeleteTeamRequest copyWith({
    _i1.UuidValue? teamId,
    bool? transferAppsToOwner,
    String? confirmationName,
  }) {
    return DeleteTeamRequest(
      teamId: teamId ?? this.teamId,
      transferAppsToOwner: transferAppsToOwner ?? this.transferAppsToOwner,
      confirmationName: confirmationName ?? this.confirmationName,
    );
  }
}
