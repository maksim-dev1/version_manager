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

/// Точка графика кумулятивного роста.
abstract class CumulativeUsersEntry
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  CumulativeUsersEntry._({
    required this.date,
    required this.totalChecks,
    required this.totalUniqueUsers,
  });

  factory CumulativeUsersEntry({
    required DateTime date,
    required int totalChecks,
    required int totalUniqueUsers,
  }) = _CumulativeUsersEntryImpl;

  factory CumulativeUsersEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CumulativeUsersEntry(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      totalChecks: jsonSerialization['totalChecks'] as int,
      totalUniqueUsers: jsonSerialization['totalUniqueUsers'] as int,
    );
  }

  /// Дата
  DateTime date;

  /// Накопленное общее количество проверок к этой дате
  int totalChecks;

  /// Накопленное количество уникальных пользователей к этой дате
  int totalUniqueUsers;

  /// Returns a shallow copy of this [CumulativeUsersEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CumulativeUsersEntry copyWith({
    DateTime? date,
    int? totalChecks,
    int? totalUniqueUsers,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CumulativeUsersEntry',
      'date': date.toJson(),
      'totalChecks': totalChecks,
      'totalUniqueUsers': totalUniqueUsers,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CumulativeUsersEntry',
      'date': date.toJson(),
      'totalChecks': totalChecks,
      'totalUniqueUsers': totalUniqueUsers,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _CumulativeUsersEntryImpl extends CumulativeUsersEntry {
  _CumulativeUsersEntryImpl({
    required DateTime date,
    required int totalChecks,
    required int totalUniqueUsers,
  }) : super._(
         date: date,
         totalChecks: totalChecks,
         totalUniqueUsers: totalUniqueUsers,
       );

  /// Returns a shallow copy of this [CumulativeUsersEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CumulativeUsersEntry copyWith({
    DateTime? date,
    int? totalChecks,
    int? totalUniqueUsers,
  }) {
    return CumulativeUsersEntry(
      date: date ?? this.date,
      totalChecks: totalChecks ?? this.totalChecks,
      totalUniqueUsers: totalUniqueUsers ?? this.totalUniqueUsers,
    );
  }
}
