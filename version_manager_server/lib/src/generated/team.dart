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
import 'user.dart' as _i2;
import 'team_member.dart' as _i3;
import 'application.dart' as _i4;
import 'package:version_manager_server/src/generated/protocol.dart' as _i5;

/// Команда пользователей для совместного управления приложениями
abstract class Team
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  Team._({
    this.id,
    required this.name,
    this.description,
    required this.ownerId,
    this.owner,
    this.members,
    this.applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory Team({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required int ownerId,
    _i2.User? owner,
    List<_i3.TeamMember>? members,
    List<_i4.Application>? applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TeamImpl;

  factory Team.fromJson(Map<String, dynamic> jsonSerialization) {
    return Team(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      name: jsonSerialization['name'] as String,
      description: jsonSerialization['description'] as String?,
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i5.Protocol().deserialize<_i2.User>(jsonSerialization['owner']),
      members: jsonSerialization['members'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i3.TeamMember>>(
              jsonSerialization['members'],
            ),
      applications: jsonSerialization['applications'] == null
          ? null
          : _i5.Protocol().deserialize<List<_i4.Application>>(
              jsonSerialization['applications'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = TeamTable();

  static const db = TeamRepository._();

  @override
  _i1.UuidValue? id;

  /// Название команды (3-50 символов)
  String name;

  /// Описание команды
  String? description;

  int ownerId;

  /// Владелец команды
  _i2.User? owner;

  /// Участники команды
  List<_i3.TeamMember>? members;

  /// Приложения, принадлежащие команде
  List<_i4.Application>? applications;

  /// Дата создания команды
  DateTime createdAt;

  /// Дата последнего обновления команды
  DateTime updatedAt;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [Team]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Team copyWith({
    _i1.UuidValue? id,
    String? name,
    String? description,
    int? ownerId,
    _i2.User? owner,
    List<_i3.TeamMember>? members,
    List<_i4.Application>? applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Team',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (members != null)
        'members': members?.toJson(valueToJson: (v) => v.toJson()),
      if (applications != null)
        'applications': applications?.toJson(valueToJson: (v) => v.toJson()),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Team',
      if (id != null) 'id': id?.toJson(),
      'name': name,
      if (description != null) 'description': description,
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (members != null)
        'members': members?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (applications != null)
        'applications': applications?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
    };
  }

  static TeamInclude include({
    _i2.UserInclude? owner,
    _i3.TeamMemberIncludeList? members,
    _i4.ApplicationIncludeList? applications,
  }) {
    return TeamInclude._(
      owner: owner,
      members: members,
      applications: applications,
    );
  }

  static TeamIncludeList includeList({
    _i1.WhereExpressionBuilder<TeamTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamTable>? orderByList,
    TeamInclude? include,
  }) {
    return TeamIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Team.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Team.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TeamImpl extends Team {
  _TeamImpl({
    _i1.UuidValue? id,
    required String name,
    String? description,
    required int ownerId,
    _i2.User? owner,
    List<_i3.TeamMember>? members,
    List<_i4.Application>? applications,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         name: name,
         description: description,
         ownerId: ownerId,
         owner: owner,
         members: members,
         applications: applications,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [Team]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Team copyWith({
    Object? id = _Undefined,
    String? name,
    Object? description = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? members = _Undefined,
    Object? applications = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Team(
      id: id is _i1.UuidValue? ? id : this.id,
      name: name ?? this.name,
      description: description is String? ? description : this.description,
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i2.User? ? owner : this.owner?.copyWith(),
      members: members is List<_i3.TeamMember>?
          ? members
          : this.members?.map((e0) => e0.copyWith()).toList(),
      applications: applications is List<_i4.Application>?
          ? applications
          : this.applications?.map((e0) => e0.copyWith()).toList(),
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class TeamUpdateTable extends _i1.UpdateTable<TeamTable> {
  TeamUpdateTable(super.table);

  _i1.ColumnValue<String, String> name(String value) => _i1.ColumnValue(
    table.name,
    value,
  );

  _i1.ColumnValue<String, String> description(String? value) => _i1.ColumnValue(
    table.description,
    value,
  );

  _i1.ColumnValue<int, int> ownerId(int value) => _i1.ColumnValue(
    table.ownerId,
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

class TeamTable extends _i1.Table<_i1.UuidValue?> {
  TeamTable({super.tableRelation}) : super(tableName: 'teams') {
    updateTable = TeamUpdateTable(this);
    name = _i1.ColumnString(
      'name',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
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

  late final TeamUpdateTable updateTable;

  /// Название команды (3-50 символов)
  late final _i1.ColumnString name;

  /// Описание команды
  late final _i1.ColumnString description;

  late final _i1.ColumnInt ownerId;

  /// Владелец команды
  _i2.UserTable? _owner;

  /// Участники команды
  _i3.TeamMemberTable? ___members;

  /// Участники команды
  _i1.ManyRelation<_i3.TeamMemberTable>? _members;

  /// Приложения, принадлежащие команде
  _i4.ApplicationTable? ___applications;

  /// Приложения, принадлежащие команде
  _i1.ManyRelation<_i4.ApplicationTable>? _applications;

  /// Дата создания команды
  late final _i1.ColumnDateTime createdAt;

  /// Дата последнего обновления команды
  late final _i1.ColumnDateTime updatedAt;

  _i2.UserTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: Team.t.ownerId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i3.TeamMemberTable get __members {
    if (___members != null) return ___members!;
    ___members = _i1.createRelationTable(
      relationFieldName: '__members',
      field: Team.t.id,
      foreignField: _i3.TeamMember.t.teamId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TeamMemberTable(tableRelation: foreignTableRelation),
    );
    return ___members!;
  }

  _i4.ApplicationTable get __applications {
    if (___applications != null) return ___applications!;
    ___applications = _i1.createRelationTable(
      relationFieldName: '__applications',
      field: Team.t.id,
      foreignField: _i4.Application.t.ownerTeamId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ApplicationTable(tableRelation: foreignTableRelation),
    );
    return ___applications!;
  }

  _i1.ManyRelation<_i3.TeamMemberTable> get members {
    if (_members != null) return _members!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'members',
      field: Team.t.id,
      foreignField: _i3.TeamMember.t.teamId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TeamMemberTable(tableRelation: foreignTableRelation),
    );
    _members = _i1.ManyRelation<_i3.TeamMemberTable>(
      tableWithRelations: relationTable,
      table: _i3.TeamMemberTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _members!;
  }

  _i1.ManyRelation<_i4.ApplicationTable> get applications {
    if (_applications != null) return _applications!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'applications',
      field: Team.t.id,
      foreignField: _i4.Application.t.ownerTeamId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ApplicationTable(tableRelation: foreignTableRelation),
    );
    _applications = _i1.ManyRelation<_i4.ApplicationTable>(
      tableWithRelations: relationTable,
      table: _i4.ApplicationTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _applications!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    name,
    description,
    ownerId,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'members') {
      return __members;
    }
    if (relationField == 'applications') {
      return __applications;
    }
    return null;
  }
}

class TeamInclude extends _i1.IncludeObject {
  TeamInclude._({
    _i2.UserInclude? owner,
    _i3.TeamMemberIncludeList? members,
    _i4.ApplicationIncludeList? applications,
  }) {
    _owner = owner;
    _members = members;
    _applications = applications;
  }

  _i2.UserInclude? _owner;

  _i3.TeamMemberIncludeList? _members;

  _i4.ApplicationIncludeList? _applications;

  @override
  Map<String, _i1.Include?> get includes => {
    'owner': _owner,
    'members': _members,
    'applications': _applications,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => Team.t;
}

class TeamIncludeList extends _i1.IncludeList {
  TeamIncludeList._({
    _i1.WhereExpressionBuilder<TeamTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Team.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => Team.t;
}

class TeamRepository {
  const TeamRepository._();

  final attach = const TeamAttachRepository._();

  final attachRow = const TeamAttachRowRepository._();

  final detach = const TeamDetachRepository._();

  final detachRow = const TeamDetachRowRepository._();

  /// Returns a list of [Team]s matching the given query parameters.
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
  Future<List<Team>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamTable>? orderByList,
    _i1.Transaction? transaction,
    TeamInclude? include,
  }) async {
    return session.db.find<Team>(
      where: where?.call(Team.t),
      orderBy: orderBy?.call(Team.t),
      orderByList: orderByList?.call(Team.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Team] matching the given query parameters.
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
  Future<Team?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamTable>? where,
    int? offset,
    _i1.OrderByBuilder<TeamTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TeamTable>? orderByList,
    _i1.Transaction? transaction,
    TeamInclude? include,
  }) async {
    return session.db.findFirstRow<Team>(
      where: where?.call(Team.t),
      orderBy: orderBy?.call(Team.t),
      orderByList: orderByList?.call(Team.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Team] by its [id] or null if no such row exists.
  Future<Team?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    TeamInclude? include,
  }) async {
    return session.db.findById<Team>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Team]s in the list and returns the inserted rows.
  ///
  /// The returned [Team]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Team>> insert(
    _i1.Session session,
    List<Team> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Team>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Team] and returns the inserted row.
  ///
  /// The returned [Team] will have its `id` field set.
  Future<Team> insertRow(
    _i1.Session session,
    Team row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Team>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Team]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Team>> update(
    _i1.Session session,
    List<Team> rows, {
    _i1.ColumnSelections<TeamTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Team>(
      rows,
      columns: columns?.call(Team.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Team]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Team> updateRow(
    _i1.Session session,
    Team row, {
    _i1.ColumnSelections<TeamTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Team>(
      row,
      columns: columns?.call(Team.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Team] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Team?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<TeamUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<Team>(
      id,
      columnValues: columnValues(Team.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Team]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<Team>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TeamUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TeamTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TeamTable>? orderBy,
    _i1.OrderByListBuilder<TeamTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<Team>(
      columnValues: columnValues(Team.t.updateTable),
      where: where(Team.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Team.t),
      orderByList: orderByList?.call(Team.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [Team]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Team>> delete(
    _i1.Session session,
    List<Team> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Team>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Team].
  Future<Team> deleteRow(
    _i1.Session session,
    Team row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Team>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Team>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TeamTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Team>(
      where: where(Team.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TeamTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Team>(
      where: where?.call(Team.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TeamAttachRepository {
  const TeamAttachRepository._();

  /// Creates a relation between this [Team] and the given [TeamMember]s
  /// by setting each [TeamMember]'s foreign key `teamId` to refer to this [Team].
  Future<void> members(
    _i1.Session session,
    Team team,
    List<_i3.TeamMember> teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.any((e) => e.id == null)) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }

    var $teamMember = teamMember
        .map((e) => e.copyWith(teamId: team.id))
        .toList();
    await session.db.update<_i3.TeamMember>(
      $teamMember,
      columns: [_i3.TeamMember.t.teamId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Team] and the given [Application]s
  /// by setting each [Application]'s foreign key `ownerTeamId` to refer to this [Team].
  Future<void> applications(
    _i1.Session session,
    Team team,
    List<_i4.Application> application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.any((e) => e.id == null)) {
      throw ArgumentError.notNull('application.id');
    }
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }

    var $application = application
        .map((e) => e.copyWith(ownerTeamId: team.id))
        .toList();
    await session.db.update<_i4.Application>(
      $application,
      columns: [_i4.Application.t.ownerTeamId],
      transaction: transaction,
    );
  }
}

class TeamAttachRowRepository {
  const TeamAttachRowRepository._();

  /// Creates a relation between the given [Team] and [User]
  /// by setting the [Team]'s foreign key `ownerId` to refer to the [User].
  Future<void> owner(
    _i1.Session session,
    Team team,
    _i2.User owner, {
    _i1.Transaction? transaction,
  }) async {
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $team = team.copyWith(ownerId: owner.id);
    await session.db.updateRow<Team>(
      $team,
      columns: [Team.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Team] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `teamId` to refer to this [Team].
  Future<void> members(
    _i1.Session session,
    Team team,
    _i3.TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }

    var $teamMember = teamMember.copyWith(teamId: team.id);
    await session.db.updateRow<_i3.TeamMember>(
      $teamMember,
      columns: [_i3.TeamMember.t.teamId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Team] and the given [Application]
  /// by setting the [Application]'s foreign key `ownerTeamId` to refer to this [Team].
  Future<void> applications(
    _i1.Session session,
    Team team,
    _i4.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }

    var $application = application.copyWith(ownerTeamId: team.id);
    await session.db.updateRow<_i4.Application>(
      $application,
      columns: [_i4.Application.t.ownerTeamId],
      transaction: transaction,
    );
  }
}

class TeamDetachRepository {
  const TeamDetachRepository._();

  /// Detaches the relation between this [Team] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `teamId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> members(
    _i1.Session session,
    List<_i3.TeamMember> teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.any((e) => e.id == null)) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember.map((e) => e.copyWith(teamId: null)).toList();
    await session.db.update<_i3.TeamMember>(
      $teamMember,
      columns: [_i3.TeamMember.t.teamId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Team] and the given [Application]
  /// by setting the [Application]'s foreign key `ownerTeamId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> applications(
    _i1.Session session,
    List<_i4.Application> application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.any((e) => e.id == null)) {
      throw ArgumentError.notNull('application.id');
    }

    var $application = application
        .map((e) => e.copyWith(ownerTeamId: null))
        .toList();
    await session.db.update<_i4.Application>(
      $application,
      columns: [_i4.Application.t.ownerTeamId],
      transaction: transaction,
    );
  }
}

class TeamDetachRowRepository {
  const TeamDetachRowRepository._();

  /// Detaches the relation between this [Team] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `teamId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> members(
    _i1.Session session,
    _i3.TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember.copyWith(teamId: null);
    await session.db.updateRow<_i3.TeamMember>(
      $teamMember,
      columns: [_i3.TeamMember.t.teamId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Team] and the given [Application]
  /// by setting the [Application]'s foreign key `ownerTeamId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> applications(
    _i1.Session session,
    _i4.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $application = application.copyWith(ownerTeamId: null);
    await session.db.updateRow<_i4.Application>(
      $application,
      columns: [_i4.Application.t.ownerTeamId],
      transaction: transaction,
    );
  }
}
