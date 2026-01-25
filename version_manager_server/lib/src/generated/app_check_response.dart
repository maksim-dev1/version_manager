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
import 'store_links.dart' as _i2;
import 'package:version_manager_server/src/generated/protocol.dart' as _i3;

abstract class AppCheckResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AppCheckResponse._({
    bool? isBlocked,
    this.blockReason,
    this.latestVersion,
    this.latestBuildNumber,
    bool? forceUpdate,
    this.storeLinks,
    this.changelog,
  }) : isBlocked = isBlocked ?? false,
       forceUpdate = forceUpdate ?? false;

  factory AppCheckResponse({
    bool? isBlocked,
    String? blockReason,
    String? latestVersion,
    int? latestBuildNumber,
    bool? forceUpdate,
    List<_i2.StoreLinks>? storeLinks,
    String? changelog,
  }) = _AppCheckResponseImpl;

  factory AppCheckResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppCheckResponse(
      isBlocked: jsonSerialization['isBlocked'] as bool?,
      blockReason: jsonSerialization['blockReason'] as String?,
      latestVersion: jsonSerialization['latestVersion'] as String?,
      latestBuildNumber: jsonSerialization['latestBuildNumber'] as int?,
      forceUpdate: jsonSerialization['forceUpdate'] as bool?,
      storeLinks: jsonSerialization['storeLinks'] == null
          ? null
          : _i3.Protocol().deserialize<List<_i2.StoreLinks>>(
              jsonSerialization['storeLinks'],
            ),
      changelog: jsonSerialization['changelog'] as String?,
    );
  }

  /// Заблокирована ли текущая версия клиента
  bool isBlocked;

  /// Причина блокировки версии
  String? blockReason;

  /// Последняя доступная версия приложения
  String? latestVersion;

  /// Номер сборки последней версии
  int? latestBuildNumber;

  /// Требуется ли обязательное обновление
  bool forceUpdate;

  /// Ссылки на магазины приложений для обновления
  List<_i2.StoreLinks>? storeLinks;

  /// Changelog последней версии
  String? changelog;

  /// Returns a shallow copy of this [AppCheckResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppCheckResponse copyWith({
    bool? isBlocked,
    String? blockReason,
    String? latestVersion,
    int? latestBuildNumber,
    bool? forceUpdate,
    List<_i2.StoreLinks>? storeLinks,
    String? changelog,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppCheckResponse',
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (latestVersion != null) 'latestVersion': latestVersion,
      if (latestBuildNumber != null) 'latestBuildNumber': latestBuildNumber,
      'forceUpdate': forceUpdate,
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(valueToJson: (v) => v.toJson()),
      if (changelog != null) 'changelog': changelog,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppCheckResponse',
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (latestVersion != null) 'latestVersion': latestVersion,
      if (latestBuildNumber != null) 'latestBuildNumber': latestBuildNumber,
      'forceUpdate': forceUpdate,
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (changelog != null) 'changelog': changelog,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppCheckResponseImpl extends AppCheckResponse {
  _AppCheckResponseImpl({
    bool? isBlocked,
    String? blockReason,
    String? latestVersion,
    int? latestBuildNumber,
    bool? forceUpdate,
    List<_i2.StoreLinks>? storeLinks,
    String? changelog,
  }) : super._(
         isBlocked: isBlocked,
         blockReason: blockReason,
         latestVersion: latestVersion,
         latestBuildNumber: latestBuildNumber,
         forceUpdate: forceUpdate,
         storeLinks: storeLinks,
         changelog: changelog,
       );

  /// Returns a shallow copy of this [AppCheckResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppCheckResponse copyWith({
    bool? isBlocked,
    Object? blockReason = _Undefined,
    Object? latestVersion = _Undefined,
    Object? latestBuildNumber = _Undefined,
    bool? forceUpdate,
    Object? storeLinks = _Undefined,
    Object? changelog = _Undefined,
  }) {
    return AppCheckResponse(
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      latestVersion: latestVersion is String?
          ? latestVersion
          : this.latestVersion,
      latestBuildNumber: latestBuildNumber is int?
          ? latestBuildNumber
          : this.latestBuildNumber,
      forceUpdate: forceUpdate ?? this.forceUpdate,
      storeLinks: storeLinks is List<_i2.StoreLinks>?
          ? storeLinks
          : this.storeLinks?.map((e0) => e0.copyWith()).toList(),
      changelog: changelog is String? ? changelog : this.changelog,
    );
  }
}
