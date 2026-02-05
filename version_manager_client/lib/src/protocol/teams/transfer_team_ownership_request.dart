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

/// Запрос на передачу владения командой
abstract class TransferTeamOwnershipRequest implements _i1.SerializableModel {
  TransferTeamOwnershipRequest._({
    required this.teamId,
    required this.newOwnerId,
  });

  factory TransferTeamOwnershipRequest({
    required _i1.UuidValue teamId,
    required _i1.UuidValue newOwnerId,
  }) = _TransferTeamOwnershipRequestImpl;

  factory TransferTeamOwnershipRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TransferTeamOwnershipRequest(
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      newOwnerId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['newOwnerId'],
      ),
    );
  }

  _i1.UuidValue teamId;

  _i1.UuidValue newOwnerId;

  /// Returns a shallow copy of this [TransferTeamOwnershipRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TransferTeamOwnershipRequest copyWith({
    _i1.UuidValue? teamId,
    _i1.UuidValue? newOwnerId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TransferTeamOwnershipRequest',
      'teamId': teamId.toJson(),
      'newOwnerId': newOwnerId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TransferTeamOwnershipRequestImpl extends TransferTeamOwnershipRequest {
  _TransferTeamOwnershipRequestImpl({
    required _i1.UuidValue teamId,
    required _i1.UuidValue newOwnerId,
  }) : super._(
         teamId: teamId,
         newOwnerId: newOwnerId,
       );

  /// Returns a shallow copy of this [TransferTeamOwnershipRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TransferTeamOwnershipRequest copyWith({
    _i1.UuidValue? teamId,
    _i1.UuidValue? newOwnerId,
  }) {
    return TransferTeamOwnershipRequest(
      teamId: teamId ?? this.teamId,
      newOwnerId: newOwnerId ?? this.newOwnerId,
    );
  }
}
