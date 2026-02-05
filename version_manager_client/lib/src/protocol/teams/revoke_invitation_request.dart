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

/// Запрос на отзыв приглашения
abstract class RevokeInvitationRequest implements _i1.SerializableModel {
  RevokeInvitationRequest._({required this.memberId});

  factory RevokeInvitationRequest({required _i1.UuidValue memberId}) =
      _RevokeInvitationRequestImpl;

  factory RevokeInvitationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return RevokeInvitationRequest(
      memberId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['memberId'],
      ),
    );
  }

  _i1.UuidValue memberId;

  /// Returns a shallow copy of this [RevokeInvitationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RevokeInvitationRequest copyWith({_i1.UuidValue? memberId});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RevokeInvitationRequest',
      'memberId': memberId.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _RevokeInvitationRequestImpl extends RevokeInvitationRequest {
  _RevokeInvitationRequestImpl({required _i1.UuidValue memberId})
    : super._(memberId: memberId);

  /// Returns a shallow copy of this [RevokeInvitationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RevokeInvitationRequest copyWith({_i1.UuidValue? memberId}) {
    return RevokeInvitationRequest(memberId: memberId ?? this.memberId);
  }
}
