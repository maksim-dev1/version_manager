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
import '../statistics/daily_active_users_entry.dart' as _i2;
import '../statistics/cumulative_users_entry.dart' as _i3;
import 'package:version_manager_client/src/protocol/protocol.dart' as _i4;

/// Ответ с данными активности пользователей по дням.
abstract class DailyActiveUsersResponse implements _i1.SerializableModel {
  DailyActiveUsersResponse._({
    required this.entries,
    required this.cumulativeGrowth,
  });

  factory DailyActiveUsersResponse({
    required List<_i2.DailyActiveUsersEntry> entries,
    required List<_i3.CumulativeUsersEntry> cumulativeGrowth,
  }) = _DailyActiveUsersResponseImpl;

  factory DailyActiveUsersResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DailyActiveUsersResponse(
      entries: _i4.Protocol().deserialize<List<_i2.DailyActiveUsersEntry>>(
        jsonSerialization['entries'],
      ),
      cumulativeGrowth: _i4.Protocol()
          .deserialize<List<_i3.CumulativeUsersEntry>>(
            jsonSerialization['cumulativeGrowth'],
          ),
    );
  }

  /// Данные по дням
  List<_i2.DailyActiveUsersEntry> entries;

  /// Кумулятивный рост общего количества пользователей по дням
  List<_i3.CumulativeUsersEntry> cumulativeGrowth;

  /// Returns a shallow copy of this [DailyActiveUsersResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DailyActiveUsersResponse copyWith({
    List<_i2.DailyActiveUsersEntry>? entries,
    List<_i3.CumulativeUsersEntry>? cumulativeGrowth,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'DailyActiveUsersResponse',
      'entries': entries.toJson(valueToJson: (v) => v.toJson()),
      'cumulativeGrowth': cumulativeGrowth.toJson(
        valueToJson: (v) => v.toJson(),
      ),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DailyActiveUsersResponseImpl extends DailyActiveUsersResponse {
  _DailyActiveUsersResponseImpl({
    required List<_i2.DailyActiveUsersEntry> entries,
    required List<_i3.CumulativeUsersEntry> cumulativeGrowth,
  }) : super._(
         entries: entries,
         cumulativeGrowth: cumulativeGrowth,
       );

  /// Returns a shallow copy of this [DailyActiveUsersResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DailyActiveUsersResponse copyWith({
    List<_i2.DailyActiveUsersEntry>? entries,
    List<_i3.CumulativeUsersEntry>? cumulativeGrowth,
  }) {
    return DailyActiveUsersResponse(
      entries: entries ?? this.entries.map((e0) => e0.copyWith()).toList(),
      cumulativeGrowth:
          cumulativeGrowth ??
          this.cumulativeGrowth.map((e0) => e0.copyWith()).toList(),
    );
  }
}
