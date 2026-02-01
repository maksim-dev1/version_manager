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
import '../apps/version.dart' as _i3;
import '../enums/platform_type.dart' as _i4;
import '../enums/response_status_type.dart' as _i5;
import 'package:version_manager_server/src/generated/protocol.dart' as _i6;

/// Лог проверки версии
abstract class VersionCheckLog
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  VersionCheckLog._({
    this.id,
    required this.applicationId,
    this.application,
    this.versionId,
    this.version,
    required this.versionNumber,
    required this.buildNumber,
    required this.platform,
    this.osVersion,
    this.deviceId,
    this.locale,
    this.deviceModel,
    this.ipAddress,
    required this.responseStatus,
    DateTime? checkedAt,
  }) : checkedAt = checkedAt ?? DateTime.now();

  factory VersionCheckLog({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    _i1.UuidValue? versionId,
    _i3.Version? version,
    required String versionNumber,
    required int buildNumber,
    required _i4.PlatformType platform,
    String? osVersion,
    String? deviceId,
    String? locale,
    String? deviceModel,
    String? ipAddress,
    required _i5.ResponseStatusType responseStatus,
    DateTime? checkedAt,
  }) = _VersionCheckLogImpl;

  factory VersionCheckLog.fromJson(Map<String, dynamic> jsonSerialization) {
    return VersionCheckLog(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      application: jsonSerialization['application'] == null
          ? null
          : _i6.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      versionId: jsonSerialization['versionId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['versionId']),
      version: jsonSerialization['version'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Version>(
              jsonSerialization['version'],
            ),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      platform: _i4.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      osVersion: jsonSerialization['osVersion'] as String?,
      deviceId: jsonSerialization['deviceId'] as String?,
      locale: jsonSerialization['locale'] as String?,
      deviceModel: jsonSerialization['deviceModel'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      responseStatus: _i5.ResponseStatusType.fromJson(
        (jsonSerialization['responseStatus'] as String),
      ),
      checkedAt: jsonSerialization['checkedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['checkedAt']),
    );
  }

  static final t = VersionCheckLogTable();

  static const db = VersionCheckLogRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  _i2.Application? application;

  _i1.UuidValue? versionId;

  _i3.Version? version;

  String versionNumber;

  int buildNumber;

  _i4.PlatformType platform;

  String? osVersion;

  String? deviceId;

  String? locale;

  String? deviceModel;

  String? ipAddress;

  _i5.ResponseStatusType responseStatus;

  DateTime checkedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [VersionCheckLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionCheckLog copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    _i1.UuidValue? versionId,
    _i3.Version? version,
    String? versionNumber,
    int? buildNumber,
    _i4.PlatformType? platform,
    String? osVersion,
    String? deviceId,
    String? locale,
    String? deviceModel,
    String? ipAddress,
    _i5.ResponseStatusType? responseStatus,
    DateTime? checkedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionCheckLog',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      if (versionId != null) 'versionId': versionId?.toJson(),
      if (version != null) 'version': version?.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      if (osVersion != null) 'osVersion': osVersion,
      if (deviceId != null) 'deviceId': deviceId,
      if (locale != null) 'locale': locale,
      if (deviceModel != null) 'deviceModel': deviceModel,
      if (ipAddress != null) 'ipAddress': ipAddress,
      'responseStatus': responseStatus.toJson(),
      'checkedAt': checkedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VersionCheckLog',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      if (versionId != null) 'versionId': versionId?.toJson(),
      if (version != null) 'version': version?.toJsonForProtocol(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      if (osVersion != null) 'osVersion': osVersion,
      if (deviceId != null) 'deviceId': deviceId,
      if (locale != null) 'locale': locale,
      if (deviceModel != null) 'deviceModel': deviceModel,
      if (ipAddress != null) 'ipAddress': ipAddress,
      'responseStatus': responseStatus.toJson(),
      'checkedAt': checkedAt.toJson(),
    };
  }

  static VersionCheckLogInclude include({
    _i2.ApplicationInclude? application,
    _i3.VersionInclude? version,
  }) {
    return VersionCheckLogInclude._(
      application: application,
      version: version,
    );
  }

  static VersionCheckLogIncludeList includeList({
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    VersionCheckLogInclude? include,
  }) {
    return VersionCheckLogIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VersionCheckLog.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VersionCheckLogImpl extends VersionCheckLog {
  _VersionCheckLogImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    _i1.UuidValue? versionId,
    _i3.Version? version,
    required String versionNumber,
    required int buildNumber,
    required _i4.PlatformType platform,
    String? osVersion,
    String? deviceId,
    String? locale,
    String? deviceModel,
    String? ipAddress,
    required _i5.ResponseStatusType responseStatus,
    DateTime? checkedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         versionId: versionId,
         version: version,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         platform: platform,
         osVersion: osVersion,
         deviceId: deviceId,
         locale: locale,
         deviceModel: deviceModel,
         ipAddress: ipAddress,
         responseStatus: responseStatus,
         checkedAt: checkedAt,
       );

  /// Returns a shallow copy of this [VersionCheckLog]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionCheckLog copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    Object? versionId = _Undefined,
    Object? version = _Undefined,
    String? versionNumber,
    int? buildNumber,
    _i4.PlatformType? platform,
    Object? osVersion = _Undefined,
    Object? deviceId = _Undefined,
    Object? locale = _Undefined,
    Object? deviceModel = _Undefined,
    Object? ipAddress = _Undefined,
    _i5.ResponseStatusType? responseStatus,
    DateTime? checkedAt,
  }) {
    return VersionCheckLog(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      versionId: versionId is _i1.UuidValue? ? versionId : this.versionId,
      version: version is _i3.Version? ? version : this.version?.copyWith(),
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      platform: platform ?? this.platform,
      osVersion: osVersion is String? ? osVersion : this.osVersion,
      deviceId: deviceId is String? ? deviceId : this.deviceId,
      locale: locale is String? ? locale : this.locale,
      deviceModel: deviceModel is String? ? deviceModel : this.deviceModel,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      responseStatus: responseStatus ?? this.responseStatus,
      checkedAt: checkedAt ?? this.checkedAt,
    );
  }
}

class VersionCheckLogUpdateTable extends _i1.UpdateTable<VersionCheckLogTable> {
  VersionCheckLogUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> versionId(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.versionId,
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

  _i1.ColumnValue<_i4.PlatformType, _i4.PlatformType> platform(
    _i4.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> osVersion(String? value) => _i1.ColumnValue(
    table.osVersion,
    value,
  );

  _i1.ColumnValue<String, String> deviceId(String? value) => _i1.ColumnValue(
    table.deviceId,
    value,
  );

  _i1.ColumnValue<String, String> locale(String? value) => _i1.ColumnValue(
    table.locale,
    value,
  );

  _i1.ColumnValue<String, String> deviceModel(String? value) => _i1.ColumnValue(
    table.deviceModel,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<_i5.ResponseStatusType, _i5.ResponseStatusType>
  responseStatus(_i5.ResponseStatusType value) => _i1.ColumnValue(
    table.responseStatus,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> checkedAt(DateTime value) =>
      _i1.ColumnValue(
        table.checkedAt,
        value,
      );
}

class VersionCheckLogTable extends _i1.Table<_i1.UuidValue?> {
  VersionCheckLogTable({super.tableRelation})
    : super(tableName: 'version_check_logs') {
    updateTable = VersionCheckLogUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    versionId = _i1.ColumnUuid(
      'versionId',
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
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    osVersion = _i1.ColumnString(
      'osVersion',
      this,
    );
    deviceId = _i1.ColumnString(
      'deviceId',
      this,
    );
    locale = _i1.ColumnString(
      'locale',
      this,
    );
    deviceModel = _i1.ColumnString(
      'deviceModel',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    responseStatus = _i1.ColumnEnum(
      'responseStatus',
      this,
      _i1.EnumSerialization.byName,
    );
    checkedAt = _i1.ColumnDateTime(
      'checkedAt',
      this,
      hasDefault: true,
    );
  }

  late final VersionCheckLogUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  _i2.ApplicationTable? _application;

  late final _i1.ColumnUuid versionId;

  _i3.VersionTable? _version;

  late final _i1.ColumnString versionNumber;

  late final _i1.ColumnInt buildNumber;

  late final _i1.ColumnEnum<_i4.PlatformType> platform;

  late final _i1.ColumnString osVersion;

  late final _i1.ColumnString deviceId;

  late final _i1.ColumnString locale;

  late final _i1.ColumnString deviceModel;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnEnum<_i5.ResponseStatusType> responseStatus;

  late final _i1.ColumnDateTime checkedAt;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: VersionCheckLog.t.applicationId,
      foreignField: _i2.Application.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ApplicationTable(tableRelation: foreignTableRelation),
    );
    return _application!;
  }

  _i3.VersionTable get version {
    if (_version != null) return _version!;
    _version = _i1.createRelationTable(
      relationFieldName: 'version',
      field: VersionCheckLog.t.versionId,
      foreignField: _i3.Version.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VersionTable(tableRelation: foreignTableRelation),
    );
    return _version!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    applicationId,
    versionId,
    versionNumber,
    buildNumber,
    platform,
    osVersion,
    deviceId,
    locale,
    deviceModel,
    ipAddress,
    responseStatus,
    checkedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'application') {
      return application;
    }
    if (relationField == 'version') {
      return version;
    }
    return null;
  }
}

class VersionCheckLogInclude extends _i1.IncludeObject {
  VersionCheckLogInclude._({
    _i2.ApplicationInclude? application,
    _i3.VersionInclude? version,
  }) {
    _application = application;
    _version = version;
  }

  _i2.ApplicationInclude? _application;

  _i3.VersionInclude? _version;

  @override
  Map<String, _i1.Include?> get includes => {
    'application': _application,
    'version': _version,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => VersionCheckLog.t;
}

class VersionCheckLogIncludeList extends _i1.IncludeList {
  VersionCheckLogIncludeList._({
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VersionCheckLog.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => VersionCheckLog.t;
}

class VersionCheckLogRepository {
  const VersionCheckLogRepository._();

  final attachRow = const VersionCheckLogAttachRowRepository._();

  final detachRow = const VersionCheckLogDetachRowRepository._();

  /// Returns a list of [VersionCheckLog]s matching the given query parameters.
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
  Future<List<VersionCheckLog>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    _i1.Transaction? transaction,
    VersionCheckLogInclude? include,
  }) async {
    return session.db.find<VersionCheckLog>(
      where: where?.call(VersionCheckLog.t),
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderByList: orderByList?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [VersionCheckLog] matching the given query parameters.
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
  Future<VersionCheckLog?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    _i1.Transaction? transaction,
    VersionCheckLogInclude? include,
  }) async {
    return session.db.findFirstRow<VersionCheckLog>(
      where: where?.call(VersionCheckLog.t),
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderByList: orderByList?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VersionCheckLog] by its [id] or null if no such row exists.
  Future<VersionCheckLog?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VersionCheckLogInclude? include,
  }) async {
    return session.db.findById<VersionCheckLog>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [VersionCheckLog]s in the list and returns the inserted rows.
  ///
  /// The returned [VersionCheckLog]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VersionCheckLog>> insert(
    _i1.Session session,
    List<VersionCheckLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VersionCheckLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VersionCheckLog] and returns the inserted row.
  ///
  /// The returned [VersionCheckLog] will have its `id` field set.
  Future<VersionCheckLog> insertRow(
    _i1.Session session,
    VersionCheckLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VersionCheckLog>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VersionCheckLog]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VersionCheckLog>> update(
    _i1.Session session,
    List<VersionCheckLog> rows, {
    _i1.ColumnSelections<VersionCheckLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VersionCheckLog>(
      rows,
      columns: columns?.call(VersionCheckLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VersionCheckLog]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VersionCheckLog> updateRow(
    _i1.Session session,
    VersionCheckLog row, {
    _i1.ColumnSelections<VersionCheckLogTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VersionCheckLog>(
      row,
      columns: columns?.call(VersionCheckLog.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VersionCheckLog] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VersionCheckLog?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<VersionCheckLogUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VersionCheckLog>(
      id,
      columnValues: columnValues(VersionCheckLog.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VersionCheckLog]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VersionCheckLog>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VersionCheckLogUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<VersionCheckLogTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckLogTable>? orderBy,
    _i1.OrderByListBuilder<VersionCheckLogTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VersionCheckLog>(
      columnValues: columnValues(VersionCheckLog.t.updateTable),
      where: where(VersionCheckLog.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VersionCheckLog.t),
      orderByList: orderByList?.call(VersionCheckLog.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VersionCheckLog]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VersionCheckLog>> delete(
    _i1.Session session,
    List<VersionCheckLog> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VersionCheckLog>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VersionCheckLog].
  Future<VersionCheckLog> deleteRow(
    _i1.Session session,
    VersionCheckLog row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VersionCheckLog>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VersionCheckLog>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VersionCheckLogTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VersionCheckLog>(
      where: where(VersionCheckLog.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckLogTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VersionCheckLog>(
      where: where?.call(VersionCheckLog.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VersionCheckLogAttachRowRepository {
  const VersionCheckLogAttachRowRepository._();

  /// Creates a relation between the given [VersionCheckLog] and [Application]
  /// by setting the [VersionCheckLog]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    VersionCheckLog versionCheckLog,
    _i2.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckLog.id == null) {
      throw ArgumentError.notNull('versionCheckLog.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $versionCheckLog = versionCheckLog.copyWith(
      applicationId: application.id,
    );
    await session.db.updateRow<VersionCheckLog>(
      $versionCheckLog,
      columns: [VersionCheckLog.t.applicationId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [VersionCheckLog] and [Version]
  /// by setting the [VersionCheckLog]'s foreign key `versionId` to refer to the [Version].
  Future<void> version(
    _i1.Session session,
    VersionCheckLog versionCheckLog,
    _i3.Version version, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckLog.id == null) {
      throw ArgumentError.notNull('versionCheckLog.id');
    }
    if (version.id == null) {
      throw ArgumentError.notNull('version.id');
    }

    var $versionCheckLog = versionCheckLog.copyWith(versionId: version.id);
    await session.db.updateRow<VersionCheckLog>(
      $versionCheckLog,
      columns: [VersionCheckLog.t.versionId],
      transaction: transaction,
    );
  }
}

class VersionCheckLogDetachRowRepository {
  const VersionCheckLogDetachRowRepository._();

  /// Detaches the relation between this [VersionCheckLog] and the [Version] set in `version`
  /// by setting the [VersionCheckLog]'s foreign key `versionId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> version(
    _i1.Session session,
    VersionCheckLog versionCheckLog, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckLog.id == null) {
      throw ArgumentError.notNull('versionCheckLog.id');
    }

    var $versionCheckLog = versionCheckLog.copyWith(versionId: null);
    await session.db.updateRow<VersionCheckLog>(
      $versionCheckLog,
      columns: [VersionCheckLog.t.versionId],
      transaction: transaction,
    );
  }
}
