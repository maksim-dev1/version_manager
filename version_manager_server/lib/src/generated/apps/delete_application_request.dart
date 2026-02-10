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

/// Запрос на удаление приложения
abstract class DeleteApplicationRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DeleteApplicationRequest._({
    required this.applicationId,
    required this.confirmationName,
  });

  factory DeleteApplicationRequest({
    required _i1.UuidValue applicationId,
    required String confirmationName,
  }) = _DeleteApplicationRequestImpl;

  factory DeleteApplicationRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DeleteApplicationRequest(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      confirmationName: jsonSerialization['confirmationName'] as String,
    );
  }

  _i1.UuidValue applicationId;

  String confirmationName;

  /// Returns a shallow copy of this [DeleteApplicationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DeleteApplicationRequest copyWith({
    _i1.UuidValue? applicationId,
    String? confirmationName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DeleteApplicationRequest',
      'applicationId': applicationId.toJson(),
      'confirmationName': confirmationName,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DeleteApplicationRequest',
      'applicationId': applicationId.toJson(),
      'confirmationName': confirmationName,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DeleteApplicationRequestImpl extends DeleteApplicationRequest {
  _DeleteApplicationRequestImpl({
    required _i1.UuidValue applicationId,
    required String confirmationName,
  }) : super._(
         applicationId: applicationId,
         confirmationName: confirmationName,
       );

  /// Returns a shallow copy of this [DeleteApplicationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DeleteApplicationRequest copyWith({
    _i1.UuidValue? applicationId,
    String? confirmationName,
  }) {
    return DeleteApplicationRequest(
      applicationId: applicationId ?? this.applicationId,
      confirmationName: confirmationName ?? this.confirmationName,
    );
  }
}
