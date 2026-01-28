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
import 'enums/team_member_status_type.dart' as _i2;
import 'team.dart' as _i3;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _i4;
import 'enums/team_role_type.dart' as _i5;
import 'package:version_manager_server/src/generated/protocol.dart' as _i6;

/// Участник команды с определенной ролью и статусом
abstract class TeamMember
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  TeamMember._({
    this.id,
    required this.teamId,
    this.team,
    required this.userId,
    this.user,
    required this.role,
    _i2.TeamMemberStatusType? status,
    this.invitedById,
    this.invitedBy,
    DateTime? invitedAt,
    this.joinedAt,
    this.invitationExpiresAt,
  }) : status = status ?? _i2.TeamMemberStatusType.invited,
       invitedAt = invitedAt ?? DateTime.now();

  factory TeamMember({
    _i1.UuidValue? id,
    required _i1.UuidValue teamId,
    _i3.Team? team,
    required _i1.UuidValue userId,
    _i4.AuthUser? user,
    required _i5.TeamRoleType role,
    _i2.TeamMemberStatusType? status,
    _i1.UuidValue? invitedById,
    _i4.AuthUser? invitedBy,
    DateTime? invitedAt,
    DateTime? joinedAt,
    DateTime? invitationExpiresAt,
  }) = _TeamMemberImpl;

  factory TeamMember.fromJson(Map<String, dynamic> jsonSerialization) {
    return TeamMember(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      teamId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['teamId']),
      team: jsonSerialization['team'] == null
          ? null
          : _i6.Protocol().deserialize<_i3.Team>(jsonSerialization['team']),
      userId: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['userId']),
      user: jsonSerialization['user'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.AuthUser>(jsonSerialization['user']),
      role: _i5.TeamRoleType.fromJson((jsonSerialization['role'] as String)),
      status: jsonSerialization['status'] == null
          ? null
          : _i2.TeamMemberStatusType.fromJson(
              (jsonSerialization['status'] as String),
            ),
      invitedById: jsonSerialization['invitedById'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(
              jsonSerialization['invitedById'],
            ),
      invitedBy: jsonSerialization['invitedBy'] == null
          ? null
          : _i6.Protocol().deserialize<_i4.AuthUser>(
              jsonSerialization['invitedBy'],
            ),
      invitedAt: jsonSerialization['invitedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['invitedAt']),
      joinedAt: jsonSerialization['joinedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['joinedAt']),
      invitationExpiresAt: jsonSerialization['invitationExpiresAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['invitationExpiresAt'],
            ),
    );
  }

  static final t = TeamMemberTable();

  static const db = TeamMemberRepository._();

  @override
  _i1.UuidValue? id;

  _i1.UuidValue teamId;

  /// Команда
  _i3.Team? team;

  _i1.UuidValue userId;

  /// Пользователь (связь с AuthUser из auth модуля)
  _i4.AuthUser? user;

  /// Роль участника в команде (owner, admin, developer, observer)
  _i5.TeamRoleType role;

  /// Статус участника (invited, active)
  _i2.TeamMemberStatusType status;

  _i1.UuidValue? invitedById;

  /// Пользователь, который пригласил (NULL для owner)
  _i4.AuthUser? invitedBy;

  /// Дата приглашения
  DateTime invitedAt;

  /// Дата принятия приглашения (NULL если status=invited)
  DateTime? joinedAt;

  /// Дата истечения приглашения (NULL если status=active)
  DateTime? invitationExpiresAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [TeamMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TeamMember copyWith({
    _i1.UuidValue? id,
    _i1.UuidValue? teamId,
    _i3.Team? team,
    _i1.UuidValue? userId,
    _i4.AuthUser? user,
    _i5.TeamRoleType? role,
    _i2.TeamMemberStatusType? status,
    _i1.UuidValue? invitedById,
    _i4.AuthUser? invitedBy,
    DateTime? invitedAt,
    DateTime? joinedAt,
    DateTime? invitationExpiresAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TeamMember',
      if (id != null) 'id': id?.toJson(),
      'teamId': teamId.toJson(),
      if (team != null) 'team': team?.toJson(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJson(),
      'role': role.toJson(),
      'status': status.toJson(),
      if (invitedById != null) 'invitedById': invitedById?.toJson(),
      if (invitedBy != null) 'invitedBy': invitedBy?.toJson(),
      'invitedAt': invitedAt.toJson(),
      if (joinedAt != null) 'joinedAt': joinedAt?.toJson(),
      if (invitationExpiresAt != null)
        'invitationExpiresAt': invitationExpiresAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TeamMember',
      if (id != null) 'id': id?.toJson(),
      'teamId': teamId.toJson(),
      if (team != null) 'team': team?.toJsonForProtocol(),
      'userId': userId.toJson(),
      if (user != null) 'user': user?.toJsonForProtocol(),
      'role': role.toJson(),
      'status': status.toJson(),
      if (invitedById != null) 'invitedById': invitedById?.toJson(),
      if (invitedBy != null) 'invitedBy': invitedBy?.toJsonForProtocol(),
      'invitedAt': invitedAt.toJson(),
      if (joinedAt != null) 'joinedAt': joinedAt?.toJson(),
      if (invitationExpiresAt != null)
        'invitationExpiresAt': invitationExpiresAt?.toJson(),
    };
  }

  static TeamMemberInclude include({
    _i3.TeamInclude? team,
    _i4.AuthUserInclude? user,
    _i4.AuthUserInclude? invitedBy,
  }) {
    return TeamMemberInclude._(
      team: team,
      user: user,
      invitedBy: invitedBy,
    );
  }

  static TeamMemberIncludeList includeList({
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    TeamMemberInclude? include,
  }) {
    return TeamMemberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeamMember.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TeamMember.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamMemberImpl extends TeamMember {
  _TeamMemberImpl({
    _i1.UuidValue? id,
    required _i1.UuidValue teamId,
    _i3.Team? team,
    required _i1.UuidValue userId,
    _i4.AuthUser? user,
    required _i5.TeamRoleType role,
    _i2.TeamMemberStatusType? status,
    _i1.UuidValue? invitedById,
    _i4.AuthUser? invitedBy,
    DateTime? invitedAt,
    DateTime? joinedAt,
    DateTime? invitationExpiresAt,
  }) : super._(
         id: id,
         teamId: teamId,
         team: team,
         userId: userId,
         user: user,
         role: role,
         status: status,
         invitedById: invitedById,
         invitedBy: invitedBy,
         invitedAt: invitedAt,
         joinedAt: joinedAt,
         invitationExpiresAt: invitationExpiresAt,
       );

  /// Returns a shallow copy of this [TeamMember]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TeamMember copyWith({
    Object? id = _Undefined,
    _i1.UuidValue? teamId,
    Object? team = _Undefined,
    _i1.UuidValue? userId,
    Object? user = _Undefined,
    _i5.TeamRoleType? role,
    _i2.TeamMemberStatusType? status,
    Object? invitedById = _Undefined,
    Object? invitedBy = _Undefined,
    DateTime? invitedAt,
    Object? joinedAt = _Undefined,
    Object? invitationExpiresAt = _Undefined,
  }) {
    return TeamMember(
      id: id is _i1.UuidValue? ? id : this.id,
      teamId: teamId ?? this.teamId,
      team: team is _i3.Team? ? team : this.team?.copyWith(),
      userId: userId ?? this.userId,
      user: user is _i4.AuthUser? ? user : this.user?.copyWith(),
      role: role ?? this.role,
      status: status ?? this.status,
      invitedById: invitedById is _i1.UuidValue?
          ? invitedById
          : this.invitedById,
      invitedBy: invitedBy is _i4.AuthUser?
          ? invitedBy
          : this.invitedBy?.copyWith(),
      invitedAt: invitedAt ?? this.invitedAt,
      joinedAt: joinedAt is DateTime? ? joinedAt : this.joinedAt,
      invitationExpiresAt: invitationExpiresAt is DateTime?
          ? invitationExpiresAt
          : this.invitationExpiresAt,
    );
  }
}

class TeamMemberUpdateTable extends _i1.UpdateTable<TeamMemberTable> {
  TeamMemberUpdateTable(super.table);

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> teamId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.teamId,
        value,
      );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> userId(_i1.UuidValue value) =>
      _i1.ColumnValue(
        table.userId,
        value,
      );

  _i1.ColumnValue<_i5.TeamRoleType, _i5.TeamRoleType> role(
    _i5.TeamRoleType value,
  ) => _i1.ColumnValue(
    table.role,
    value,
  );

  _i1.ColumnValue<_i2.TeamMemberStatusType, _i2.TeamMemberStatusType> status(
    _i2.TeamMemberStatusType value,
  ) => _i1.ColumnValue(
    table.status,
    value,
  );

  _i1.ColumnValue<_i1.UuidValue, _i1.UuidValue> invitedById(
    _i1.UuidValue? value,
  ) => _i1.ColumnValue(
    table.invitedById,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> invitedAt(DateTime value) =>
      _i1.ColumnValue(
        table.invitedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> joinedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.joinedAt,
        value,
      );

  _i1.ColumnValue<DateTime, DateTime> invitationExpiresAt(DateTime? value) =>
      _i1.ColumnValue(
        table.invitationExpiresAt,
        value,
      );
}

class TeamMemberTable extends _i1.Table<_i1.UuidValue?> {
  TeamMemberTable({super.tableRelation}) : super(tableName: 'team_members') {
    updateTable = TeamMemberUpdateTable(this);
    teamId = _i1.ColumnUuid(
      'teamId',
      this,
    );
    userId = _i1.ColumnUuid(
      'userId',
      this,
    );
    role = _i1.ColumnEnum(
      'role',
      this,
      _i1.EnumSerialization.byName,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    invitedById = _i1.ColumnUuid(
      'invitedById',
      this,
    );
    invitedAt = _i1.ColumnDateTime(
      'invitedAt',
      this,
      hasDefault: true,
    );
    joinedAt = _i1.ColumnDateTime(
      'joinedAt',
      this,
    );
    invitationExpiresAt = _i1.ColumnDateTime(
      'invitationExpiresAt',
      this,
    );
  }

  late final TeamMemberUpdateTable updateTable;

  late final _i1.ColumnUuid teamId;

  /// Команда
  _i3.TeamTable? _team;

  late final _i1.ColumnUuid userId;

  /// Пользователь (связь с AuthUser из auth модуля)
  _i4.AuthUserTable? _user;

  /// Роль участника в команде (owner, admin, developer, observer)
  late final _i1.ColumnEnum<_i5.TeamRoleType> role;

  /// Статус участника (invited, active)
  late final _i1.ColumnEnum<_i2.TeamMemberStatusType> status;

  late final _i1.ColumnUuid invitedById;

  /// Пользователь, который пригласил (NULL для owner)
  _i4.AuthUserTable? _invitedBy;

  /// Дата приглашения
  late final _i1.ColumnDateTime invitedAt;

  /// Дата принятия приглашения (NULL если status=invited)
  late final _i1.ColumnDateTime joinedAt;

  /// Дата истечения приглашения (NULL если status=active)
  late final _i1.ColumnDateTime invitationExpiresAt;

  _i3.TeamTable get team {
    if (_team != null) return _team!;
    _team = _i1.createRelationTable(
      relationFieldName: 'team',
      field: TeamMember.t.teamId,
      foreignField: _i3.Team.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TeamTable(tableRelation: foreignTableRelation),
    );
    return _team!;
  }

  _i4.AuthUserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: TeamMember.t.userId,
      foreignField: _i4.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i4.AuthUserTable get invitedBy {
    if (_invitedBy != null) return _invitedBy!;
    _invitedBy = _i1.createRelationTable(
      relationFieldName: 'invitedBy',
      field: TeamMember.t.invitedById,
      foreignField: _i4.AuthUser.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.AuthUserTable(tableRelation: foreignTableRelation),
    );
    return _invitedBy!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    teamId,
    userId,
    role,
    status,
    invitedById,
    invitedAt,
    joinedAt,
    invitationExpiresAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'team') {
      return team;
    }
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'invitedBy') {
      return invitedBy;
    }
    return null;
  }
}

class TeamMemberInclude extends _i1.IncludeObject {
  TeamMemberInclude._({
    _i3.TeamInclude? team,
    _i4.AuthUserInclude? user,
    _i4.AuthUserInclude? invitedBy,
  }) {
    _team = team;
    _user = user;
    _invitedBy = invitedBy;
  }

  _i3.TeamInclude? _team;

  _i4.AuthUserInclude? _user;

  _i4.AuthUserInclude? _invitedBy;

  @override
  Map<String, _i1.Include?> get includes => {
    'team': _team,
    'user': _user,
    'invitedBy': _invitedBy,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => TeamMember.t;
}

class TeamMemberIncludeList extends _i1.IncludeList {
  TeamMemberIncludeList._({
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TeamMember.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => TeamMember.t;
}

class TeamMemberRepository {
  const TeamMemberRepository._();

  final attachRow = const TeamMemberAttachRowRepository._();

  final detachRow = const TeamMemberDetachRowRepository._();

  /// Returns a list of [TeamMember]s matching the given query parameters.
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
  Future<List<TeamMember>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    _i1.Transaction? transaction,
    TeamMemberInclude? include,
  }) async {
    return session.db.find<TeamMember>(
      where: where?.call(TeamMember.t),
      orderBy: orderBy?.call(TeamMember.t),
      orderByList: orderByList?.call(TeamMember.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [TeamMember] matching the given query parameters.
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
  Future<TeamMember?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    _i1.Transaction? transaction,
    TeamMemberInclude? include,
  }) async {
    return session.db.findFirstRow<TeamMember>(
      where: where?.call(TeamMember.t),
      orderBy: orderBy?.call(TeamMember.t),
      orderByList: orderByList?.call(TeamMember.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [TeamMember] by its [id] or null if no such row exists.
  Future<TeamMember?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    TeamMemberInclude? include,
  }) async {
    return session.db.findById<TeamMember>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [TeamMember]s in the list and returns the inserted rows.
  ///
  /// The returned [TeamMember]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TeamMember>> insert(
    _i1.Session session,
    List<TeamMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TeamMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TeamMember] and returns the inserted row.
  ///
  /// The returned [TeamMember] will have its `id` field set.
  Future<TeamMember> insertRow(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TeamMember>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TeamMember]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TeamMember>> update(
    _i1.Session session,
    List<TeamMember> rows, {
    _i1.ColumnSelections<TeamMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TeamMember>(
      rows,
      columns: columns?.call(TeamMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TeamMember]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TeamMember> updateRow(
    _i1.Session session,
    TeamMember row, {
    _i1.ColumnSelections<TeamMemberTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TeamMember>(
      row,
      columns: columns?.call(TeamMember.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TeamMember] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TeamMember?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<TeamMemberUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TeamMember>(
      id,
      columnValues: columnValues(TeamMember.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TeamMember]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TeamMember>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TeamMemberUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TeamMemberTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamMemberTable>? orderBy,
    _i1.OrderByListBuilder<TeamMemberTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TeamMember>(
      columnValues: columnValues(TeamMember.t.updateTable),
      where: where(TeamMember.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TeamMember.t),
      orderByList: orderByList?.call(TeamMember.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TeamMember]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TeamMember>> delete(
    _i1.Session session,
    List<TeamMember> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TeamMember>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TeamMember].
  Future<TeamMember> deleteRow(
    _i1.Session session,
    TeamMember row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TeamMember>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TeamMember>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeamMemberTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TeamMember>(
      where: where(TeamMember.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamMemberTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TeamMember>(
      where: where?.call(TeamMember.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TeamMemberAttachRowRepository {
  const TeamMemberAttachRowRepository._();

  /// Creates a relation between the given [TeamMember] and [Team]
  /// by setting the [TeamMember]'s foreign key `teamId` to refer to the [Team].
  Future<void> team(
    _i1.Session session,
    TeamMember teamMember,
    _i3.Team team, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }

    var $teamMember = teamMember.copyWith(teamId: team.id);
    await session.db.updateRow<TeamMember>(
      $teamMember,
      columns: [TeamMember.t.teamId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TeamMember] and [AuthUser]
  /// by setting the [TeamMember]'s foreign key `userId` to refer to the [AuthUser].
  Future<void> user(
    _i1.Session session,
    TeamMember teamMember,
    _i4.AuthUser user, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $teamMember = teamMember.copyWith(userId: user.id);
    await session.db.updateRow<TeamMember>(
      $teamMember,
      columns: [TeamMember.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [TeamMember] and [AuthUser]
  /// by setting the [TeamMember]'s foreign key `invitedById` to refer to the [AuthUser].
  Future<void> invitedBy(
    _i1.Session session,
    TeamMember teamMember,
    _i4.AuthUser invitedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (invitedBy.id == null) {
      throw ArgumentError.notNull('invitedBy.id');
    }

    var $teamMember = teamMember.copyWith(invitedById: invitedBy.id);
    await session.db.updateRow<TeamMember>(
      $teamMember,
      columns: [TeamMember.t.invitedById],
      transaction: transaction,
    );
  }
}

class TeamMemberDetachRowRepository {
  const TeamMemberDetachRowRepository._();

  /// Detaches the relation between this [TeamMember] and the [AuthUser] set in `invitedBy`
  /// by setting the [TeamMember]'s foreign key `invitedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> invitedBy(
    _i1.Session session,
    TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember.copyWith(invitedById: null);
    await session.db.updateRow<TeamMember>(
      $teamMember,
      columns: [TeamMember.t.invitedById],
      transaction: transaction,
    );
  }
}
