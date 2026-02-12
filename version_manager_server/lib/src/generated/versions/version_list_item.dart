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

/// Элемент списка версий (краткая информация)
abstract class VersionListItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  VersionListItem._({
    required this.id,
    required this.versionNumber,
    required this.buildNumber,
    required this.changelog,
    required this.isBlocked,
    this.blockReason,
    this.recommendedVersionNumber,
    required this.activeUsersCount,
    required this.isLatest,
    required this.createdAt,
  });

  factory VersionListItem({
    required _i1.UuidValue id,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    required bool isBlocked,
    String? blockReason,
    String? recommendedVersionNumber,
    required int activeUsersCount,
    required bool isLatest,
    required DateTime createdAt,
  }) = _VersionListItemImpl;

  factory VersionListItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return VersionListItem(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      changelog: jsonSerialization['changelog'] as String,
      isBlocked: jsonSerialization['isBlocked'] as bool,
      blockReason: jsonSerialization['blockReason'] as String?,
      recommendedVersionNumber:
          jsonSerialization['recommendedVersionNumber'] as String?,
      activeUsersCount: jsonSerialization['activeUsersCount'] as int,
      isLatest: jsonSerialization['isLatest'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  _i1.UuidValue id;

  String versionNumber;

  int buildNumber;

  String changelog;

  bool isBlocked;

  String? blockReason;

  /// Номер рекомендуемой версии (если установлена)
  String? recommendedVersionNumber;

  /// Количество активных пользователей на этой версии
  int activeUsersCount;

  /// Является ли эта версия самой новой
  bool isLatest;

  DateTime createdAt;

  /// Returns a shallow copy of this [VersionListItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionListItem copyWith({
    _i1.UuidValue? id,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    String? recommendedVersionNumber,
    int? activeUsersCount,
    bool? isLatest,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionListItem',
      'id': id.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (recommendedVersionNumber != null)
        'recommendedVersionNumber': recommendedVersionNumber,
      'activeUsersCount': activeUsersCount,
      'isLatest': isLatest,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VersionListItem',
      'id': id.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (recommendedVersionNumber != null)
        'recommendedVersionNumber': recommendedVersionNumber,
      'activeUsersCount': activeUsersCount,
      'isLatest': isLatest,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VersionListItemImpl extends VersionListItem {
  _VersionListItemImpl({
    required _i1.UuidValue id,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    required bool isBlocked,
    String? blockReason,
    String? recommendedVersionNumber,
    required int activeUsersCount,
    required bool isLatest,
    required DateTime createdAt,
  }) : super._(
         id: id,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         changelog: changelog,
         isBlocked: isBlocked,
         blockReason: blockReason,
         recommendedVersionNumber: recommendedVersionNumber,
         activeUsersCount: activeUsersCount,
         isLatest: isLatest,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [VersionListItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionListItem copyWith({
    _i1.UuidValue? id,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    Object? blockReason = _Undefined,
    Object? recommendedVersionNumber = _Undefined,
    int? activeUsersCount,
    bool? isLatest,
    DateTime? createdAt,
  }) {
    return VersionListItem(
      id: id ?? this.id,
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      changelog: changelog ?? this.changelog,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      recommendedVersionNumber: recommendedVersionNumber is String?
          ? recommendedVersionNumber
          : this.recommendedVersionNumber,
      activeUsersCount: activeUsersCount ?? this.activeUsersCount,
      isLatest: isLatest ?? this.isLatest,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
