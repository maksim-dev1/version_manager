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
import '../enums/owner_type.dart' as _i2;

/// Запрос на передачу приложения другому владельцу.
///
/// Поддерживает три сценария:
/// - user → team (личное в команду)
/// - team → user (командное в личное)
/// - team → team (из одной команды в другую)
abstract class TransferApplicationOwnershipRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TransferApplicationOwnershipRequest._({
    required this.applicationId,
    required this.newOwnerType,
    this.newTeamId,
  });

  factory TransferApplicationOwnershipRequest({
    required _i1.UuidValue applicationId,
    required _i2.OwnerType newOwnerType,
    _i1.UuidValue? newTeamId,
  }) = _TransferApplicationOwnershipRequestImpl;

  factory TransferApplicationOwnershipRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TransferApplicationOwnershipRequest(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      newOwnerType: _i2.OwnerType.fromJson(
        (jsonSerialization['newOwnerType'] as String),
      ),
      newTeamId: jsonSerialization['newTeamId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['newTeamId']),
    );
  }

  _i1.UuidValue applicationId;

  _i2.OwnerType newOwnerType;

  _i1.UuidValue? newTeamId;

  /// Returns a shallow copy of this [TransferApplicationOwnershipRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TransferApplicationOwnershipRequest copyWith({
    _i1.UuidValue? applicationId,
    _i2.OwnerType? newOwnerType,
    _i1.UuidValue? newTeamId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TransferApplicationOwnershipRequest',
      'applicationId': applicationId.toJson(),
      'newOwnerType': newOwnerType.toJson(),
      if (newTeamId != null) 'newTeamId': newTeamId?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TransferApplicationOwnershipRequest',
      'applicationId': applicationId.toJson(),
      'newOwnerType': newOwnerType.toJson(),
      if (newTeamId != null) 'newTeamId': newTeamId?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TransferApplicationOwnershipRequestImpl
    extends TransferApplicationOwnershipRequest {
  _TransferApplicationOwnershipRequestImpl({
    required _i1.UuidValue applicationId,
    required _i2.OwnerType newOwnerType,
    _i1.UuidValue? newTeamId,
  }) : super._(
         applicationId: applicationId,
         newOwnerType: newOwnerType,
         newTeamId: newTeamId,
       );

  /// Returns a shallow copy of this [TransferApplicationOwnershipRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TransferApplicationOwnershipRequest copyWith({
    _i1.UuidValue? applicationId,
    _i2.OwnerType? newOwnerType,
    Object? newTeamId = _Undefined,
  }) {
    return TransferApplicationOwnershipRequest(
      applicationId: applicationId ?? this.applicationId,
      newOwnerType: newOwnerType ?? this.newOwnerType,
      newTeamId: newTeamId is _i1.UuidValue? ? newTeamId : this.newTeamId,
    );
  }
}
