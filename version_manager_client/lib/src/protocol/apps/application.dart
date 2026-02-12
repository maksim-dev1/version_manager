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
import '../enums/platform_type.dart' as _i2;
import '../enums/owner_type.dart' as _i3;
import '../auth/user.dart' as _i4;
import '../teams/team.dart' as _i5;
import '../apps/store_link.dart' as _i6;
import '../versions/version.dart' as _i7;
import '../logs/version_check_log.dart' as _i8;
import '../logs/version_check_daily_summary.dart' as _i9;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i10;

/// Приложение для управления версиями
abstract class Application implements _i1.SerializableModel {
  Application._({
    this.id,
    required this.namespace,
    required this.name,
    String? description,
    this.iconUrl,
    required this.platforms,
    required this.ownerType,
    this.ownerUserId,
    this.ownerUser,
    this.ownerTeamId,
    this.ownerTeam,
    this.storeLinks,
    this.versions,
    this.checkLogs,
    this.dailySummaries,
    bool? isActive,
    required this.apiKeyHash,
    String? apiKeyLast4,
    DateTime? apiKeyCreatedAt,
    this.apiKeyLastRegeneratedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : description = description ?? '',
       isActive = isActive ?? true,
       apiKeyLast4 = apiKeyLast4 ?? '',
       apiKeyCreatedAt = apiKeyCreatedAt ?? DateTime.now(),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Application({
    _i1.UuidValue? id,
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<_i2.PlatformType> platforms,
    required _i3.OwnerType ownerType,
    _i1.UuidValue? ownerUserId,
    _i4.User? ownerUser,
    _i1.UuidValue? ownerTeamId,
    _i5.Team? ownerTeam,
    List<_i6.StoreLink>? storeLinks,
    List<_i7.Version>? versions,
    List<_i8.VersionCheckLog>? checkLogs,
    List<_i9.VersionCheckDailySummary>? dailySummaries,
    bool? isActive,
    required String apiKeyHash,
    String? apiKeyLast4,
    DateTime? apiKeyCreatedAt,
    DateTime? apiKeyLastRegeneratedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ApplicationImpl;

  factory Application.fromJson(Map<String, dynamic> jsonSerialization) {
    return Application(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      namespace: jsonSerialization['namespace'] as String,
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      iconUrl: jsonSerialization['iconUrl'] as String?,
      platforms: _i10.Protocol().deserialize<List<_i2.PlatformType>>(
        jsonSerialization['platforms'],
      ),
      ownerType: _i3.OwnerType.fromJson(
        (jsonSerialization['ownerType'] as String),
      ),
      ownerUserId: jsonSerialization['ownerUserId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerUserId'],
            ),
      ownerUser: jsonSerialization['ownerUser'] == null
          ? null
          : _i10.Protocol().deserialize<_i4.User>(
              jsonSerialization['ownerUser'],
            ),
      ownerTeamId: jsonSerialization['ownerTeamId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerTeamId'],
            ),
      ownerTeam: jsonSerialization['ownerTeam'] == null
          ? null
          : _i10.Protocol().deserialize<_i5.Team>(
              jsonSerialization['ownerTeam'],
            ),
      storeLinks: jsonSerialization['storeLinks'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i6.StoreLink>>(
              jsonSerialization['storeLinks'],
            ),
      versions: jsonSerialization['versions'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i7.Version>>(
              jsonSerialization['versions'],
            ),
      checkLogs: jsonSerialization['checkLogs'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i8.VersionCheckLog>>(
              jsonSerialization['checkLogs'],
            ),
      dailySummaries: jsonSerialization['dailySummaries'] == null
          ? null
          : _i10.Protocol().deserialize<List<_i9.VersionCheckDailySummary>>(
              jsonSerialization['dailySummaries'],
            ),
      isActive: jsonSerialization['isActive'] as bool?,
      apiKeyHash: jsonSerialization['apiKeyHash'] as String,
      apiKeyLast4: jsonSerialization['apiKeyLast4'] as String?,
      apiKeyCreatedAt: jsonSerialization['apiKeyCreatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['apiKeyCreatedAt'],
            ),
      apiKeyLastRegeneratedAt:
          jsonSerialization['apiKeyLastRegeneratedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['apiKeyLastRegeneratedAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  _i1.UuidValue? id;

  String namespace;

  String name;

  String description;

  String? iconUrl;

  List<_i2.PlatformType> platforms;

  _i3.OwnerType ownerType;

  _i1.UuidValue? ownerUserId;

  _i4.User? ownerUser;

  _i1.UuidValue? ownerTeamId;

  _i5.Team? ownerTeam;

  List<_i6.StoreLink>? storeLinks;

  List<_i7.Version>? versions;

  List<_i8.VersionCheckLog>? checkLogs;

  List<_i9.VersionCheckDailySummary>? dailySummaries;

  bool isActive;

  String apiKeyHash;

  String apiKeyLast4;

  DateTime apiKeyCreatedAt;

  DateTime? apiKeyLastRegeneratedAt;

  DateTime createdAt;

  DateTime updatedAt;

  /// Returns a shallow copy of this [Application]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Application copyWith({
    _i1.UuidValue? id,
    String? namespace,
    String? name,
    String? description,
    String? iconUrl,
    List<_i2.PlatformType>? platforms,
    _i3.OwnerType? ownerType,
    _i1.UuidValue? ownerUserId,
    _i4.User? ownerUser,
    _i1.UuidValue? ownerTeamId,
    _i5.Team? ownerTeam,
    List<_i6.StoreLink>? storeLinks,
    List<_i7.Version>? versions,
    List<_i8.VersionCheckLog>? checkLogs,
    List<_i9.VersionCheckDailySummary>? dailySummaries,
    bool? isActive,
    String? apiKeyHash,
    String? apiKeyLast4,
    DateTime? apiKeyCreatedAt,
    DateTime? apiKeyLastRegeneratedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Application',
      if (id != null) 'id': id?.toJson(),
      'namespace': namespace,
      'name': name,
      'description': description,
      if (iconUrl != null) 'iconUrl': iconUrl,
      'platforms': platforms.toJson(valueToJson: (v) => v.toJson()),
      'ownerType': ownerType.toJson(),
      if (ownerUserId != null) 'ownerUserId': ownerUserId?.toJson(),
      if (ownerUser != null) 'ownerUser': ownerUser?.toJson(),
      if (ownerTeamId != null) 'ownerTeamId': ownerTeamId?.toJson(),
      if (ownerTeam != null) 'ownerTeam': ownerTeam?.toJson(),
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(valueToJson: (v) => v.toJson()),
      if (versions != null)
        'versions': versions?.toJson(valueToJson: (v) => v.toJson()),
      if (checkLogs != null)
        'checkLogs': checkLogs?.toJson(valueToJson: (v) => v.toJson()),
      if (dailySummaries != null)
        'dailySummaries': dailySummaries?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      'isActive': isActive,
      'apiKeyHash': apiKeyHash,
      'apiKeyLast4': apiKeyLast4,
      'apiKeyCreatedAt': apiKeyCreatedAt.toJson(),
      if (apiKeyLastRegeneratedAt != null)
        'apiKeyLastRegeneratedAt': apiKeyLastRegeneratedAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ApplicationImpl extends Application {
  _ApplicationImpl({
    _i1.UuidValue? id,
    required String namespace,
    required String name,
    String? description,
    String? iconUrl,
    required List<_i2.PlatformType> platforms,
    required _i3.OwnerType ownerType,
    _i1.UuidValue? ownerUserId,
    _i4.User? ownerUser,
    _i1.UuidValue? ownerTeamId,
    _i5.Team? ownerTeam,
    List<_i6.StoreLink>? storeLinks,
    List<_i7.Version>? versions,
    List<_i8.VersionCheckLog>? checkLogs,
    List<_i9.VersionCheckDailySummary>? dailySummaries,
    bool? isActive,
    required String apiKeyHash,
    String? apiKeyLast4,
    DateTime? apiKeyCreatedAt,
    DateTime? apiKeyLastRegeneratedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         namespace: namespace,
         name: name,
         description: description,
         iconUrl: iconUrl,
         platforms: platforms,
         ownerType: ownerType,
         ownerUserId: ownerUserId,
         ownerUser: ownerUser,
         ownerTeamId: ownerTeamId,
         ownerTeam: ownerTeam,
         storeLinks: storeLinks,
         versions: versions,
         checkLogs: checkLogs,
         dailySummaries: dailySummaries,
         isActive: isActive,
         apiKeyHash: apiKeyHash,
         apiKeyLast4: apiKeyLast4,
         apiKeyCreatedAt: apiKeyCreatedAt,
         apiKeyLastRegeneratedAt: apiKeyLastRegeneratedAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Application]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Application copyWith({
    Object? id = _Undefined,
    String? namespace,
    String? name,
    String? description,
    Object? iconUrl = _Undefined,
    List<_i2.PlatformType>? platforms,
    _i3.OwnerType? ownerType,
    Object? ownerUserId = _Undefined,
    Object? ownerUser = _Undefined,
    Object? ownerTeamId = _Undefined,
    Object? ownerTeam = _Undefined,
    Object? storeLinks = _Undefined,
    Object? versions = _Undefined,
    Object? checkLogs = _Undefined,
    Object? dailySummaries = _Undefined,
    bool? isActive,
    String? apiKeyHash,
    String? apiKeyLast4,
    DateTime? apiKeyCreatedAt,
    Object? apiKeyLastRegeneratedAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Application(
      id: id is _i1.UuidValue? ? id : this.id,
      namespace: namespace ?? this.namespace,
      name: name ?? this.name,
      description: description ?? this.description,
      iconUrl: iconUrl is String? ? iconUrl : this.iconUrl,
      platforms: platforms ?? this.platforms.map((e0) => e0).toList(),
      ownerType: ownerType ?? this.ownerType,
      ownerUserId: ownerUserId is _i1.UuidValue?
          ? ownerUserId
          : this.ownerUserId,
      ownerUser: ownerUser is _i4.User?
          ? ownerUser
          : this.ownerUser?.copyWith(),
      ownerTeamId: ownerTeamId is _i1.UuidValue?
          ? ownerTeamId
          : this.ownerTeamId,
      ownerTeam: ownerTeam is _i5.Team?
          ? ownerTeam
          : this.ownerTeam?.copyWith(),
      storeLinks: storeLinks is List<_i6.StoreLink>?
          ? storeLinks
          : this.storeLinks?.map((e0) => e0.copyWith()).toList(),
      versions: versions is List<_i7.Version>?
          ? versions
          : this.versions?.map((e0) => e0.copyWith()).toList(),
      checkLogs: checkLogs is List<_i8.VersionCheckLog>?
          ? checkLogs
          : this.checkLogs?.map((e0) => e0.copyWith()).toList(),
      dailySummaries: dailySummaries is List<_i9.VersionCheckDailySummary>?
          ? dailySummaries
          : this.dailySummaries?.map((e0) => e0.copyWith()).toList(),
      isActive: isActive ?? this.isActive,
      apiKeyHash: apiKeyHash ?? this.apiKeyHash,
      apiKeyLast4: apiKeyLast4 ?? this.apiKeyLast4,
      apiKeyCreatedAt: apiKeyCreatedAt ?? this.apiKeyCreatedAt,
      apiKeyLastRegeneratedAt: apiKeyLastRegeneratedAt is DateTime?
          ? apiKeyLastRegeneratedAt
          : this.apiKeyLastRegeneratedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
