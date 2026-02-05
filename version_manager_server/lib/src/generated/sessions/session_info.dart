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

/// Информация об активной сессии
abstract class SessionInfo
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SessionInfo._({
    required this.id,
    this.deviceInfo,
    this.ipAddress,
    this.userAgent,
    required this.createdAt,
    this.lastActivityAt,
    required this.isCurrent,
    this.city,
    this.country,
  });

  factory SessionInfo({
    required _i1.UuidValue id,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    required DateTime createdAt,
    DateTime? lastActivityAt,
    required bool isCurrent,
    String? city,
    String? country,
  }) = _SessionInfoImpl;

  factory SessionInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return SessionInfo(
      id: _i1.UuidValueJsonExtension.fromJson(jsonSerialization['id']),
      deviceInfo: jsonSerialization['deviceInfo'] as String?,
      ipAddress: jsonSerialization['ipAddress'] as String?,
      userAgent: jsonSerialization['userAgent'] as String?,
      createdAt: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      lastActivityAt: jsonSerialization['lastActivityAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastActivityAt'],
            ),
      isCurrent: jsonSerialization['isCurrent'] as bool,
      city: jsonSerialization['city'] as String?,
      country: jsonSerialization['country'] as String?,
    );
  }

  _i1.UuidValue id;

  String? deviceInfo;

  String? ipAddress;

  String? userAgent;

  DateTime createdAt;

  DateTime? lastActivityAt;

  bool isCurrent;

  String? city;

  String? country;

  /// Returns a shallow copy of this [SessionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SessionInfo copyWith({
    _i1.UuidValue? id,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    DateTime? createdAt,
    DateTime? lastActivityAt,
    bool? isCurrent,
    String? city,
    String? country,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'SessionInfo',
      'id': id.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'createdAt': createdAt.toJson(),
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'isCurrent': isCurrent,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'SessionInfo',
      'id': id.toJson(),
      if (deviceInfo != null) 'deviceInfo': deviceInfo,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (userAgent != null) 'userAgent': userAgent,
      'createdAt': createdAt.toJson(),
      if (lastActivityAt != null) 'lastActivityAt': lastActivityAt?.toJson(),
      'isCurrent': isCurrent,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SessionInfoImpl extends SessionInfo {
  _SessionInfoImpl({
    required _i1.UuidValue id,
    String? deviceInfo,
    String? ipAddress,
    String? userAgent,
    required DateTime createdAt,
    DateTime? lastActivityAt,
    required bool isCurrent,
    String? city,
    String? country,
  }) : super._(
         id: id,
         deviceInfo: deviceInfo,
         ipAddress: ipAddress,
         userAgent: userAgent,
         createdAt: createdAt,
         lastActivityAt: lastActivityAt,
         isCurrent: isCurrent,
         city: city,
         country: country,
       );

  /// Returns a shallow copy of this [SessionInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SessionInfo copyWith({
    _i1.UuidValue? id,
    Object? deviceInfo = _Undefined,
    Object? ipAddress = _Undefined,
    Object? userAgent = _Undefined,
    DateTime? createdAt,
    Object? lastActivityAt = _Undefined,
    bool? isCurrent,
    Object? city = _Undefined,
    Object? country = _Undefined,
  }) {
    return SessionInfo(
      id: id ?? this.id,
      deviceInfo: deviceInfo is String? ? deviceInfo : this.deviceInfo,
      ipAddress: ipAddress is String? ? ipAddress : this.ipAddress,
      userAgent: userAgent is String? ? userAgent : this.userAgent,
      createdAt: createdAt ?? this.createdAt,
      lastActivityAt: lastActivityAt is DateTime?
          ? lastActivityAt
          : this.lastActivityAt,
      isCurrent: isCurrent ?? this.isCurrent,
      city: city is String? ? city : this.city,
      country: country is String? ? country : this.country,
    );
  }
}
