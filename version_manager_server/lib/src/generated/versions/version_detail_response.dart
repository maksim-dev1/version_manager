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
import '../versions/version.dart' as _i2;
import 'package:version_manager_server/src/generated/protocol.dart' as _i3;

/// Детальная информация о версии (для редактирования)
abstract class VersionDetailResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  VersionDetailResponse._({
    required this.version,
    required this.isLatest,
    required this.newerVersions,
    required this.activeUsersCount,
    required this.recommendingVersionsCount,
  });

  factory VersionDetailResponse({
    required _i2.Version version,
    required bool isLatest,
    required List<_i2.Version> newerVersions,
    required int activeUsersCount,
    required int recommendingVersionsCount,
  }) = _VersionDetailResponseImpl;

  factory VersionDetailResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VersionDetailResponse(
      version: _i3.Protocol().deserialize<_i2.Version>(
        jsonSerialization['version'],
      ),
      isLatest: jsonSerialization['isLatest'] as bool,
      newerVersions: _i3.Protocol().deserialize<List<_i2.Version>>(
        jsonSerialization['newerVersions'],
      ),
      activeUsersCount: jsonSerialization['activeUsersCount'] as int,
      recommendingVersionsCount:
          jsonSerialization['recommendingVersionsCount'] as int,
    );
  }

  _i2.Version version;

  /// Является ли эта версия самой новой
  bool isLatest;

  /// Список версий с большим buildNumber (для выбора рекомендуемой)
  List<_i2.Version> newerVersions;

  /// Количество активных пользователей
  int activeUsersCount;

  /// Количество версий, которые рекомендуют обновление на эту версию
  int recommendingVersionsCount;

  /// Returns a shallow copy of this [VersionDetailResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionDetailResponse copyWith({
    _i2.Version? version,
    bool? isLatest,
    List<_i2.Version>? newerVersions,
    int? activeUsersCount,
    int? recommendingVersionsCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionDetailResponse',
      'version': version.toJson(),
      'isLatest': isLatest,
      'newerVersions': newerVersions.toJson(valueToJson: (v) => v.toJson()),
      'activeUsersCount': activeUsersCount,
      'recommendingVersionsCount': recommendingVersionsCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VersionDetailResponse',
      'version': version.toJsonForProtocol(),
      'isLatest': isLatest,
      'newerVersions': newerVersions.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'activeUsersCount': activeUsersCount,
      'recommendingVersionsCount': recommendingVersionsCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VersionDetailResponseImpl extends VersionDetailResponse {
  _VersionDetailResponseImpl({
    required _i2.Version version,
    required bool isLatest,
    required List<_i2.Version> newerVersions,
    required int activeUsersCount,
    required int recommendingVersionsCount,
  }) : super._(
         version: version,
         isLatest: isLatest,
         newerVersions: newerVersions,
         activeUsersCount: activeUsersCount,
         recommendingVersionsCount: recommendingVersionsCount,
       );

  /// Returns a shallow copy of this [VersionDetailResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionDetailResponse copyWith({
    _i2.Version? version,
    bool? isLatest,
    List<_i2.Version>? newerVersions,
    int? activeUsersCount,
    int? recommendingVersionsCount,
  }) {
    return VersionDetailResponse(
      version: version ?? this.version.copyWith(),
      isLatest: isLatest ?? this.isLatest,
      newerVersions:
          newerVersions ??
          this.newerVersions.map((e0) => e0.copyWith()).toList(),
      activeUsersCount: activeUsersCount ?? this.activeUsersCount,
      recommendingVersionsCount:
          recommendingVersionsCount ?? this.recommendingVersionsCount,
    );
  }
}
