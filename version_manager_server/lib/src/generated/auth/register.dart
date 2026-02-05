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

abstract class RegisterRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  RegisterRequest._({
    required this.email,
    required this.password,
    this.deviceInfo,
    this.userAgent,
    this.ipAddress,
  });

  factory RegisterRequest({
    required String email,
    required String password,
    String? deviceInfo,
    String? userAgent,
    String? ipAddress,
  }) = _RegisterRequestImpl;

  factory RegisterRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return RegisterRequest(
      email: jsonSerialization['email'] as String,
      password: jsonSerialization['password'] as String,
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
    );
  }

  String email;

  String password;

  String? deviceInfo;

  String? userAgent;

  String? ipAddress;

  /// Returns a shallow copy of this [RegisterRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  RegisterRequest copyWith({
    String? email,
    String? password,
    String? deviceInfo,
    String? userAgent,
    String? ipAddress,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'RegisterRequest',
      'email': email,
      'password': password,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (userAgent != null) 'userAgent': userAgent,
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'RegisterRequest',
      'email': email,
      'password': password,
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (userAgent != null) 'userAgent': userAgent,
      if (ipAddress != null) 'ipAddress': ipAddress,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RegisterRequestImpl extends RegisterRequest {
  _RegisterRequestImpl({
    required String email,
    required String password,
    String? deviceInfo,
    String? userAgent,
    String? ipAddress,
  }) : super._(
         email: email,
         password: password,
         deviceInfo: deviceInfo,
         userAgent: userAgent,
         ipAddress: ipAddress,
       );

  /// Returns a shallow copy of this [RegisterRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  RegisterRequest copyWith({
    String? email,
    String? password,
    Object? deviceInfo = _Undefined,
    Object? userAgent = _Undefined,
    Object? ipAddress = _Undefined,
  }) {
    return RegisterRequest(
      email: email ?? this.email,
      password: password ?? this.password,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
    );
  }
}
