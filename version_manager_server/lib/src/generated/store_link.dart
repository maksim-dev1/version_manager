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
import 'application.dart' as _i2;
import 'enums/platform_type.dart' as _i3;
import 'package:version_manager_server/src/generated/protocol.dart' as _i4;

/// Ссылка на страницу приложения в магазине (Google Play, App Store и т.д.)
abstract class StoreLink
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  StoreLink._({
    this.id,
    required this.applicationId,
    this.application,
    required this.platform,
    required this.storeName,
    required this.url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory StoreLink({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required _i3.PlatformType platform,
    required String storeName,
    required String url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _StoreLinkImpl;

  factory StoreLink.fromJson(Map<String, dynamic> jsonSerialization) {
    return StoreLink(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      applicationId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['applicationId'],
      ),
      application: jsonSerialization['application'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.Application>(
              jsonSerialization['application'],
            ),
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      storeName: jsonSerialization['storeName'] as String,
      url: jsonSerialization['url'] as String,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = StoreLinkTable();

  static const db = StoreLinkRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Платформа (ios, android, web и т.д.)
  _i3.PlatformType platform;

  /// Название магазина (Google Play, App Store и т.д.)
  String storeName;

  /// URL страницы приложения в магазине
  String url;

  /// Дата создания ссылки
  DateTime createdAt;

  /// Дата последнего обновления ссылки
  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [StoreLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  StoreLink copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    _i3.PlatformType? platform,
    String? storeName,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'StoreLink',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'platform': platform.toJson(),
      'storeName': storeName,
      'url': url,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'StoreLink',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      'platform': platform.toJson(),
      'storeName': storeName,
      'url': url,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static StoreLinkInclude include({_i2.ApplicationInclude? application}) {
    return StoreLinkInclude._(application: application);
  }

  static StoreLinkIncludeList includeList({
    _i1.WhereExpressionBuilder<StoreLinkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreLinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreLinkTable>? orderByList,
    StoreLinkInclude? include,
  }) {
    return StoreLinkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StoreLink.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(StoreLink.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _StoreLinkImpl extends StoreLink {
  _StoreLinkImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required _i3.PlatformType platform,
    required String storeName,
    required String url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         platform: platform,
         storeName: storeName,
         url: url,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [StoreLink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  StoreLink copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    _i3.PlatformType? platform,
    String? storeName,
    String? url,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return StoreLink(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      platform: platform ?? this.platform,
      storeName: storeName ?? this.storeName,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class StoreLinkUpdateTable extends _i1.UpdateTable<StoreLinkTable> {
  StoreLinkUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<_i3.PlatformType, _i3.PlatformType> platform(
    _i3.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<String, String> storeName(String value) => _i1.ColumnValue(
    table.storeName,
    value,
  );

  _i1.ColumnValue<String, String> url(String value) => _i1.ColumnValue(
    table.url,
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

class StoreLinkTable extends _i1.Table<_i1.UuidValue?> {
  StoreLinkTable({super.tableRelation}) : super(tableName: 'store_links') {
    updateTable = StoreLinkUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    storeName = _i1.ColumnString(
      'storeName',
      this,
    );
    url = _i1.ColumnString(
      'url',
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

  late final StoreLinkUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  /// Приложение
  _i2.ApplicationTable? _application;

  /// Платформа (ios, android, web и т.д.)
  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  /// Название магазина (Google Play, App Store и т.д.)
  late final _i1.ColumnString storeName;

  /// URL страницы приложения в магазине
  late final _i1.ColumnString url;

  /// Дата создания ссылки
  late final _i1.ColumnDateTime createdAt;

  /// Дата последнего обновления ссылки
  late final _i1.ColumnDateTime updatedAt;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: StoreLink.t.applicationId,
      foreignField: _i2.Application.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ApplicationTable(tableRelation: foreignTableRelation),
    );
    return _application!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    applicationId,
    platform,
    storeName,
    url,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'application') {
      return application;
    }
    return null;
  }
}

class StoreLinkInclude extends _i1.IncludeObject {
  StoreLinkInclude._({_i2.ApplicationInclude? application}) {
    _application = application;
  }

  _i2.ApplicationInclude? _application;

  @override
  Map<String, _i1.Include?> get includes => {'application': _application};

  @override
  _i1.Table<_i1.UuidValue?> get table => StoreLink.t;
}

class StoreLinkIncludeList extends _i1.IncludeList {
  StoreLinkIncludeList._({
    _i1.WhereExpressionBuilder<StoreLinkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(StoreLink.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => StoreLink.t;
}

class StoreLinkRepository {
  const StoreLinkRepository._();

  final attachRow = const StoreLinkAttachRowRepository._();

  /// Returns a list of [StoreLink]s matching the given query parameters.
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
  Future<List<StoreLink>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreLinkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreLinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreLinkTable>? orderByList,
    _i1.Transaction? transaction,
    StoreLinkInclude? include,
  }) async {
    return session.db.find<StoreLink>(
      where: where?.call(StoreLink.t),
      orderBy: orderBy?.call(StoreLink.t),
      orderByList: orderByList?.call(StoreLink.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [StoreLink] matching the given query parameters.
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
  Future<StoreLink?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreLinkTable>? where,
    int? offset,
    _i1.OrderByBuilder<StoreLinkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<StoreLinkTable>? orderByList,
    _i1.Transaction? transaction,
    StoreLinkInclude? include,
  }) async {
    return session.db.findFirstRow<StoreLink>(
      where: where?.call(StoreLink.t),
      orderBy: orderBy?.call(StoreLink.t),
      orderByList: orderByList?.call(StoreLink.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [StoreLink] by its [id] or null if no such row exists.
  Future<StoreLink?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    StoreLinkInclude? include,
  }) async {
    return session.db.findById<StoreLink>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [StoreLink]s in the list and returns the inserted rows.
  ///
  /// The returned [StoreLink]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<StoreLink>> insert(
    _i1.Session session,
    List<StoreLink> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<StoreLink>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [StoreLink] and returns the inserted row.
  ///
  /// The returned [StoreLink] will have its `id` field set.
  Future<StoreLink> insertRow(
    _i1.Session session,
    StoreLink row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<StoreLink>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [StoreLink]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<StoreLink>> update(
    _i1.Session session,
    List<StoreLink> rows, {
    _i1.ColumnSelections<StoreLinkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<StoreLink>(
      rows,
      columns: columns?.call(StoreLink.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StoreLink]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<StoreLink> updateRow(
    _i1.Session session,
    StoreLink row, {
    _i1.ColumnSelections<StoreLinkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<StoreLink>(
      row,
      columns: columns?.call(StoreLink.t),
      transaction: transaction,
    );
  }

  /// Updates a single [StoreLink] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<StoreLink?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<StoreLinkUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<StoreLink>(
      id,
      columnValues: columnValues(StoreLink.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [StoreLink]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<StoreLink>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<StoreLinkUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<StoreLinkTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<StoreLinkTable>? orderBy,
    _i1.OrderByListBuilder<StoreLinkTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<StoreLink>(
      columnValues: columnValues(StoreLink.t.updateTable),
      where: where(StoreLink.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(StoreLink.t),
      orderByList: orderByList?.call(StoreLink.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [StoreLink]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<StoreLink>> delete(
    _i1.Session session,
    List<StoreLink> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<StoreLink>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [StoreLink].
  Future<StoreLink> deleteRow(
    _i1.Session session,
    StoreLink row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<StoreLink>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<StoreLink>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<StoreLinkTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<StoreLink>(
      where: where(StoreLink.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<StoreLinkTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<StoreLink>(
      where: where?.call(StoreLink.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class StoreLinkAttachRowRepository {
  const StoreLinkAttachRowRepository._();

  /// Creates a relation between the given [StoreLink] and [Application]
  /// by setting the [StoreLink]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    StoreLink storeLink,
    _i2.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (storeLink.id == null) {
      throw ArgumentError.notNull('storeLink.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $storeLink = storeLink.copyWith(applicationId: application.id);
    await session.db.updateRow<StoreLink>(
      $storeLink,
      columns: [StoreLink.t.applicationId],
      transaction: transaction,
    );
  }
}
