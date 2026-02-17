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
import '../apps/application.dart' as _i2;
import '../versions/version.dart' as _i3;
import '../enums/recommendation_frequency_type.dart' as _i4;
import 'package:version_manager_server/src/generated/protocol.dart' as _i5;

/// Версия приложения
abstract class Version
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Version._({
    this.id,
    required this.applicationId,
    this.application,
    required this.versionNumber,
    required this.buildNumber,
    required this.changelog,
    bool? isBlocked,
    this.blockReason,
    this.recommendedVersionId,
    this.recommendedVersion,
    this.recommendingVersions,
    this.recommendationFrequency,
    this.recommendationEveryNthLaunch,
    this.recommendationPeriodHours,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : isBlocked = isBlocked ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Version({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    _i3.Version? recommendedVersion,
    List<_i3.Version>? recommendingVersions,
    _i4.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VersionImpl;

  factory Version.fromJson(Map<String, dynamic> jsonSerialization) {
    return Version(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      application: jsonSerialization['application'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      changelog: jsonSerialization['changelog'] as String,
      isBlocked: jsonSerialization['isBlocked'] as bool?,
      blockReason: jsonSerialization['blockReason'] as String?,
      recommendedVersionId: jsonSerialization['recommendedVersionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['recommendedVersionId'],
            ),
      recommendedVersion: jsonSerialization['recommendedVersion'] == null
          ? null
          : _i5.Protocol().deserialize<_i3.Version>(
              jsonSerialization['recommendedVersion'],
            ),
      recommendingVersions: jsonSerialization['recommendingVersions'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.Version>>(
              jsonSerialization['recommendingVersions'],
            ),
      recommendationFrequency:
          jsonSerialization['recommendationFrequency'] == null
          ? null
          : _i4.RecommendationFrequencyType.fromJson(
              (jsonSerialization['recommendationFrequency'] as String),
            ),
      recommendationEveryNthLaunch:
          jsonSerialization['recommendationEveryNthLaunch'] as int?,
      recommendationPeriodHours:
          jsonSerialization['recommendationPeriodHours'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = VersionTable();

  static const db = VersionRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  _i2.Application? application;

  String versionNumber;

  int buildNumber;

  String changelog;

  bool isBlocked;

  String? blockReason;

  _i1.UuidValue? recommendedVersionId;

  _i3.Version? recommendedVersion;

  List<_i3.Version>? recommendingVersions;

  /// Настройки частоты показа рекомендации обновления
  _i4.RecommendationFrequencyType? recommendationFrequency;

  /// Интервал для типа "everyNthLaunch" (от 2 до 50)
  int? recommendationEveryNthLaunch;

  /// Интервал для типа "oncePer" в часах
  int? recommendationPeriodHours;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Version]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Version copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    _i3.Version? recommendedVersion,
    List<_i3.Version>? recommendingVersions,
    _i4.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Version',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (recommendedVersionId != null)
        'recommendedVersionId': recommendedVersionId?.toJson(),
      if (recommendedVersion != null)
        'recommendedVersion': recommendedVersion?.toJson(),
      if (recommendingVersions != null)
        'recommendingVersions': recommendingVersions?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (recommendationFrequency != null)
        'recommendationFrequency': recommendationFrequency?.toJson(),
      if (recommendationEveryNthLaunch != null)
        'recommendationEveryNthLaunch': recommendationEveryNthLaunch,
      if (recommendationPeriodHours != null)
        'recommendationPeriodHours': recommendationPeriodHours,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Version',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      if (recommendedVersionId != null)
        'recommendedVersionId': recommendedVersionId?.toJson(),
      if (recommendedVersion != null)
        'recommendedVersion': recommendedVersion?.toJsonForProtocol(),
      if (recommendingVersions != null)
        'recommendingVersions': recommendingVersions?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (recommendationFrequency != null)
        'recommendationFrequency': recommendationFrequency?.toJson(),
      if (recommendationEveryNthLaunch != null)
        'recommendationEveryNthLaunch': recommendationEveryNthLaunch,
      if (recommendationPeriodHours != null)
        'recommendationPeriodHours': recommendationPeriodHours,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static VersionInclude include({
    _i2.ApplicationInclude? application,
    _i3.VersionInclude? recommendedVersion,
    _i3.VersionIncludeList? recommendingVersions,
  }) {
    return VersionInclude._(
      application: application,
      recommendedVersion: recommendedVersion,
      recommendingVersions: recommendingVersions,
    );
  }

  static VersionIncludeList includeList({
    _i1.WhereExpressionBuilder<VersionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionTable>? orderByList,
    VersionInclude? include,
  }) {
    return VersionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Version.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Version.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VersionImpl extends Version {
  _VersionImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String versionNumber,
    required int buildNumber,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    _i1.UuidValue? recommendedVersionId,
    _i3.Version? recommendedVersion,
    List<_i3.Version>? recommendingVersions,
    _i4.RecommendationFrequencyType? recommendationFrequency,
    int? recommendationEveryNthLaunch,
    int? recommendationPeriodHours,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         changelog: changelog,
         isBlocked: isBlocked,
         blockReason: blockReason,
         recommendedVersionId: recommendedVersionId,
         recommendedVersion: recommendedVersion,
         recommendingVersions: recommendingVersions,
         recommendationFrequency: recommendationFrequency,
         recommendationEveryNthLaunch: recommendationEveryNthLaunch,
         recommendationPeriodHours: recommendationPeriodHours,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Version]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Version copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    String? versionNumber,
    int? buildNumber,
    String? changelog,
    bool? isBlocked,
    Object? blockReason = _Undefined,
    Object? recommendedVersionId = _Undefined,
    Object? recommendedVersion = _Undefined,
    Object? recommendingVersions = _Undefined,
    Object? recommendationFrequency = _Undefined,
    Object? recommendationEveryNthLaunch = _Undefined,
    Object? recommendationPeriodHours = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Version(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      changelog: changelog ?? this.changelog,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      recommendedVersionId: recommendedVersionId is _i1.UuidValue?
          ? recommendedVersionId
          : this.recommendedVersionId,
      recommendedVersion: recommendedVersion is _i3.Version?
          ? recommendedVersion
          : this.recommendedVersion?.copyWith(),
      recommendingVersions: recommendingVersions is List<_i3.Version>?
          ? recommendingVersions
          : this.recommendingVersions?.map((e0) => e0.copyWith()).toList(),
      recommendationFrequency:
          recommendationFrequency is _i4.RecommendationFrequencyType?
          ? recommendationFrequency
          : this.recommendationFrequency,
      recommendationEveryNthLaunch: recommendationEveryNthLaunch is int?
          ? recommendationEveryNthLaunch
          : this.recommendationEveryNthLaunch,
      recommendationPeriodHours: recommendationPeriodHours is int?
          ? recommendationPeriodHours
          : this.recommendationPeriodHours,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class VersionUpdateTable extends _i1.UpdateTable<VersionTable> {
  VersionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<String, String> versionNumber(String value) =>
      _i1.ColumnValue(
        table.versionNumber,
        value,
      );

  _i1.ColumnValue<int, int> buildNumber(int value) => _i1.ColumnValue(
    table.buildNumber,
    value,
  );

  _i1.ColumnValue<String, String> changelog(String value) => _i1.ColumnValue(
    table.changelog,
    value,
  );

  _i1.ColumnValue<bool, bool> isBlocked(bool value) => _i1.ColumnValue(
    table.isBlocked,
    value,
  );

  _i1.ColumnValue<String, String> blockReason(String? value) => _i1.ColumnValue(
    table.blockReason,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> recommendedVersionId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.recommendedVersionId,
    value,
  );

  _i1.ColumnValue<
    _i4.RecommendationFrequencyType,
    _i4.RecommendationFrequencyType
  >
  recommendationFrequency(_i4.RecommendationFrequencyType? value) =>
      _i1.ColumnValue(
        table.recommendationFrequency,
        value,
      );

  _i1.ColumnValue<int, int> recommendationEveryNthLaunch(int? value) =>
      _i1.ColumnValue(
        table.recommendationEveryNthLaunch,
        value,
      );

  _i1.ColumnValue<int, int> recommendationPeriodHours(int? value) =>
      _i1.ColumnValue(
        table.recommendationPeriodHours,
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

class VersionTable extends _i1.Table<_i1.UuidValue?> {
  VersionTable({super.tableRelation}) : super(tableName: 'versions') {
    updateTable = VersionUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    versionNumber = _i1.ColumnString(
      'versionNumber',
      this,
    );
    buildNumber = _i1.ColumnInt(
      'buildNumber',
      this,
    );
    changelog = _i1.ColumnString(
      'changelog',
      this,
    );
    isBlocked = _i1.ColumnBool(
      'isBlocked',
      this,
      hasDefault: true,
    );
    blockReason = _i1.ColumnString(
      'blockReason',
      this,
    );
    recommendedVersionId = _i1.ColumnUuid(
      'recommendedVersionId',
      this,
    );
    recommendationFrequency = _i1.ColumnEnum(
      'recommendationFrequency',
      this,
      _i1.EnumSerialization.byName,
    );
    recommendationEveryNthLaunch = _i1.ColumnInt(
      'recommendationEveryNthLaunch',
      this,
    );
    recommendationPeriodHours = _i1.ColumnInt(
      'recommendationPeriodHours',
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

  late final VersionUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  _i2.ApplicationTable? _application;

  late final _i1.ColumnString versionNumber;

  late final _i1.ColumnInt buildNumber;

  late final _i1.ColumnString changelog;

  late final _i1.ColumnBool isBlocked;

  late final _i1.ColumnString blockReason;

  late final _i1.ColumnUuid recommendedVersionId;

  _i3.VersionTable? _recommendedVersion;

  _i3.VersionTable? ___recommendingVersions;

  _i1.ManyRelation<_i3.VersionTable>? _recommendingVersions;

  /// Настройки частоты показа рекомендации обновления
  late final _i1.ColumnEnum<_i4.RecommendationFrequencyType>
  recommendationFrequency;

  /// Интервал для типа "everyNthLaunch" (от 2 до 50)
  late final _i1.ColumnInt recommendationEveryNthLaunch;

  /// Интервал для типа "oncePer" в часах
  late final _i1.ColumnInt recommendationPeriodHours;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: Version.t.applicationId,
      foreignField: _i2.Application.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ApplicationTable(tableRelation: foreignTableRelation),
    );
    return _application!;
  }

  _i3.VersionTable get recommendedVersion {
    if (_recommendedVersion != null) return _recommendedVersion!;
    _recommendedVersion = _i1.createRelationTable(
      relationFieldName: 'recommendedVersion',
      field: Version.t.recommendedVersionId,
      foreignField: _i3.Version.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VersionTable(tableRelation: foreignTableRelation),
    );
    return _recommendedVersion!;
  }

  _i3.VersionTable get __recommendingVersions {
    if (___recommendingVersions != null) return ___recommendingVersions!;
    ___recommendingVersions = _i1.createRelationTable(
      relationFieldName: '__recommendingVersions',
      field: Version.t.id,
      foreignField: _i3.Version.t.recommendedVersionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VersionTable(tableRelation: foreignTableRelation),
    );
    return ___recommendingVersions!;
  }

  _i1.ManyRelation<_i3.VersionTable> get recommendingVersions {
    if (_recommendingVersions != null) return _recommendingVersions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'recommendingVersions',
      field: Version.t.id,
      foreignField: _i3.Version.t.recommendedVersionId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VersionTable(tableRelation: foreignTableRelation),
    );
    _recommendingVersions = _i1.ManyRelation<_i3.VersionTable>(
      tableWithRelations: relationTable,
      table: _i3.VersionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _recommendingVersions!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    applicationId,
    versionNumber,
    buildNumber,
    changelog,
    isBlocked,
    blockReason,
    recommendedVersionId,
    recommendationFrequency,
    recommendationEveryNthLaunch,
    recommendationPeriodHours,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'application') {
      return application;
    }
    if (relationField == 'recommendedVersion') {
      return recommendedVersion;
    }
    if (relationField == 'recommendingVersions') {
      return __recommendingVersions;
    }
    return null;
  }
}

class VersionInclude extends _i1.IncludeObject {
  VersionInclude._({
    _i2.ApplicationInclude? application,
    _i3.VersionInclude? recommendedVersion,
    _i3.VersionIncludeList? recommendingVersions,
  }) {
    _application = application;
    _recommendedVersion = recommendedVersion;
    _recommendingVersions = recommendingVersions;
  }

  _i2.ApplicationInclude? _application;

  _i3.VersionInclude? _recommendedVersion;

  _i3.VersionIncludeList? _recommendingVersions;

  @override
  Map<String, _i1.Include?> get includes => {
    'application': _application,
    'recommendedVersion': _recommendedVersion,
    'recommendingVersions': _recommendingVersions,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => Version.t;
}

class VersionIncludeList extends _i1.IncludeList {
  VersionIncludeList._({
    _i1.WhereExpressionBuilder<VersionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Version.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Version.t;
}

class VersionRepository {
  const VersionRepository._();

  final attach = const VersionAttachRepository._();

  final attachRow = const VersionAttachRowRepository._();

  final detach = const VersionDetachRepository._();

  final detachRow = const VersionDetachRowRepository._();

  /// Returns a list of [Version]s matching the given query parameters.
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
  Future<List<Version>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionTable>? orderByList,
    _i1.Transaction? transaction,
    VersionInclude? include,
  }) async {
    return session.db.find<Version>(
      where: where?.call(Version.t),
      orderBy: orderBy?.call(Version.t),
      orderByList: orderByList?.call(Version.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Version] matching the given query parameters.
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
  Future<Version?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionTable>? where,
    int? offset,
    _i1.OrderByBuilder<VersionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionTable>? orderByList,
    _i1.Transaction? transaction,
    VersionInclude? include,
  }) async {
    return session.db.findFirstRow<Version>(
      where: where?.call(Version.t),
      orderBy: orderBy?.call(Version.t),
      orderByList: orderByList?.call(Version.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Version] by its [id] or null if no such row exists.
  Future<Version?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VersionInclude? include,
  }) async {
    return session.db.findById<Version>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Version]s in the list and returns the inserted rows.
  ///
  /// The returned [Version]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Version>> insert(
    _i1.Session session,
    List<Version> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Version>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Version] and returns the inserted row.
  ///
  /// The returned [Version] will have its `id` field set.
  Future<Version> insertRow(
    _i1.Session session,
    Version row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Version>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Version]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Version>> update(
    _i1.Session session,
    List<Version> rows, {
    _i1.ColumnSelections<VersionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Version>(
      rows,
      columns: columns?.call(Version.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Version]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Version> updateRow(
    _i1.Session session,
    Version row, {
    _i1.ColumnSelections<VersionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Version>(
      row,
      columns: columns?.call(Version.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Version] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Version?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<VersionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Version>(
      id,
      columnValues: columnValues(Version.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Version]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Version>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VersionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<VersionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionTable>? orderBy,
    _i1.OrderByListBuilder<VersionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Version>(
      columnValues: columnValues(Version.t.updateTable),
      where: where(Version.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Version.t),
      orderByList: orderByList?.call(Version.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Version]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Version>> delete(
    _i1.Session session,
    List<Version> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Version>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Version].
  Future<Version> deleteRow(
    _i1.Session session,
    Version row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Version>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Version>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VersionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Version>(
      where: where(Version.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Version>(
      where: where?.call(Version.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VersionAttachRepository {
  const VersionAttachRepository._();

  /// Creates a relation between this [Version] and the given [Version]s
  /// by setting each [Version]'s foreign key `recommendedVersionId` to refer to this [Version].
  Future<void> recommendingVersions(
    _i1.Session session,
    Version version,
    List<_i3.Version> nestedVersion, {
    _i1.Transaction? transaction,
  }) async {
    if (nestedVersion.any((e) => e.id == null)) {
      throw ArgumentError.notNull('nestedVersion.id');
    }
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $nestedVersion = nestedVersion
        .map((e) => e.copyWith(recommendedVersionId: version.id))
        .toList();
    await session.db.update<_i3.Version>(
      $nestedVersion,
      columns: [_i3.Version.t.recommendedVersionId],
      transaction: transaction,
    );
  }
}

class VersionAttachRowRepository {
  const VersionAttachRowRepository._();

  /// Creates a relation between the given [Version] and [Application]
  /// by setting the [Version]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    Version version,
    _i2.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $version = version.copyWith(applicationId: application.id);
    await session.db.updateRow<Version>(
      $version,
      columns: [Version.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Version] and [Version]
  /// by setting the [Version]'s foreign key `recommendedVersionId` to refer to the [Version].
  Future<void> recommendedVersion(
    _i1.Session session,
    Version version,
    _i3.Version recommendedVersion, {
    _i1.Transaction? transaction,
  }) async {
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }
    if (recommendedVersion.id == null) {
      throw ArgumentError.notNull('recommendedVersion.id');
    }

    var $version = version.copyWith(
      recommendedVersionId: recommendedVersion.id,
    );
    await session.db.updateRow<Version>(
      $version,
      columns: [Version.t.recommendedVersionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Version] and the given [Version]
  /// by setting the [Version]'s foreign key `recommendedVersionId` to refer to this [Version].
  Future<void> recommendingVersions(
    _i1.Session session,
    Version version,
    _i3.Version nestedVersion, {
    _i1.Transaction? transaction,
  }) async {
    if (nestedVersion.id == null) {
      throw ArgumentError.notNull('nestedVersion.id');
    }
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $nestedVersion = nestedVersion.copyWith(
      recommendedVersionId: version.id,
    );
    await session.db.updateRow<_i3.Version>(
      $nestedVersion,
      columns: [_i3.Version.t.recommendedVersionId],
      transaction: transaction,
    );
  }
}

class VersionDetachRepository {
  const VersionDetachRepository._();

  /// Detaches the relation between this [Version] and the given [Version]
  /// by setting the [Version]'s foreign key `recommendedVersionId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> recommendingVersions(
    _i1.Session session,
    List<_i3.Version> version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.any((e) => e.id == null)) {
      throw ArgumentError.notNull('version.id');
    }

    var $version = version
        .map((e) => e.copyWith(recommendedVersionId: null))
        .toList();
    await session.db.update<_i3.Version>(
      $version,
      columns: [_i3.Version.t.recommendedVersionId],
      transaction: transaction,
    );
  }
}

class VersionDetachRowRepository {
  const VersionDetachRowRepository._();

  /// Detaches the relation between this [Version] and the [Version] set in `recommendedVersion`
  /// by setting the [Version]'s foreign key `recommendedVersionId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> recommendedVersion(
    _i1.Session session,
    Version version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $version = version.copyWith(recommendedVersionId: null);
    await session.db.updateRow<Version>(
      $version,
      columns: [Version.t.recommendedVersionId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Version] and the given [Version]
  /// by setting the [Version]'s foreign key `recommendedVersionId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> recommendingVersions(
    _i1.Session session,
    _i3.Version version, {
    _i1.Transaction? transaction,
  }) async {
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $version = version.copyWith(recommendedVersionId: null);
    await session.db.updateRow<_i3.Version>(
      $version,
      columns: [_i3.Version.t.recommendedVersionId],
      transaction: transaction,
    );
  }
}
