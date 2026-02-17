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

/// Данные тепловой карты — активность по часам и дням недели.
abstract class HeatmapEntry
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  HeatmapEntry._({
    required this.dayOfWeek,
    required this.hour,
    required this.count,
  });

  factory HeatmapEntry({
    required int dayOfWeek,
    required int hour,
    required int count,
  }) = _HeatmapEntryImpl;

  factory HeatmapEntry.fromJson(Map<String, dynamic> jsonSerialization) {
    return HeatmapEntry(
      dayOfWeek: jsonSerialization['dayOfWeek'] as int,
      hour: jsonSerialization['hour'] as int,
      count: jsonSerialization['count'] as int,
    );
  }

  /// День недели (1=Пн, 7=Вс)
  int dayOfWeek;

  /// Час дня (0-23)
  int hour;

  /// Количество проверок
  int count;

  /// Returns a shallow copy of this [HeatmapEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  HeatmapEntry copyWith({
    int? dayOfWeek,
    int? hour,
    int? count,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HeatmapEntry',
      'dayOfWeek': dayOfWeek,
      'hour': hour,
      'count': count,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HeatmapEntry',
      'dayOfWeek': dayOfWeek,
      'hour': hour,
      'count': count,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _HeatmapEntryImpl extends HeatmapEntry {
  _HeatmapEntryImpl({
    required int dayOfWeek,
    required int hour,
    required int count,
  }) : super._(
         dayOfWeek: dayOfWeek,
         hour: hour,
         count: count,
       );

  /// Returns a shallow copy of this [HeatmapEntry]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  HeatmapEntry copyWith({
    int? dayOfWeek,
    int? hour,
    int? count,
  }) {
    return HeatmapEntry(
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      hour: hour ?? this.hour,
      count: count ?? this.count,
    );
  }
}
