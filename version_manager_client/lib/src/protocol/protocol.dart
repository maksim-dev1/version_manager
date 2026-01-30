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
import 'application.dart' as _i2;
import 'enums/owner_type.dart' as _i3;
import 'enums/platform_type.dart' as _i4;
import 'enums/response_status_type.dart' as _i5;
import 'enums/team_member_status_type.dart' as _i6;
import 'enums/team_role_type.dart' as _i7;
import 'exceptions/invalid_data_exception.dart' as _i8;
import 'greetings/greeting.dart' as _i9;
import 'store_link.dart' as _i10;
import 'team.dart' as _i11;
import 'team_member.dart' as _i12;
import 'version.dart' as _i13;
import 'version_check_log.dart' as _i14;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _i15;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _i16;
export 'application.dart';
export 'enums/owner_type.dart';
export 'enums/platform_type.dart';
export 'enums/response_status_type.dart';
export 'enums/team_member_status_type.dart';
export 'enums/team_role_type.dart';
export 'exceptions/invalid_data_exception.dart';
export 'greetings/greeting.dart';
export 'store_link.dart';
export 'team.dart';
export 'team_member.dart';
export 'version.dart';
export 'version_check_log.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on FormatException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _i2.Application) {
      return _i2.Application.fromJson(data) as T;
    }
    if (t == _i3.OwnerType) {
      return _i3.OwnerType.fromJson(data) as T;
    }
    if (t == _i4.PlatformType) {
      return _i4.PlatformType.fromJson(data) as T;
    }
    if (t == _i5.ResponseStatusType) {
      return _i5.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i6.TeamMemberStatusType) {
      return _i6.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i7.TeamRoleType) {
      return _i7.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i8.InvalidDataException) {
      return _i8.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i9.Greeting) {
      return _i9.Greeting.fromJson(data) as T;
    }
    if (t == _i10.StoreLink) {
      return _i10.StoreLink.fromJson(data) as T;
    }
    if (t == _i11.Team) {
      return _i11.Team.fromJson(data) as T;
    }
    if (t == _i12.TeamMember) {
      return _i12.TeamMember.fromJson(data) as T;
    }
    if (t == _i13.Version) {
      return _i13.Version.fromJson(data) as T;
    }
    if (t == _i14.VersionCheckLog) {
      return _i14.VersionCheckLog.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Application?>()) {
      return (data != null ? _i2.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.OwnerType?>()) {
      return (data != null ? _i3.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.PlatformType?>()) {
      return (data != null ? _i4.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ResponseStatusType?>()) {
      return (data != null ? _i5.ResponseStatusType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.TeamMemberStatusType?>()) {
      return (data != null ? _i6.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.TeamRoleType?>()) {
      return (data != null ? _i7.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.InvalidDataException?>()) {
      return (data != null ? _i8.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.Greeting?>()) {
      return (data != null ? _i9.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.StoreLink?>()) {
      return (data != null ? _i10.StoreLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Team?>()) {
      return (data != null ? _i11.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.TeamMember?>()) {
      return (data != null ? _i12.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Version?>()) {
      return (data != null ? _i13.Version.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.VersionCheckLog?>()) {
      return (data != null ? _i14.VersionCheckLog.fromJson(data) : null) as T;
    }
    if (t == List<_i4.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i4.PlatformType>(e))
              .toList()
          as T;
    }
    if (t == List<_i10.StoreLink>) {
      return (data as List).map((e) => deserialize<_i10.StoreLink>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i10.StoreLink>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i10.StoreLink>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i13.Version>) {
      return (data as List).map((e) => deserialize<_i13.Version>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i13.Version>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i13.Version>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i14.VersionCheckLog>) {
      return (data as List)
              .map((e) => deserialize<_i14.VersionCheckLog>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i14.VersionCheckLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i14.VersionCheckLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i12.TeamMember>) {
      return (data as List).map((e) => deserialize<_i12.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i12.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i12.TeamMember>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i2.Application>) {
      return (data as List).map((e) => deserialize<_i2.Application>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i2.Application>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i2.Application>(e))
                    .toList()
              : null)
          as T;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i16.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Application => 'Application',
      _i3.OwnerType => 'OwnerType',
      _i4.PlatformType => 'PlatformType',
      _i5.ResponseStatusType => 'ResponseStatusType',
      _i6.TeamMemberStatusType => 'TeamMemberStatusType',
      _i7.TeamRoleType => 'TeamRoleType',
      _i8.InvalidDataException => 'InvalidDataException',
      _i9.Greeting => 'Greeting',
      _i10.StoreLink => 'StoreLink',
      _i11.Team => 'Team',
      _i12.TeamMember => 'TeamMember',
      _i13.Version => 'Version',
      _i14.VersionCheckLog => 'VersionCheckLog',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst(
        'version_manager.',
        '',
      );
    }

    switch (data) {
      case _i2.Application():
        return 'Application';
      case _i3.OwnerType():
        return 'OwnerType';
      case _i4.PlatformType():
        return 'PlatformType';
      case _i5.ResponseStatusType():
        return 'ResponseStatusType';
      case _i6.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i7.TeamRoleType():
        return 'TeamRoleType';
      case _i8.InvalidDataException():
        return 'InvalidDataException';
      case _i9.Greeting():
        return 'Greeting';
      case _i10.StoreLink():
        return 'StoreLink';
      case _i11.Team():
        return 'Team';
      case _i12.TeamMember():
        return 'TeamMember';
      case _i13.Version():
        return 'Version';
      case _i14.VersionCheckLog():
        return 'VersionCheckLog';
    }
    className = _i15.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_idp.$className';
    }
    className = _i16.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Application') {
      return deserialize<_i2.Application>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i3.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i4.PlatformType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i5.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i6.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i7.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i8.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i9.Greeting>(data['data']);
    }
    if (dataClassName == 'StoreLink') {
      return deserialize<_i10.StoreLink>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i11.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i12.TeamMember>(data['data']);
    }
    if (dataClassName == 'Version') {
      return deserialize<_i13.Version>(data['data']);
    }
    if (dataClassName == 'VersionCheckLog') {
      return deserialize<_i14.VersionCheckLog>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _i15.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _i16.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _i15.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _i16.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
