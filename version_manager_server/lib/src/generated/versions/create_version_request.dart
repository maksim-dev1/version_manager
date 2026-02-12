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

/// Запрос на создание версии приложения
abstract class CreateVersionRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CreateVersionRequest._({
    required this.applicationId,
    required this.versionNumber,
    required this.buildNumber,
    required this.changelog,
  });

  factory CreateVersionRequest({
    required _i1.UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  }) = _CreateVersionRequestImpl;

  factory CreateVersionRequest.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateVersionRequest(
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      changelog: jsonSerialization['changelog'] as String,
    );
  }

  _i1.UuidValue applicationId;

  /// Семантическая версия в формате MAJOR.MINOR.PATCH
  String versionNumber;

  /// Целое положительное число, уникальное для приложения
  int buildNumber;

  /// Описание изменений (changelog), от 10 до 2000 символов
  String changelog;

  /// Returns a shallow copy of this [CreateVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateVersionRequest copyWith({
    _i1.UuidValue? applicationId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateVersionRequest',
      'applicationId': applicationId.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CreateVersionRequest',
      'applicationId': applicationId.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateVersionRequestImpl extends CreateVersionRequest {
  _CreateVersionRequestImpl({
    required _i1.UuidValue applicationId,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
  }) : super._(
         applicationId: applicationId,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         changelog: changelog,
       );

  /// Returns a shallow copy of this [CreateVersionRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateVersionRequest copyWith({
    _i1.UuidValue? applicationId,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
  }) {
    return CreateVersionRequest(
      applicationId: applicationId ?? this.applicationId,
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      changelog: changelog ?? this.changelog,
    );
  }
}
