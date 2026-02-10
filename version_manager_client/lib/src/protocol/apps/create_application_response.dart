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
import '../apps/application.dart' as _i2;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i3;

/// Ответ при создании приложения (содержит API ключ)
abstract class CreateApplicationResponse implements _i1.SerializableModel {
  CreateApplicationResponse._({
    required this.application,
    required this.apiKey,
  });

  factory CreateApplicationResponse({
    required _i2.Application application,
    required String apiKey,
  }) = _CreateApplicationResponseImpl;

  factory CreateApplicationResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CreateApplicationResponse(
      application: _i3.Protocol().deserialize<_i2.Application>(
        jsonSerialization['application'],
      ),
      apiKey: jsonSerialization['apiKey'] as String,
    );
  }

  _i2.Application application;

  String apiKey;

  /// Returns a shallow copy of this [CreateApplicationResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CreateApplicationResponse copyWith({
    _i2.Application? application,
    String? apiKey,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CreateApplicationResponse',
      'application': application.toJson(),
      'apiKey': apiKey,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CreateApplicationResponseImpl extends CreateApplicationResponse {
  _CreateApplicationResponseImpl({
    required _i2.Application application,
    required String apiKey,
  }) : super._(
         application: application,
         apiKey: apiKey,
       );

  /// Returns a shallow copy of this [CreateApplicationResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CreateApplicationResponse copyWith({
    _i2.Application? application,
    String? apiKey,
  }) {
    return CreateApplicationResponse(
      application: application ?? this.application.copyWith(),
      apiKey: apiKey ?? this.apiKey,
    );
  }
}
