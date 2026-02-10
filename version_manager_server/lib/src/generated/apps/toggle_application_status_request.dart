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

/// Запрос на активацию/деактивацию приложения
abstract class ToggleApplicationStatusRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ToggleApplicationStatusRequest._({
    required this.applicationId,
    required this.isActive,
  });

  factory ToggleApplicationStatusRequest({
    required _i1.UuidValue applicationId,
    required bool isActive,
  }) = _ToggleApplicationStatusRequestImpl;

  factory ToggleApplicationStatusRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ToggleApplicationStatusRequest(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      isActive: jsonSerialization['isActive'] as bool,
    );
  }

  _i1.UuidValue applicationId;

  bool isActive;

  /// Returns a shallow copy of this [ToggleApplicationStatusRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ToggleApplicationStatusRequest copyWith({
    _i1.UuidValue? applicationId,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ToggleApplicationStatusRequest',
      'applicationId': applicationId.toJson(),
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ToggleApplicationStatusRequest',
      'applicationId': applicationId.toJson(),
      'isActive': isActive,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ToggleApplicationStatusRequestImpl
    extends ToggleApplicationStatusRequest {
  _ToggleApplicationStatusRequestImpl({
    required _i1.UuidValue applicationId,
    required bool isActive,
  }) : super._(
         applicationId: applicationId,
         isActive: isActive,
       );

  /// Returns a shallow copy of this [ToggleApplicationStatusRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ToggleApplicationStatusRequest copyWith({
    _i1.UuidValue? applicationId,
    bool? isActive,
  }) {
    return ToggleApplicationStatusRequest(
      applicationId: applicationId ?? this.applicationId,
      isActive: isActive ?? this.isActive,
    );
  }
}
