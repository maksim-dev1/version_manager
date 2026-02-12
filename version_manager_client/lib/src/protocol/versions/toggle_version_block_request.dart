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

/// Запрос на быструю блокировку/разблокировку версии
abstract class ToggleVersionBlockRequest implements _i1.SerializableModel {
  ToggleVersionBlockRequest._({
    required this.versionId,
    required this.isBlocked,
    this.blockReason,
  });

  factory ToggleVersionBlockRequest({
    required _i1.UuidValue versionId,
    required bool isBlocked,
    String? blockReason,
  }) = _ToggleVersionBlockRequestImpl;

  factory ToggleVersionBlockRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return ToggleVersionBlockRequest(
      versionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['versionId'],
      ),
      isBlocked: jsonSerialization['isBlocked'] as bool,
      blockReason: jsonSerialization['blockReason'] as String?,
    );
  }

  _i1.UuidValue versionId;

  /// true — заблокировать, false — разблокировать
  bool isBlocked;

  /// Причина блокировки (обязательна при isBlocked = true), от 10 до 500 символов
  String? blockReason;

  /// Returns a shallow copy of this [ToggleVersionBlockRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ToggleVersionBlockRequest copyWith({
    _i1.UuidValue? versionId,
    bool? isBlocked,
    String? blockReason,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ToggleVersionBlockRequest',
      'versionId': versionId.toJson(),
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ToggleVersionBlockRequestImpl extends ToggleVersionBlockRequest {
  _ToggleVersionBlockRequestImpl({
    required _i1.UuidValue versionId,
    required bool isBlocked,
    String? blockReason,
  }) : super._(
         versionId: versionId,
         isBlocked: isBlocked,
         blockReason: blockReason,
       );

  /// Returns a shallow copy of this [ToggleVersionBlockRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ToggleVersionBlockRequest copyWith({
    _i1.UuidValue? versionId,
    bool? isBlocked,
    Object? blockReason = _Undefined,
  }) {
    return ToggleVersionBlockRequest(
      versionId: versionId ?? this.versionId,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
    );
  }
}
