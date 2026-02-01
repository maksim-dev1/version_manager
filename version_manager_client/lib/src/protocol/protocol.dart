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
import 'auth/auth_response.dart' as _i5;
import 'auth/auth_session.dart' as _i6;
import 'auth/check_email.dart' as _i7;
import 'auth/check_email_response.dart' as _i8;
import 'auth/common.dart' as _i9;
import 'auth/common_success.dart' as _i10;
import 'auth/login.dart' as _i11;
import 'auth/refresh_token.dart' as _i12;
import 'auth/register_send_code.dart' as _i13;
import 'auth/register_set_password.dart' as _i14;
import 'auth/register_verify_code.dart' as _i15;
import 'auth/send_code_response.dart' as _i16;
import 'auth/token_pair_response.dart' as _i17;
import 'auth/user.dart' as _i18;
import 'auth/verification_code.dart' as _i19;
import 'auth/verify_code_response.dart' as _i20;
import 'enums/owner_type.dart' as _i21;
import 'enums/platform_type.dart' as _i22;
import 'enums/response_status_type.dart' as _i23;
import 'enums/team_member_status_type.dart' as _i24;
import 'enums/team_role_type.dart' as _i25;
import 'enums/verification_putpose_type.dart' as _i26;
import 'exceptions/invalid_data_exception.dart' as _i27;
import 'greetings/greeting.dart' as _i28;
import 'logs/version_check_log.dart' as _i29;
import 'teams/team.dart' as _i30;
import 'teams/team_member.dart' as _i31;
export 'apps/application.dart';
export 'apps/store_link.dart';
export 'apps/version.dart';
export 'auth/auth_response.dart';
export 'auth/auth_session.dart';
export 'auth/check_email.dart';
export 'auth/check_email_response.dart';
export 'auth/common.dart';
export 'auth/common_success.dart';
export 'auth/login.dart';
export 'auth/refresh_token.dart';
export 'auth/register_send_code.dart';
export 'auth/register_set_password.dart';
export 'auth/register_verify_code.dart';
export 'auth/send_code_response.dart';
export 'auth/token_pair_response.dart';
export 'auth/user.dart';
export 'auth/verification_code.dart';
export 'auth/verify_code_response.dart';
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
    if (t == _i5.AuthResponse) {
      return _i5.AuthResponse.fromJson(data) as T;
    }
    if (t == _i6.AuthSession) {
      return _i6.AuthSession.fromJson(data) as T;
    }
    if (t == _i7.CheckEmailRequest) {
      return _i7.CheckEmailRequest.fromJson(data) as T;
    }
    if (t == _i8.CheckEmailResponse) {
      return _i8.CheckEmailResponse.fromJson(data) as T;
    }
    if (t == _i9.UserPublic) {
      return _i9.UserPublic.fromJson(data) as T;
    }
    if (t == _i10.SuccessResponse) {
      return _i10.SuccessResponse.fromJson(data) as T;
    }
    if (t == _i11.LoginRequest) {
      return _i11.LoginRequest.fromJson(data) as T;
    }
    if (t == _i12.RefreshTokenRequest) {
      return _i12.RefreshTokenRequest.fromJson(data) as T;
    }
    if (t == _i13.RegisterSendCodeRequest) {
      return _i13.RegisterSendCodeRequest.fromJson(data) as T;
    }
    if (t == _i14.RegisterSetPasswordRequest) {
      return _i14.RegisterSetPasswordRequest.fromJson(data) as T;
    }
    if (t == _i15.RegisterVerifyCodeRequest) {
      return _i15.RegisterVerifyCodeRequest.fromJson(data) as T;
    }
    if (t == _i16.SendCodeResponse) {
      return _i16.SendCodeResponse.fromJson(data) as T;
    }
    if (t == _i17.TokenPairResponse) {
      return _i17.TokenPairResponse.fromJson(data) as T;
    }
    if (t == _i18.User) {
      return _i18.User.fromJson(data) as T;
    }
    if (t == _i19.VerificationCode) {
      return _i19.VerificationCode.fromJson(data) as T;
    }
    if (t == _i20.VerifyCodeResponse) {
      return _i20.VerifyCodeResponse.fromJson(data) as T;
    }
    if (t == _i21.OwnerType) {
      return _i21.OwnerType.fromJson(data) as T;
    }
    if (t == _i22.PlatformType) {
      return _i22.PlatformType.fromJson(data) as T;
    }
    if (t == _i23.ResponseStatusType) {
      return _i23.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i24.TeamMemberStatusType) {
      return _i24.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i25.TeamRoleType) {
      return _i25.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i26.VerificationPurposeType) {
      return _i26.VerificationPurposeType.fromJson(data) as T;
    }
    if (t == _i27.InvalidDataException) {
      return _i27.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i28.Greeting) {
      return _i28.Greeting.fromJson(data) as T;
    }
    if (t == _i29.VersionCheckLog) {
      return _i29.VersionCheckLog.fromJson(data) as T;
    }
    if (t == _i30.Team) {
      return _i30.Team.fromJson(data) as T;
    }
    if (t == _i31.TeamMember) {
      return _i31.TeamMember.fromJson(data) as T;
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
    if (t == _i1.getType<_i5.AuthResponse?>()) {
      return (data != null ? _i5.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.AuthSession?>()) {
      return (data != null ? _i6.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.CheckEmailRequest?>()) {
      return (data != null ? _i7.CheckEmailRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CheckEmailResponse?>()) {
      return (data != null ? _i8.CheckEmailResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.UserPublic?>()) {
      return (data != null ? _i9.UserPublic.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.SuccessResponse?>()) {
      return (data != null ? _i10.SuccessResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.LoginRequest?>()) {
      return (data != null ? _i11.LoginRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.RefreshTokenRequest?>()) {
      return (data != null ? _i12.RefreshTokenRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.RegisterSendCodeRequest?>()) {
      return (data != null ? _i13.RegisterSendCodeRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.RegisterSetPasswordRequest?>()) {
      return (data != null
              ? _i14.RegisterSetPasswordRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.RegisterVerifyCodeRequest?>()) {
      return (data != null
              ? _i15.RegisterVerifyCodeRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i16.SendCodeResponse?>()) {
      return (data != null ? _i16.SendCodeResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.TokenPairResponse?>()) {
      return (data != null ? _i17.TokenPairResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.User?>()) {
      return (data != null ? _i18.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.VerificationCode?>()) {
      return (data != null ? _i19.VerificationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.VerifyCodeResponse?>()) {
      return (data != null ? _i20.VerifyCodeResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.OwnerType?>()) {
      return (data != null ? _i21.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.PlatformType?>()) {
      return (data != null ? _i22.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ResponseStatusType?>()) {
      return (data != null ? _i23.ResponseStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.TeamMemberStatusType?>()) {
      return (data != null ? _i24.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.TeamRoleType?>()) {
      return (data != null ? _i25.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.VerificationPurposeType?>()) {
      return (data != null ? _i26.VerificationPurposeType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.InvalidDataException?>()) {
      return (data != null ? _i27.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.Greeting?>()) {
      return (data != null ? _i28.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.VersionCheckLog?>()) {
      return (data != null ? _i29.VersionCheckLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.Team?>()) {
      return (data != null ? _i30.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.TeamMember?>()) {
      return (data != null ? _i31.TeamMember.fromJson(data) : null) as T;
    }
    if (t == List<_i22.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i22.PlatformType>(e))
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
    if (t == List<_i29.VersionCheckLog>) {
      return (data as List)
              .map((e) => deserialize<_i29.VersionCheckLog>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i29.VersionCheckLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i29.VersionCheckLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i6.AuthSession>) {
      return (data as List).map((e) => deserialize<_i6.AuthSession>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i6.AuthSession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i6.AuthSession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i19.VerificationCode>) {
      return (data as List)
              .map((e) => deserialize<_i19.VerificationCode>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i19.VerificationCode>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i19.VerificationCode>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i30.Team>) {
      return (data as List).map((e) => deserialize<_i30.Team>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i30.Team>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i30.Team>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i31.TeamMember>) {
      return (data as List).map((e) => deserialize<_i31.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i31.TeamMember>(e))
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
      _i5.AuthResponse => 'AuthResponse',
      _i6.AuthSession => 'AuthSession',
      _i7.CheckEmailRequest => 'CheckEmailRequest',
      _i8.CheckEmailResponse => 'CheckEmailResponse',
      _i9.UserPublic => 'UserPublic',
      _i10.SuccessResponse => 'SuccessResponse',
      _i11.LoginRequest => 'LoginRequest',
      _i12.RefreshTokenRequest => 'RefreshTokenRequest',
      _i13.RegisterSendCodeRequest => 'RegisterSendCodeRequest',
      _i14.RegisterSetPasswordRequest => 'RegisterSetPasswordRequest',
      _i15.RegisterVerifyCodeRequest => 'RegisterVerifyCodeRequest',
      _i16.SendCodeResponse => 'SendCodeResponse',
      _i17.TokenPairResponse => 'TokenPairResponse',
      _i18.User => 'User',
      _i19.VerificationCode => 'VerificationCode',
      _i20.VerifyCodeResponse => 'VerifyCodeResponse',
      _i21.OwnerType => 'OwnerType',
      _i22.PlatformType => 'PlatformType',
      _i23.ResponseStatusType => 'ResponseStatusType',
      _i24.TeamMemberStatusType => 'TeamMemberStatusType',
      _i25.TeamRoleType => 'TeamRoleType',
      _i26.VerificationPurposeType => 'VerificationPurposeType',
      _i27.InvalidDataException => 'InvalidDataException',
      _i28.Greeting => 'Greeting',
      _i29.VersionCheckLog => 'VersionCheckLog',
      _i30.Team => 'Team',
      _i31.TeamMember => 'TeamMember',
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
      case _i5.AuthResponse():
        return 'AuthResponse';
      case _i6.AuthSession():
        return 'AuthSession';
      case _i7.CheckEmailRequest():
        return 'CheckEmailRequest';
      case _i8.CheckEmailResponse():
        return 'CheckEmailResponse';
      case _i9.UserPublic():
        return 'UserPublic';
      case _i10.SuccessResponse():
        return 'SuccessResponse';
      case _i11.LoginRequest():
        return 'LoginRequest';
      case _i12.RefreshTokenRequest():
        return 'RefreshTokenRequest';
      case _i13.RegisterSendCodeRequest():
        return 'RegisterSendCodeRequest';
      case _i14.RegisterSetPasswordRequest():
        return 'RegisterSetPasswordRequest';
      case _i15.RegisterVerifyCodeRequest():
        return 'RegisterVerifyCodeRequest';
      case _i16.SendCodeResponse():
        return 'SendCodeResponse';
      case _i17.TokenPairResponse():
        return 'TokenPairResponse';
      case _i18.User():
        return 'User';
      case _i19.VerificationCode():
        return 'VerificationCode';
      case _i20.VerifyCodeResponse():
        return 'VerifyCodeResponse';
      case _i21.OwnerType():
        return 'OwnerType';
      case _i22.PlatformType():
        return 'PlatformType';
      case _i23.ResponseStatusType():
        return 'ResponseStatusType';
      case _i24.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i25.TeamRoleType():
        return 'TeamRoleType';
      case _i26.VerificationPurposeType():
        return 'VerificationPurposeType';
      case _i27.InvalidDataException():
        return 'InvalidDataException';
      case _i28.Greeting():
        return 'Greeting';
      case _i29.VersionCheckLog():
        return 'VersionCheckLog';
      case _i30.Team():
        return 'Team';
      case _i31.TeamMember():
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
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i5.AuthResponse>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i6.AuthSession>(data['data']);
    }
    if (dataClassName == 'CheckEmailRequest') {
      return deserialize<_i7.CheckEmailRequest>(data['data']);
    }
    if (dataClassName == 'CheckEmailResponse') {
      return deserialize<_i8.CheckEmailResponse>(data['data']);
    }
    if (dataClassName == 'UserPublic') {
      return deserialize<_i9.UserPublic>(data['data']);
    }
    if (dataClassName == 'SuccessResponse') {
      return deserialize<_i10.SuccessResponse>(data['data']);
    }
    if (dataClassName == 'LoginRequest') {
      return deserialize<_i11.LoginRequest>(data['data']);
    }
    if (dataClassName == 'RefreshTokenRequest') {
      return deserialize<_i12.RefreshTokenRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSendCodeRequest') {
      return deserialize<_i13.RegisterSendCodeRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSetPasswordRequest') {
      return deserialize<_i14.RegisterSetPasswordRequest>(data['data']);
    }
    if (dataClassName == 'RegisterVerifyCodeRequest') {
      return deserialize<_i15.RegisterVerifyCodeRequest>(data['data']);
    }
    if (dataClassName == 'SendCodeResponse') {
      return deserialize<_i16.SendCodeResponse>(data['data']);
    }
    if (dataClassName == 'TokenPairResponse') {
      return deserialize<_i17.TokenPairResponse>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i18.User>(data['data']);
    }
    if (dataClassName == 'VerificationCode') {
      return deserialize<_i19.VerificationCode>(data['data']);
    }
    if (dataClassName == 'VerifyCodeResponse') {
      return deserialize<_i20.VerifyCodeResponse>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i21.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i22.PlatformType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i23.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i24.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i25.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'VerificationPurposeType') {
      return deserialize<_i26.VerificationPurposeType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i27.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i28.Greeting>(data['data']);
    }
    if (dataClassName == 'VersionCheckLog') {
      return deserialize<_i29.VersionCheckLog>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i30.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i31.TeamMember>(data['data']);
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
