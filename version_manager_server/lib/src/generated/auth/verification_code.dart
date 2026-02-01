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
import '../auth/user.dart' as _i2;
import '../enums/verification_putpose_type.dart' as _i3;
import 'package:version_manager_server/src/generated/protocol.dart' as _i4;

abstract class VerificationCode
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  VerificationCode._({
    this.id,
    this.userId,
    this.user,
    required this.email,
    required this.purpose,
    required this.codeHash,
    required this.expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    this.usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    this.resendAvailableAt,
    this.ipAddress,
    this.userAgent,
  }) : createdAt = createdAt ?? DateTime.now(),
       isUsed = isUsed ?? false,
       attemptsUsed = attemptsUsed ?? 0,
       maxAttempts = maxAttempts ?? 5;

  factory VerificationCode({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    required String email,
    required _i3.VerificationPurposeType purpose,
    required String codeHash,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    DateTime? usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    DateTime? resendAvailableAt,
    String? ipAddress,
    String? userAgent,
  }) = _VerificationCodeImpl;

  factory VerificationCode.fromJson(Map<String, dynamic> jsonSerialization) {
    return VerificationCode(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      userId: jsonSerialization['userId'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i4.Protocol().deserialize<_i2.User>(jsonSerialization['user']),
      email: jsonSerialization['email'] as String,
      purpose: _i3.VerificationPurposeType.fromJson(
        (jsonSerialization['purpose'] as String),
      ),
      codeHash: jsonSerialization['codeHash'] as String,
      expiresAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['expiresAt'],
      ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      isUsed: jsonSerialization['isUsed'] as bool?,
      usedAt: jsonSerialization['usedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['usedAt']),
      attemptsUsed: jsonSerialization['attemptsUsed'] as int?,
      maxAttempts: jsonSerialization['maxAttempts'] as int?,
      resendAvailableAt: jsonSerialization['resendAvailableAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['resendAvailableAt'],
            ),
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
    );
  }

  static final t = VerificationCodeTable();

  static const db = VerificationCodeRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue? userId;

  _i2.User? user;

  String email;

  _i3.VerificationPurposeType purpose;

  String codeHash;

  DateTime expiresAt;

  DateTime createdAt;

  bool isUsed;

  DateTime? usedAt;

  int attemptsUsed;

  int maxAttempts;

  DateTime? resendAvailableAt;

  String? ipAddress;

  String? userAgent;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VerificationCode copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    String? email,
    _i3.VerificationPurposeType? purpose,
    String? codeHash,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    DateTime? usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    DateTime? resendAvailableAt,
    String? ipAddress,
    String? userAgent,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VerificationCode',
      if (id != null) 'id': id?.toJson(),
      if (userId != null) 'userId': userId?.toJson(),
      if (user != null) 'user': user?.toJson(),
      'email': email,
      'purpose': purpose.toJson(),
      'codeHash': codeHash,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isUsed': isUsed,
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
      'attemptsUsed': attemptsUsed,
      'maxAttempts': maxAttempts,
      if (resendAvailableAt != null)
        'resendAvailableAt': resendAvailableAt?.toJson(),
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VerificationCode',
      if (id != null) 'id': id?.toJson(),
      if (userId != null) 'userId': userId?.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'email': email,
      'purpose': purpose.toJson(),
      'codeHash': codeHash,
      'expiresAt': expiresAt.toJson(),
      'createdAt': createdAt.toJson(),
      'isUsed': isUsed,
      if (usedAt != null) 'usedAt': usedAt?.toJson(),
      'attemptsUsed': attemptsUsed,
      'maxAttempts': maxAttempts,
      if (resendAvailableAt != null)
        'resendAvailableAt': resendAvailableAt?.toJson(),
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
    };
  }

  static VerificationCodeInclude include({_i2.UserInclude? user}) {
    return VerificationCodeInclude._(user: user);
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
    _i1.UuidValue? id,
    _i1.UuidValue? userId,
    _i2.User? user,
    required String email,
    required _i3.VerificationPurposeType purpose,
    required String codeHash,
    required DateTime expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    DateTime? usedAt,
    int? attemptsUsed,
    int? maxAttempts,
    DateTime? resendAvailableAt,
    String? ipAddress,
    String? userAgent,
  }) : super._(
         id: id,
         userId: userId,
         user: user,
         email: email,
         purpose: purpose,
         codeHash: codeHash,
         expiresAt: expiresAt,
         createdAt: createdAt,
         isUsed: isUsed,
         usedAt: usedAt,
         attemptsUsed: attemptsUsed,
         maxAttempts: maxAttempts,
         resendAvailableAt: resendAvailableAt,
         ipAddress: ipAddress,
         userAgent: userAgent,
       );

  /// Returns a shallow copy of this [VerificationCode]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VerificationCode copyWith({
    Object? id = _Undefined,
    Object? userId = _Undefined,
    Object? user = _Undefined,
    String? email,
    _i3.VerificationPurposeType? purpose,
    String? codeHash,
    DateTime? expiresAt,
    DateTime? createdAt,
    bool? isUsed,
    Object? usedAt = _Undefined,
    int? attemptsUsed,
    int? maxAttempts,
    Object? resendAvailableAt = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
  }) {
    return VerificationCode(
      id: id is _i1.UuidValue? ? id : this.id,
      userId: userId is _i1.UuidValue? ? userId : this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      email: email ?? this.email,
      purpose: purpose ?? this.purpose,
      codeHash: codeHash ?? this.codeHash,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      isUsed: isUsed ?? this.isUsed,
      usedAt: usedAt is DateTime? ? usedAt : this.usedAt,
      attemptsUsed: attemptsUsed ?? this.attemptsUsed,
      maxAttempts: maxAttempts ?? this.maxAttempts,
      resendAvailableAt: resendAvailableAt is DateTime?
          ? resendAvailableAt
          : this.resendAvailableAt,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
    );
  }
}

class VerificationCodeUpdateTable
    extends _i1.UpdateTable<VerificationCodeTable> {
  VerificationCodeUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue? value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<_i3.VerificationPurposeType, _i3.VerificationPurposeType>
  purpose(_i3.VerificationPurposeType value) => _i1.ColumnValue(
    table.purpose,
    value,
  );

  _i1.ColumnValue<String, String> codeHash(String value) => _i1.ColumnValue(
    table.codeHash,
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

  _i1.ColumnValue<DateTime, DateTime> usedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.usedAt,
        value,
      );

  _i1.ColumnValue<int, int> attemptsUsed(int value) => _i1.ColumnValue(
    table.attemptsUsed,
    value,
  );

  _i1.ColumnValue<int, int> maxAttempts(int value) => _i1.ColumnValue(
    table.maxAttempts,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> resendAvailableAt(DateTime? value) =>
      _i1.ColumnValue(
        table.resendAvailableAt,
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
}

class VerificationCodeTable extends _i1.Table<_i1.UuidValue?> {
  VerificationCodeTable({super.tableRelation})
    : super(tableName: 'verification_codes') {
    updateTable = VerificationCodeUpdateTable(this);
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    purpose = _i1.ColumnEnum(
      'purpose',
      this,
      _i1.EnumSerialization.byName,
    );
    codeHash = _i1.ColumnString(
      'codeHash',
      this,
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
    usedAt = _i1.ColumnDateTime(
      'usedAt',
      this,
    );
    attemptsUsed = _i1.ColumnInt(
      'attemptsUsed',
      this,
      hasDefault: true,
    );
    maxAttempts = _i1.ColumnInt(
      'maxAttempts',
      this,
      hasDefault: true,
    );
    resendAvailableAt = _i1.ColumnDateTime(
      'resendAvailableAt',
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
  }

  late final VerificationCodeUpdateTable updateTable;

  late final _i1.ColumnUuid userId;

  _i2.UserTable? _user;

  late final _i1.ColumnString email;

  late final _i1.ColumnEnum<_i3.VerificationPurposeType> purpose;

  late final _i1.ColumnString codeHash;

  late final _i1.ColumnDateTime expiresAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnBool isUsed;

  late final _i1.ColumnDateTime usedAt;

  late final _i1.ColumnInt attemptsUsed;

  late final _i1.ColumnInt maxAttempts;

  late final _i1.ColumnDateTime resendAvailableAt;

  late final _i1.ColumnString ipAddress;

  late final _i1.ColumnString userAgent;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: VerificationCode.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    userId,
    email,
    purpose,
    codeHash,
    expiresAt,
    createdAt,
    isUsed,
    usedAt,
    attemptsUsed,
    maxAttempts,
    resendAvailableAt,
    ipAddress,
    userAgent,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class VerificationCodeInclude extends _i1.IncludeObject {
  VerificationCodeInclude._({_i2.UserInclude? user}) {
    _user = user;
  }

  _i2.UserInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<_i1.UuidValue?> get table => VerificationCode.t;
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
  _i1.Table<_i1.UuidValue?> get table => VerificationCode.t;
}

class VerificationCodeRepository {
  const VerificationCodeRepository._();

  final attachRow = const VerificationCodeAttachRowRepository._();

  final detachRow = const VerificationCodeDetachRowRepository._();

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
    VerificationCodeInclude? include,
  }) async {
    return session.db.find<VerificationCode>(
      where: where?.call(VerificationCode.t),
      orderBy: orderBy?.call(VerificationCode.t),
      orderByList: orderByList?.call(VerificationCode.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
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
    VerificationCodeInclude? include,
  }) async {
    return session.db.findFirstRow<VerificationCode>(
      where: where?.call(VerificationCode.t),
      orderBy: orderBy?.call(VerificationCode.t),
      orderByList: orderByList?.call(VerificationCode.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [VerificationCode] by its [id] or null if no such row exists.
  Future<VerificationCode?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    VerificationCodeInclude? include,
  }) async {
    return session.db.findById<VerificationCode>(
      id,
      transaction: transaction,
      include: include,
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
    _i1.UuidValue id, {
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

class VerificationCodeAttachRowRepository {
  const VerificationCodeAttachRowRepository._();

  /// Creates a relation between the given [VerificationCode] and [User]
  /// by setting the [VerificationCode]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    VerificationCode verificationCode,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (verificationCode.id == null) {
      throw ArgumentError.notNull('verificationCode.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $verificationCode = verificationCode.copyWith(userId: user.id);
    await session.db.updateRow<VerificationCode>(
      $verificationCode,
      columns: [VerificationCode.t.userId],
      transaction: transaction,
    );
  }
}

class VerificationCodeDetachRowRepository {
  const VerificationCodeDetachRowRepository._();

  /// Detaches the relation between this [VerificationCode] and the [User] set in `user`
  /// by setting the [VerificationCode]'s foreign key `userId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> user(
    _i1.Session session,
    VerificationCode verificationCode, {
    _i1.Transaction? transaction,
  }) async {
    if (verificationCode.id == null) {
      throw ArgumentError.notNull('verificationCode.id');
    }

    var $verificationCode = verificationCode.copyWith(userId: null);
    await session.db.updateRow<VerificationCode>(
      $verificationCode,
      columns: [VerificationCode.t.userId],
      transaction: transaction,
    );
  }
}
