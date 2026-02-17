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

/// Статистика по языку/локали.
abstract class LocaleStatisticsEntry
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LocaleStatisticsEntry._({
    required this.locale,
    required this.checkCount,
    required this.percentage,
  });

  factory LocaleStatisticsEntry({
    required String locale,
    required int checkCount,
    required double percentage,
  }) = _LocaleStatisticsEntryImpl;

  factory LocaleStatisticsEntry.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return LocaleStatisticsEntry(
      locale: jsonSerialization['locale'] as String,
      checkCount: jsonSerialization['checkCount'] as int,
      percentage: (jsonSerialization['percentage'] as num).toDouble(),
    );
  }

  /// Локаль (например: "ru_RU", "en_US")
  String locale;

  /// Количество проверок
  int checkCount;

  /// Процент от общего числа
  double percentage;

  /// Returns a shallow copy of this [LocaleStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LocaleStatisticsEntry copyWith({
    String? locale,
    int? checkCount,
    double? percentage,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'LocaleStatisticsEntry',
      'locale': locale,
      'checkCount': checkCount,
      'percentage': percentage,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'LocaleStatisticsEntry',
      'locale': locale,
      'checkCount': checkCount,
      'percentage': percentage,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LocaleStatisticsEntryImpl extends LocaleStatisticsEntry {
  _LocaleStatisticsEntryImpl({
    required String locale,
    required int checkCount,
    required double percentage,
  }) : super._(
         locale: locale,
         checkCount: checkCount,
         percentage: percentage,
       );

  /// Returns a shallow copy of this [LocaleStatisticsEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LocaleStatisticsEntry copyWith({
    String? locale,
    int? checkCount,
    double? percentage,
  }) {
    return LocaleStatisticsEntry(
      locale: locale ?? this.locale,
      checkCount: checkCount ?? this.checkCount,
      percentage: percentage ?? this.percentage,
    );
  }
}
