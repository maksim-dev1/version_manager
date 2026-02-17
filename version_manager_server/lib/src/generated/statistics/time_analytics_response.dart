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
import '../statistics/heatmap_entry.dart' as _i2;
import 'package:version_manager_server/src/generated/protocol.dart' as _i3;

/// Временная аналитика.
abstract class TimeAnalyticsResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  TimeAnalyticsResponse._({required this.heatmap});

  factory TimeAnalyticsResponse({required List<_i2.HeatmapEntry> heatmap}) =
      _TimeAnalyticsResponseImpl;

  factory TimeAnalyticsResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return TimeAnalyticsResponse(
      heatmap: _i3.Protocol().deserialize<List<_i2.HeatmapEntry>>(
        jsonSerialization['heatmap'],
      ),
    );
  }

  /// Тепловая карта активности (день недели × час)
  List<_i2.HeatmapEntry> heatmap;

  /// Returns a shallow copy of this [TimeAnalyticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TimeAnalyticsResponse copyWith({List<_i2.HeatmapEntry>? heatmap});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TimeAnalyticsResponse',
      'heatmap': heatmap.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TimeAnalyticsResponse',
      'heatmap': heatmap.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TimeAnalyticsResponseImpl extends TimeAnalyticsResponse {
  _TimeAnalyticsResponseImpl({required List<_i2.HeatmapEntry> heatmap})
    : super._(heatmap: heatmap);

  /// Returns a shallow copy of this [TimeAnalyticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TimeAnalyticsResponse copyWith({List<_i2.HeatmapEntry>? heatmap}) {
    return TimeAnalyticsResponse(
      heatmap: heatmap ?? this.heatmap.map((e0) => e0.copyWith()).toList(),
    );
  }
}
