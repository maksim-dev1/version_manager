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
import '../enums/platform_type.dart' as _i3;
import 'package:version_manager_server/src/generated/protocol.dart' as _i4;

/// Экземпляр приложения для подсчёта уникальных пользователей.
///
/// Хранит идентификатор экземпляра приложения:
/// — iOS: identifierForVendor (IDFV) — уникален для приложения, сбрасывается при удалении
/// — Android: App Instance ID — генерируется для конкретного экземпляра
///
/// Это НЕ персональные данные (not PII):
/// — Привязан только к приложению, не к устройству глобально
/// — Не позволяет отслеживать пользователя между приложениями
/// — Сбрасывается при переустановке приложения
/// — Не требует ATT dialog, consent popup, disclosure в магазинах
///
/// Используется для:
/// — Подсчёта уникальных пользователей (DAU/WAU/MAU)
/// — Определения новых пользователей (firstSeenAt)
/// — Кумулятивного роста пользовательской базы
abstract class AppInstance
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  AppInstance._({
    this.id,
    required this.applicationId,
    this.application,
    required this.instanceId,
    required this.platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    this.lastBuildNumber,
  }) : firstSeenAt = firstSeenAt ?? DateTime.now(),
       lastSeenAt = lastSeenAt ?? DateTime.now(),
       lastActiveDate = lastActiveDate ?? DateTime.now();

  factory AppInstance({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String instanceId,
    required _i3.PlatformType platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    int? lastBuildNumber,
  }) = _AppInstanceImpl;

  factory AppInstance.fromJson(Map<String, dynamic> jsonSerialization) {
    return AppInstance(
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
      instanceId: jsonSerialization['instanceId'] as String,
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      firstSeenAt: jsonSerialization['firstSeenAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['firstSeenAt'],
            ),
      lastSeenAt: jsonSerialization['lastSeenAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['lastSeenAt']),
      lastActiveDate: jsonSerialization['lastActiveDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActiveDate'],
            ),
      lastBuildNumber: jsonSerialization['lastBuildNumber'] as int?,
    );
  }

  static final t = AppInstanceTable();

  static const db = AppInstanceRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Идентификатор экземпляра (IDFV на iOS / App Instance ID на Android)
  String instanceId;

  /// Платформа
  _i3.PlatformType platform;

  /// Дата первого появления
  DateTime firstSeenAt;

  /// Дата последнего появления
  DateTime lastSeenAt;

  /// Дата последней активности (только дата, без времени, UTC)
  /// Используется для точного подсчёта уникальных устройств за день.
  DateTime lastActiveDate;

  /// Последний номер сборки, на которой был пользователь.
  /// Используется для подсчёта пользователей по текущей версии.
  int? lastBuildNumber;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [AppInstance]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AppInstance copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    String? instanceId,
    _i3.PlatformType? platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    int? lastBuildNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AppInstance',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'instanceId': instanceId,
      'platform': platform.toJson(),
      'firstSeenAt': firstSeenAt.toJson(),
      'lastSeenAt': lastSeenAt.toJson(),
      'lastActiveDate': lastActiveDate.toJson(),
      if (lastBuildNumber != null) 'lastBuildNumber': lastBuildNumber,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AppInstance',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      'instanceId': instanceId,
      'platform': platform.toJson(),
      'firstSeenAt': firstSeenAt.toJson(),
      'lastSeenAt': lastSeenAt.toJson(),
      'lastActiveDate': lastActiveDate.toJson(),
      if (lastBuildNumber != null) 'lastBuildNumber': lastBuildNumber,
    };
  }

  static AppInstanceInclude include({_i2.ApplicationInclude? application}) {
    return AppInstanceInclude._(application: application);
  }

  static AppInstanceIncludeList includeList({
    _i1.WhereExpressionBuilder<AppInstanceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppInstanceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppInstanceTable>? orderByList,
    AppInstanceInclude? include,
  }) {
    return AppInstanceIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppInstance.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AppInstance.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AppInstanceImpl extends AppInstance {
  _AppInstanceImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required String instanceId,
    required _i3.PlatformType platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    int? lastBuildNumber,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         instanceId: instanceId,
         platform: platform,
         firstSeenAt: firstSeenAt,
         lastSeenAt: lastSeenAt,
         lastActiveDate: lastActiveDate,
         lastBuildNumber: lastBuildNumber,
       );

  /// Returns a shallow copy of this [AppInstance]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AppInstance copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    String? instanceId,
    _i3.PlatformType? platform,
    DateTime? firstSeenAt,
    DateTime? lastSeenAt,
    DateTime? lastActiveDate,
    Object? lastBuildNumber = _Undefined,
  }) {
    return AppInstance(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      instanceId: instanceId ?? this.instanceId,
      platform: platform ?? this.platform,
      firstSeenAt: firstSeenAt ?? this.firstSeenAt,
      lastSeenAt: lastSeenAt ?? this.lastSeenAt,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      lastBuildNumber: lastBuildNumber is int?
          ? lastBuildNumber
          : this.lastBuildNumber,
    );
  }
}

class AppInstanceUpdateTable extends _i1.UpdateTable<AppInstanceTable> {
  AppInstanceUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<String, String> instanceId(String value) => _i1.ColumnValue(
    table.instanceId,
    value,
  );

  _i1.ColumnValue<_i3.PlatformType, _i3.PlatformType> platform(
    _i3.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> firstSeenAt(DateTime value) =>
      _i1.ColumnValue(
        table.firstSeenAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastSeenAt(DateTime value) =>
      _i1.ColumnValue(
        table.lastSeenAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastActiveDate(DateTime value) =>
      _i1.ColumnValue(
        table.lastActiveDate,
        value,
      );

  _i1.ColumnValue<int, int> lastBuildNumber(int? value) => _i1.ColumnValue(
    table.lastBuildNumber,
    value,
  );
}

class AppInstanceTable extends _i1.Table<_i1.UuidValue?> {
  AppInstanceTable({super.tableRelation}) : super(tableName: 'app_instances') {
    updateTable = AppInstanceUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    instanceId = _i1.ColumnString(
      'instanceId',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    firstSeenAt = _i1.ColumnDateTime(
      'firstSeenAt',
      this,
      hasDefault: true,
    );
    lastSeenAt = _i1.ColumnDateTime(
      'lastSeenAt',
      this,
      hasDefault: true,
    );
    lastActiveDate = _i1.ColumnDateTime(
      'lastActiveDate',
      this,
      hasDefault: true,
    );
    lastBuildNumber = _i1.ColumnInt(
      'lastBuildNumber',
      this,
    );
  }

  late final AppInstanceUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  /// Приложение
  _i2.ApplicationTable? _application;

  /// Идентификатор экземпляра (IDFV на iOS / App Instance ID на Android)
  late final _i1.ColumnString instanceId;

  /// Платформа
  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  /// Дата первого появления
  late final _i1.ColumnDateTime firstSeenAt;

  /// Дата последнего появления
  late final _i1.ColumnDateTime lastSeenAt;

  /// Дата последней активности (только дата, без времени, UTC)
  /// Используется для точного подсчёта уникальных устройств за день.
  late final _i1.ColumnDateTime lastActiveDate;

  /// Последний номер сборки, на которой был пользователь.
  /// Используется для подсчёта пользователей по текущей версии.
  late final _i1.ColumnInt lastBuildNumber;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: AppInstance.t.applicationId,
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
    instanceId,
    platform,
    firstSeenAt,
    lastSeenAt,
    lastActiveDate,
    lastBuildNumber,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'application') {
      return application;
    }
    return null;
  }
}

class AppInstanceInclude extends _i1.IncludeObject {
  AppInstanceInclude._({_i2.ApplicationInclude? application}) {
    _application = application;
  }

  _i2.ApplicationInclude? _application;

  @override
  Map<String, _i1.Include?> get includes => {'application': _application};

  @override
  _i1.Table<_i1.UuidValue?> get table => AppInstance.t;
}

class AppInstanceIncludeList extends _i1.IncludeList {
  AppInstanceIncludeList._({
    _i1.WhereExpressionBuilder<AppInstanceTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AppInstance.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => AppInstance.t;
}

class AppInstanceRepository {
  const AppInstanceRepository._();

  final attachRow = const AppInstanceAttachRowRepository._();

  /// Returns a list of [AppInstance]s matching the given query parameters.
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
  Future<List<AppInstance>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppInstanceTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppInstanceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppInstanceTable>? orderByList,
    _i1.Transaction? transaction,
    AppInstanceInclude? include,
  }) async {
    return session.db.find<AppInstance>(
      where: where?.call(AppInstance.t),
      orderBy: orderBy?.call(AppInstance.t),
      orderByList: orderByList?.call(AppInstance.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [AppInstance] matching the given query parameters.
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
  Future<AppInstance?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppInstanceTable>? where,
    int? offset,
    _i1.OrderByBuilder<AppInstanceTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AppInstanceTable>? orderByList,
    _i1.Transaction? transaction,
    AppInstanceInclude? include,
  }) async {
    return session.db.findFirstRow<AppInstance>(
      where: where?.call(AppInstance.t),
      orderBy: orderBy?.call(AppInstance.t),
      orderByList: orderByList?.call(AppInstance.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [AppInstance] by its [id] or null if no such row exists.
  Future<AppInstance?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    AppInstanceInclude? include,
  }) async {
    return session.db.findById<AppInstance>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [AppInstance]s in the list and returns the inserted rows.
  ///
  /// The returned [AppInstance]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AppInstance>> insert(
    _i1.Session session,
    List<AppInstance> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AppInstance>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AppInstance] and returns the inserted row.
  ///
  /// The returned [AppInstance] will have its `id` field set.
  Future<AppInstance> insertRow(
    _i1.Session session,
    AppInstance row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AppInstance>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AppInstance]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AppInstance>> update(
    _i1.Session session,
    List<AppInstance> rows, {
    _i1.ColumnSelections<AppInstanceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AppInstance>(
      rows,
      columns: columns?.call(AppInstance.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppInstance]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AppInstance> updateRow(
    _i1.Session session,
    AppInstance row, {
    _i1.ColumnSelections<AppInstanceTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AppInstance>(
      row,
      columns: columns?.call(AppInstance.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AppInstance] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AppInstance?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<AppInstanceUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AppInstance>(
      id,
      columnValues: columnValues(AppInstance.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AppInstance]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AppInstance>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AppInstanceUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AppInstanceTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AppInstanceTable>? orderBy,
    _i1.OrderByListBuilder<AppInstanceTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AppInstance>(
      columnValues: columnValues(AppInstance.t.updateTable),
      where: where(AppInstance.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AppInstance.t),
      orderByList: orderByList?.call(AppInstance.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AppInstance]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AppInstance>> delete(
    _i1.Session session,
    List<AppInstance> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AppInstance>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AppInstance].
  Future<AppInstance> deleteRow(
    _i1.Session session,
    AppInstance row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AppInstance>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AppInstance>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AppInstanceTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AppInstance>(
      where: where(AppInstance.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AppInstanceTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AppInstance>(
      where: where?.call(AppInstance.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class AppInstanceAttachRowRepository {
  const AppInstanceAttachRowRepository._();

  /// Creates a relation between the given [AppInstance] and [Application]
  /// by setting the [AppInstance]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    AppInstance appInstance,
    _i2.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (appInstance.id == null) {
      throw ArgumentError.notNull('appInstance.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $appInstance = appInstance.copyWith(applicationId: application.id);
    await session.db.updateRow<AppInstance>(
      $appInstance,
      columns: [AppInstance.t.applicationId],
      transaction: transaction,
    );
  }
}
