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

abstract class TokenPairResponse implements _i1.SerializableModel {
  TokenPairResponse._({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenPairResponse({
    required String accessToken,
    required String refreshToken,
  }) = _TokenPairResponseImpl;

  factory TokenPairResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return TokenPairResponse(
      accessToken: jsonSerialization['accessToken'] as String,
      refreshToken: jsonSerialization['refreshToken'] as String,
    );
  }

  String accessToken;

  String refreshToken;

  /// Returns a shallow copy of this [TokenPairResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TokenPairResponse copyWith({
    String? accessToken,
    String? refreshToken,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TokenPairResponse',
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _TokenPairResponseImpl extends TokenPairResponse {
  _TokenPairResponseImpl({
    required String accessToken,
    required String refreshToken,
  }) : super._(
         accessToken: accessToken,
         refreshToken: refreshToken,
       );

  /// Returns a shallow copy of this [TokenPairResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TokenPairResponse copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return TokenPairResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
