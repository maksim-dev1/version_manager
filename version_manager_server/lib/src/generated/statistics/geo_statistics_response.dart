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
import '../statistics/locale_statistics_entry.dart' as _i2;
import 'package:version_manager_server/src/generated/protocol.dart' as _i3;

/// Статистика по локалям.
/// Страны не собираются (IP не сохраняется, GeoIP не используется).
abstract class GeoStatisticsResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  GeoStatisticsResponse._({required this.locales});

  factory GeoStatisticsResponse({
    required List<_i2.LocaleStatisticsEntry> locales,
  }) = _GeoStatisticsResponseImpl;

  factory GeoStatisticsResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return GeoStatisticsResponse(
      locales: _i3.Protocol().deserialize<List<_i2.LocaleStatisticsEntry>>(
        jsonSerialization['locales'],
      ),
    );
  }

  /// Распределение по локалям
  List<_i2.LocaleStatisticsEntry> locales;

  /// Returns a shallow copy of this [GeoStatisticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  GeoStatisticsResponse copyWith({List<_i2.LocaleStatisticsEntry>? locales});
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'GeoStatisticsResponse',
      'locales': locales.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'GeoStatisticsResponse',
      'locales': locales.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _GeoStatisticsResponseImpl extends GeoStatisticsResponse {
  _GeoStatisticsResponseImpl({required List<_i2.LocaleStatisticsEntry> locales})
    : super._(locales: locales);

  /// Returns a shallow copy of this [GeoStatisticsResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  GeoStatisticsResponse copyWith({List<_i2.LocaleStatisticsEntry>? locales}) {
    return GeoStatisticsResponse(
      locales: locales ?? this.locales.map((e0) => e0.copyWith()).toList(),
    );
  }
}
