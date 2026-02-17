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

/// Дневная агрегированная статистика проверок версий.
///
/// Содержит преагрегированные метрики за один день для одного приложения,
/// одной платформы и одной версии (buildNumber). Используется для:
/// — быстрых дашбордов без тяжёлых запросов
/// — хранения исторических данных
/// — аналитики трендов по дням
///
/// Заполняется автоматически при каждом запросе check-version
/// (инкрементальное обновление).
///
/// Retention policy: хранить бессрочно (~200 байт/запись).
abstract class DailyCheckSummary
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  DailyCheckSummary._({
    this.id,
    required this.applicationId,
    this.application,
    required this.date,
    required this.platform,
    required this.buildNumber,
    required this.versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    this.avgProcessingTimeMs,
    this.maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : uniqueDevices = uniqueDevices ?? 0,
       newDevices = newDevices ?? 0,
       totalChecks = totalChecks ?? 0,
       blockedChecks = blockedChecks ?? 0,
       updateAvailableChecks = updateAvailableChecks ?? 0,
       activeChecks = activeChecks ?? 0,
       errorChecks = errorChecks ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory DailyCheckSummary({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DailyCheckSummaryImpl;

  factory DailyCheckSummary.fromJson(Map<String, dynamic> jsonSerialization) {
    return DailyCheckSummary(
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
      platform: _i3.PlatformType.fromJson(
        (jsonSerialization['platform'] as String),
      ),
      buildNumber: jsonSerialization['buildNumber'] as int,
      versionNumber: jsonSerialization['versionNumber'] as String,
      uniqueDevices: jsonSerialization['uniqueDevices'] as int?,
      newDevices: jsonSerialization['newDevices'] as int?,
      totalChecks: jsonSerialization['totalChecks'] as int?,
      blockedChecks: jsonSerialization['blockedChecks'] as int?,
      updateAvailableChecks: jsonSerialization['updateAvailableChecks'] as int?,
      activeChecks: jsonSerialization['activeChecks'] as int?,
      errorChecks: jsonSerialization['errorChecks'] as int?,
      avgProcessingTimeMs: jsonSerialization['avgProcessingTimeMs'] as int?,
      maxProcessingTimeMs: jsonSerialization['maxProcessingTimeMs'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = DailyCheckSummaryTable();

  static const db = DailyCheckSummaryRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Дата агрегации (начало дня UTC)
  DateTime date;

  /// Платформа
  _i3.PlatformType platform;

  /// Номер сборки
  int buildNumber;

  /// Номер версии (для отображения)
  String versionNumber;

  /// Уникальные устройства за день (по instanceId, точный подсчёт)
  int uniqueDevices;

  /// Новые устройства за день (firstSeenAt = сегодня)
  int newDevices;

  /// Общее количество проверок за день
  int totalChecks;

  /// Проверки со статусом blocked
  int blockedChecks;

  /// Проверки со статусом update_available
  int updateAvailableChecks;

  /// Проверки со статусом active
  int activeChecks;

  /// Проверки со статусом error
  int errorChecks;

  /// Среднее время обработки запроса (мс)
  int? avgProcessingTimeMs;

  /// Максимальное время обработки (мс)
  int? maxProcessingTimeMs;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [DailyCheckSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyCheckSummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyCheckSummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'date': date.toJson(),
      'platform': platform.toJson(),
      'buildNumber': buildNumber,
      'versionNumber': versionNumber,
      'uniqueDevices': uniqueDevices,
      'newDevices': newDevices,
      'totalChecks': totalChecks,
      'blockedChecks': blockedChecks,
      'updateAvailableChecks': updateAvailableChecks,
      'activeChecks': activeChecks,
      'errorChecks': errorChecks,
      if (avgProcessingTimeMs != null)
        'avgProcessingTimeMs': avgProcessingTimeMs,
      if (maxProcessingTimeMs != null)
        'maxProcessingTimeMs': maxProcessingTimeMs,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'DailyCheckSummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      'date': date.toJson(),
      'platform': platform.toJson(),
      'buildNumber': buildNumber,
      'versionNumber': versionNumber,
      'uniqueDevices': uniqueDevices,
      'newDevices': newDevices,
      'totalChecks': totalChecks,
      'blockedChecks': blockedChecks,
      'updateAvailableChecks': updateAvailableChecks,
      'activeChecks': activeChecks,
      'errorChecks': errorChecks,
      if (avgProcessingTimeMs != null)
        'avgProcessingTimeMs': avgProcessingTimeMs,
      if (maxProcessingTimeMs != null)
        'maxProcessingTimeMs': maxProcessingTimeMs,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static DailyCheckSummaryInclude include({
    _i2.ApplicationInclude? application,
  }) {
    return DailyCheckSummaryInclude._(application: application);
  }

  static DailyCheckSummaryIncludeList includeList({
    _i1.WhereExpressionBuilder<DailyCheckSummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyCheckSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyCheckSummaryTable>? orderByList,
    DailyCheckSummaryInclude? include,
  }) {
    return DailyCheckSummaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailyCheckSummary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DailyCheckSummary.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DailyCheckSummaryImpl extends DailyCheckSummary {
  _DailyCheckSummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         applicationId: applicationId,
         application: application,
         date: date,
         platform: platform,
         buildNumber: buildNumber,
         versionNumber: versionNumber,
         uniqueDevices: uniqueDevices,
         newDevices: newDevices,
         totalChecks: totalChecks,
         blockedChecks: blockedChecks,
         updateAvailableChecks: updateAvailableChecks,
         activeChecks: activeChecks,
         errorChecks: errorChecks,
         avgProcessingTimeMs: avgProcessingTimeMs,
         maxProcessingTimeMs: maxProcessingTimeMs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [DailyCheckSummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyCheckSummary copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? uniqueDevices,
    int? newDevices,
    int? totalChecks,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    Object? avgProcessingTimeMs = _Undefined,
    Object? maxProcessingTimeMs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return DailyCheckSummary(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      date: date ?? this.date,
      platform: platform ?? this.platform,
      buildNumber: buildNumber ?? this.buildNumber,
      versionNumber: versionNumber ?? this.versionNumber,
      uniqueDevices: uniqueDevices ?? this.uniqueDevices,
      newDevices: newDevices ?? this.newDevices,
      totalChecks: totalChecks ?? this.totalChecks,
      blockedChecks: blockedChecks ?? this.blockedChecks,
      updateAvailableChecks:
          updateAvailableChecks ?? this.updateAvailableChecks,
      activeChecks: activeChecks ?? this.activeChecks,
      errorChecks: errorChecks ?? this.errorChecks,
      avgProcessingTimeMs: avgProcessingTimeMs is int?
          ? avgProcessingTimeMs
          : this.avgProcessingTimeMs,
      maxProcessingTimeMs: maxProcessingTimeMs is int?
          ? maxProcessingTimeMs
          : this.maxProcessingTimeMs,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class DailyCheckSummaryUpdateTable
    extends _i1.UpdateTable<DailyCheckSummaryTable> {
  DailyCheckSummaryUpdateTable(super.table);

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

  _i1.ColumnValue<_i3.PlatformType, _i3.PlatformType> platform(
    _i3.PlatformType value,
  ) => _i1.ColumnValue(
    table.platform,
    value,
  );

  _i1.ColumnValue<int, int> buildNumber(int value) => _i1.ColumnValue(
    table.buildNumber,
    value,
  );

  _i1.ColumnValue<String, String> versionNumber(String value) =>
      _i1.ColumnValue(
        table.versionNumber,
        value,
      );

  _i1.ColumnValue<int, int> uniqueDevices(int value) => _i1.ColumnValue(
    table.uniqueDevices,
    value,
  );

  _i1.ColumnValue<int, int> newDevices(int value) => _i1.ColumnValue(
    table.newDevices,
    value,
  );

  _i1.ColumnValue<int, int> totalChecks(int value) => _i1.ColumnValue(
    table.totalChecks,
    value,
  );

  _i1.ColumnValue<int, int> blockedChecks(int value) => _i1.ColumnValue(
    table.blockedChecks,
    value,
  );

  _i1.ColumnValue<int, int> updateAvailableChecks(int value) => _i1.ColumnValue(
    table.updateAvailableChecks,
    value,
  );

  _i1.ColumnValue<int, int> activeChecks(int value) => _i1.ColumnValue(
    table.activeChecks,
    value,
  );

  _i1.ColumnValue<int, int> errorChecks(int value) => _i1.ColumnValue(
    table.errorChecks,
    value,
  );

  _i1.ColumnValue<int, int> avgProcessingTimeMs(int? value) => _i1.ColumnValue(
    table.avgProcessingTimeMs,
    value,
  );

  _i1.ColumnValue<int, int> maxProcessingTimeMs(int? value) => _i1.ColumnValue(
    table.maxProcessingTimeMs,
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

class DailyCheckSummaryTable extends _i1.Table<_i1.UuidValue?> {
  DailyCheckSummaryTable({super.tableRelation})
    : super(tableName: 'daily_check_summaries') {
    updateTable = DailyCheckSummaryUpdateTable(this);
    applicationId = _i1.ColumnUuid(
      'applicationId',
      this,
    );
    date = _i1.ColumnDateTime(
      'date',
      this,
    );
    platform = _i1.ColumnEnum(
      'platform',
      this,
      _i1.EnumSerialization.byName,
    );
    buildNumber = _i1.ColumnInt(
      'buildNumber',
      this,
    );
    versionNumber = _i1.ColumnString(
      'versionNumber',
      this,
    );
    uniqueDevices = _i1.ColumnInt(
      'uniqueDevices',
      this,
      hasDefault: true,
    );
    newDevices = _i1.ColumnInt(
      'newDevices',
      this,
      hasDefault: true,
    );
    totalChecks = _i1.ColumnInt(
      'totalChecks',
      this,
      hasDefault: true,
    );
    blockedChecks = _i1.ColumnInt(
      'blockedChecks',
      this,
      hasDefault: true,
    );
    updateAvailableChecks = _i1.ColumnInt(
      'updateAvailableChecks',
      this,
      hasDefault: true,
    );
    activeChecks = _i1.ColumnInt(
      'activeChecks',
      this,
      hasDefault: true,
    );
    errorChecks = _i1.ColumnInt(
      'errorChecks',
      this,
      hasDefault: true,
    );
    avgProcessingTimeMs = _i1.ColumnInt(
      'avgProcessingTimeMs',
      this,
    );
    maxProcessingTimeMs = _i1.ColumnInt(
      'maxProcessingTimeMs',
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

  late final DailyCheckSummaryUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  /// Приложение
  _i2.ApplicationTable? _application;

  /// Дата агрегации (начало дня UTC)
  late final _i1.ColumnDateTime date;

  /// Платформа
  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  /// Номер сборки
  late final _i1.ColumnInt buildNumber;

  /// Номер версии (для отображения)
  late final _i1.ColumnString versionNumber;

  /// Уникальные устройства за день (по instanceId, точный подсчёт)
  late final _i1.ColumnInt uniqueDevices;

  /// Новые устройства за день (firstSeenAt = сегодня)
  late final _i1.ColumnInt newDevices;

  /// Общее количество проверок за день
  late final _i1.ColumnInt totalChecks;

  /// Проверки со статусом blocked
  late final _i1.ColumnInt blockedChecks;

  /// Проверки со статусом update_available
  late final _i1.ColumnInt updateAvailableChecks;

  /// Проверки со статусом active
  late final _i1.ColumnInt activeChecks;

  /// Проверки со статусом error
  late final _i1.ColumnInt errorChecks;

  /// Среднее время обработки запроса (мс)
  late final _i1.ColumnInt avgProcessingTimeMs;

  /// Максимальное время обработки (мс)
  late final _i1.ColumnInt maxProcessingTimeMs;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.ApplicationTable get application {
    if (_application != null) return _application!;
    _application = _i1.createRelationTable(
      relationFieldName: 'application',
      field: DailyCheckSummary.t.applicationId,
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
    platform,
    buildNumber,
    versionNumber,
    uniqueDevices,
    newDevices,
    totalChecks,
    blockedChecks,
    updateAvailableChecks,
    activeChecks,
    errorChecks,
    avgProcessingTimeMs,
    maxProcessingTimeMs,
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

class DailyCheckSummaryInclude extends _i1.IncludeObject {
  DailyCheckSummaryInclude._({_i2.ApplicationInclude? application}) {
    _application = application;
  }

  _i2.ApplicationInclude? _application;

  @override
  Map<String, _i1.Include?> get includes => {'application': _application};

  @override
  _i1.Table<_i1.UuidValue?> get table => DailyCheckSummary.t;
}

class DailyCheckSummaryIncludeList extends _i1.IncludeList {
  DailyCheckSummaryIncludeList._({
    _i1.WhereExpressionBuilder<DailyCheckSummaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DailyCheckSummary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => DailyCheckSummary.t;
}

class DailyCheckSummaryRepository {
  const DailyCheckSummaryRepository._();

  final attachRow = const DailyCheckSummaryAttachRowRepository._();

  /// Returns a list of [DailyCheckSummary]s matching the given query parameters.
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
  Future<List<DailyCheckSummary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyCheckSummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyCheckSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyCheckSummaryTable>? orderByList,
    _i1.Transaction? transaction,
    DailyCheckSummaryInclude? include,
  }) async {
    return session.db.find<DailyCheckSummary>(
      where: where?.call(DailyCheckSummary.t),
      orderBy: orderBy?.call(DailyCheckSummary.t),
      orderByList: orderByList?.call(DailyCheckSummary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DailyCheckSummary] matching the given query parameters.
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
  Future<DailyCheckSummary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyCheckSummaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<DailyCheckSummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DailyCheckSummaryTable>? orderByList,
    _i1.Transaction? transaction,
    DailyCheckSummaryInclude? include,
  }) async {
    return session.db.findFirstRow<DailyCheckSummary>(
      where: where?.call(DailyCheckSummary.t),
      orderBy: orderBy?.call(DailyCheckSummary.t),
      orderByList: orderByList?.call(DailyCheckSummary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DailyCheckSummary] by its [id] or null if no such row exists.
  Future<DailyCheckSummary?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    DailyCheckSummaryInclude? include,
  }) async {
    return session.db.findById<DailyCheckSummary>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DailyCheckSummary]s in the list and returns the inserted rows.
  ///
  /// The returned [DailyCheckSummary]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DailyCheckSummary>> insert(
    _i1.Session session,
    List<DailyCheckSummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DailyCheckSummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DailyCheckSummary] and returns the inserted row.
  ///
  /// The returned [DailyCheckSummary] will have its `id` field set.
  Future<DailyCheckSummary> insertRow(
    _i1.Session session,
    DailyCheckSummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DailyCheckSummary>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DailyCheckSummary]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DailyCheckSummary>> update(
    _i1.Session session,
    List<DailyCheckSummary> rows, {
    _i1.ColumnSelections<DailyCheckSummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DailyCheckSummary>(
      rows,
      columns: columns?.call(DailyCheckSummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailyCheckSummary]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DailyCheckSummary> updateRow(
    _i1.Session session,
    DailyCheckSummary row, {
    _i1.ColumnSelections<DailyCheckSummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DailyCheckSummary>(
      row,
      columns: columns?.call(DailyCheckSummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DailyCheckSummary] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<DailyCheckSummary?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<DailyCheckSummaryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<DailyCheckSummary>(
      id,
      columnValues: columnValues(DailyCheckSummary.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [DailyCheckSummary]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<DailyCheckSummary>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<DailyCheckSummaryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<DailyCheckSummaryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DailyCheckSummaryTable>? orderBy,
    _i1.OrderByListBuilder<DailyCheckSummaryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<DailyCheckSummary>(
      columnValues: columnValues(DailyCheckSummary.t.updateTable),
      where: where(DailyCheckSummary.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DailyCheckSummary.t),
      orderByList: orderByList?.call(DailyCheckSummary.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [DailyCheckSummary]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DailyCheckSummary>> delete(
    _i1.Session session,
    List<DailyCheckSummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DailyCheckSummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DailyCheckSummary].
  Future<DailyCheckSummary> deleteRow(
    _i1.Session session,
    DailyCheckSummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DailyCheckSummary>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DailyCheckSummary>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DailyCheckSummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DailyCheckSummary>(
      where: where(DailyCheckSummary.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DailyCheckSummaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DailyCheckSummary>(
      where: where?.call(DailyCheckSummary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DailyCheckSummaryAttachRowRepository {
  const DailyCheckSummaryAttachRowRepository._();

  /// Creates a relation between the given [DailyCheckSummary] and [Application]
  /// by setting the [DailyCheckSummary]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    DailyCheckSummary dailyCheckSummary,
    _i2.Application application, {
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
    await session.db.updateRow<DailyCheckSummary>(
      $dailyCheckSummary,
      columns: [DailyCheckSummary.t.applicationId],
      transaction: transaction,
    );
  }
}
