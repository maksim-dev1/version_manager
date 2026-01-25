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
import 'enums/platform.dart' as _i2;

abstract class AppCheckRequest implements _i1.SerializableModel {
  AppCheckRequest._({
    required this.packageName,
    required this.currentVersion,
    required this.currentBuildNumber,
    _i2.Platform? platform,
  }) : platform = platform ?? _i2.Platform.unknown;

  factory AppCheckRequest({
    required String packageName,
    required String currentVersion,
    required int currentBuildNumber,
    _i2.Platform? platform,
  }) = _AppCheckRequestImpl;

  factory AppCheckRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppCheckRequest(
      packageName: jsonSerialization['packageName'] as String,
      currentVersion: jsonSerialization['currentVersion'] as String,
      currentBuildNumber: jsonSerialization['currentBuildNumber'] as int,
      platform: jsonSerialization['platform'] == null
          ? null
          : _i2.Platform.fromJson((jsonSerialization['platform'] as String)),
    );
  }

  /// Идентификатор приложения (например: com.example.myapp)
  String packageName;

  /// Текущая версия приложения клиента (например: 1.0.0)
  String currentVersion;

  /// Номер сборки приложения клиента
  int currentBuildNumber;

  /// Платформа (android, ios)
  _i2.Platform platform;

  /// Returns a shallow copy of this [AppCheckRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppCheckRequest copyWith({
    String? packageName,
    String? currentVersion,
    int? currentBuildNumber,
    _i2.Platform? platform,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppCheckRequest',
      'packageName': packageName,
      'currentVersion': currentVersion,
      'currentBuildNumber': currentBuildNumber,
      'platform': platform.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AppCheckRequestImpl extends AppCheckRequest {
  _AppCheckRequestImpl({
    required String packageName,
    required String currentVersion,
    required int currentBuildNumber,
    _i2.Platform? platform,
  }) : super._(
         packageName: packageName,
         currentVersion: currentVersion,
         currentBuildNumber: currentBuildNumber,
         platform: platform,
       );

  /// Returns a shallow copy of this [AppCheckRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppCheckRequest copyWith({
    String? packageName,
    String? currentVersion,
    int? currentBuildNumber,
    _i2.Platform? platform,
  }) {
    return AppCheckRequest(
      packageName: packageName ?? this.packageName,
      currentVersion: currentVersion ?? this.currentVersion,
      currentBuildNumber: currentBuildNumber ?? this.currentBuildNumber,
      platform: platform ?? this.platform,
    );
  }
}
