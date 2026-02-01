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
import '../auth/common.dart' as _i2;
import 'package:version_manager_server/src/generated/protocol.dart' as _i3;

abstract class AuthResponse
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  AuthResponse._({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory AuthResponse({
    required String accessToken,
    required String refreshToken,
    required _i2.UserPublic user,
  }) = _AuthResponseImpl;

  factory AuthResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthResponse(
      accessToken: jsonSerialization['accessToken'] as String,
      refreshToken: jsonSerialization['refreshToken'] as String,
      user: _i3.Protocol().deserialize<_i2.UserPublic>(
        jsonSerialization['user'],
      ),
    );
  }

  String accessToken;

  String refreshToken;

  _i2.UserPublic user;

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  AuthResponse copyWith({
    String? accessToken,
    String? refreshToken,
    _i2.UserPublic? user,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'AuthResponse',
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'AuthResponse',
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'user': user.toJsonForProtocol(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _AuthResponseImpl extends AuthResponse {
  _AuthResponseImpl({
    required String accessToken,
    required String refreshToken,
    required _i2.UserPublic user,
  }) : super._(
         accessToken: accessToken,
         refreshToken: refreshToken,
         user: user,
       );

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  AuthResponse copyWith({
    String? accessToken,
    String? refreshToken,
    _i2.UserPublic? user,
  }) {
    return AuthResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user.copyWith(),
    );
  }
}
