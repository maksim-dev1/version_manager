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

abstract class AuthSession
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  AuthSession._({
    this.id,
    required this.userId,
    required this.token,
    required this.refreshToken,
    this.deviceInfo,
    this.ipAddress,
    this.userAgent,
    required this.expiresAt,
    required this.refreshExpiresAt,
    DateTime? createdAt,
    this.lastActivityAt,
    bool? isActive,
  }) : createdAt = createdAt ?? DateTime.now(),
       isActive = isActive ?? true;

  factory AuthSession({
    int? id,
    required int userId,
    required String token,
    required String refreshToken,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    required DateTime expiresAt,
    required DateTime refreshExpiresAt,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isActive,
  }) = _AuthSessionImpl;

  factory AuthSession.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthSession(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      token: jsonSerialization['token'] as String,
      refreshToken: jsonSerialization['refreshToken'] as String,
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      refreshExpiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['refreshExpiresAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      lastActivityAt: jsonSerialization['lastActivityAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActivityAt'],
            ),
      isActive: jsonSerialization['isActive'] as bool?,
    );
  }

  static final t = AuthSessionTable();

  static const db = AuthSessionRepository._();

  @override
  int? id;

  int userId;

  String token;

  String refreshToken;

  String? deviceInfo;

  String? ipAddress;

  String? userAgent;

  DateTime expiresAt;

  DateTime refreshExpiresAt;

  DateTime createdAt;

  DateTime? lastActivityAt;

  bool isActive;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthSession copyWith({
    int? id,
    int? userId,
    String? token,
    String? refreshToken,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? expiresAt,
    DateTime? refreshExpiresAt,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isActive,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthSession',
      if (id != null) 'id': id,
      'userId': userId,
      'token': token,
      'refreshToken': refreshToken,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'expiresAt': expiresAt.toJson(),
      'refreshExpiresAt': refreshExpiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'isActive': isActive,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AuthSession',
      if (id != null) 'id': id,
      'userId': userId,
      'token': token,
      'refreshToken': refreshToken,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'expiresAt': expiresAt.toJson(),
      'refreshExpiresAt': refreshExpiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'isActive': isActive,
    };
  }

  static AuthSessionInclude include() {
    return AuthSessionInclude._();
  }

  static AuthSessionIncludeList includeList({
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    AuthSessionInclude? include,
  }) {
    return AuthSessionIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AuthSession.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(AuthSession.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AuthSessionImpl extends AuthSession {
  _AuthSessionImpl({
    int? id,
    required int userId,
    required String token,
    required String refreshToken,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    required DateTime expiresAt,
    required DateTime refreshExpiresAt,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isActive,
  }) : super._(
         id: id,
         userId: userId,
         token: token,
         refreshToken: refreshToken,
         deviceInfo: deviceInfo,
         ipAddress: ipAddress,
         userAgent: userAgent,
         expiresAt: expiresAt,
         refreshExpiresAt: refreshExpiresAt,
         createdAt: createdAt,
         lastActivityAt: lastActivityAt,
         isActive: isActive,
       );

  /// Returns a shallow copy of this [AuthSession]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthSession copyWith({
    Object? id = _Undefined,
    int? userId,
    String? token,
    String? refreshToken,
    Object? deviceInfo = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    DateTime? expiresAt,
    DateTime? refreshExpiresAt,
    DateTime? createdAt,
    Object? lastActivityAt = _Undefined,
    bool? isActive,
  }) {
    return AuthSession(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      expiresAt: expiresAt ?? this.expiresAt,
      refreshExpiresAt: refreshExpiresAt ?? this.refreshExpiresAt,
      createdAt: createdAt ?? this.createdAt,
      lastActivityAt: lastActivityAt is DateTime?
          ? lastActivityAt
          : this.lastActivityAt,
      isActive: isActive ?? this.isActive,
    );
  }
}

class AuthSessionUpdateTable extends _i1.UpdateTable<AuthSessionTable> {
  AuthSessionUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> token(String value) => _i1.ColumnValue(
    table.token,
    value,
  );

  _i1.ColumnValue<String, String> refreshToken(String value) => _i1.ColumnValue(
    table.refreshToken,
    value,
  );

  _i1.ColumnValue<String, String> deviceInfo(String? value) => _i1.ColumnValue(
    table.deviceInfo,
    value,
  );

  _i1.ColumnValue<String, String> ipAddress(String? value) => _i1.ColumnValue(
    table.ipAddress,
    value,
  );

  _i1.ColumnValue<String, String> userAgent(String? value) => _i1.ColumnValue(
    table.userAgent,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> refreshExpiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.refreshExpiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> lastActivityAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastActivityAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );
}

class AuthSessionTable extends _i1.Table<int?> {
  AuthSessionTable({super.tableRelation}) : super(tableName: 'auth_sessions') {
    updateTable = AuthSessionUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    token = _i1.ColumnString(
      'token',
      this,
    );
    refreshToken = _i1.ColumnString(
      'refreshToken',
      this,
    );
    deviceInfo = _i1.ColumnString(
      'deviceInfo',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
    userAgent = _i1.ColumnString(
      'userAgent',
      this,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    refreshExpiresAt = _i1.ColumnDateTime(
      'refreshExpiresAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    lastActivityAt = _i1.ColumnDateTime(
      'lastActivityAt',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
  }

  late final AuthSessionUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString token;

  late final _i1.ColumnString refreshToken;

  late final _i1.ColumnString deviceInfo;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnString userAgent;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime refreshExpiresAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime lastActivityAt;

  late final _i1.ColumnBool isActive;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    token,
    refreshToken,
    deviceInfo,
    ipAddress,
    userAgent,
    expiresAt,
    refreshExpiresAt,
    createdAt,
    lastActivityAt,
    isActive,
  ];
}

class AuthSessionInclude extends _i1.IncludeObject {
  AuthSessionInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => AuthSession.t;
}

class AuthSessionIncludeList extends _i1.IncludeList {
  AuthSessionIncludeList._({
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(AuthSession.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => AuthSession.t;
}

class AuthSessionRepository {
  const AuthSessionRepository._();

  /// Returns a list of [AuthSession]s matching the given query parameters.
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
  Future<List<AuthSession>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<AuthSession>(
      where: where?.call(AuthSession.t),
      orderBy: orderBy?.call(AuthSession.t),
      orderByList: orderByList?.call(AuthSession.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [AuthSession] matching the given query parameters.
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
  Future<AuthSession?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<AuthSession>(
      where: where?.call(AuthSession.t),
      orderBy: orderBy?.call(AuthSession.t),
      orderByList: orderByList?.call(AuthSession.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [AuthSession] by its [id] or null if no such row exists.
  Future<AuthSession?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<AuthSession>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [AuthSession]s in the list and returns the inserted rows.
  ///
  /// The returned [AuthSession]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<AuthSession>> insert(
    _i1.Session session,
    List<AuthSession> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<AuthSession>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [AuthSession] and returns the inserted row.
  ///
  /// The returned [AuthSession] will have its `id` field set.
  Future<AuthSession> insertRow(
    _i1.Session session,
    AuthSession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<AuthSession>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [AuthSession]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<AuthSession>> update(
    _i1.Session session,
    List<AuthSession> rows, {
    _i1.ColumnSelections<AuthSessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<AuthSession>(
      rows,
      columns: columns?.call(AuthSession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AuthSession]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<AuthSession> updateRow(
    _i1.Session session,
    AuthSession row, {
    _i1.ColumnSelections<AuthSessionTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<AuthSession>(
      row,
      columns: columns?.call(AuthSession.t),
      transaction: transaction,
    );
  }

  /// Updates a single [AuthSession] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<AuthSession?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<AuthSessionUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<AuthSession>(
      id,
      columnValues: columnValues(AuthSession.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [AuthSession]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<AuthSession>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<AuthSessionUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<AuthSessionTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AuthSessionTable>? orderBy,
    _i1.OrderByListBuilder<AuthSessionTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<AuthSession>(
      columnValues: columnValues(AuthSession.t.updateTable),
      where: where(AuthSession.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(AuthSession.t),
      orderByList: orderByList?.call(AuthSession.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [AuthSession]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<AuthSession>> delete(
    _i1.Session session,
    List<AuthSession> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<AuthSession>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [AuthSession].
  Future<AuthSession> deleteRow(
    _i1.Session session,
    AuthSession row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<AuthSession>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<AuthSession>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AuthSessionTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<AuthSession>(
      where: where(AuthSession.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AuthSessionTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<AuthSession>(
      where: where?.call(AuthSession.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
