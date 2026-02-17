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
import 'package:serverpod_client/serverpod_client.dart' as _i1;

/// Данные активности по дням.
abstract class DailyActiveUsersEntry implements _i1.SerializableModel {
  DailyActiveUsersEntry._({
    required this.date,
    required this.totalChecks,
    required this.activeUsers,
    required this.newUsers,
  });

  factory DailyActiveUsersEntry({
    required DateTime date,
    required int totalChecks,
    required int activeUsers,
    required int newUsers,
  }) = _DailyActiveUsersEntryImpl;

  factory DailyActiveUsersEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DailyActiveUsersEntry(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      totalChecks: jsonSerialization['totalChecks'] as int,
      activeUsers: jsonSerialization['activeUsers'] as int,
      newUsers: jsonSerialization['newUsers'] as int,
    );
  }

  /// Дата (YYYY-MM-DD)
  DateTime date;

  /// Общее количество проверок
  int totalChecks;

  /// Уникальных пользователей за день (по fingerprint)
  int activeUsers;

  /// Новых пользователей за день
  int newUsers;

  /// Returns a shallow copy of this [DailyActiveUsersEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyActiveUsersEntry copyWith({
    DateTime? date,
    int? totalChecks,
    int? activeUsers,
    int? newUsers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyActiveUsersEntry',
      'date': date.toJson(),
      'totalChecks': totalChecks,
      'activeUsers': activeUsers,
      'newUsers': newUsers,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DailyActiveUsersEntryImpl extends DailyActiveUsersEntry {
  _DailyActiveUsersEntryImpl({
    required DateTime date,
    required int totalChecks,
    required int activeUsers,
    required int newUsers,
  }) : super._(
         date: date,
         totalChecks: totalChecks,
         activeUsers: activeUsers,
         newUsers: newUsers,
       );

  /// Returns a shallow copy of this [DailyActiveUsersEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyActiveUsersEntry copyWith({
    DateTime? date,
    int? totalChecks,
    int? activeUsers,
    int? newUsers,
  }) {
    return DailyActiveUsersEntry(
      date: date ?? this.date,
      totalChecks: totalChecks ?? this.totalChecks,
      activeUsers: activeUsers ?? this.activeUsers,
      newUsers: newUsers ?? this.newUsers,
    );
  }
}
