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

/// Статистика по одной версии приложения.
abstract class VersionStatisticsEntry implements _i1.SerializableModel {
  VersionStatisticsEntry._({
    required this.versionId,
    required this.versionNumber,
    required this.buildNumber,
    required this.userCount,
    required this.percentage,
    required this.isBlocked,
    required this.createdAt,
    required this.ageDays,
  });

  factory VersionStatisticsEntry({
    required _i1.UuidValue versionId,
    required String versionNumber,
    required int buildNumber,
    required int userCount,
    required double percentage,
    required bool isBlocked,
    required DateTime createdAt,
    required int ageDays,
  }) = _VersionStatisticsEntryImpl;

  factory VersionStatisticsEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VersionStatisticsEntry(
      versionId: _i1.UuidValueJsonExtension.fromJson(
        jsonSerialization['versionId'],
      ),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      userCount: jsonSerialization['userCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
      isBlocked: jsonSerialization['isBlocked'] as bool,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      ageDays: jsonSerialization['ageDays'] as int,
    );
  }

  /// ID версии
  _i1.UuidValue versionId;

  /// Номер версии
  String versionNumber;

  /// Номер сборки
  int buildNumber;

  /// Количество уникальных пользователей (за период)
  int userCount;

  /// Процент от общего числа пользователей
  double percentage;

  /// Заблокирована ли версия
  bool isBlocked;

  /// Дата создания версии
  DateTime createdAt;

  /// Возраст версии в днях (дней с момента создания)
  int ageDays;

  /// Returns a shallow copy of this [VersionStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionStatisticsEntry copyWith({
    _i1.UuidValue? versionId,
    String? versionNumber,
    int? buildNumber,
    int? userCount,
    double? percentage,
    bool? isBlocked,
    DateTime? createdAt,
    int? ageDays,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionStatisticsEntry',
      'versionId': versionId.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'userCount': userCount,
      'percentage': percentage,
      'isBlocked': isBlocked,
      'createdAt': createdAt.toJson(),
      'ageDays': ageDays,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VersionStatisticsEntryImpl extends VersionStatisticsEntry {
  _VersionStatisticsEntryImpl({
    required _i1.UuidValue versionId,
    required String versionNumber,
    required int buildNumber,
    required int userCount,
    required double percentage,
    required bool isBlocked,
    required DateTime createdAt,
    required int ageDays,
  }) : super._(
         versionId: versionId,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         userCount: userCount,
         percentage: percentage,
         isBlocked: isBlocked,
         createdAt: createdAt,
         ageDays: ageDays,
       );

  /// Returns a shallow copy of this [VersionStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionStatisticsEntry copyWith({
    _i1.UuidValue? versionId,
    String? versionNumber,
    int? buildNumber,
    int? userCount,
    double? percentage,
    bool? isBlocked,
    DateTime? createdAt,
    int? ageDays,
  }) {
    return VersionStatisticsEntry(
      versionId: versionId ?? this.versionId,
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      userCount: userCount ?? this.userCount,
      percentage: percentage ?? this.percentage,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      ageDays: ageDays ?? this.ageDays,
    );
  }
}
