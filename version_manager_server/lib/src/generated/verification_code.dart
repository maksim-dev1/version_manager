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
import 'enums/verification_code_type.dart' as _i2;

abstract class VerificationCode
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  VerificationCode._({
    this.id,
    this.userId,
    required this.email,
    required this.code,
    required this.type,
    int? attempts,
    int? maxAttempts,
    required this.expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) : attempts = attempts ?? 0,
       maxAttempts = maxAttempts ?? 5,
       createdAt = createdAt ?? DateTime.now(),
       isUsed = isUsed ?? false;

  factory VerificationCode({
    int? id,
    int? userId,
    required String email,
    required String code,
    required _i2.VerificationCodeType type,
    int? attempts,
    int? maxAttempts,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) = _VerificationCodeImpl;

  factory VerificationCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return VerificationCode(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int?,
      email: jsonSerialization['email'] as String,
      code: jsonSerialization['code'] as String,
      type: _i2.VerificationCodeType.fromJson(
        (jsonSerialization['type'] as String),
      ),
      attempts: jsonSerialization['attempts'] as int?,
      maxAttempts: jsonSerialization['maxAttempts'] as int?,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isUsed: jsonSerialization['isUsed'] as bool?,
    );
  }

  static final t = VerificationCodeTable();

  static const db = VerificationCodeRepository._();

  @override
  int? id;

  int? userId;

  String email;

  String code;

  _i2.VerificationCodeType type;

  int attempts;

  int maxAttempts;

  DateTime expiresAt;

  DateTime createdAt;

  bool isUsed;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VerificationCode copyWith({
    int? id,
    int? userId,
    String? email,
    String? code,
    _i2.VerificationCodeType? type,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VerificationCode',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'email': email,
      'code': code,
      'type': type.toJson(),
      'attempts': attempts,
      'maxAttempts': maxAttempts,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isUsed': isUsed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VerificationCode',
      if (id != null) 'id': id,
      if (userId != null) 'userId': userId,
      'email': email,
      'code': code,
      'type': type.toJson(),
      'attempts': attempts,
      'maxAttempts': maxAttempts,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isUsed': isUsed,
    };
  }

  static VerificationCodeInclude include() {
    return VerificationCodeInclude._();
  }

  static VerificationCodeIncludeList includeList({
    _i1.WhereExpressionBuilder<VerificationCodeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VerificationCodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VerificationCodeTable>? orderByList,
    VerificationCodeInclude? include,
  }) {
    return VerificationCodeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VerificationCode.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(VerificationCode.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _VerificationCodeImpl extends VerificationCode {
  _VerificationCodeImpl({
    int? id,
    int? userId,
    required String email,
    required String code,
    required _i2.VerificationCodeType type,
    int? attempts,
    int? maxAttempts,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) : super._(
         id: id,
         userId: userId,
         email: email,
         code: code,
         type: type,
         attempts: attempts,
         maxAttempts: maxAttempts,
         expiresAt: expiresAt,
         createdAt: createdAt,
         isUsed: isUsed,
       );

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VerificationCode copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    String? email,
    String? code,
    _i2.VerificationCodeType? type,
    int? attempts,
    int? maxAttempts,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
  }) {
    return VerificationCode(
      id: id is int? ? id : this.id,
      userId: userId is int? ? userId : this.userId,
      email: email ?? this.email,
      code: code ?? this.code,
      type: type ?? this.type,
      attempts: attempts ?? this.attempts,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      isUsed: isUsed ?? this.isUsed,
    );
  }
}

class VerificationCodeUpdateTable
    extends _i1.UpdateTable<VerificationCodeTable> {
  VerificationCodeUpdateTable(super.table);

  _i1.ColumnValue<int, int> userId(int? value) => _i1.ColumnValue(
    table.userId,
    value,
  );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> code(String value) => _i1.ColumnValue(
    table.code,
    value,
  );

  _i1.ColumnValue<_i2.VerificationCodeType, _i2.VerificationCodeType> type(
    _i2.VerificationCodeType value,
  ) => _i1.ColumnValue(
    table.type,
    value,
  );

  _i1.ColumnValue<int, int> attempts(int value) => _i1.ColumnValue(
    table.attempts,
    value,
  );

  _i1.ColumnValue<int, int> maxAttempts(int value) => _i1.ColumnValue(
    table.maxAttempts,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> expiresAt(DateTime value) =>
      _i1.ColumnValue(
        table.expiresAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _i1.ColumnValue(
        table.createdAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isUsed(bool value) => _i1.ColumnValue(
    table.isUsed,
    value,
  );
}

class VerificationCodeTable extends _i1.Table<int?> {
  VerificationCodeTable({super.tableRelation})
    : super(tableName: 'verification_codes') {
    updateTable = VerificationCodeUpdateTable(this);
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    code = _i1.ColumnString(
      'code',
      this,
    );
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    attempts = _i1.ColumnInt(
      'attempts',
      this,
      hasDefault: true,
    );
    maxAttempts = _i1.ColumnInt(
      'maxAttempts',
      this,
      hasDefault: true,
    );
    expiresAt = _i1.ColumnDateTime(
      'expiresAt',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    isUsed = _i1.ColumnBool(
      'isUsed',
      this,
      hasDefault: true,
    );
  }

  late final VerificationCodeUpdateTable updateTable;

  late final _i1.ColumnInt userId;

  late final _i1.ColumnString email;

  late final _i1.ColumnString code;

  late final _i1.ColumnEnum<_i2.VerificationCodeType> type;

  late final _i1.ColumnInt attempts;

  late final _i1.ColumnInt maxAttempts;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnBool isUsed;

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    email,
    code,
    type,
    attempts,
    maxAttempts,
    expiresAt,
    createdAt,
    isUsed,
  ];
}

class VerificationCodeInclude extends _i1.IncludeObject {
  VerificationCodeInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => VerificationCode.t;
}

class VerificationCodeIncludeList extends _i1.IncludeList {
  VerificationCodeIncludeList._({
    _i1.WhereExpressionBuilder<VerificationCodeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(VerificationCode.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => VerificationCode.t;
}

class VerificationCodeRepository {
  const VerificationCodeRepository._();

  /// Returns a list of [VerificationCode]s matching the given query parameters.
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
  Future<List<VerificationCode>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VerificationCodeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VerificationCodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VerificationCodeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<VerificationCode>(
      where: where?.call(VerificationCode.t),
      orderBy: orderBy?.call(VerificationCode.t),
      orderByList: orderByList?.call(VerificationCode.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [VerificationCode] matching the given query parameters.
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
  Future<VerificationCode?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VerificationCodeTable>? where,
    int? offset,
    _i1.OrderByBuilder<VerificationCodeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<VerificationCodeTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<VerificationCode>(
      where: where?.call(VerificationCode.t),
      orderBy: orderBy?.call(VerificationCode.t),
      orderByList: orderByList?.call(VerificationCode.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [VerificationCode] by its [id] or null if no such row exists.
  Future<VerificationCode?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<VerificationCode>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [VerificationCode]s in the list and returns the inserted rows.
  ///
  /// The returned [VerificationCode]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<VerificationCode>> insert(
    _i1.Session session,
    List<VerificationCode> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<VerificationCode>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [VerificationCode] and returns the inserted row.
  ///
  /// The returned [VerificationCode] will have its `id` field set.
  Future<VerificationCode> insertRow(
    _i1.Session session,
    VerificationCode row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<VerificationCode>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [VerificationCode]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<VerificationCode>> update(
    _i1.Session session,
    List<VerificationCode> rows, {
    _i1.ColumnSelections<VerificationCodeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<VerificationCode>(
      rows,
      columns: columns?.call(VerificationCode.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VerificationCode]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<VerificationCode> updateRow(
    _i1.Session session,
    VerificationCode row, {
    _i1.ColumnSelections<VerificationCodeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<VerificationCode>(
      row,
      columns: columns?.call(VerificationCode.t),
      transaction: transaction,
    );
  }

  /// Updates a single [VerificationCode] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<VerificationCode?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<VerificationCodeUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<VerificationCode>(
      id,
      columnValues: columnValues(VerificationCode.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [VerificationCode]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<VerificationCode>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<VerificationCodeUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<VerificationCodeTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<VerificationCodeTable>? orderBy,
    _i1.OrderByListBuilder<VerificationCodeTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<VerificationCode>(
      columnValues: columnValues(VerificationCode.t.updateTable),
      where: where(VerificationCode.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(VerificationCode.t),
      orderByList: orderByList?.call(VerificationCode.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [VerificationCode]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<VerificationCode>> delete(
    _i1.Session session,
    List<VerificationCode> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VerificationCode>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [VerificationCode].
  Future<VerificationCode> deleteRow(
    _i1.Session session,
    VerificationCode row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<VerificationCode>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<VerificationCode>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<VerificationCodeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<VerificationCode>(
      where: where(VerificationCode.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<VerificationCodeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VerificationCode>(
      where: where?.call(VerificationCode.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
