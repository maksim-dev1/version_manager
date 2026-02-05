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

/// Запрос на принятие/отклонение приглашения
abstract class RespondToInvitationRequest implements _i1.SerializableModel {
  RespondToInvitationRequest._({
    required this.teamId,
    required this.accept,
  });

  factory RespondToInvitationRequest({
    required _i1.UuidValue teamId,
    required bool accept,
  }) = _RespondToInvitationRequestImpl;

  factory RespondToInvitationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RespondToInvitationRequest(
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      accept: jsonSerialization['accept'] as bool,
    );
  }

  _i1.UuidValue teamId;

  bool accept;

  /// Returns a shallow copy of this [RespondToInvitationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RespondToInvitationRequest copyWith({
    _i1.UuidValue? teamId,
    bool? accept,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RespondToInvitationRequest',
      'teamId': teamId.toJson(),
      'accept': accept,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RespondToInvitationRequestImpl extends RespondToInvitationRequest {
  _RespondToInvitationRequestImpl({
    required _i1.UuidValue teamId,
    required bool accept,
  }) : super._(
         teamId: teamId,
         accept: accept,
       );

  /// Returns a shallow copy of this [RespondToInvitationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RespondToInvitationRequest copyWith({
    _i1.UuidValue? teamId,
    bool? accept,
  }) {
    return RespondToInvitationRequest(
      teamId: teamId ?? this.teamId,
      accept: accept ?? this.accept,
    );
  }
}
