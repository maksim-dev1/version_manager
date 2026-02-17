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

/// Дневная статистика по измерениям (dimensions).
///
/// Хранит количество проверок за день, разбитое по различным измерениям:
/// — os_version: распределение по версиям ОС
/// — device_model: распределение по моделям устройств
/// — locale: распределение по локалям
/// — hour: распределение по часам суток (для heatmap)
///
/// Заполняется автоматически при каждом запросе check-version.
/// Заменяет необходимость хранения сырых логов (version_check_logs).
///
/// Retention policy: хранить бессрочно (~100 байт/запись).
abstract class DailyDimensionSummary
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  DailyDimensionSummary._({
    this.id,
    required this.applicationId,
    this.application,
    required this.date,
    required this.dimensionType,
    required this.dimensionValue,
    required this.platform,
    int? checkCount,
  }) : checkCount = checkCount ?? 0;

  factory DailyDimensionSummary({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required String dimensionType,
    required String dimensionValue,
    required _i3.PlatformType platform,
    int? checkCount,
  }) = _DailyDimensionSummaryImpl;

  factory DailyDimensionSummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DailyDimensionSummary(
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
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      dimensionType: jsonSerialization['dimensionType'] as String,
      dimensionValue: jsonSerialization['dimensionValue'] as String,
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      checkCount: jsonSerialization['checkCount'] as int?,
    );
  }

  static final t = DailyDimensionSummaryTable();

  static const db = DailyDimensionSummaryRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Дата агрегации (начало дня UTC)
  DateTime date;

  /// Тип измерения: "os_version", "device_model", "locale", "hour"
  String dimensionType;

  /// Значение измерения (например: "17.2.1", "iPhone 15", "ru_RU", "14")
  String dimensionValue;

  /// Платформа (для os_version и device_model — платформа запроса;
  /// для locale и hour — платформа запроса для per-platform breakdown)
  _i3.PlatformType platform;

  /// Количество проверок
  int checkCount;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [DailyDimensionSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyDimensionSummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    DateTime? date,
    String? dimensionType,
    String? dimensionValue,
    _i3.PlatformType? platform,
    int? checkCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyDimensionSummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'date': date.toJson(),
      'dimensionType': dimensionType,
      'dimensionValue': dimensionValue,
      'platform': platform.toJson(),
      'checkCount': checkCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DailyDimensionSummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      'date': date.toJson(),
      'dimensionType': dimensionType,
      'dimensionValue': dimensionValue,
      'platform': platform.toJson(),
      'checkCount': checkCount,
    };
  }

  static DailyDimensionSummaryInclude include({
    _i2.ApplicationInclude? application,
  }) {
    return DailyDimensionSummaryInclude._(application: application);
  }

  static DailyDimensionSummaryIncludeList includeList({
    _i1.WhereExpressionBuilder<DailyDimensionSummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyDimensionSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyDimensionSummaryTable>? orderByList,
    DailyDimensionSummaryInclude? include,
  }) {
    return DailyDimensionSummaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailyDimensionSummary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DailyDimensionSummary.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DailyDimensionSummaryImpl extends DailyDimensionSummary {
  _DailyDimensionSummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required String dimensionType,
    required String dimensionValue,
    required _i3.PlatformType platform,
    int? checkCount,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         date: date,
         dimensionType: dimensionType,
         dimensionValue: dimensionValue,
         platform: platform,
         checkCount: checkCount,
       );

  /// Returns a shallow copy of this [DailyDimensionSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyDimensionSummary copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    DateTime? date,
    String? dimensionType,
    String? dimensionValue,
    _i3.PlatformType? platform,
    int? checkCount,
  }) {
    return DailyDimensionSummary(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      date: date ?? this.date,
      dimensionType: dimensionType ?? this.dimensionType,
      dimensionValue: dimensionValue ?? this.dimensionValue,
      platform: platform ?? this.platform,
      checkCount: checkCount ?? this.checkCount,
    );
  }
}

class DailyDimensionSummaryUpdateTable
    extends _i1.UpdateTable<DailyDimensionSummaryTable> {
  DailyDimensionSummaryUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> applicationId(
    _i1.UuidValue value,
  ) => _i1.ColumnValue(
    table.applicationId,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> date(DateTime value) => _i1.ColumnValue(
    table.date,
    value,
  );

  _i1.ColumnValue<String, String> dimensionType(String value) =>
      _i1.ColumnValue(
        table.dimensionType,
        value,
      );

  _i1.ColumnValue<String, String> dimensionValue(String value) =>
      _i1.ColumnValue(
        table.dimensionValue,
        value,
      );

  _i1.ColumnValue<_i3.PlatformType, _i3.PlatformType> platform(
    _i3.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<int, int> checkCount(int value) => _i1.ColumnValue(
    table.checkCount,
    value,
  );
}

class DailyDimensionSummaryTable extends _i1.Table<_i1.UuidValue?> {
  DailyDimensionSummaryTable({super.tableRelation})
    : super(tableName: 'daily_dimension_summaries') {
    updateTable = DailyDimensionSummaryUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    dimensionType = _i1.ColumnString(
      'dimensionType',
      this,
    );
    dimensionValue = _i1.ColumnString(
      'dimensionValue',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    checkCount = _i1.ColumnInt(
      'checkCount',
      this,
      hasDefault: true,
    );
  }

  late final DailyDimensionSummaryUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  /// Приложение
  _i2.ApplicationTable? _application;

  /// Дата агрегации (начало дня UTC)
  late final _i1.ColumnDateTime date;

  /// Тип измерения: "os_version", "device_model", "locale", "hour"
  late final _i1.ColumnString dimensionType;

  /// Значение измерения (например: "17.2.1", "iPhone 15", "ru_RU", "14")
  late final _i1.ColumnString dimensionValue;

  /// Платформа (для os_version и device_model — платформа запроса;
  /// для locale и hour — платформа запроса для per-platform breakdown)
  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  /// Количество проверок
  late final _i1.ColumnInt checkCount;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: DailyDimensionSummary.t.applicationId,
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
    date,
    dimensionType,
    dimensionValue,
    platform,
    checkCount,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'application') {
      return application;
    }
    return null;
  }
}

class DailyDimensionSummaryInclude extends _i1.IncludeObject {
  DailyDimensionSummaryInclude._({_i2.ApplicationInclude? application}) {
    _application = application;
  }

  _i2.ApplicationInclude? _application;

  @override
  Map<String, _i1.Include?> get includes => {'application': _application};

  @override
  _i1.Table<_i1.UuidValue?> get table => DailyDimensionSummary.t;
}

class DailyDimensionSummaryIncludeList extends _i1.IncludeList {
  DailyDimensionSummaryIncludeList._({
    _i1.WhereExpressionBuilder<DailyDimensionSummaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DailyDimensionSummary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => DailyDimensionSummary.t;
}

class DailyDimensionSummaryRepository {
  const DailyDimensionSummaryRepository._();

  final attachRow = const DailyDimensionSummaryAttachRowRepository._();

  /// Returns a list of [DailyDimensionSummary]s matching the given query parameters.
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
  Future<List<DailyDimensionSummary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyDimensionSummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyDimensionSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyDimensionSummaryTable>? orderByList,
    _i1.Transaction? transaction,
    DailyDimensionSummaryInclude? include,
  }) async {
    return session.db.find<DailyDimensionSummary>(
      where: where?.call(DailyDimensionSummary.t),
      orderBy: orderBy?.call(DailyDimensionSummary.t),
      orderByList: orderByList?.call(DailyDimensionSummary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DailyDimensionSummary] matching the given query parameters.
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
  Future<DailyDimensionSummary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyDimensionSummaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<DailyDimensionSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyDimensionSummaryTable>? orderByList,
    _i1.Transaction? transaction,
    DailyDimensionSummaryInclude? include,
  }) async {
    return session.db.findFirstRow<DailyDimensionSummary>(
      where: where?.call(DailyDimensionSummary.t),
      orderBy: orderBy?.call(DailyDimensionSummary.t),
      orderByList: orderByList?.call(DailyDimensionSummary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DailyDimensionSummary] by its [id] or null if no such row exists.
  Future<DailyDimensionSummary?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    DailyDimensionSummaryInclude? include,
  }) async {
    return session.db.findById<DailyDimensionSummary>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DailyDimensionSummary]s in the list and returns the inserted rows.
  ///
  /// The returned [DailyDimensionSummary]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DailyDimensionSummary>> insert(
    _i1.Session session,
    List<DailyDimensionSummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DailyDimensionSummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DailyDimensionSummary] and returns the inserted row.
  ///
  /// The returned [DailyDimensionSummary] will have its `id` field set.
  Future<DailyDimensionSummary> insertRow(
    _i1.Session session,
    DailyDimensionSummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DailyDimensionSummary>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DailyDimensionSummary]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DailyDimensionSummary>> update(
    _i1.Session session,
    List<DailyDimensionSummary> rows, {
    _i1.ColumnSelections<DailyDimensionSummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DailyDimensionSummary>(
      rows,
      columns: columns?.call(DailyDimensionSummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailyDimensionSummary]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DailyDimensionSummary> updateRow(
    _i1.Session session,
    DailyDimensionSummary row, {
    _i1.ColumnSelections<DailyDimensionSummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DailyDimensionSummary>(
      row,
      columns: columns?.call(DailyDimensionSummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailyDimensionSummary] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DailyDimensionSummary?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<DailyDimensionSummaryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DailyDimensionSummary>(
      id,
      columnValues: columnValues(DailyDimensionSummary.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DailyDimensionSummary]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DailyDimensionSummary>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DailyDimensionSummaryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DailyDimensionSummaryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyDimensionSummaryTable>? orderBy,
    _i1.OrderByListBuilder<DailyDimensionSummaryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DailyDimensionSummary>(
      columnValues: columnValues(DailyDimensionSummary.t.updateTable),
      where: where(DailyDimensionSummary.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailyDimensionSummary.t),
      orderByList: orderByList?.call(DailyDimensionSummary.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DailyDimensionSummary]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DailyDimensionSummary>> delete(
    _i1.Session session,
    List<DailyDimensionSummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DailyDimensionSummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DailyDimensionSummary].
  Future<DailyDimensionSummary> deleteRow(
    _i1.Session session,
    DailyDimensionSummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DailyDimensionSummary>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DailyDimensionSummary>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DailyDimensionSummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DailyDimensionSummary>(
      where: where(DailyDimensionSummary.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyDimensionSummaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DailyDimensionSummary>(
      where: where?.call(DailyDimensionSummary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DailyDimensionSummaryAttachRowRepository {
  const DailyDimensionSummaryAttachRowRepository._();

  /// Creates a relation between the given [DailyDimensionSummary] and [Application]
  /// by setting the [DailyDimensionSummary]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    DailyDimensionSummary dailyDimensionSummary,
    _i2.Application application, {
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
    await session.db.updateRow<DailyDimensionSummary>(
      $dailyDimensionSummary,
      columns: [DailyDimensionSummary.t.applicationId],
      transaction: transaction,
    );
  }
}
