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

/// Ответ с предложенным следующим номером сборки
abstract class NextBuildNumberResponse implements _i1.SerializableModel {
  NextBuildNumberResponse._({
    required this.nextBuildNumber,
    required this.currentMaxBuildNumber,
  });

  factory NextBuildNumberResponse({
    required int nextBuildNumber,
    required int currentMaxBuildNumber,
  }) = _NextBuildNumberResponseImpl;

  factory NextBuildNumberResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NextBuildNumberResponse(
      nextBuildNumber: jsonSerialization['nextBuildNumber'] as int,
      currentMaxBuildNumber: jsonSerialization['currentMaxBuildNumber'] as int,
    );
  }

  /// Следующий рекомендуемый номер сборки
  int nextBuildNumber;

  /// Текущий максимальный номер сборки (0 если версий нет)
  int currentMaxBuildNumber;

  /// Returns a shallow copy of this [NextBuildNumberResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NextBuildNumberResponse copyWith({
    int? nextBuildNumber,
    int? currentMaxBuildNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NextBuildNumberResponse',
      'nextBuildNumber': nextBuildNumber,
      'currentMaxBuildNumber': currentMaxBuildNumber,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _NextBuildNumberResponseImpl extends NextBuildNumberResponse {
  _NextBuildNumberResponseImpl({
    required int nextBuildNumber,
    required int currentMaxBuildNumber,
  }) : super._(
         nextBuildNumber: nextBuildNumber,
         currentMaxBuildNumber: currentMaxBuildNumber,
       );

  /// Returns a shallow copy of this [NextBuildNumberResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NextBuildNumberResponse copyWith({
    int? nextBuildNumber,
    int? currentMaxBuildNumber,
  }) {
    return NextBuildNumberResponse(
      nextBuildNumber: nextBuildNumber ?? this.nextBuildNumber,
      currentMaxBuildNumber:
          currentMaxBuildNumber ?? this.currentMaxBuildNumber,
    );
  }
}
