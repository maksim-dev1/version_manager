/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../enums/platform_type.dart' as _i2;
import '../enums/owner_type.dart' as _i3;
import '../auth/user.dart' as _i4;
import '../teams/team.dart' as _i5;
import '../apps/store_link.dart' as _i6;
import '../versions/version.dart' as _i7;
import '../statistics/app_instance.dart' as _i8;
import '../statistics/daily_check_summary.dart' as _i9;
import '../statistics/daily_dimension_summary.dart' as _i10;
import 'package:version_manager_server/src/generated/protocol.dart' as _i11;

/// Приложение для управления версиями
abstract class Application
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
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
    this.appInstances,
    this.checkSummaries,
    this.dimensionSummaries,
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
    List<_i8.AppInstance>? appInstances,
    List<_i9.DailyCheckSummary>? checkSummaries,
    List<_i10.DailyDimensionSummary>? dimensionSummaries,
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
      platforms: _i11.Protocol().deserialize<List<_i2.PlatformType>>(
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
          : _i11.Protocol().deserialize<_i4.User>(
              jsonSerialization['ownerUser'],
            ),
      ownerTeamId: jsonSerialization['ownerTeamId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['ownerTeamId'],
            ),
      ownerTeam: jsonSerialization['ownerTeam'] == null
          ? null
          : _i11.Protocol().deserialize<_i5.Team>(
              jsonSerialization['ownerTeam'],
            ),
      storeLinks: jsonSerialization['storeLinks'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i6.StoreLink>>(
              jsonSerialization['storeLinks'],
            ),
      versions: jsonSerialization['versions'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i7.Version>>(
              jsonSerialization['versions'],
            ),
      appInstances: jsonSerialization['appInstances'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i8.AppInstance>>(
              jsonSerialization['appInstances'],
            ),
      checkSummaries: jsonSerialization['checkSummaries'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i9.DailyCheckSummary>>(
              jsonSerialization['checkSummaries'],
            ),
      dimensionSummaries: jsonSerialization['dimensionSummaries'] == null
          ? null
          : _i11.Protocol().deserialize<List<_i10.DailyDimensionSummary>>(
              jsonSerialization['dimensionSummaries'],
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

  static final t = ApplicationTable();

  static const db = ApplicationRepository._();

  @override
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

  List<_i8.AppInstance>? appInstances;

  List<_i9.DailyCheckSummary>? checkSummaries;

  List<_i10.DailyDimensionSummary>? dimensionSummaries;

  bool isActive;

  String apiKeyHash;

  String apiKeyLast4;

  DateTime apiKeyCreatedAt;

  DateTime? apiKeyLastRegeneratedAt;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

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
    List<_i8.AppInstance>? appInstances,
    List<_i9.DailyCheckSummary>? checkSummaries,
    List<_i10.DailyDimensionSummary>? dimensionSummaries,
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
      if (appInstances != null)
        'appInstances': appInstances?.toJson(valueToJson: (v) => v.toJson()),
      if (checkSummaries != null)
        'checkSummaries': checkSummaries?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (dimensionSummaries != null)
        'dimensionSummaries': dimensionSummaries?.toJson(
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
  Map<String, dynamic> toJsonForProtocol() {
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
      if (ownerUser != null) 'ownerUser': ownerUser?.toJsonForProtocol(),
      if (ownerTeamId != null) 'ownerTeamId': ownerTeamId?.toJson(),
      if (ownerTeam != null) 'ownerTeam': ownerTeam?.toJsonForProtocol(),
      if (storeLinks != null)
        'storeLinks': storeLinks?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (versions != null)
        'versions': versions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (appInstances != null)
        'appInstances': appInstances?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (checkSummaries != null)
        'checkSummaries': checkSummaries?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (dimensionSummaries != null)
        'dimensionSummaries': dimensionSummaries?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
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

  static ApplicationInclude include({
    _i4.UserInclude? ownerUser,
    _i5.TeamInclude? ownerTeam,
    _i6.StoreLinkIncludeList? storeLinks,
    _i7.VersionIncludeList? versions,
    _i8.AppInstanceIncludeList? appInstances,
    _i9.DailyCheckSummaryIncludeList? checkSummaries,
    _i10.DailyDimensionSummaryIncludeList? dimensionSummaries,
  }) {
    return ApplicationInclude._(
      ownerUser: ownerUser,
      ownerTeam: ownerTeam,
      storeLinks: storeLinks,
      versions: versions,
      appInstances: appInstances,
      checkSummaries: checkSummaries,
      dimensionSummaries: dimensionSummaries,
    );
  }

  static ApplicationIncludeList includeList({
    _i1.WhereExpressionBuilder<ApplicationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApplicationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApplicationTable>? orderByList,
    ApplicationInclude? include,
  }) {
    return ApplicationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Application.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Application.t),
      include: include,
    );
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
    List<_i8.AppInstance>? appInstances,
    List<_i9.DailyCheckSummary>? checkSummaries,
    List<_i10.DailyDimensionSummary>? dimensionSummaries,
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
         appInstances: appInstances,
         checkSummaries: checkSummaries,
         dimensionSummaries: dimensionSummaries,
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
    Object? appInstances = _Undefined,
    Object? checkSummaries = _Undefined,
    Object? dimensionSummaries = _Undefined,
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
      appInstances: appInstances is List<_i8.AppInstance>?
          ? appInstances
          : this.appInstances?.map((e0) => e0.copyWith()).toList(),
      checkSummaries: checkSummaries is List<_i9.DailyCheckSummary>?
          ? checkSummaries
          : this.checkSummaries?.map((e0) => e0.copyWith()).toList(),
      dimensionSummaries:
          dimensionSummaries is List<_i10.DailyDimensionSummary>?
          ? dimensionSummaries
          : this.dimensionSummaries?.map((e0) => e0.copyWith()).toList(),
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

class ApplicationUpdateTable extends _i1.UpdateTable<ApplicationTable> {
  ApplicationUpdateTable(super.table);

  _i1.ColumnValue<String, String> namespace(String value) => _i1.ColumnValue(
    table.namespace,
    value,
  );

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<String, String> iconUrl(String? value) => _i1.ColumnValue(
    table.iconUrl,
    value,
  );

  _i1.ColumnValue<List<_i2.PlatformType>, List<_i2.PlatformType>> platforms(
    List<_i2.PlatformType> value,
  ) => _i1.ColumnValue(
    table.platforms,
    value,
  );

  _i1.ColumnValue<_i3.OwnerType, _i3.OwnerType> ownerType(
    _i3.OwnerType value,
  ) => _i1.ColumnValue(
    table.ownerType,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> ownerUserId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.ownerUserId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> ownerTeamId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.ownerTeamId,
    value,
  );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<String, String> apiKeyHash(String value) => _i1.ColumnValue(
    table.apiKeyHash,
    value,
  );

  _i1.ColumnValue<String, String> apiKeyLast4(String value) => _i1.ColumnValue(
    table.apiKeyLast4,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> apiKeyCreatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.apiKeyCreatedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> apiKeyLastRegeneratedAt(
    DateTime? value,
  ) => _i1.ColumnValue(
    table.apiKeyLastRegeneratedAt,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> updatedAt(DateTime value) =>
      _i1.ColumnValue(
        table.updatedAt,
        value,
      );
}

class ApplicationTable extends _i1.Table<_i1.UuidValue?> {
  ApplicationTable({super.tableRelation}) : super(tableName: 'applications') {
    updateTable = ApplicationUpdateTable(this);
    namespace = _i1.ColumnString(
      'namespace',
      this,
    );
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
      hasDefault: true,
    );
    iconUrl = _i1.ColumnString(
      'iconUrl',
      this,
    );
    platforms = _i1.ColumnSerializable<List<_i2.PlatformType>>(
      'platforms',
      this,
    );
    ownerType = _i1.ColumnEnum(
      'ownerType',
      this,
      _i1.EnumSerialization.byName,
    );
    ownerUserId = _i1.ColumnUuid(
      'ownerUserId',
      this,
    );
    ownerTeamId = _i1.ColumnUuid(
      'ownerTeamId',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    apiKeyHash = _i1.ColumnString(
      'apiKeyHash',
      this,
    );
    apiKeyLast4 = _i1.ColumnString(
      'apiKeyLast4',
      this,
      hasDefault: true,
    );
    apiKeyCreatedAt = _i1.ColumnDateTime(
      'apiKeyCreatedAt',
      this,
      hasDefault: true,
    );
    apiKeyLastRegeneratedAt = _i1.ColumnDateTime(
      'apiKeyLastRegeneratedAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
      hasDefault: true,
    );
  }

  late final ApplicationUpdateTable updateTable;

  late final _i1.ColumnString namespace;

  late final _i1.ColumnString name;

  late final _i1.ColumnString description;

  late final _i1.ColumnString iconUrl;

  late final _i1.ColumnSerializable<List<_i2.PlatformType>> platforms;

  late final _i1.ColumnEnum<_i3.OwnerType> ownerType;

  late final _i1.ColumnUuid ownerUserId;

  _i4.UserTable? _ownerUser;

  late final _i1.ColumnUuid ownerTeamId;

  _i5.TeamTable? _ownerTeam;

  _i6.StoreLinkTable? ___storeLinks;

  _i1.ManyRelation<_i6.StoreLinkTable>? _storeLinks;

  _i7.VersionTable? ___versions;

  _i1.ManyRelation<_i7.VersionTable>? _versions;

  _i8.AppInstanceTable? ___appInstances;

  _i1.ManyRelation<_i8.AppInstanceTable>? _appInstances;

  _i9.DailyCheckSummaryTable? ___checkSummaries;

  _i1.ManyRelation<_i9.DailyCheckSummaryTable>? _checkSummaries;

  _i10.DailyDimensionSummaryTable? ___dimensionSummaries;

  _i1.ManyRelation<_i10.DailyDimensionSummaryTable>? _dimensionSummaries;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnString apiKeyHash;

  late final _i1.ColumnString apiKeyLast4;

  late final _i1.ColumnDateTime apiKeyCreatedAt;

  late final _i1.ColumnDateTime apiKeyLastRegeneratedAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i4.UserTable get ownerUser {
    if (_ownerUser != null) return _ownerUser!;
    _ownerUser = _i1.createRelationTable(
      relationFieldName: 'ownerUser',
      field: Application.t.ownerUserId,
      foreignField: _i4.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.UserTable(tableRelation: foreignTableRelation),
    );
    return _ownerUser!;
  }

  _i5.TeamTable get ownerTeam {
    if (_ownerTeam != null) return _ownerTeam!;
    _ownerTeam = _i1.createRelationTable(
      relationFieldName: 'ownerTeam',
      field: Application.t.ownerTeamId,
      foreignField: _i5.Team.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TeamTable(tableRelation: foreignTableRelation),
    );
    return _ownerTeam!;
  }

  _i6.StoreLinkTable get __storeLinks {
    if (___storeLinks != null) return ___storeLinks!;
    ___storeLinks = _i1.createRelationTable(
      relationFieldName: '__storeLinks',
      field: Application.t.id,
      foreignField: _i6.StoreLink.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.StoreLinkTable(tableRelation: foreignTableRelation),
    );
    return ___storeLinks!;
  }

  _i7.VersionTable get __versions {
    if (___versions != null) return ___versions!;
    ___versions = _i1.createRelationTable(
      relationFieldName: '__versions',
      field: Application.t.id,
      foreignField: _i7.Version.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.VersionTable(tableRelation: foreignTableRelation),
    );
    return ___versions!;
  }

  _i8.AppInstanceTable get __appInstances {
    if (___appInstances != null) return ___appInstances!;
    ___appInstances = _i1.createRelationTable(
      relationFieldName: '__appInstances',
      field: Application.t.id,
      foreignField: _i8.AppInstance.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.AppInstanceTable(tableRelation: foreignTableRelation),
    );
    return ___appInstances!;
  }

  _i9.DailyCheckSummaryTable get __checkSummaries {
    if (___checkSummaries != null) return ___checkSummaries!;
    ___checkSummaries = _i1.createRelationTable(
      relationFieldName: '__checkSummaries',
      field: Application.t.id,
      foreignField: _i9.DailyCheckSummary.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.DailyCheckSummaryTable(tableRelation: foreignTableRelation),
    );
    return ___checkSummaries!;
  }

  _i10.DailyDimensionSummaryTable get __dimensionSummaries {
    if (___dimensionSummaries != null) return ___dimensionSummaries!;
    ___dimensionSummaries = _i1.createRelationTable(
      relationFieldName: '__dimensionSummaries',
      field: Application.t.id,
      foreignField: _i10.DailyDimensionSummary.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i10.DailyDimensionSummaryTable(tableRelation: foreignTableRelation),
    );
    return ___dimensionSummaries!;
  }

  _i1.ManyRelation<_i6.StoreLinkTable> get storeLinks {
    if (_storeLinks != null) return _storeLinks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'storeLinks',
      field: Application.t.id,
      foreignField: _i6.StoreLink.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.StoreLinkTable(tableRelation: foreignTableRelation),
    );
    _storeLinks = _i1.ManyRelation<_i6.StoreLinkTable>(
      tableWithRelations: relationTable,
      table: _i6.StoreLinkTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _storeLinks!;
  }

  _i1.ManyRelation<_i7.VersionTable> get versions {
    if (_versions != null) return _versions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'versions',
      field: Application.t.id,
      foreignField: _i7.Version.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.VersionTable(tableRelation: foreignTableRelation),
    );
    _versions = _i1.ManyRelation<_i7.VersionTable>(
      tableWithRelations: relationTable,
      table: _i7.VersionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _versions!;
  }

  _i1.ManyRelation<_i8.AppInstanceTable> get appInstances {
    if (_appInstances != null) return _appInstances!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'appInstances',
      field: Application.t.id,
      foreignField: _i8.AppInstance.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.AppInstanceTable(tableRelation: foreignTableRelation),
    );
    _appInstances = _i1.ManyRelation<_i8.AppInstanceTable>(
      tableWithRelations: relationTable,
      table: _i8.AppInstanceTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _appInstances!;
  }

  _i1.ManyRelation<_i9.DailyCheckSummaryTable> get checkSummaries {
    if (_checkSummaries != null) return _checkSummaries!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'checkSummaries',
      field: Application.t.id,
      foreignField: _i9.DailyCheckSummary.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.DailyCheckSummaryTable(tableRelation: foreignTableRelation),
    );
    _checkSummaries = _i1.ManyRelation<_i9.DailyCheckSummaryTable>(
      tableWithRelations: relationTable,
      table: _i9.DailyCheckSummaryTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _checkSummaries!;
  }

  _i1.ManyRelation<_i10.DailyDimensionSummaryTable> get dimensionSummaries {
    if (_dimensionSummaries != null) return _dimensionSummaries!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'dimensionSummaries',
      field: Application.t.id,
      foreignField: _i10.DailyDimensionSummary.t.applicationId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i10.DailyDimensionSummaryTable(tableRelation: foreignTableRelation),
    );
    _dimensionSummaries = _i1.ManyRelation<_i10.DailyDimensionSummaryTable>(
      tableWithRelations: relationTable,
      table: _i10.DailyDimensionSummaryTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _dimensionSummaries!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    namespace,
    name,
    description,
    iconUrl,
    platforms,
    ownerType,
    ownerUserId,
    ownerTeamId,
    isActive,
    apiKeyHash,
    apiKeyLast4,
    apiKeyCreatedAt,
    apiKeyLastRegeneratedAt,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'ownerUser') {
      return ownerUser;
    }
    if (relationField == 'ownerTeam') {
      return ownerTeam;
    }
    if (relationField == 'storeLinks') {
      return __storeLinks;
    }
    if (relationField == 'versions') {
      return __versions;
    }
    if (relationField == 'appInstances') {
      return __appInstances;
    }
    if (relationField == 'checkSummaries') {
      return __checkSummaries;
    }
    if (relationField == 'dimensionSummaries') {
      return __dimensionSummaries;
    }
    return null;
  }
}

class ApplicationInclude extends _i1.IncludeObject {
  ApplicationInclude._({
    _i4.UserInclude? ownerUser,
    _i5.TeamInclude? ownerTeam,
    _i6.StoreLinkIncludeList? storeLinks,
    _i7.VersionIncludeList? versions,
    _i8.AppInstanceIncludeList? appInstances,
    _i9.DailyCheckSummaryIncludeList? checkSummaries,
    _i10.DailyDimensionSummaryIncludeList? dimensionSummaries,
  }) {
    _ownerUser = ownerUser;
    _ownerTeam = ownerTeam;
    _storeLinks = storeLinks;
    _versions = versions;
    _appInstances = appInstances;
    _checkSummaries = checkSummaries;
    _dimensionSummaries = dimensionSummaries;
  }

  _i4.UserInclude? _ownerUser;

  _i5.TeamInclude? _ownerTeam;

  _i6.StoreLinkIncludeList? _storeLinks;

  _i7.VersionIncludeList? _versions;

  _i8.AppInstanceIncludeList? _appInstances;

  _i9.DailyCheckSummaryIncludeList? _checkSummaries;

  _i10.DailyDimensionSummaryIncludeList? _dimensionSummaries;

  @override
  Map<String, _i1.Include?> get includes => {
    'ownerUser': _ownerUser,
    'ownerTeam': _ownerTeam,
    'storeLinks': _storeLinks,
    'versions': _versions,
    'appInstances': _appInstances,
    'checkSummaries': _checkSummaries,
    'dimensionSummaries': _dimensionSummaries,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => Application.t;
}

class ApplicationIncludeList extends _i1.IncludeList {
  ApplicationIncludeList._({
    _i1.WhereExpressionBuilder<ApplicationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Application.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Application.t;
}

class ApplicationRepository {
  const ApplicationRepository._();

  final attach = const ApplicationAttachRepository._();

  final attachRow = const ApplicationAttachRowRepository._();

  final detach = const ApplicationDetachRepository._();

  final detachRow = const ApplicationDetachRowRepository._();

  /// Returns a list of [Application]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Application>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ApplicationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApplicationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApplicationTable>? orderByList,
    _i1.Transaction? transaction,
    ApplicationInclude? include,
  }) async {
    return session.db.find<Application>(
      where: where?.call(Application.t),
      orderBy: orderBy?.call(Application.t),
      orderByList: orderByList?.call(Application.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Application] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Application?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ApplicationTable>? where,
    int? offset,
    _i1.OrderByBuilder<ApplicationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ApplicationTable>? orderByList,
    _i1.Transaction? transaction,
    ApplicationInclude? include,
  }) async {
    return session.db.findFirstRow<Application>(
      where: where?.call(Application.t),
      orderBy: orderBy?.call(Application.t),
      orderByList: orderByList?.call(Application.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Application] by its [id] or null if no such row exists.
  Future<Application?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    ApplicationInclude? include,
  }) async {
    return session.db.findById<Application>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Application]s in the list and returns the inserted rows.
  ///
  /// The returned [Application]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Application>> insert(
    _i1.Session session,
    List<Application> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Application>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Application] and returns the inserted row.
  ///
  /// The returned [Application] will have its `id` field set.
  Future<Application> insertRow(
    _i1.Session session,
    Application row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Application>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Application]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Application>> update(
    _i1.Session session,
    List<Application> rows, {
    _i1.ColumnSelections<ApplicationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Application>(
      rows,
      columns: columns?.call(Application.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Application]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Application> updateRow(
    _i1.Session session,
    Application row, {
    _i1.ColumnSelections<ApplicationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Application>(
      row,
      columns: columns?.call(Application.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Application] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Application?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<ApplicationUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Application>(
      id,
      columnValues: columnValues(Application.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Application]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Application>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<ApplicationUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<ApplicationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ApplicationTable>? orderBy,
    _i1.OrderByListBuilder<ApplicationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Application>(
      columnValues: columnValues(Application.t.updateTable),
      where: where(Application.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Application.t),
      orderByList: orderByList?.call(Application.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Application]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Application>> delete(
    _i1.Session session,
    List<Application> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Application>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Application].
  Future<Application> deleteRow(
    _i1.Session session,
    Application row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Application>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Application>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ApplicationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Application>(
      where: where(Application.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ApplicationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Application>(
      where: where?.call(Application.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ApplicationAttachRepository {
  const ApplicationAttachRepository._();

  /// Creates a relation between this [Application] and the given [StoreLink]s
  /// by setting each [StoreLink]'s foreign key `applicationId` to refer to this [Application].
  Future<void> storeLinks(
    _i1.Session session,
    Application application,
    List<_i6.StoreLink> storeLink, {
    _i1.Transaction? transaction,
  }) async {
    if (storeLink.any((e) => e.id == null)) {
      throw ArgumentError.notNull('storeLink.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $storeLink = storeLink
        .map((e) => e.copyWith(applicationId: application.id))
        .toList();
    await session.db.update<_i6.StoreLink>(
      $storeLink,
      columns: [_i6.StoreLink.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [Version]s
  /// by setting each [Version]'s foreign key `applicationId` to refer to this [Application].
  Future<void> versions(
    _i1.Session session,
    Application application,
    List<_i7.Version> version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.any((e) => e.id == null)) {
      throw ArgumentError.notNull('version.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $version = version
        .map((e) => e.copyWith(applicationId: application.id))
        .toList();
    await session.db.update<_i7.Version>(
      $version,
      columns: [_i7.Version.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [AppInstance]s
  /// by setting each [AppInstance]'s foreign key `applicationId` to refer to this [Application].
  Future<void> appInstances(
    _i1.Session session,
    Application application,
    List<_i8.AppInstance> appInstance, {
    _i1.Transaction? transaction,
  }) async {
    if (appInstance.any((e) => e.id == null)) {
      throw ArgumentError.notNull('appInstance.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $appInstance = appInstance
        .map((e) => e.copyWith(applicationId: application.id))
        .toList();
    await session.db.update<_i8.AppInstance>(
      $appInstance,
      columns: [_i8.AppInstance.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [DailyCheckSummary]s
  /// by setting each [DailyCheckSummary]'s foreign key `applicationId` to refer to this [Application].
  Future<void> checkSummaries(
    _i1.Session session,
    Application application,
    List<_i9.DailyCheckSummary> dailyCheckSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyCheckSummary.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dailyCheckSummary.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $dailyCheckSummary = dailyCheckSummary
        .map((e) => e.copyWith(applicationId: application.id))
        .toList();
    await session.db.update<_i9.DailyCheckSummary>(
      $dailyCheckSummary,
      columns: [_i9.DailyCheckSummary.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [DailyDimensionSummary]s
  /// by setting each [DailyDimensionSummary]'s foreign key `applicationId` to refer to this [Application].
  Future<void> dimensionSummaries(
    _i1.Session session,
    Application application,
    List<_i10.DailyDimensionSummary> dailyDimensionSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyDimensionSummary.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dailyDimensionSummary.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $dailyDimensionSummary = dailyDimensionSummary
        .map((e) => e.copyWith(applicationId: application.id))
        .toList();
    await session.db.update<_i10.DailyDimensionSummary>(
      $dailyDimensionSummary,
      columns: [_i10.DailyDimensionSummary.t.applicationId],
      transaction: transaction,
    );
  }
}

class ApplicationAttachRowRepository {
  const ApplicationAttachRowRepository._();

  /// Creates a relation between the given [Application] and [User]
  /// by setting the [Application]'s foreign key `ownerUserId` to refer to the [User].
  Future<void> ownerUser(
    _i1.Session session,
    Application application,
    _i4.User ownerUser, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }
    if (ownerUser.id == null) {
      throw ArgumentError.notNull('ownerUser.id');
    }

    var $application = application.copyWith(ownerUserId: ownerUser.id);
    await session.db.updateRow<Application>(
      $application,
      columns: [Application.t.ownerUserId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Application] and [Team]
  /// by setting the [Application]'s foreign key `ownerTeamId` to refer to the [Team].
  Future<void> ownerTeam(
    _i1.Session session,
    Application application,
    _i5.Team ownerTeam, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }
    if (ownerTeam.id == null) {
      throw ArgumentError.notNull('ownerTeam.id');
    }

    var $application = application.copyWith(ownerTeamId: ownerTeam.id);
    await session.db.updateRow<Application>(
      $application,
      columns: [Application.t.ownerTeamId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [StoreLink]
  /// by setting the [StoreLink]'s foreign key `applicationId` to refer to this [Application].
  Future<void> storeLinks(
    _i1.Session session,
    Application application,
    _i6.StoreLink storeLink, {
    _i1.Transaction? transaction,
  }) async {
    if (storeLink.id == null) {
      throw ArgumentError.notNull('storeLink.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $storeLink = storeLink.copyWith(applicationId: application.id);
    await session.db.updateRow<_i6.StoreLink>(
      $storeLink,
      columns: [_i6.StoreLink.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [Version]
  /// by setting the [Version]'s foreign key `applicationId` to refer to this [Application].
  Future<void> versions(
    _i1.Session session,
    Application application,
    _i7.Version version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $version = version.copyWith(applicationId: application.id);
    await session.db.updateRow<_i7.Version>(
      $version,
      columns: [_i7.Version.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [AppInstance]
  /// by setting the [AppInstance]'s foreign key `applicationId` to refer to this [Application].
  Future<void> appInstances(
    _i1.Session session,
    Application application,
    _i8.AppInstance appInstance, {
    _i1.Transaction? transaction,
  }) async {
    if (appInstance.id == null) {
      throw ArgumentError.notNull('appInstance.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $appInstance = appInstance.copyWith(applicationId: application.id);
    await session.db.updateRow<_i8.AppInstance>(
      $appInstance,
      columns: [_i8.AppInstance.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [DailyCheckSummary]
  /// by setting the [DailyCheckSummary]'s foreign key `applicationId` to refer to this [Application].
  Future<void> checkSummaries(
    _i1.Session session,
    Application application,
    _i9.DailyCheckSummary dailyCheckSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyCheckSummary.id == null) {
      throw ArgumentError.notNull('dailyCheckSummary.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $dailyCheckSummary = dailyCheckSummary.copyWith(
      applicationId: application.id,
    );
    await session.db.updateRow<_i9.DailyCheckSummary>(
      $dailyCheckSummary,
      columns: [_i9.DailyCheckSummary.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Application] and the given [DailyDimensionSummary]
  /// by setting the [DailyDimensionSummary]'s foreign key `applicationId` to refer to this [Application].
  Future<void> dimensionSummaries(
    _i1.Session session,
    Application application,
    _i10.DailyDimensionSummary dailyDimensionSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyDimensionSummary.id == null) {
      throw ArgumentError.notNull('dailyDimensionSummary.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $dailyDimensionSummary = dailyDimensionSummary.copyWith(
      applicationId: application.id,
    );
    await session.db.updateRow<_i10.DailyDimensionSummary>(
      $dailyDimensionSummary,
      columns: [_i10.DailyDimensionSummary.t.applicationId],
      transaction: transaction,
    );
  }
}

class ApplicationDetachRepository {
  const ApplicationDetachRepository._();

  /// Detaches the relation between this [Application] and the given [StoreLink]
  /// by setting the [StoreLink]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> storeLinks(
    _i1.Session session,
    List<_i6.StoreLink> storeLink, {
    _i1.Transaction? transaction,
  }) async {
    if (storeLink.any((e) => e.id == null)) {
      throw ArgumentError.notNull('storeLink.id');
    }

    var $storeLink = storeLink
        .map((e) => e.copyWith(applicationId: null))
        .toList();
    await session.db.update<_i6.StoreLink>(
      $storeLink,
      columns: [_i6.StoreLink.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [Version]
  /// by setting the [Version]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> versions(
    _i1.Session session,
    List<_i7.Version> version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.any((e) => e.id == null)) {
      throw ArgumentError.notNull('version.id');
    }

    var $version = version.map((e) => e.copyWith(applicationId: null)).toList();
    await session.db.update<_i7.Version>(
      $version,
      columns: [_i7.Version.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [AppInstance]
  /// by setting the [AppInstance]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> appInstances(
    _i1.Session session,
    List<_i8.AppInstance> appInstance, {
    _i1.Transaction? transaction,
  }) async {
    if (appInstance.any((e) => e.id == null)) {
      throw ArgumentError.notNull('appInstance.id');
    }

    var $appInstance = appInstance
        .map((e) => e.copyWith(applicationId: null))
        .toList();
    await session.db.update<_i8.AppInstance>(
      $appInstance,
      columns: [_i8.AppInstance.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [DailyCheckSummary]
  /// by setting the [DailyCheckSummary]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> checkSummaries(
    _i1.Session session,
    List<_i9.DailyCheckSummary> dailyCheckSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyCheckSummary.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dailyCheckSummary.id');
    }

    var $dailyCheckSummary = dailyCheckSummary
        .map((e) => e.copyWith(applicationId: null))
        .toList();
    await session.db.update<_i9.DailyCheckSummary>(
      $dailyCheckSummary,
      columns: [_i9.DailyCheckSummary.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [DailyDimensionSummary]
  /// by setting the [DailyDimensionSummary]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> dimensionSummaries(
    _i1.Session session,
    List<_i10.DailyDimensionSummary> dailyDimensionSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyDimensionSummary.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dailyDimensionSummary.id');
    }

    var $dailyDimensionSummary = dailyDimensionSummary
        .map((e) => e.copyWith(applicationId: null))
        .toList();
    await session.db.update<_i10.DailyDimensionSummary>(
      $dailyDimensionSummary,
      columns: [_i10.DailyDimensionSummary.t.applicationId],
      transaction: transaction,
    );
  }
}

class ApplicationDetachRowRepository {
  const ApplicationDetachRowRepository._();

  /// Detaches the relation between this [Application] and the [User] set in `ownerUser`
  /// by setting the [Application]'s foreign key `ownerUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ownerUser(
    _i1.Session session,
    Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $application = application.copyWith(ownerUserId: null);
    await session.db.updateRow<Application>(
      $application,
      columns: [Application.t.ownerUserId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the [Team] set in `ownerTeam`
  /// by setting the [Application]'s foreign key `ownerTeamId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ownerTeam(
    _i1.Session session,
    Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $application = application.copyWith(ownerTeamId: null);
    await session.db.updateRow<Application>(
      $application,
      columns: [Application.t.ownerTeamId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [StoreLink]
  /// by setting the [StoreLink]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> storeLinks(
    _i1.Session session,
    _i6.StoreLink storeLink, {
    _i1.Transaction? transaction,
  }) async {
    if (storeLink.id == null) {
      throw ArgumentError.notNull('storeLink.id');
    }

    var $storeLink = storeLink.copyWith(applicationId: null);
    await session.db.updateRow<_i6.StoreLink>(
      $storeLink,
      columns: [_i6.StoreLink.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [Version]
  /// by setting the [Version]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> versions(
    _i1.Session session,
    _i7.Version version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $version = version.copyWith(applicationId: null);
    await session.db.updateRow<_i7.Version>(
      $version,
      columns: [_i7.Version.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [AppInstance]
  /// by setting the [AppInstance]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> appInstances(
    _i1.Session session,
    _i8.AppInstance appInstance, {
    _i1.Transaction? transaction,
  }) async {
    if (appInstance.id == null) {
      throw ArgumentError.notNull('appInstance.id');
    }

    var $appInstance = appInstance.copyWith(applicationId: null);
    await session.db.updateRow<_i8.AppInstance>(
      $appInstance,
      columns: [_i8.AppInstance.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [DailyCheckSummary]
  /// by setting the [DailyCheckSummary]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> checkSummaries(
    _i1.Session session,
    _i9.DailyCheckSummary dailyCheckSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyCheckSummary.id == null) {
      throw ArgumentError.notNull('dailyCheckSummary.id');
    }

    var $dailyCheckSummary = dailyCheckSummary.copyWith(applicationId: null);
    await session.db.updateRow<_i9.DailyCheckSummary>(
      $dailyCheckSummary,
      columns: [_i9.DailyCheckSummary.t.applicationId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Application] and the given [DailyDimensionSummary]
  /// by setting the [DailyDimensionSummary]'s foreign key `applicationId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> dimensionSummaries(
    _i1.Session session,
    _i10.DailyDimensionSummary dailyDimensionSummary, {
    _i1.Transaction? transaction,
  }) async {
    if (dailyDimensionSummary.id == null) {
      throw ArgumentError.notNull('dailyDimensionSummary.id');
    }

    var $dailyDimensionSummary = dailyDimensionSummary.copyWith(
      applicationId: null,
    );
    await session.db.updateRow<_i10.DailyDimensionSummary>(
      $dailyDimensionSummary,
      columns: [_i10.DailyDimensionSummary.t.applicationId],
      transaction: transaction,
    );
  }
}
