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

/// Агрегированная дневная статистика проверок версий.
///
/// Содержит преагрегированные метрики за один день для одного приложения,
/// одной платформы и одной версии. Используется для:
/// — быстрых дашбордов без тяжёлых запросов к version_check_logs
/// — хранения исторических данных после удаления детальных логов
/// — аналитики трендов по дням
///
/// Заполняется автоматически при каждом запросе check-version
/// (инкрементальное обновление) или через периодическую задачу (cron).
///
/// Retention policy: хранить бессрочно (компактные данные ~200 байт/запись).
abstract class VersionCheckDailySummary
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  VersionCheckDailySummary._({
    this.id,
    required this.applicationId,
    this.application,
    required this.date,
    required this.platform,
    required this.buildNumber,
    required this.versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    this.avgProcessingTimeMs,
    this.maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : totalChecks = totalChecks ?? 0,
       uniqueDevices = uniqueDevices ?? 0,
       blockedChecks = blockedChecks ?? 0,
       updateAvailableChecks = updateAvailableChecks ?? 0,
       activeChecks = activeChecks ?? 0,
       errorChecks = errorChecks ?? 0,
       newInstalls = newInstalls ?? 0,
       upgrades = upgrades ?? 0,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory VersionCheckDailySummary({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _VersionCheckDailySummaryImpl;

  factory VersionCheckDailySummary.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VersionCheckDailySummary(
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
      totalChecks: jsonSerialization['totalChecks'] as int?,
      uniqueDevices: jsonSerialization['uniqueDevices'] as int?,
      blockedChecks: jsonSerialization['blockedChecks'] as int?,
      updateAvailableChecks: jsonSerialization['updateAvailableChecks'] as int?,
      activeChecks: jsonSerialization['activeChecks'] as int?,
      errorChecks: jsonSerialization['errorChecks'] as int?,
      newInstalls: jsonSerialization['newInstalls'] as int?,
      upgrades: jsonSerialization['upgrades'] as int?,
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

  static final t = VersionCheckDailySummaryTable();

  static const db = VersionCheckDailySummaryRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue applicationId;

  /// Приложение
  _i2.Application? application;

  /// Дата агрегации (без времени, начало дня UTC)
  DateTime date;

  /// Платформа
  _i3.PlatformType platform;

  /// Номер сборки
  int buildNumber;

  /// Номер версии (для отображения)
  String versionNumber;

  /// Общее количество проверок за день
  int totalChecks;

  /// Количество уникальных устройств
  int uniqueDevices;

  /// Проверки со статусом blocked
  int blockedChecks;

  /// Проверки со статусом update_available
  int updateAvailableChecks;

  /// Проверки со статусом active
  int activeChecks;

  /// Проверки со статусом error
  int errorChecks;

  /// Количество первых проверок (новые устройства)
  int newInstalls;

  /// Количество обновлений (устройство сменило версию)
  int upgrades;

  /// Среднее время обработки запроса (мс)
  int? avgProcessingTimeMs;

  /// Максимальное время обработки (мс)
  int? maxProcessingTimeMs;

  DateTime createdAt;

  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [VersionCheckDailySummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionCheckDailySummary copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? applicationId,
    _i2.Application? application,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    int? avgProcessingTimeMs,
    int? maxProcessingTimeMs,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionCheckDailySummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJson(),
      'date': date.toJson(),
      'platform': platform.toJson(),
      'buildNumber': buildNumber,
      'versionNumber': versionNumber,
      'totalChecks': totalChecks,
      'uniqueDevices': uniqueDevices,
      'blockedChecks': blockedChecks,
      'updateAvailableChecks': updateAvailableChecks,
      'activeChecks': activeChecks,
      'errorChecks': errorChecks,
      'newInstalls': newInstalls,
      'upgrades': upgrades,
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
      '__className__': 'VersionCheckDailySummary',
      if (id != null) 'id': id?.toJson(),
      'applicationId': applicationId.toJson(),
      if (application != null) 'application': application?.toJsonForProtocol(),
      'date': date.toJson(),
      'platform': platform.toJson(),
      'buildNumber': buildNumber,
      'versionNumber': versionNumber,
      'totalChecks': totalChecks,
      'uniqueDevices': uniqueDevices,
      'blockedChecks': blockedChecks,
      'updateAvailableChecks': updateAvailableChecks,
      'activeChecks': activeChecks,
      'errorChecks': errorChecks,
      'newInstalls': newInstalls,
      'upgrades': upgrades,
      if (avgProcessingTimeMs != null)
        'avgProcessingTimeMs': avgProcessingTimeMs,
      if (maxProcessingTimeMs != null)
        'maxProcessingTimeMs': maxProcessingTimeMs,
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static VersionCheckDailySummaryInclude include({
    _i2.ApplicationInclude? application,
  }) {
    return VersionCheckDailySummaryInclude._(application: application);
  }

  static VersionCheckDailySummaryIncludeList includeList({
    _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckDailySummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckDailySummaryTable>? orderByList,
    VersionCheckDailySummaryInclude? include,
  }) {
    return VersionCheckDailySummaryIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VersionCheckDailySummary.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VersionCheckDailySummary.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VersionCheckDailySummaryImpl extends VersionCheckDailySummary {
  _VersionCheckDailySummaryImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue applicationId,
    _i2.Application? application,
    required DateTime date,
    required _i3.PlatformType platform,
    required int buildNumber,
    required String versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
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
         totalChecks: totalChecks,
         uniqueDevices: uniqueDevices,
         blockedChecks: blockedChecks,
         updateAvailableChecks: updateAvailableChecks,
         activeChecks: activeChecks,
         errorChecks: errorChecks,
         newInstalls: newInstalls,
         upgrades: upgrades,
         avgProcessingTimeMs: avgProcessingTimeMs,
         maxProcessingTimeMs: maxProcessingTimeMs,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [VersionCheckDailySummary]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionCheckDailySummary copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? applicationId,
    Object? application = _Undefined,
    DateTime? date,
    _i3.PlatformType? platform,
    int? buildNumber,
    String? versionNumber,
    int? totalChecks,
    int? uniqueDevices,
    int? blockedChecks,
    int? updateAvailableChecks,
    int? activeChecks,
    int? errorChecks,
    int? newInstalls,
    int? upgrades,
    Object? avgProcessingTimeMs = _Undefined,
    Object? maxProcessingTimeMs = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return VersionCheckDailySummary(
      id: id is _i1.UuidValue? ? id : this.id,
      applicationId: applicationId ?? this.applicationId,
      application: application is _i2.Application?
          ? application
          : this.application?.copyWith(),
      date: date ?? this.date,
      platform: platform ?? this.platform,
      buildNumber: buildNumber ?? this.buildNumber,
      versionNumber: versionNumber ?? this.versionNumber,
      totalChecks: totalChecks ?? this.totalChecks,
      uniqueDevices: uniqueDevices ?? this.uniqueDevices,
      blockedChecks: blockedChecks ?? this.blockedChecks,
      updateAvailableChecks:
          updateAvailableChecks ?? this.updateAvailableChecks,
      activeChecks: activeChecks ?? this.activeChecks,
      errorChecks: errorChecks ?? this.errorChecks,
      newInstalls: newInstalls ?? this.newInstalls,
      upgrades: upgrades ?? this.upgrades,
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

class VersionCheckDailySummaryUpdateTable
    extends _i1.UpdateTable<VersionCheckDailySummaryTable> {
  VersionCheckDailySummaryUpdateTable(super.table);

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

  _i1.ColumnValue<int, int> totalChecks(int value) => _i1.ColumnValue(
    table.totalChecks,
    value,
  );

  _i1.ColumnValue<int, int> uniqueDevices(int value) => _i1.ColumnValue(
    table.uniqueDevices,
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

  _i1.ColumnValue<int, int> newInstalls(int value) => _i1.ColumnValue(
    table.newInstalls,
    value,
  );

  _i1.ColumnValue<int, int> upgrades(int value) => _i1.ColumnValue(
    table.upgrades,
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

class VersionCheckDailySummaryTable extends _i1.Table<_i1.UuidValue?> {
  VersionCheckDailySummaryTable({super.tableRelation})
    : super(tableName: 'version_check_daily_summaries') {
    updateTable = VersionCheckDailySummaryUpdateTable(this);
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
    totalChecks = _i1.ColumnInt(
      'totalChecks',
      this,
      hasDefault: true,
    );
    uniqueDevices = _i1.ColumnInt(
      'uniqueDevices',
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
    newInstalls = _i1.ColumnInt(
      'newInstalls',
      this,
      hasDefault: true,
    );
    upgrades = _i1.ColumnInt(
      'upgrades',
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

  late final VersionCheckDailySummaryUpdateTable updateTable;

  late final _i1.ColumnUuid applicationId;

  /// Приложение
  _i2.ApplicationTable? _application;

  /// Дата агрегации (без времени, начало дня UTC)
  late final _i1.ColumnDateTime date;

  /// Платформа
  late final _i1.ColumnEnum<_i3.PlatformType> platform;

  /// Номер сборки
  late final _i1.ColumnInt buildNumber;

  /// Номер версии (для отображения)
  late final _i1.ColumnString versionNumber;

  /// Общее количество проверок за день
  late final _i1.ColumnInt totalChecks;

  /// Количество уникальных устройств
  late final _i1.ColumnInt uniqueDevices;

  /// Проверки со статусом blocked
  late final _i1.ColumnInt blockedChecks;

  /// Проверки со статусом update_available
  late final _i1.ColumnInt updateAvailableChecks;

  /// Проверки со статусом active
  late final _i1.ColumnInt activeChecks;

  /// Проверки со статусом error
  late final _i1.ColumnInt errorChecks;

  /// Количество первых проверок (новые устройства)
  late final _i1.ColumnInt newInstalls;

  /// Количество обновлений (устройство сменило версию)
  late final _i1.ColumnInt upgrades;

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
      field: VersionCheckDailySummary.t.applicationId,
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
    totalChecks,
    uniqueDevices,
    blockedChecks,
    updateAvailableChecks,
    activeChecks,
    errorChecks,
    newInstalls,
    upgrades,
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

class VersionCheckDailySummaryInclude extends _i1.IncludeObject {
  VersionCheckDailySummaryInclude._({_i2.ApplicationInclude? application}) {
    _application = application;
  }

  _i2.ApplicationInclude? _application;

  @override
  Map<String, _i1.Include?> get includes => {'application': _application};

  @override
  _i1.Table<_i1.UuidValue?> get table => VersionCheckDailySummary.t;
}

class VersionCheckDailySummaryIncludeList extends _i1.IncludeList {
  VersionCheckDailySummaryIncludeList._({
    _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VersionCheckDailySummary.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => VersionCheckDailySummary.t;
}

class VersionCheckDailySummaryRepository {
  const VersionCheckDailySummaryRepository._();

  final attachRow = const VersionCheckDailySummaryAttachRowRepository._();

  /// Returns a list of [VersionCheckDailySummary]s matching the given query parameters.
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
  Future<List<VersionCheckDailySummary>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckDailySummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckDailySummaryTable>? orderByList,
    _i1.Transaction? transaction,
    VersionCheckDailySummaryInclude? include,
  }) async {
    return session.db.find<VersionCheckDailySummary>(
      where: where?.call(VersionCheckDailySummary.t),
      orderBy: orderBy?.call(VersionCheckDailySummary.t),
      orderByList: orderByList?.call(VersionCheckDailySummary.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [VersionCheckDailySummary] matching the given query parameters.
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
  Future<VersionCheckDailySummary?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable>? where,
    int? offset,
    _i1.OrderByBuilder<VersionCheckDailySummaryTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VersionCheckDailySummaryTable>? orderByList,
    _i1.Transaction? transaction,
    VersionCheckDailySummaryInclude? include,
  }) async {
    return session.db.findFirstRow<VersionCheckDailySummary>(
      where: where?.call(VersionCheckDailySummary.t),
      orderBy: orderBy?.call(VersionCheckDailySummary.t),
      orderByList: orderByList?.call(VersionCheckDailySummary.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VersionCheckDailySummary] by its [id] or null if no such row exists.
  Future<VersionCheckDailySummary?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VersionCheckDailySummaryInclude? include,
  }) async {
    return session.db.findById<VersionCheckDailySummary>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [VersionCheckDailySummary]s in the list and returns the inserted rows.
  ///
  /// The returned [VersionCheckDailySummary]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VersionCheckDailySummary>> insert(
    _i1.Session session,
    List<VersionCheckDailySummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VersionCheckDailySummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VersionCheckDailySummary] and returns the inserted row.
  ///
  /// The returned [VersionCheckDailySummary] will have its `id` field set.
  Future<VersionCheckDailySummary> insertRow(
    _i1.Session session,
    VersionCheckDailySummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VersionCheckDailySummary>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VersionCheckDailySummary]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VersionCheckDailySummary>> update(
    _i1.Session session,
    List<VersionCheckDailySummary> rows, {
    _i1.ColumnSelections<VersionCheckDailySummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VersionCheckDailySummary>(
      rows,
      columns: columns?.call(VersionCheckDailySummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VersionCheckDailySummary]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VersionCheckDailySummary> updateRow(
    _i1.Session session,
    VersionCheckDailySummary row, {
    _i1.ColumnSelections<VersionCheckDailySummaryTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VersionCheckDailySummary>(
      row,
      columns: columns?.call(VersionCheckDailySummary.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VersionCheckDailySummary] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VersionCheckDailySummary?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<VersionCheckDailySummaryUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VersionCheckDailySummary>(
      id,
      columnValues: columnValues(VersionCheckDailySummary.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VersionCheckDailySummary]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VersionCheckDailySummary>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VersionCheckDailySummaryUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VersionCheckDailySummaryTable>? orderBy,
    _i1.OrderByListBuilder<VersionCheckDailySummaryTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VersionCheckDailySummary>(
      columnValues: columnValues(VersionCheckDailySummary.t.updateTable),
      where: where(VersionCheckDailySummary.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VersionCheckDailySummary.t),
      orderByList: orderByList?.call(VersionCheckDailySummary.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VersionCheckDailySummary]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VersionCheckDailySummary>> delete(
    _i1.Session session,
    List<VersionCheckDailySummary> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VersionCheckDailySummary>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VersionCheckDailySummary].
  Future<VersionCheckDailySummary> deleteRow(
    _i1.Session session,
    VersionCheckDailySummary row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VersionCheckDailySummary>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VersionCheckDailySummary>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VersionCheckDailySummary>(
      where: where(VersionCheckDailySummary.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VersionCheckDailySummaryTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VersionCheckDailySummary>(
      where: where?.call(VersionCheckDailySummary.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class VersionCheckDailySummaryAttachRowRepository {
  const VersionCheckDailySummaryAttachRowRepository._();

  /// Creates a relation between the given [VersionCheckDailySummary] and [Application]
  /// by setting the [VersionCheckDailySummary]'s foreign key `applicationId` to refer to the [Application].
  Future<void> application(
    _i1.Session session,
    VersionCheckDailySummary versionCheckDailySummary,
    _i2.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (versionCheckDailySummary.id == null) {
      throw ArgumentError.notNull('versionCheckDailySummary.id');
    }
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $versionCheckDailySummary = versionCheckDailySummary.copyWith(
      applicationId: application.id,
    );
    await session.db.updateRow<VersionCheckDailySummary>(
      $versionCheckDailySummary,
      columns: [VersionCheckDailySummary.t.applicationId],
      transaction: transaction,
    );
  }
}
