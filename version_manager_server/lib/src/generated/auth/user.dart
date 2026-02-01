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
import '../auth/auth_session.dart' as _i2;
import '../auth/verification_code.dart' as _i3;
import '../teams/team.dart' as _i4;
import '../teams/team_member.dart' as _i5;
import '../apps/application.dart' as _i6;
import 'package:version_manager_server/src/generated/protocol.dart' as _i7;

abstract class User
    implements _i1.TableRow<_i1.UuidValue?>, _i1.ProtocolSerialization {
  User._({
    this.id,
    required this.email,
    required this.passwordHash,
    this.firstName,
    this.lastName,
    this.displayName,
    this.avatarUrl,
    this.phone,
    bool? isEmailVerified,
    this.emailVerifiedAt,
    bool? isActive,
    this.lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.sessions,
    this.verificationCodes,
    this.ownedTeams,
    this.teamMemberships,
    this.sentTeamInvites,
    this.ownedApplications,
  }) : isEmailVerified = isEmailVerified ?? false,
       isActive = isActive ?? true,
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  factory User({
    _i1.UuidValue? id,
    required String email,
    required String passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    DateTime? emailVerifiedAt,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.AuthSession>? sessions,
    List<_i3.VerificationCode>? verificationCodes,
    List<_i4.Team>? ownedTeams,
    List<_i5.TeamMember>? teamMemberships,
    List<_i5.TeamMember>? sentTeamInvites,
    List<_i6.Application>? ownedApplications,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] == null
          ? null
          : _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      email: jsonSerialization['email'] as String,
      passwordHash: jsonSerialization['passwordHash'] as String,
      firstName: jsonSerialization['firstName'] as String?,
      lastName: jsonSerialization['lastName'] as String?,
      displayName: jsonSerialization['displayName'] as String?,
      avatarUrl: jsonSerialization['avatarUrl'] as String?,
      phone: jsonSerialization['phone'] as String?,
      isEmailVerified: jsonSerialization['isEmailVerified'] as bool?,
      emailVerifiedAt: jsonSerialization['emailVerifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['emailVerifiedAt'],
            ),
      isActive: jsonSerialization['isActive'] as bool?,
      lastLoginAt: jsonSerialization['lastLoginAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastLoginAt'],
            ),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      sessions: jsonSerialization['sessions'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i2.AuthSession>>(
              jsonSerialization['sessions'],
            ),
      verificationCodes: jsonSerialization['verificationCodes'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i3.VerificationCode>>(
              jsonSerialization['verificationCodes'],
            ),
      ownedTeams: jsonSerialization['ownedTeams'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i4.Team>>(
              jsonSerialization['ownedTeams'],
            ),
      teamMemberships: jsonSerialization['teamMemberships'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i5.TeamMember>>(
              jsonSerialization['teamMemberships'],
            ),
      sentTeamInvites: jsonSerialization['sentTeamInvites'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i5.TeamMember>>(
              jsonSerialization['sentTeamInvites'],
            ),
      ownedApplications: jsonSerialization['ownedApplications'] == null
          ? null
          : _i7.Protocol().deserialize<List<_i6.Application>>(
              jsonSerialization['ownedApplications'],
            ),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  _i1.UuidValue? id;

  String email;

  String passwordHash;

  String? firstName;

  String? lastName;

  String? displayName;

  String? avatarUrl;

  String? phone;

  bool isEmailVerified;

  DateTime? emailVerifiedAt;

  bool isActive;

  DateTime? lastLoginAt;

  DateTime createdAt;

  DateTime updatedAt;

  List<_i2.AuthSession>? sessions;

  List<_i3.VerificationCode>? verificationCodes;

  List<_i4.Team>? ownedTeams;

  List<_i5.TeamMember>? teamMemberships;

  List<_i5.TeamMember>? sentTeamInvites;

  List<_i6.Application>? ownedApplications;

  @override
  _i1.Table<_i1.UuidValue?> get table => t;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    _i1.UuidValue? id,
    String? email,
    String? passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    DateTime? emailVerifiedAt,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.AuthSession>? sessions,
    List<_i3.VerificationCode>? verificationCodes,
    List<_i4.Team>? ownedTeams,
    List<_i5.TeamMember>? teamMemberships,
    List<_i5.TeamMember>? sentTeamInvites,
    List<_i6.Application>? ownedApplications,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id?.toJson(),
      'email': email,
      'passwordHash': passwordHash,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (phone != null) 'phone': phone,
      'isEmailVerified': isEmailVerified,
      if (emailVerifiedAt != null) 'emailVerifiedAt': emailVerifiedAt?.toJson(),
      'isActive': isActive,
      if (lastLoginAt != null) 'lastLoginAt': lastLoginAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (sessions != null)
        'sessions': sessions?.toJson(valueToJson: (v) => v.toJson()),
      if (verificationCodes != null)
        'verificationCodes': verificationCodes?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (ownedTeams != null)
        'ownedTeams': ownedTeams?.toJson(valueToJson: (v) => v.toJson()),
      if (teamMemberships != null)
        'teamMemberships': teamMemberships?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (sentTeamInvites != null)
        'sentTeamInvites': sentTeamInvites?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
      if (ownedApplications != null)
        'ownedApplications': ownedApplications?.toJson(
          valueToJson: (v) => v.toJson(),
        ),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'User',
      if (id != null) 'id': id?.toJson(),
      'email': email,
      'passwordHash': passwordHash,
      if (firstName != null) 'firstName': firstName,
      if (lastName != null) 'lastName': lastName,
      if (displayName != null) 'displayName': displayName,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
      if (phone != null) 'phone': phone,
      'isEmailVerified': isEmailVerified,
      if (emailVerifiedAt != null) 'emailVerifiedAt': emailVerifiedAt?.toJson(),
      'isActive': isActive,
      if (lastLoginAt != null) 'lastLoginAt': lastLoginAt?.toJson(),
      'createdAt': createdAt.toJson(),
      'updatedAt': updatedAt.toJson(),
      if (sessions != null)
        'sessions': sessions?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (verificationCodes != null)
        'verificationCodes': verificationCodes?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (ownedTeams != null)
        'ownedTeams': ownedTeams?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (teamMemberships != null)
        'teamMemberships': teamMemberships?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (sentTeamInvites != null)
        'sentTeamInvites': sentTeamInvites?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
      if (ownedApplications != null)
        'ownedApplications': ownedApplications?.toJson(
          valueToJson: (v) => v.toJsonForProtocol(),
        ),
    };
  }

  static UserInclude include({
    _i2.AuthSessionIncludeList? sessions,
    _i3.VerificationCodeIncludeList? verificationCodes,
    _i4.TeamIncludeList? ownedTeams,
    _i5.TeamMemberIncludeList? teamMemberships,
    _i5.TeamMemberIncludeList? sentTeamInvites,
    _i6.ApplicationIncludeList? ownedApplications,
  }) {
    return UserInclude._(
      sessions: sessions,
      verificationCodes: verificationCodes,
      ownedTeams: ownedTeams,
      teamMemberships: teamMemberships,
      sentTeamInvites: sentTeamInvites,
      ownedApplications: ownedApplications,
    );
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    _i1.UuidValue? id,
    required String email,
    required String passwordHash,
    String? firstName,
    String? lastName,
    String? displayName,
    String? avatarUrl,
    String? phone,
    bool? isEmailVerified,
    DateTime? emailVerifiedAt,
    bool? isActive,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<_i2.AuthSession>? sessions,
    List<_i3.VerificationCode>? verificationCodes,
    List<_i4.Team>? ownedTeams,
    List<_i5.TeamMember>? teamMemberships,
    List<_i5.TeamMember>? sentTeamInvites,
    List<_i6.Application>? ownedApplications,
  }) : super._(
         id: id,
         email: email,
         passwordHash: passwordHash,
         firstName: firstName,
         lastName: lastName,
         displayName: displayName,
         avatarUrl: avatarUrl,
         phone: phone,
         isEmailVerified: isEmailVerified,
         emailVerifiedAt: emailVerifiedAt,
         isActive: isActive,
         lastLoginAt: lastLoginAt,
         createdAt: createdAt,
         updatedAt: updatedAt,
         sessions: sessions,
         verificationCodes: verificationCodes,
         ownedTeams: ownedTeams,
         teamMemberships: teamMemberships,
         sentTeamInvites: sentTeamInvites,
         ownedApplications: ownedApplications,
       );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    String? email,
    String? passwordHash,
    Object? firstName = _Undefined,
    Object? lastName = _Undefined,
    Object? displayName = _Undefined,
    Object? avatarUrl = _Undefined,
    Object? phone = _Undefined,
    bool? isEmailVerified,
    Object? emailVerifiedAt = _Undefined,
    bool? isActive,
    Object? lastLoginAt = _Undefined,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? sessions = _Undefined,
    Object? verificationCodes = _Undefined,
    Object? ownedTeams = _Undefined,
    Object? teamMemberships = _Undefined,
    Object? sentTeamInvites = _Undefined,
    Object? ownedApplications = _Undefined,
  }) {
    return User(
      id: id is _i1.UuidValue? ? id : this.id,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      firstName: firstName is String? ? firstName : this.firstName,
      lastName: lastName is String? ? lastName : this.lastName,
      displayName: displayName is String? ? displayName : this.displayName,
      avatarUrl: avatarUrl is String? ? avatarUrl : this.avatarUrl,
      phone: phone is String? ? phone : this.phone,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      emailVerifiedAt: emailVerifiedAt is DateTime?
          ? emailVerifiedAt
          : this.emailVerifiedAt,
      isActive: isActive ?? this.isActive,
      lastLoginAt: lastLoginAt is DateTime? ? lastLoginAt : this.lastLoginAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sessions: sessions is List<_i2.AuthSession>?
          ? sessions
          : this.sessions?.map((e0) => e0.copyWith()).toList(),
      verificationCodes: verificationCodes is List<_i3.VerificationCode>?
          ? verificationCodes
          : this.verificationCodes?.map((e0) => e0.copyWith()).toList(),
      ownedTeams: ownedTeams is List<_i4.Team>?
          ? ownedTeams
          : this.ownedTeams?.map((e0) => e0.copyWith()).toList(),
      teamMemberships: teamMemberships is List<_i5.TeamMember>?
          ? teamMemberships
          : this.teamMemberships?.map((e0) => e0.copyWith()).toList(),
      sentTeamInvites: sentTeamInvites is List<_i5.TeamMember>?
          ? sentTeamInvites
          : this.sentTeamInvites?.map((e0) => e0.copyWith()).toList(),
      ownedApplications: ownedApplications is List<_i6.Application>?
          ? ownedApplications
          : this.ownedApplications?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class UserUpdateTable extends _i1.UpdateTable<UserTable> {
  UserUpdateTable(super.table);

  _i1.ColumnValue<String, String> email(String value) => _i1.ColumnValue(
    table.email,
    value,
  );

  _i1.ColumnValue<String, String> passwordHash(String value) => _i1.ColumnValue(
    table.passwordHash,
    value,
  );

  _i1.ColumnValue<String, String> firstName(String? value) => _i1.ColumnValue(
    table.firstName,
    value,
  );

  _i1.ColumnValue<String, String> lastName(String? value) => _i1.ColumnValue(
    table.lastName,
    value,
  );

  _i1.ColumnValue<String, String> displayName(String? value) => _i1.ColumnValue(
    table.displayName,
    value,
  );

  _i1.ColumnValue<String, String> avatarUrl(String? value) => _i1.ColumnValue(
    table.avatarUrl,
    value,
  );

  _i1.ColumnValue<String, String> phone(String? value) => _i1.ColumnValue(
    table.phone,
    value,
  );

  _i1.ColumnValue<bool, bool> isEmailVerified(bool value) => _i1.ColumnValue(
    table.isEmailVerified,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> emailVerifiedAt(DateTime? value) =>
      _i1.ColumnValue(
        table.emailVerifiedAt,
        value,
      );

  _i1.ColumnValue<bool, bool> isActive(bool value) => _i1.ColumnValue(
    table.isActive,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> lastLoginAt(DateTime? value) =>
      _i1.ColumnValue(
        table.lastLoginAt,
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

class UserTable extends _i1.Table<_i1.UuidValue?> {
  UserTable({super.tableRelation}) : super(tableName: 'users') {
    updateTable = UserUpdateTable(this);
    email = _i1.ColumnString(
      'email',
      this,
    );
    passwordHash = _i1.ColumnString(
      'passwordHash',
      this,
    );
    firstName = _i1.ColumnString(
      'firstName',
      this,
    );
    lastName = _i1.ColumnString(
      'lastName',
      this,
    );
    displayName = _i1.ColumnString(
      'displayName',
      this,
    );
    avatarUrl = _i1.ColumnString(
      'avatarUrl',
      this,
    );
    phone = _i1.ColumnString(
      'phone',
      this,
    );
    isEmailVerified = _i1.ColumnBool(
      'isEmailVerified',
      this,
      hasDefault: true,
    );
    emailVerifiedAt = _i1.ColumnDateTime(
      'emailVerifiedAt',
      this,
    );
    isActive = _i1.ColumnBool(
      'isActive',
      this,
      hasDefault: true,
    );
    lastLoginAt = _i1.ColumnDateTime(
      'lastLoginAt',
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

  late final UserUpdateTable updateTable;

  late final _i1.ColumnString email;

  late final _i1.ColumnString passwordHash;

  late final _i1.ColumnString firstName;

  late final _i1.ColumnString lastName;

  late final _i1.ColumnString displayName;

  late final _i1.ColumnString avatarUrl;

  late final _i1.ColumnString phone;

  late final _i1.ColumnBool isEmailVerified;

  late final _i1.ColumnDateTime emailVerifiedAt;

  late final _i1.ColumnBool isActive;

  late final _i1.ColumnDateTime lastLoginAt;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.AuthSessionTable? ___sessions;

  _i1.ManyRelation<_i2.AuthSessionTable>? _sessions;

  _i3.VerificationCodeTable? ___verificationCodes;

  _i1.ManyRelation<_i3.VerificationCodeTable>? _verificationCodes;

  _i4.TeamTable? ___ownedTeams;

  _i1.ManyRelation<_i4.TeamTable>? _ownedTeams;

  _i5.TeamMemberTable? ___teamMemberships;

  _i1.ManyRelation<_i5.TeamMemberTable>? _teamMemberships;

  _i5.TeamMemberTable? ___sentTeamInvites;

  _i1.ManyRelation<_i5.TeamMemberTable>? _sentTeamInvites;

  _i6.ApplicationTable? ___ownedApplications;

  _i1.ManyRelation<_i6.ApplicationTable>? _ownedApplications;

  _i2.AuthSessionTable get __sessions {
    if (___sessions != null) return ___sessions!;
    ___sessions = _i1.createRelationTable(
      relationFieldName: '__sessions',
      field: User.t.id,
      foreignField: _i2.AuthSession.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthSessionTable(tableRelation: foreignTableRelation),
    );
    return ___sessions!;
  }

  _i3.VerificationCodeTable get __verificationCodes {
    if (___verificationCodes != null) return ___verificationCodes!;
    ___verificationCodes = _i1.createRelationTable(
      relationFieldName: '__verificationCodes',
      field: User.t.id,
      foreignField: _i3.VerificationCode.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VerificationCodeTable(tableRelation: foreignTableRelation),
    );
    return ___verificationCodes!;
  }

  _i4.TeamTable get __ownedTeams {
    if (___ownedTeams != null) return ___ownedTeams!;
    ___ownedTeams = _i1.createRelationTable(
      relationFieldName: '__ownedTeams',
      field: User.t.id,
      foreignField: _i4.Team.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.TeamTable(tableRelation: foreignTableRelation),
    );
    return ___ownedTeams!;
  }

  _i5.TeamMemberTable get __teamMemberships {
    if (___teamMemberships != null) return ___teamMemberships!;
    ___teamMemberships = _i1.createRelationTable(
      relationFieldName: '__teamMemberships',
      field: User.t.id,
      foreignField: _i5.TeamMember.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TeamMemberTable(tableRelation: foreignTableRelation),
    );
    return ___teamMemberships!;
  }

  _i5.TeamMemberTable get __sentTeamInvites {
    if (___sentTeamInvites != null) return ___sentTeamInvites!;
    ___sentTeamInvites = _i1.createRelationTable(
      relationFieldName: '__sentTeamInvites',
      field: User.t.id,
      foreignField: _i5.TeamMember.t.invitedById,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TeamMemberTable(tableRelation: foreignTableRelation),
    );
    return ___sentTeamInvites!;
  }

  _i6.ApplicationTable get __ownedApplications {
    if (___ownedApplications != null) return ___ownedApplications!;
    ___ownedApplications = _i1.createRelationTable(
      relationFieldName: '__ownedApplications',
      field: User.t.id,
      foreignField: _i6.Application.t.ownerUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.ApplicationTable(tableRelation: foreignTableRelation),
    );
    return ___ownedApplications!;
  }

  _i1.ManyRelation<_i2.AuthSessionTable> get sessions {
    if (_sessions != null) return _sessions!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'sessions',
      field: User.t.id,
      foreignField: _i2.AuthSession.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AuthSessionTable(tableRelation: foreignTableRelation),
    );
    _sessions = _i1.ManyRelation<_i2.AuthSessionTable>(
      tableWithRelations: relationTable,
      table: _i2.AuthSessionTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _sessions!;
  }

  _i1.ManyRelation<_i3.VerificationCodeTable> get verificationCodes {
    if (_verificationCodes != null) return _verificationCodes!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'verificationCodes',
      field: User.t.id,
      foreignField: _i3.VerificationCode.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.VerificationCodeTable(tableRelation: foreignTableRelation),
    );
    _verificationCodes = _i1.ManyRelation<_i3.VerificationCodeTable>(
      tableWithRelations: relationTable,
      table: _i3.VerificationCodeTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _verificationCodes!;
  }

  _i1.ManyRelation<_i4.TeamTable> get ownedTeams {
    if (_ownedTeams != null) return _ownedTeams!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'ownedTeams',
      field: User.t.id,
      foreignField: _i4.Team.t.ownerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.TeamTable(tableRelation: foreignTableRelation),
    );
    _ownedTeams = _i1.ManyRelation<_i4.TeamTable>(
      tableWithRelations: relationTable,
      table: _i4.TeamTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _ownedTeams!;
  }

  _i1.ManyRelation<_i5.TeamMemberTable> get teamMemberships {
    if (_teamMemberships != null) return _teamMemberships!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'teamMemberships',
      field: User.t.id,
      foreignField: _i5.TeamMember.t.userId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TeamMemberTable(tableRelation: foreignTableRelation),
    );
    _teamMemberships = _i1.ManyRelation<_i5.TeamMemberTable>(
      tableWithRelations: relationTable,
      table: _i5.TeamMemberTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _teamMemberships!;
  }

  _i1.ManyRelation<_i5.TeamMemberTable> get sentTeamInvites {
    if (_sentTeamInvites != null) return _sentTeamInvites!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'sentTeamInvites',
      field: User.t.id,
      foreignField: _i5.TeamMember.t.invitedById,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.TeamMemberTable(tableRelation: foreignTableRelation),
    );
    _sentTeamInvites = _i1.ManyRelation<_i5.TeamMemberTable>(
      tableWithRelations: relationTable,
      table: _i5.TeamMemberTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _sentTeamInvites!;
  }

  _i1.ManyRelation<_i6.ApplicationTable> get ownedApplications {
    if (_ownedApplications != null) return _ownedApplications!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'ownedApplications',
      field: User.t.id,
      foreignField: _i6.Application.t.ownerUserId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.ApplicationTable(tableRelation: foreignTableRelation),
    );
    _ownedApplications = _i1.ManyRelation<_i6.ApplicationTable>(
      tableWithRelations: relationTable,
      table: _i6.ApplicationTable(
        tableRelation: relationTable.tableRelation!.lastRelation,
      ),
    );
    return _ownedApplications!;
  }

  @override
  List<_i1.Column> get columns => [
    id,
    email,
    passwordHash,
    firstName,
    lastName,
    displayName,
    avatarUrl,
    phone,
    isEmailVerified,
    emailVerifiedAt,
    isActive,
    lastLoginAt,
    createdAt,
    updatedAt,
  ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'sessions') {
      return __sessions;
    }
    if (relationField == 'verificationCodes') {
      return __verificationCodes;
    }
    if (relationField == 'ownedTeams') {
      return __ownedTeams;
    }
    if (relationField == 'teamMemberships') {
      return __teamMemberships;
    }
    if (relationField == 'sentTeamInvites') {
      return __sentTeamInvites;
    }
    if (relationField == 'ownedApplications') {
      return __ownedApplications;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({
    _i2.AuthSessionIncludeList? sessions,
    _i3.VerificationCodeIncludeList? verificationCodes,
    _i4.TeamIncludeList? ownedTeams,
    _i5.TeamMemberIncludeList? teamMemberships,
    _i5.TeamMemberIncludeList? sentTeamInvites,
    _i6.ApplicationIncludeList? ownedApplications,
  }) {
    _sessions = sessions;
    _verificationCodes = verificationCodes;
    _ownedTeams = ownedTeams;
    _teamMemberships = teamMemberships;
    _sentTeamInvites = sentTeamInvites;
    _ownedApplications = ownedApplications;
  }

  _i2.AuthSessionIncludeList? _sessions;

  _i3.VerificationCodeIncludeList? _verificationCodes;

  _i4.TeamIncludeList? _ownedTeams;

  _i5.TeamMemberIncludeList? _teamMemberships;

  _i5.TeamMemberIncludeList? _sentTeamInvites;

  _i6.ApplicationIncludeList? _ownedApplications;

  @override
  Map<String, _i1.Include?> get includes => {
    'sessions': _sessions,
    'verificationCodes': _verificationCodes,
    'ownedTeams': _ownedTeams,
    'teamMemberships': _teamMemberships,
    'sentTeamInvites': _sentTeamInvites,
    'ownedApplications': _ownedApplications,
  };

  @override
  _i1.Table<_i1.UuidValue?> get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<_i1.UuidValue?> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attach = const UserAttachRepository._();

  final attachRow = const UserAttachRowRepository._();

  final detach = const UserDetachRepository._();

  final detachRow = const UserDetachRowRepository._();

  /// Returns a list of [User]s matching the given query parameters.
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
  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
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
  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i1.Session session,
    _i1.UuidValue id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<User?> updateById(
    _i1.Session session,
    _i1.UuidValue id, {
    required _i1.ColumnValueListBuilder<UserUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<User>(
      id,
      columnValues: columnValues(User.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [User]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<User>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<UserUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<UserTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<User>(
      columnValues: columnValues(User.t.updateTable),
      where: where(User.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRepository {
  const UserAttachRepository._();

  /// Creates a relation between this [User] and the given [AuthSession]s
  /// by setting each [AuthSession]'s foreign key `userId` to refer to this [User].
  Future<void> sessions(
    _i1.Session session,
    User user,
    List<_i2.AuthSession> authSession, {
    _i1.Transaction? transaction,
  }) async {
    if (authSession.any((e) => e.id == null)) {
      throw ArgumentError.notNull('authSession.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $authSession = authSession
        .map((e) => e.copyWith(userId: user.id))
        .toList();
    await session.db.update<_i2.AuthSession>(
      $authSession,
      columns: [_i2.AuthSession.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [VerificationCode]s
  /// by setting each [VerificationCode]'s foreign key `userId` to refer to this [User].
  Future<void> verificationCodes(
    _i1.Session session,
    User user,
    List<_i3.VerificationCode> verificationCode, {
    _i1.Transaction? transaction,
  }) async {
    if (verificationCode.any((e) => e.id == null)) {
      throw ArgumentError.notNull('verificationCode.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $verificationCode = verificationCode
        .map((e) => e.copyWith(userId: user.id))
        .toList();
    await session.db.update<_i3.VerificationCode>(
      $verificationCode,
      columns: [_i3.VerificationCode.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Team]s
  /// by setting each [Team]'s foreign key `ownerId` to refer to this [User].
  Future<void> ownedTeams(
    _i1.Session session,
    User user,
    List<_i4.Team> team, {
    _i1.Transaction? transaction,
  }) async {
    if (team.any((e) => e.id == null)) {
      throw ArgumentError.notNull('team.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $team = team.map((e) => e.copyWith(ownerId: user.id)).toList();
    await session.db.update<_i4.Team>(
      $team,
      columns: [_i4.Team.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [TeamMember]s
  /// by setting each [TeamMember]'s foreign key `userId` to refer to this [User].
  Future<void> teamMemberships(
    _i1.Session session,
    User user,
    List<_i5.TeamMember> teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.any((e) => e.id == null)) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $teamMember = teamMember
        .map((e) => e.copyWith(userId: user.id))
        .toList();
    await session.db.update<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [TeamMember]s
  /// by setting each [TeamMember]'s foreign key `invitedById` to refer to this [User].
  Future<void> sentTeamInvites(
    _i1.Session session,
    User user,
    List<_i5.TeamMember> teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.any((e) => e.id == null)) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $teamMember = teamMember
        .map((e) => e.copyWith(invitedById: user.id))
        .toList();
    await session.db.update<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.invitedById],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Application]s
  /// by setting each [Application]'s foreign key `ownerUserId` to refer to this [User].
  Future<void> ownedApplications(
    _i1.Session session,
    User user,
    List<_i6.Application> application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.any((e) => e.id == null)) {
      throw ArgumentError.notNull('application.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $application = application
        .map((e) => e.copyWith(ownerUserId: user.id))
        .toList();
    await session.db.update<_i6.Application>(
      $application,
      columns: [_i6.Application.t.ownerUserId],
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between this [User] and the given [AuthSession]
  /// by setting the [AuthSession]'s foreign key `userId` to refer to this [User].
  Future<void> sessions(
    _i1.Session session,
    User user,
    _i2.AuthSession authSession, {
    _i1.Transaction? transaction,
  }) async {
    if (authSession.id == null) {
      throw ArgumentError.notNull('authSession.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $authSession = authSession.copyWith(userId: user.id);
    await session.db.updateRow<_i2.AuthSession>(
      $authSession,
      columns: [_i2.AuthSession.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [VerificationCode]
  /// by setting the [VerificationCode]'s foreign key `userId` to refer to this [User].
  Future<void> verificationCodes(
    _i1.Session session,
    User user,
    _i3.VerificationCode verificationCode, {
    _i1.Transaction? transaction,
  }) async {
    if (verificationCode.id == null) {
      throw ArgumentError.notNull('verificationCode.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $verificationCode = verificationCode.copyWith(userId: user.id);
    await session.db.updateRow<_i3.VerificationCode>(
      $verificationCode,
      columns: [_i3.VerificationCode.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Team]
  /// by setting the [Team]'s foreign key `ownerId` to refer to this [User].
  Future<void> ownedTeams(
    _i1.Session session,
    User user,
    _i4.Team team, {
    _i1.Transaction? transaction,
  }) async {
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $team = team.copyWith(ownerId: user.id);
    await session.db.updateRow<_i4.Team>(
      $team,
      columns: [_i4.Team.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `userId` to refer to this [User].
  Future<void> teamMemberships(
    _i1.Session session,
    User user,
    _i5.TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $teamMember = teamMember.copyWith(userId: user.id);
    await session.db.updateRow<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `invitedById` to refer to this [User].
  Future<void> sentTeamInvites(
    _i1.Session session,
    User user,
    _i5.TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $teamMember = teamMember.copyWith(invitedById: user.id);
    await session.db.updateRow<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.invitedById],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [User] and the given [Application]
  /// by setting the [Application]'s foreign key `ownerUserId` to refer to this [User].
  Future<void> ownedApplications(
    _i1.Session session,
    User user,
    _i6.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $application = application.copyWith(ownerUserId: user.id);
    await session.db.updateRow<_i6.Application>(
      $application,
      columns: [_i6.Application.t.ownerUserId],
      transaction: transaction,
    );
  }
}

class UserDetachRepository {
  const UserDetachRepository._();

  /// Detaches the relation between this [User] and the given [VerificationCode]
  /// by setting the [VerificationCode]'s foreign key `userId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> verificationCodes(
    _i1.Session session,
    List<_i3.VerificationCode> verificationCode, {
    _i1.Transaction? transaction,
  }) async {
    if (verificationCode.any((e) => e.id == null)) {
      throw ArgumentError.notNull('verificationCode.id');
    }

    var $verificationCode = verificationCode
        .map((e) => e.copyWith(userId: null))
        .toList();
    await session.db.update<_i3.VerificationCode>(
      $verificationCode,
      columns: [_i3.VerificationCode.t.userId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [Team]
  /// by setting the [Team]'s foreign key `ownerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ownedTeams(
    _i1.Session session,
    List<_i4.Team> team, {
    _i1.Transaction? transaction,
  }) async {
    if (team.any((e) => e.id == null)) {
      throw ArgumentError.notNull('team.id');
    }

    var $team = team.map((e) => e.copyWith(ownerId: null)).toList();
    await session.db.update<_i4.Team>(
      $team,
      columns: [_i4.Team.t.ownerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `userId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> teamMemberships(
    _i1.Session session,
    List<_i5.TeamMember> teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.any((e) => e.id == null)) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember.map((e) => e.copyWith(userId: null)).toList();
    await session.db.update<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.userId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `invitedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> sentTeamInvites(
    _i1.Session session,
    List<_i5.TeamMember> teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.any((e) => e.id == null)) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember
        .map((e) => e.copyWith(invitedById: null))
        .toList();
    await session.db.update<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.invitedById],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [Application]
  /// by setting the [Application]'s foreign key `ownerUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ownedApplications(
    _i1.Session session,
    List<_i6.Application> application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.any((e) => e.id == null)) {
      throw ArgumentError.notNull('application.id');
    }

    var $application = application
        .map((e) => e.copyWith(ownerUserId: null))
        .toList();
    await session.db.update<_i6.Application>(
      $application,
      columns: [_i6.Application.t.ownerUserId],
      transaction: transaction,
    );
  }
}

class UserDetachRowRepository {
  const UserDetachRowRepository._();

  /// Detaches the relation between this [User] and the given [VerificationCode]
  /// by setting the [VerificationCode]'s foreign key `userId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> verificationCodes(
    _i1.Session session,
    _i3.VerificationCode verificationCode, {
    _i1.Transaction? transaction,
  }) async {
    if (verificationCode.id == null) {
      throw ArgumentError.notNull('verificationCode.id');
    }

    var $verificationCode = verificationCode.copyWith(userId: null);
    await session.db.updateRow<_i3.VerificationCode>(
      $verificationCode,
      columns: [_i3.VerificationCode.t.userId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [Team]
  /// by setting the [Team]'s foreign key `ownerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ownedTeams(
    _i1.Session session,
    _i4.Team team, {
    _i1.Transaction? transaction,
  }) async {
    if (team.id == null) {
      throw ArgumentError.notNull('team.id');
    }

    var $team = team.copyWith(ownerId: null);
    await session.db.updateRow<_i4.Team>(
      $team,
      columns: [_i4.Team.t.ownerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `userId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> teamMemberships(
    _i1.Session session,
    _i5.TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember.copyWith(userId: null);
    await session.db.updateRow<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.userId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [TeamMember]
  /// by setting the [TeamMember]'s foreign key `invitedById` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> sentTeamInvites(
    _i1.Session session,
    _i5.TeamMember teamMember, {
    _i1.Transaction? transaction,
  }) async {
    if (teamMember.id == null) {
      throw ArgumentError.notNull('teamMember.id');
    }

    var $teamMember = teamMember.copyWith(invitedById: null);
    await session.db.updateRow<_i5.TeamMember>(
      $teamMember,
      columns: [_i5.TeamMember.t.invitedById],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [User] and the given [Application]
  /// by setting the [Application]'s foreign key `ownerUserId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> ownedApplications(
    _i1.Session session,
    _i6.Application application, {
    _i1.Transaction? transaction,
  }) async {
    if (application.id == null) {
      throw ArgumentError.notNull('application.id');
    }

    var $application = application.copyWith(ownerUserId: null);
    await session.db.updateRow<_i6.Application>(
      $application,
      columns: [_i6.Application.t.ownerUserId],
      transaction: transaction,
    );
  }
}
