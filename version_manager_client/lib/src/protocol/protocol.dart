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
import 'apps/application.dart' as _i2;
import 'apps/store_link.dart' as _i3;
import 'apps/version.dart' as _i4;
import 'auth/auth_session.dart' as _i5;
import 'auth/user.dart' as _i6;
import 'auth/verification_code.dart' as _i7;
import 'enums/owner_type.dart' as _i8;
import 'enums/platform_type.dart' as _i9;
import 'enums/response_status_type.dart' as _i10;
import 'enums/team_member_status_type.dart' as _i11;
import 'enums/team_role_type.dart' as _i12;
import 'enums/verification_putpose_type.dart' as _i13;
import 'exceptions/invalid_data_exception.dart' as _i14;
import 'greetings/greeting.dart' as _i15;
import 'logs/version_check_log.dart' as _i16;
import 'teams/team.dart' as _i17;
import 'teams/team_member.dart' as _i18;
export 'apps/application.dart';
export 'apps/store_link.dart';
export 'apps/version.dart';
export 'auth/auth_session.dart';
export 'auth/user.dart';
export 'auth/verification_code.dart';
export 'enums/owner_type.dart';
export 'enums/platform_type.dart';
export 'enums/response_status_type.dart';
export 'enums/team_member_status_type.dart';
export 'enums/team_role_type.dart';
export 'enums/verification_putpose_type.dart';
export 'exceptions/invalid_data_exception.dart';
export 'greetings/greeting.dart';
export 'logs/version_check_log.dart';
export 'teams/team.dart';
export 'teams/team_member.dart';
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
    if (t == _i3.StoreLink) {
      return _i3.StoreLink.fromJson(data) as T;
    }
    if (t == _i4.Version) {
      return _i4.Version.fromJson(data) as T;
    }
    if (t == _i5.AuthSession) {
      return _i5.AuthSession.fromJson(data) as T;
    }
    if (t == _i6.User) {
      return _i6.User.fromJson(data) as T;
    }
    if (t == _i7.VerificationCode) {
      return _i7.VerificationCode.fromJson(data) as T;
    }
    if (t == _i8.OwnerType) {
      return _i8.OwnerType.fromJson(data) as T;
    }
    if (t == _i9.PlatformType) {
      return _i9.PlatformType.fromJson(data) as T;
    }
    if (t == _i10.ResponseStatusType) {
      return _i10.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i11.TeamMemberStatusType) {
      return _i11.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i12.TeamRoleType) {
      return _i12.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i13.VerificationPurposeType) {
      return _i13.VerificationPurposeType.fromJson(data) as T;
    }
    if (t == _i14.InvalidDataException) {
      return _i14.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i15.Greeting) {
      return _i15.Greeting.fromJson(data) as T;
    }
    if (t == _i16.VersionCheckLog) {
      return _i16.VersionCheckLog.fromJson(data) as T;
    }
    if (t == _i17.Team) {
      return _i17.Team.fromJson(data) as T;
    }
    if (t == _i18.TeamMember) {
      return _i18.TeamMember.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Application?>()) {
      return (data != null ? _i2.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.StoreLink?>()) {
      return (data != null ? _i3.StoreLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Version?>()) {
      return (data != null ? _i4.Version.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.AuthSession?>()) {
      return (data != null ? _i5.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.User?>()) {
      return (data != null ? _i6.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.VerificationCode?>()) {
      return (data != null ? _i7.VerificationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.OwnerType?>()) {
      return (data != null ? _i8.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.PlatformType?>()) {
      return (data != null ? _i9.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ResponseStatusType?>()) {
      return (data != null ? _i10.ResponseStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.TeamMemberStatusType?>()) {
      return (data != null ? _i11.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.TeamRoleType?>()) {
      return (data != null ? _i12.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.VerificationPurposeType?>()) {
      return (data != null ? _i13.VerificationPurposeType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.InvalidDataException?>()) {
      return (data != null ? _i14.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.Greeting?>()) {
      return (data != null ? _i15.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.VersionCheckLog?>()) {
      return (data != null ? _i16.VersionCheckLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.Team?>()) {
      return (data != null ? _i17.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.TeamMember?>()) {
      return (data != null ? _i18.TeamMember.fromJson(data) : null) as T;
    }
    if (t == List<_i9.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i9.PlatformType>(e))
              .toList()
          as T;
    }
    if (t == List<_i3.StoreLink>) {
      return (data as List).map((e) => deserialize<_i3.StoreLink>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i3.StoreLink>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i3.StoreLink>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i4.Version>) {
      return (data as List).map((e) => deserialize<_i4.Version>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i4.Version>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i4.Version>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i16.VersionCheckLog>) {
      return (data as List)
              .map((e) => deserialize<_i16.VersionCheckLog>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.VersionCheckLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.VersionCheckLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i5.AuthSession>) {
      return (data as List).map((e) => deserialize<_i5.AuthSession>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i5.AuthSession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i5.AuthSession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i7.VerificationCode>) {
      return (data as List)
              .map((e) => deserialize<_i7.VerificationCode>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i7.VerificationCode>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i7.VerificationCode>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i17.Team>) {
      return (data as List).map((e) => deserialize<_i17.Team>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i17.Team>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i17.Team>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i18.TeamMember>) {
      return (data as List).map((e) => deserialize<_i18.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i18.TeamMember>(e))
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
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Application => 'Application',
      _i3.StoreLink => 'StoreLink',
      _i4.Version => 'Version',
      _i5.AuthSession => 'AuthSession',
      _i6.User => 'User',
      _i7.VerificationCode => 'VerificationCode',
      _i8.OwnerType => 'OwnerType',
      _i9.PlatformType => 'PlatformType',
      _i10.ResponseStatusType => 'ResponseStatusType',
      _i11.TeamMemberStatusType => 'TeamMemberStatusType',
      _i12.TeamRoleType => 'TeamRoleType',
      _i13.VerificationPurposeType => 'VerificationPurposeType',
      _i14.InvalidDataException => 'InvalidDataException',
      _i15.Greeting => 'Greeting',
      _i16.VersionCheckLog => 'VersionCheckLog',
      _i17.Team => 'Team',
      _i18.TeamMember => 'TeamMember',
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
      case _i3.StoreLink():
        return 'StoreLink';
      case _i4.Version():
        return 'Version';
      case _i5.AuthSession():
        return 'AuthSession';
      case _i6.User():
        return 'User';
      case _i7.VerificationCode():
        return 'VerificationCode';
      case _i8.OwnerType():
        return 'OwnerType';
      case _i9.PlatformType():
        return 'PlatformType';
      case _i10.ResponseStatusType():
        return 'ResponseStatusType';
      case _i11.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i12.TeamRoleType():
        return 'TeamRoleType';
      case _i13.VerificationPurposeType():
        return 'VerificationPurposeType';
      case _i14.InvalidDataException():
        return 'InvalidDataException';
      case _i15.Greeting():
        return 'Greeting';
      case _i16.VersionCheckLog():
        return 'VersionCheckLog';
      case _i17.Team():
        return 'Team';
      case _i18.TeamMember():
        return 'TeamMember';
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
    if (dataClassName == 'StoreLink') {
      return deserialize<_i3.StoreLink>(data['data']);
    }
    if (dataClassName == 'Version') {
      return deserialize<_i4.Version>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i5.AuthSession>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i6.User>(data['data']);
    }
    if (dataClassName == 'VerificationCode') {
      return deserialize<_i7.VerificationCode>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i8.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i9.PlatformType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i10.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i11.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i12.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'VerificationPurposeType') {
      return deserialize<_i13.VerificationPurposeType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i14.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i15.Greeting>(data['data']);
    }
    if (dataClassName == 'VersionCheckLog') {
      return deserialize<_i16.VersionCheckLog>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i17.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i18.TeamMember>(data['data']);
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
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
