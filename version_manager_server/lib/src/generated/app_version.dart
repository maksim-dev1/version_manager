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
import 'enums/platform.dart' as _i2;
import 'store_links.dart' as _i3;
import 'package:version_manager_server/src/generated/protocol.dart' as _i4;

abstract class AppVersion
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AppVersion._({
    this.id,
    required this.applicationId,
    required this.version,
    required this.buildNumber,
    _i2.Platform? platform,
    required this.changelog,
    bool? isBlocked,
    this.blockReason,
    bool? recommendedUpdate,
    required this.storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : platform = platform ?? _i2.Platform.unknown,
       isBlocked = isBlocked ?? false,
       recommendedUpdate = recommendedUpdate ?? false,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory AppVersion({
    int? id,
    required _i1.UuidValue applicationId,
    required String version,
    required int buildNumber,
    _i2.Platform? platform,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    bool? recommendedUpdate,
    required List<_i3.StoreLinks> storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _AppVersionImpl;

  factory AppVersion.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppVersion(
      id: jsonSerialization['id'] as int?,
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      version: jsonSerialization['version'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      platform: jsonSerialization['platform'] == null
          ? null
          : _i2.Platform.fromJson((jsonSerialization['platform'] as String)),
      changelog: jsonSerialization['changelog'] as String,
      isBlocked: jsonSerialization['isBlocked'] as bool?,
      blockReason: jsonSerialization['blockReason'] as String?,
      recommendedUpdate: jsonSerialization['recommendedUpdate'] as bool?,
      storeLinks: _i4.Protocol().deserialize<List<_i3.StoreLinks>>(
        jsonSerialization['storeLinks'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = AppVersionTable();

  static const db = AppVersionRepository._();

  @override
  int? id;

  /// Serverpod автоматически добавит поле id: UuidValue
  /// Идентификатор приложения (внешний ключ к таблице applications)
  _i1.UuidValue applicationId;

  /// Версия приложения (например: 1.0.0)
  String version;

  /// Номер сборки приложения
  int buildNumber;

  /// Платформа (например: android, ios)
  _i2.Platform platform;

  /// Описание изменений в этой версии
  String changelog;

  /// Заблокирована ли эта версия для установки
  bool isBlocked;

  /// Причина блокировки версии
  String? blockReason;

  /// Предлагать эту версию для обновления
  bool recommendedUpdate;

  /// Ссылки на магазины приложений
  List<_i3.StoreLinks> storeLinks;

  /// Дата и время создания записи
  DateTime createdAt;

  /// Дата и время последнего обновления записи
  DateTime updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AppVersion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppVersion copyWith({
    int? id,
    _i1.UuidValue? applicationId,
    String? version,
    int? buildNumber,
    _i2.Platform? platform,
    String? changelog,
    bool? isBlocked,
    String? blockReason,
    bool? recommendedUpdate,
    List<_i3.StoreLinks>? storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppVersion',
      if (id != null) 'id': id,
      'applicationId': applicationId.toJson(),
      'version': version,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      'recommendedUpdate': recommendedUpdate,
      'storeLinks': storeLinks.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppVersion',
      if (id != null) 'id': id,
      'applicationId': applicationId.toJson(),
      'version': version,
      'buildNumber': buildNumber,
      'platform': platform.toJson(),
      'changelog': changelog,
      'isBlocked': isBlocked,
      if (blockReason != null) 'blockReason': blockReason,
      'recommendedUpdate': recommendedUpdate,
      'storeLinks': storeLinks.toJson(
        valueToJson: (v) => v.toJsonForProtocol(),
      ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static AppVersionInclude include() {
    return AppVersionInclude._();
  }

  static AppVersionIncludeList includeList({
    _i1.WhereExpressionBuilder<AppVersionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppVersionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppVersionTable>? orderByList,
    AppVersionInclude? include,
  }) {
    return AppVersionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppVersion.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppVersion.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppVersionImpl extends AppVersion {
  _AppVersionImpl({
    int? id,
    required _i1.UuidValue applicationId,
    required String version,
    required int buildNumber,
    _i2.Platform? platform,
    required String changelog,
    bool? isBlocked,
    String? blockReason,
    bool? recommendedUpdate,
    required List<_i3.StoreLinks> storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         version: version,
         buildNumber: buildNumber,
         platform: platform,
         changelog: changelog,
         isBlocked: isBlocked,
         blockReason: blockReason,
         recommendedUpdate: recommendedUpdate,
         storeLinks: storeLinks,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [AppVersion]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppVersion copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    String? version,
    int? buildNumber,
    _i2.Platform? platform,
    String? changelog,
    bool? isBlocked,
    Object? blockReason = _Undefined,
    bool? recommendedUpdate,
    List<_i3.StoreLinks>? storeLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppVersion(
      id: id is int? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      version: version ?? this.version,
      buildNumber: buildNumber ?? this.buildNumber,
      platform: platform ?? this.platform,
      changelog: changelog ?? this.changelog,
      isBlocked: isBlocked ?? this.isBlocked,
      blockReason: blockReason is String? ? blockReason : this.blockReason,
      recommendedUpdate: recommendedUpdate ?? this.recommendedUpdate,
      storeLinks:
          storeLinks ?? this.storeLinks.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class AppVersionUpdateTable extends _i1.UpdateTable<AppVersionTable> {
  AppVersionUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<String, String> version(String value) => _i1.ColumnValue(
    table.version,
    value,
  );

  _i1.ColumnValue<int, int> buildNumber(int value) => _i1.ColumnValue(
    table.buildNumber,
    value,
  );

  _i1.ColumnValue<_i2.Platform, _i2.Platform> platform(_i2.Platform value) =>
      _i1.ColumnValue(
        table.platform,
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

  _i1.ColumnValue<bool, bool> recommendedUpdate(bool value) => _i1.ColumnValue(
    table.recommendedUpdate,
    value,
  );

  _i1.ColumnValue<List<_i3.StoreLinks>, List<_i3.StoreLinks>> storeLinks(
    List<_i3.StoreLinks> value,
  ) => _i1.ColumnValue(
    table.storeLinks,
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

class AppVersionTable extends _i1.Table<int?> {
  AppVersionTable({super.tableRelation}) : super(tableName: 'app_versions') {
    updateTable = AppVersionUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    version = _i1.ColumnString(
      'version',
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
      hasDefault: true,
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
    recommendedUpdate = _i1.ColumnBool(
      'recommendedUpdate',
      this,
      hasDefault: true,
    );
    storeLinks = _i1.ColumnSerializable<List<_i3.StoreLinks>>(
      'storeLinks',
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

  late final AppVersionUpdateTable updateTable;

  /// Serverpod автоматически добавит поле id: UuidValue
  /// Идентификатор приложения (внешний ключ к таблице applications)
  late final _i1.ColumnUuid applicationId;

  /// Версия приложения (например: 1.0.0)
  late final _i1.ColumnString version;

  /// Номер сборки приложения
  late final _i1.ColumnInt buildNumber;

  /// Платформа (например: android, ios)
  late final _i1.ColumnEnum<_i2.Platform> platform;

  /// Описание изменений в этой версии
  late final _i1.ColumnString changelog;

  /// Заблокирована ли эта версия для установки
  late final _i1.ColumnBool isBlocked;

  /// Причина блокировки версии
  late final _i1.ColumnString blockReason;

  /// Предлагать эту версию для обновления
  late final _i1.ColumnBool recommendedUpdate;

  /// Ссылки на магазины приложений
  late final _i1.ColumnSerializable<List<_i3.StoreLinks>> storeLinks;

  /// Дата и время создания записи
  late final _i1.ColumnDateTime createdAt;

  /// Дата и время последнего обновления записи
  late final _i1.ColumnDateTime updatedAt;

  @override
  List<_i1.Column> get columns => [
    id,
    applicationId,
    version,
    buildNumber,
    platform,
    changelog,
    isBlocked,
    blockReason,
    recommendedUpdate,
    storeLinks,
    createdAt,
    updatedAt,
  ];
}

class AppVersionInclude extends _i1.IncludeObject {
  AppVersionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AppVersion.t;
}

class AppVersionIncludeList extends _i1.IncludeList {
  AppVersionIncludeList._({
    _i1.WhereExpressionBuilder<AppVersionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppVersion.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AppVersion.t;
}

class AppVersionRepository {
  const AppVersionRepository._();

  /// Returns a list of [AppVersion]s matching the given query parameters.
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
  Future<List<AppVersion>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppVersionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppVersionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppVersionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AppVersion>(
      where: where?.call(AppVersion.t),
      orderBy: orderBy?.call(AppVersion.t),
      orderByList: orderByList?.call(AppVersion.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AppVersion] matching the given query parameters.
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
  Future<AppVersion?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppVersionTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppVersionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppVersionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AppVersion>(
      where: where?.call(AppVersion.t),
      orderBy: orderBy?.call(AppVersion.t),
      orderByList: orderByList?.call(AppVersion.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AppVersion] by its [id] or null if no such row exists.
  Future<AppVersion?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AppVersion>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AppVersion]s in the list and returns the inserted rows.
  ///
  /// The returned [AppVersion]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppVersion>> insert(
    _i1.Session session,
    List<AppVersion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppVersion>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppVersion] and returns the inserted row.
  ///
  /// The returned [AppVersion] will have its `id` field set.
  Future<AppVersion> insertRow(
    _i1.Session session,
    AppVersion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppVersion>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppVersion]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppVersion>> update(
    _i1.Session session,
    List<AppVersion> rows, {
    _i1.ColumnSelections<AppVersionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppVersion>(
      rows,
      columns: columns?.call(AppVersion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppVersion]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppVersion> updateRow(
    _i1.Session session,
    AppVersion row, {
    _i1.ColumnSelections<AppVersionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppVersion>(
      row,
      columns: columns?.call(AppVersion.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppVersion] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AppVersion?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AppVersionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AppVersion>(
      id,
      columnValues: columnValues(AppVersion.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AppVersion]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AppVersion>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AppVersionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AppVersionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppVersionTable>? orderBy,
    _i1.OrderByListBuilder<AppVersionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AppVersion>(
      columnValues: columnValues(AppVersion.t.updateTable),
      where: where(AppVersion.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppVersion.t),
      orderByList: orderByList?.call(AppVersion.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AppVersion]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppVersion>> delete(
    _i1.Session session,
    List<AppVersion> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppVersion>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppVersion].
  Future<AppVersion> deleteRow(
    _i1.Session session,
    AppVersion row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppVersion>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppVersion>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppVersionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppVersion>(
      where: where(AppVersion.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppVersionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppVersion>(
      where: where?.call(AppVersion.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
