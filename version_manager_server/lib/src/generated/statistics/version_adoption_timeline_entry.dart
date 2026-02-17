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

/// Точка временной шкалы adoption rate версии.
abstract class VersionAdoptionTimelineEntry
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  VersionAdoptionTimelineEntry._({
    required this.date,
    required this.versionNumber,
    required this.buildNumber,
    required this.checkCount,
    required this.percentage,
  });

  factory VersionAdoptionTimelineEntry({
    required DateTime date,
    required String versionNumber,
    required int buildNumber,
    required int checkCount,
    required double percentage,
  }) = _VersionAdoptionTimelineEntryImpl;

  factory VersionAdoptionTimelineEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return VersionAdoptionTimelineEntry(
      date: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['date']),
      versionNumber: jsonSerialization['versionNumber'] as String,
      buildNumber: jsonSerialization['buildNumber'] as int,
      checkCount: jsonSerialization['checkCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  /// Дата
  DateTime date;

  /// Номер версии
  String versionNumber;

  /// Номер сборки
  int buildNumber;

  /// Количество проверок этой версии в этот день
  int checkCount;

  /// Процент от общего числа проверок в этот день
  double percentage;

  /// Returns a shallow copy of this [VersionAdoptionTimelineEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  VersionAdoptionTimelineEntry copyWith({
    DateTime? date,
    String? versionNumber,
    int? buildNumber,
    int? checkCount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'VersionAdoptionTimelineEntry',
      'date': date.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'checkCount': checkCount,
      'percentage': percentage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'VersionAdoptionTimelineEntry',
      'date': date.toJson(),
      'versionNumber': versionNumber,
      'buildNumber': buildNumber,
      'checkCount': checkCount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _VersionAdoptionTimelineEntryImpl extends VersionAdoptionTimelineEntry {
  _VersionAdoptionTimelineEntryImpl({
    required DateTime date,
    required String versionNumber,
    required int buildNumber,
    required int checkCount,
    required double percentage,
  }) : super._(
         date: date,
         versionNumber: versionNumber,
         buildNumber: buildNumber,
         checkCount: checkCount,
         percentage: percentage,
       );

  /// Returns a shallow copy of this [VersionAdoptionTimelineEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  VersionAdoptionTimelineEntry copyWith({
    DateTime? date,
    String? versionNumber,
    int? buildNumber,
    int? checkCount,
    double? percentage,
  }) {
    return VersionAdoptionTimelineEntry(
      date: date ?? this.date,
      versionNumber: versionNumber ?? this.versionNumber,
      buildNumber: buildNumber ?? this.buildNumber,
      checkCount: checkCount ?? this.checkCount,
      percentage: percentage ?? this.percentage,
    );
  }
}
