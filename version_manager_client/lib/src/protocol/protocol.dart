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
import 'apps/create_application_request.dart' as _i3;
import 'apps/create_application_response.dart' as _i4;
import 'apps/delete_application_request.dart' as _i5;
import 'apps/regenerate_api_key_request.dart' as _i6;
import 'apps/regenerate_api_key_response.dart' as _i7;
import 'apps/request_api_key_regeneration_request.dart' as _i8;
import 'apps/request_api_key_regeneration_response.dart' as _i9;
import 'apps/store_link.dart' as _i10;
import 'apps/store_link_entry.dart' as _i11;
import 'apps/toggle_application_status_request.dart' as _i12;
import 'apps/transfer_application_ownership_request.dart' as _i13;
import 'apps/update_application_request.dart' as _i14;
import 'apps/version.dart' as _i15;
import 'auth/auth_response.dart' as _i16;
import 'auth/auth_session.dart' as _i17;
import 'auth/check_email.dart' as _i18;
import 'auth/check_email_and_send_code_response.dart' as _i19;
import 'auth/common.dart' as _i20;
import 'auth/common_success.dart' as _i21;
import 'auth/login.dart' as _i22;
import 'auth/refresh_token.dart' as _i23;
import 'auth/register.dart' as _i24;
import 'auth/register_send_code.dart' as _i25;
import 'auth/register_set_password.dart' as _i26;
import 'auth/register_verify_code.dart' as _i27;
import 'auth/send_code_response.dart' as _i28;
import 'auth/token_pair_response.dart' as _i29;
import 'auth/user.dart' as _i30;
import 'auth/verification_code.dart' as _i31;
import 'auth/verify_code_response.dart' as _i32;
import 'enums/owner_type.dart' as _i33;
import 'enums/platform_type.dart' as _i34;
import 'enums/response_status_type.dart' as _i35;
import 'enums/team_member_status_type.dart' as _i36;
import 'enums/team_role_type.dart' as _i37;
import 'enums/verification_putpose_type.dart' as _i38;
import 'exceptions/invalid_data_exception.dart' as _i39;
import 'exceptions/too_many_attempts_exception.dart' as _i40;
import 'greetings/greeting.dart' as _i41;
import 'logs/version_check_log.dart' as _i42;
import 'sessions/session_info.dart' as _i43;
import 'sessions/terminate_session_request.dart' as _i44;
import 'teams/create_team_request.dart' as _i45;
import 'teams/delete_team_request.dart' as _i46;
import 'teams/invite_team_member_request.dart' as _i47;
import 'teams/leave_team_request.dart' as _i48;
import 'teams/remove_member_request.dart' as _i49;
import 'teams/respond_to_invitation_request.dart' as _i50;
import 'teams/revoke_invitation_request.dart' as _i51;
import 'teams/team.dart' as _i52;
import 'teams/team_member.dart' as _i53;
import 'teams/transfer_team_ownership_request.dart' as _i54;
import 'teams/update_member_role_request.dart' as _i55;
import 'teams/update_team_request.dart' as _i56;
import 'package:version_manager_client/src/protocol/apps/application.dart'
    as _i57;
import 'package:version_manager_client/src/protocol/sessions/session_info.dart'
    as _i58;
import 'package:version_manager_client/src/protocol/teams/team.dart' as _i59;
import 'package:version_manager_client/src/protocol/teams/team_member.dart'
    as _i60;
export 'apps/application.dart';
export 'apps/create_application_request.dart';
export 'apps/create_application_response.dart';
export 'apps/delete_application_request.dart';
export 'apps/regenerate_api_key_request.dart';
export 'apps/regenerate_api_key_response.dart';
export 'apps/request_api_key_regeneration_request.dart';
export 'apps/request_api_key_regeneration_response.dart';
export 'apps/store_link.dart';
export 'apps/store_link_entry.dart';
export 'apps/toggle_application_status_request.dart';
export 'apps/transfer_application_ownership_request.dart';
export 'apps/update_application_request.dart';
export 'apps/version.dart';
export 'auth/auth_response.dart';
export 'auth/auth_session.dart';
export 'auth/check_email.dart';
export 'auth/check_email_and_send_code_response.dart';
export 'auth/common.dart';
export 'auth/common_success.dart';
export 'auth/login.dart';
export 'auth/refresh_token.dart';
export 'auth/register.dart';
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
export 'exceptions/too_many_attempts_exception.dart';
export 'greetings/greeting.dart';
export 'logs/version_check_log.dart';
export 'sessions/session_info.dart';
export 'sessions/terminate_session_request.dart';
export 'teams/create_team_request.dart';
export 'teams/delete_team_request.dart';
export 'teams/invite_team_member_request.dart';
export 'teams/leave_team_request.dart';
export 'teams/remove_member_request.dart';
export 'teams/respond_to_invitation_request.dart';
export 'teams/revoke_invitation_request.dart';
export 'teams/team.dart';
export 'teams/team_member.dart';
export 'teams/transfer_team_ownership_request.dart';
export 'teams/update_member_role_request.dart';
export 'teams/update_team_request.dart';
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
    if (t == _i3.CreateApplicationRequest) {
      return _i3.CreateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i4.CreateApplicationResponse) {
      return _i4.CreateApplicationResponse.fromJson(data) as T;
    }
    if (t == _i5.DeleteApplicationRequest) {
      return _i5.DeleteApplicationRequest.fromJson(data) as T;
    }
    if (t == _i6.RegenerateApiKeyRequest) {
      return _i6.RegenerateApiKeyRequest.fromJson(data) as T;
    }
    if (t == _i7.RegenerateApiKeyResponse) {
      return _i7.RegenerateApiKeyResponse.fromJson(data) as T;
    }
    if (t == _i8.RequestApiKeyRegenerationRequest) {
      return _i8.RequestApiKeyRegenerationRequest.fromJson(data) as T;
    }
    if (t == _i9.RequestApiKeyRegenerationResponse) {
      return _i9.RequestApiKeyRegenerationResponse.fromJson(data) as T;
    }
    if (t == _i10.StoreLink) {
      return _i10.StoreLink.fromJson(data) as T;
    }
    if (t == _i11.StoreLinkEntry) {
      return _i11.StoreLinkEntry.fromJson(data) as T;
    }
    if (t == _i12.ToggleApplicationStatusRequest) {
      return _i12.ToggleApplicationStatusRequest.fromJson(data) as T;
    }
    if (t == _i13.TransferApplicationOwnershipRequest) {
      return _i13.TransferApplicationOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i14.UpdateApplicationRequest) {
      return _i14.UpdateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i15.Version) {
      return _i15.Version.fromJson(data) as T;
    }
    if (t == _i16.AuthResponse) {
      return _i16.AuthResponse.fromJson(data) as T;
    }
    if (t == _i17.AuthSession) {
      return _i17.AuthSession.fromJson(data) as T;
    }
    if (t == _i18.CheckEmailRequest) {
      return _i18.CheckEmailRequest.fromJson(data) as T;
    }
    if (t == _i19.CheckEmailAndSendCodeResponse) {
      return _i19.CheckEmailAndSendCodeResponse.fromJson(data) as T;
    }
    if (t == _i20.UserPublic) {
      return _i20.UserPublic.fromJson(data) as T;
    }
    if (t == _i21.SuccessResponse) {
      return _i21.SuccessResponse.fromJson(data) as T;
    }
    if (t == _i22.LoginRequest) {
      return _i22.LoginRequest.fromJson(data) as T;
    }
    if (t == _i23.RefreshTokenRequest) {
      return _i23.RefreshTokenRequest.fromJson(data) as T;
    }
    if (t == _i24.RegisterRequest) {
      return _i24.RegisterRequest.fromJson(data) as T;
    }
    if (t == _i25.RegisterSendCodeRequest) {
      return _i25.RegisterSendCodeRequest.fromJson(data) as T;
    }
    if (t == _i26.RegisterSetPasswordRequest) {
      return _i26.RegisterSetPasswordRequest.fromJson(data) as T;
    }
    if (t == _i27.RegisterVerifyCodeRequest) {
      return _i27.RegisterVerifyCodeRequest.fromJson(data) as T;
    }
    if (t == _i28.SendCodeResponse) {
      return _i28.SendCodeResponse.fromJson(data) as T;
    }
    if (t == _i29.TokenPairResponse) {
      return _i29.TokenPairResponse.fromJson(data) as T;
    }
    if (t == _i30.User) {
      return _i30.User.fromJson(data) as T;
    }
    if (t == _i31.VerificationCode) {
      return _i31.VerificationCode.fromJson(data) as T;
    }
    if (t == _i32.VerifyCodeResponse) {
      return _i32.VerifyCodeResponse.fromJson(data) as T;
    }
    if (t == _i33.OwnerType) {
      return _i33.OwnerType.fromJson(data) as T;
    }
    if (t == _i34.PlatformType) {
      return _i34.PlatformType.fromJson(data) as T;
    }
    if (t == _i35.ResponseStatusType) {
      return _i35.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i36.TeamMemberStatusType) {
      return _i36.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i37.TeamRoleType) {
      return _i37.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i38.VerificationPurposeType) {
      return _i38.VerificationPurposeType.fromJson(data) as T;
    }
    if (t == _i39.InvalidDataException) {
      return _i39.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i40.TooManyAttemptsException) {
      return _i40.TooManyAttemptsException.fromJson(data) as T;
    }
    if (t == _i41.Greeting) {
      return _i41.Greeting.fromJson(data) as T;
    }
    if (t == _i42.VersionCheckLog) {
      return _i42.VersionCheckLog.fromJson(data) as T;
    }
    if (t == _i43.SessionInfo) {
      return _i43.SessionInfo.fromJson(data) as T;
    }
    if (t == _i44.TerminateSessionRequest) {
      return _i44.TerminateSessionRequest.fromJson(data) as T;
    }
    if (t == _i45.CreateTeamRequest) {
      return _i45.CreateTeamRequest.fromJson(data) as T;
    }
    if (t == _i46.DeleteTeamRequest) {
      return _i46.DeleteTeamRequest.fromJson(data) as T;
    }
    if (t == _i47.InviteTeamMemberRequest) {
      return _i47.InviteTeamMemberRequest.fromJson(data) as T;
    }
    if (t == _i48.LeaveTeamRequest) {
      return _i48.LeaveTeamRequest.fromJson(data) as T;
    }
    if (t == _i49.RemoveMemberRequest) {
      return _i49.RemoveMemberRequest.fromJson(data) as T;
    }
    if (t == _i50.RespondToInvitationRequest) {
      return _i50.RespondToInvitationRequest.fromJson(data) as T;
    }
    if (t == _i51.RevokeInvitationRequest) {
      return _i51.RevokeInvitationRequest.fromJson(data) as T;
    }
    if (t == _i52.Team) {
      return _i52.Team.fromJson(data) as T;
    }
    if (t == _i53.TeamMember) {
      return _i53.TeamMember.fromJson(data) as T;
    }
    if (t == _i54.TransferTeamOwnershipRequest) {
      return _i54.TransferTeamOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i55.UpdateMemberRoleRequest) {
      return _i55.UpdateMemberRoleRequest.fromJson(data) as T;
    }
    if (t == _i56.UpdateTeamRequest) {
      return _i56.UpdateTeamRequest.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Application?>()) {
      return (data != null ? _i2.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.CreateApplicationRequest?>()) {
      return (data != null ? _i3.CreateApplicationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.CreateApplicationResponse?>()) {
      return (data != null
              ? _i4.CreateApplicationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i5.DeleteApplicationRequest?>()) {
      return (data != null ? _i5.DeleteApplicationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.RegenerateApiKeyRequest?>()) {
      return (data != null ? _i6.RegenerateApiKeyRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.RegenerateApiKeyResponse?>()) {
      return (data != null ? _i7.RegenerateApiKeyResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.RequestApiKeyRegenerationRequest?>()) {
      return (data != null
              ? _i8.RequestApiKeyRegenerationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i9.RequestApiKeyRegenerationResponse?>()) {
      return (data != null
              ? _i9.RequestApiKeyRegenerationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i10.StoreLink?>()) {
      return (data != null ? _i10.StoreLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.StoreLinkEntry?>()) {
      return (data != null ? _i11.StoreLinkEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ToggleApplicationStatusRequest?>()) {
      return (data != null
              ? _i12.ToggleApplicationStatusRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i13.TransferApplicationOwnershipRequest?>()) {
      return (data != null
              ? _i13.TransferApplicationOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.UpdateApplicationRequest?>()) {
      return (data != null
              ? _i14.UpdateApplicationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.Version?>()) {
      return (data != null ? _i15.Version.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.AuthResponse?>()) {
      return (data != null ? _i16.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.AuthSession?>()) {
      return (data != null ? _i17.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.CheckEmailRequest?>()) {
      return (data != null ? _i18.CheckEmailRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.CheckEmailAndSendCodeResponse?>()) {
      return (data != null
              ? _i19.CheckEmailAndSendCodeResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i20.UserPublic?>()) {
      return (data != null ? _i20.UserPublic.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.SuccessResponse?>()) {
      return (data != null ? _i21.SuccessResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.LoginRequest?>()) {
      return (data != null ? _i22.LoginRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.RefreshTokenRequest?>()) {
      return (data != null ? _i23.RefreshTokenRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i24.RegisterRequest?>()) {
      return (data != null ? _i24.RegisterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.RegisterSendCodeRequest?>()) {
      return (data != null ? _i25.RegisterSendCodeRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.RegisterSetPasswordRequest?>()) {
      return (data != null
              ? _i26.RegisterSetPasswordRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i27.RegisterVerifyCodeRequest?>()) {
      return (data != null
              ? _i27.RegisterVerifyCodeRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.SendCodeResponse?>()) {
      return (data != null ? _i28.SendCodeResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.TokenPairResponse?>()) {
      return (data != null ? _i29.TokenPairResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.User?>()) {
      return (data != null ? _i30.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.VerificationCode?>()) {
      return (data != null ? _i31.VerificationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.VerifyCodeResponse?>()) {
      return (data != null ? _i32.VerifyCodeResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.OwnerType?>()) {
      return (data != null ? _i33.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.PlatformType?>()) {
      return (data != null ? _i34.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.ResponseStatusType?>()) {
      return (data != null ? _i35.ResponseStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.TeamMemberStatusType?>()) {
      return (data != null ? _i36.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.TeamRoleType?>()) {
      return (data != null ? _i37.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.VerificationPurposeType?>()) {
      return (data != null ? _i38.VerificationPurposeType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i39.InvalidDataException?>()) {
      return (data != null ? _i39.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.TooManyAttemptsException?>()) {
      return (data != null
              ? _i40.TooManyAttemptsException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i41.Greeting?>()) {
      return (data != null ? _i41.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.VersionCheckLog?>()) {
      return (data != null ? _i42.VersionCheckLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.SessionInfo?>()) {
      return (data != null ? _i43.SessionInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.TerminateSessionRequest?>()) {
      return (data != null ? _i44.TerminateSessionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.CreateTeamRequest?>()) {
      return (data != null ? _i45.CreateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.DeleteTeamRequest?>()) {
      return (data != null ? _i46.DeleteTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.InviteTeamMemberRequest?>()) {
      return (data != null ? _i47.InviteTeamMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.LeaveTeamRequest?>()) {
      return (data != null ? _i48.LeaveTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.RemoveMemberRequest?>()) {
      return (data != null ? _i49.RemoveMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.RespondToInvitationRequest?>()) {
      return (data != null
              ? _i50.RespondToInvitationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i51.RevokeInvitationRequest?>()) {
      return (data != null ? _i51.RevokeInvitationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.Team?>()) {
      return (data != null ? _i52.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i53.TeamMember?>()) {
      return (data != null ? _i53.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.TransferTeamOwnershipRequest?>()) {
      return (data != null
              ? _i54.TransferTeamOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i55.UpdateMemberRoleRequest?>()) {
      return (data != null ? _i55.UpdateMemberRoleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i56.UpdateTeamRequest?>()) {
      return (data != null ? _i56.UpdateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == List<_i34.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i34.PlatformType>(e))
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
    if (t == List<_i15.Version>) {
      return (data as List).map((e) => deserialize<_i15.Version>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.Version>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i15.Version>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i42.VersionCheckLog>) {
      return (data as List)
              .map((e) => deserialize<_i42.VersionCheckLog>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i42.VersionCheckLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i42.VersionCheckLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i11.StoreLinkEntry>) {
      return (data as List)
              .map((e) => deserialize<_i11.StoreLinkEntry>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i11.StoreLinkEntry>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i11.StoreLinkEntry>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i34.PlatformType>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i34.PlatformType>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i17.AuthSession>) {
      return (data as List)
              .map((e) => deserialize<_i17.AuthSession>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.AuthSession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i17.AuthSession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i31.VerificationCode>) {
      return (data as List)
              .map((e) => deserialize<_i31.VerificationCode>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i31.VerificationCode>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i31.VerificationCode>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i52.Team>) {
      return (data as List).map((e) => deserialize<_i52.Team>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i52.Team>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i52.Team>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i53.TeamMember>) {
      return (data as List).map((e) => deserialize<_i53.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i53.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i53.TeamMember>(e))
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
    if (t == List<_i57.Application>) {
      return (data as List)
              .map((e) => deserialize<_i57.Application>(e))
              .toList()
          as T;
    }
    if (t == List<_i58.SessionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i58.SessionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.Team>) {
      return (data as List).map((e) => deserialize<_i59.Team>(e)).toList() as T;
    }
    if (t == List<_i60.TeamMember>) {
      return (data as List).map((e) => deserialize<_i60.TeamMember>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.Application => 'Application',
      _i3.CreateApplicationRequest => 'CreateApplicationRequest',
      _i4.CreateApplicationResponse => 'CreateApplicationResponse',
      _i5.DeleteApplicationRequest => 'DeleteApplicationRequest',
      _i6.RegenerateApiKeyRequest => 'RegenerateApiKeyRequest',
      _i7.RegenerateApiKeyResponse => 'RegenerateApiKeyResponse',
      _i8.RequestApiKeyRegenerationRequest =>
        'RequestApiKeyRegenerationRequest',
      _i9.RequestApiKeyRegenerationResponse =>
        'RequestApiKeyRegenerationResponse',
      _i10.StoreLink => 'StoreLink',
      _i11.StoreLinkEntry => 'StoreLinkEntry',
      _i12.ToggleApplicationStatusRequest => 'ToggleApplicationStatusRequest',
      _i13.TransferApplicationOwnershipRequest =>
        'TransferApplicationOwnershipRequest',
      _i14.UpdateApplicationRequest => 'UpdateApplicationRequest',
      _i15.Version => 'Version',
      _i16.AuthResponse => 'AuthResponse',
      _i17.AuthSession => 'AuthSession',
      _i18.CheckEmailRequest => 'CheckEmailRequest',
      _i19.CheckEmailAndSendCodeResponse => 'CheckEmailAndSendCodeResponse',
      _i20.UserPublic => 'UserPublic',
      _i21.SuccessResponse => 'SuccessResponse',
      _i22.LoginRequest => 'LoginRequest',
      _i23.RefreshTokenRequest => 'RefreshTokenRequest',
      _i24.RegisterRequest => 'RegisterRequest',
      _i25.RegisterSendCodeRequest => 'RegisterSendCodeRequest',
      _i26.RegisterSetPasswordRequest => 'RegisterSetPasswordRequest',
      _i27.RegisterVerifyCodeRequest => 'RegisterVerifyCodeRequest',
      _i28.SendCodeResponse => 'SendCodeResponse',
      _i29.TokenPairResponse => 'TokenPairResponse',
      _i30.User => 'User',
      _i31.VerificationCode => 'VerificationCode',
      _i32.VerifyCodeResponse => 'VerifyCodeResponse',
      _i33.OwnerType => 'OwnerType',
      _i34.PlatformType => 'PlatformType',
      _i35.ResponseStatusType => 'ResponseStatusType',
      _i36.TeamMemberStatusType => 'TeamMemberStatusType',
      _i37.TeamRoleType => 'TeamRoleType',
      _i38.VerificationPurposeType => 'VerificationPurposeType',
      _i39.InvalidDataException => 'InvalidDataException',
      _i40.TooManyAttemptsException => 'TooManyAttemptsException',
      _i41.Greeting => 'Greeting',
      _i42.VersionCheckLog => 'VersionCheckLog',
      _i43.SessionInfo => 'SessionInfo',
      _i44.TerminateSessionRequest => 'TerminateSessionRequest',
      _i45.CreateTeamRequest => 'CreateTeamRequest',
      _i46.DeleteTeamRequest => 'DeleteTeamRequest',
      _i47.InviteTeamMemberRequest => 'InviteTeamMemberRequest',
      _i48.LeaveTeamRequest => 'LeaveTeamRequest',
      _i49.RemoveMemberRequest => 'RemoveMemberRequest',
      _i50.RespondToInvitationRequest => 'RespondToInvitationRequest',
      _i51.RevokeInvitationRequest => 'RevokeInvitationRequest',
      _i52.Team => 'Team',
      _i53.TeamMember => 'TeamMember',
      _i54.TransferTeamOwnershipRequest => 'TransferTeamOwnershipRequest',
      _i55.UpdateMemberRoleRequest => 'UpdateMemberRoleRequest',
      _i56.UpdateTeamRequest => 'UpdateTeamRequest',
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
      case _i3.CreateApplicationRequest():
        return 'CreateApplicationRequest';
      case _i4.CreateApplicationResponse():
        return 'CreateApplicationResponse';
      case _i5.DeleteApplicationRequest():
        return 'DeleteApplicationRequest';
      case _i6.RegenerateApiKeyRequest():
        return 'RegenerateApiKeyRequest';
      case _i7.RegenerateApiKeyResponse():
        return 'RegenerateApiKeyResponse';
      case _i8.RequestApiKeyRegenerationRequest():
        return 'RequestApiKeyRegenerationRequest';
      case _i9.RequestApiKeyRegenerationResponse():
        return 'RequestApiKeyRegenerationResponse';
      case _i10.StoreLink():
        return 'StoreLink';
      case _i11.StoreLinkEntry():
        return 'StoreLinkEntry';
      case _i12.ToggleApplicationStatusRequest():
        return 'ToggleApplicationStatusRequest';
      case _i13.TransferApplicationOwnershipRequest():
        return 'TransferApplicationOwnershipRequest';
      case _i14.UpdateApplicationRequest():
        return 'UpdateApplicationRequest';
      case _i15.Version():
        return 'Version';
      case _i16.AuthResponse():
        return 'AuthResponse';
      case _i17.AuthSession():
        return 'AuthSession';
      case _i18.CheckEmailRequest():
        return 'CheckEmailRequest';
      case _i19.CheckEmailAndSendCodeResponse():
        return 'CheckEmailAndSendCodeResponse';
      case _i20.UserPublic():
        return 'UserPublic';
      case _i21.SuccessResponse():
        return 'SuccessResponse';
      case _i22.LoginRequest():
        return 'LoginRequest';
      case _i23.RefreshTokenRequest():
        return 'RefreshTokenRequest';
      case _i24.RegisterRequest():
        return 'RegisterRequest';
      case _i25.RegisterSendCodeRequest():
        return 'RegisterSendCodeRequest';
      case _i26.RegisterSetPasswordRequest():
        return 'RegisterSetPasswordRequest';
      case _i27.RegisterVerifyCodeRequest():
        return 'RegisterVerifyCodeRequest';
      case _i28.SendCodeResponse():
        return 'SendCodeResponse';
      case _i29.TokenPairResponse():
        return 'TokenPairResponse';
      case _i30.User():
        return 'User';
      case _i31.VerificationCode():
        return 'VerificationCode';
      case _i32.VerifyCodeResponse():
        return 'VerifyCodeResponse';
      case _i33.OwnerType():
        return 'OwnerType';
      case _i34.PlatformType():
        return 'PlatformType';
      case _i35.ResponseStatusType():
        return 'ResponseStatusType';
      case _i36.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i37.TeamRoleType():
        return 'TeamRoleType';
      case _i38.VerificationPurposeType():
        return 'VerificationPurposeType';
      case _i39.InvalidDataException():
        return 'InvalidDataException';
      case _i40.TooManyAttemptsException():
        return 'TooManyAttemptsException';
      case _i41.Greeting():
        return 'Greeting';
      case _i42.VersionCheckLog():
        return 'VersionCheckLog';
      case _i43.SessionInfo():
        return 'SessionInfo';
      case _i44.TerminateSessionRequest():
        return 'TerminateSessionRequest';
      case _i45.CreateTeamRequest():
        return 'CreateTeamRequest';
      case _i46.DeleteTeamRequest():
        return 'DeleteTeamRequest';
      case _i47.InviteTeamMemberRequest():
        return 'InviteTeamMemberRequest';
      case _i48.LeaveTeamRequest():
        return 'LeaveTeamRequest';
      case _i49.RemoveMemberRequest():
        return 'RemoveMemberRequest';
      case _i50.RespondToInvitationRequest():
        return 'RespondToInvitationRequest';
      case _i51.RevokeInvitationRequest():
        return 'RevokeInvitationRequest';
      case _i52.Team():
        return 'Team';
      case _i53.TeamMember():
        return 'TeamMember';
      case _i54.TransferTeamOwnershipRequest():
        return 'TransferTeamOwnershipRequest';
      case _i55.UpdateMemberRoleRequest():
        return 'UpdateMemberRoleRequest';
      case _i56.UpdateTeamRequest():
        return 'UpdateTeamRequest';
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
    if (dataClassName == 'CreateApplicationRequest') {
      return deserialize<_i3.CreateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'CreateApplicationResponse') {
      return deserialize<_i4.CreateApplicationResponse>(data['data']);
    }
    if (dataClassName == 'DeleteApplicationRequest') {
      return deserialize<_i5.DeleteApplicationRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyRequest') {
      return deserialize<_i6.RegenerateApiKeyRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyResponse') {
      return deserialize<_i7.RegenerateApiKeyResponse>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationRequest') {
      return deserialize<_i8.RequestApiKeyRegenerationRequest>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationResponse') {
      return deserialize<_i9.RequestApiKeyRegenerationResponse>(data['data']);
    }
    if (dataClassName == 'StoreLink') {
      return deserialize<_i10.StoreLink>(data['data']);
    }
    if (dataClassName == 'StoreLinkEntry') {
      return deserialize<_i11.StoreLinkEntry>(data['data']);
    }
    if (dataClassName == 'ToggleApplicationStatusRequest') {
      return deserialize<_i12.ToggleApplicationStatusRequest>(data['data']);
    }
    if (dataClassName == 'TransferApplicationOwnershipRequest') {
      return deserialize<_i13.TransferApplicationOwnershipRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateApplicationRequest') {
      return deserialize<_i14.UpdateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'Version') {
      return deserialize<_i15.Version>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i16.AuthResponse>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i17.AuthSession>(data['data']);
    }
    if (dataClassName == 'CheckEmailRequest') {
      return deserialize<_i18.CheckEmailRequest>(data['data']);
    }
    if (dataClassName == 'CheckEmailAndSendCodeResponse') {
      return deserialize<_i19.CheckEmailAndSendCodeResponse>(data['data']);
    }
    if (dataClassName == 'UserPublic') {
      return deserialize<_i20.UserPublic>(data['data']);
    }
    if (dataClassName == 'SuccessResponse') {
      return deserialize<_i21.SuccessResponse>(data['data']);
    }
    if (dataClassName == 'LoginRequest') {
      return deserialize<_i22.LoginRequest>(data['data']);
    }
    if (dataClassName == 'RefreshTokenRequest') {
      return deserialize<_i23.RefreshTokenRequest>(data['data']);
    }
    if (dataClassName == 'RegisterRequest') {
      return deserialize<_i24.RegisterRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSendCodeRequest') {
      return deserialize<_i25.RegisterSendCodeRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSetPasswordRequest') {
      return deserialize<_i26.RegisterSetPasswordRequest>(data['data']);
    }
    if (dataClassName == 'RegisterVerifyCodeRequest') {
      return deserialize<_i27.RegisterVerifyCodeRequest>(data['data']);
    }
    if (dataClassName == 'SendCodeResponse') {
      return deserialize<_i28.SendCodeResponse>(data['data']);
    }
    if (dataClassName == 'TokenPairResponse') {
      return deserialize<_i29.TokenPairResponse>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i30.User>(data['data']);
    }
    if (dataClassName == 'VerificationCode') {
      return deserialize<_i31.VerificationCode>(data['data']);
    }
    if (dataClassName == 'VerifyCodeResponse') {
      return deserialize<_i32.VerifyCodeResponse>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i33.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i34.PlatformType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i35.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i36.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i37.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'VerificationPurposeType') {
      return deserialize<_i38.VerificationPurposeType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i39.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'TooManyAttemptsException') {
      return deserialize<_i40.TooManyAttemptsException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i41.Greeting>(data['data']);
    }
    if (dataClassName == 'VersionCheckLog') {
      return deserialize<_i42.VersionCheckLog>(data['data']);
    }
    if (dataClassName == 'SessionInfo') {
      return deserialize<_i43.SessionInfo>(data['data']);
    }
    if (dataClassName == 'TerminateSessionRequest') {
      return deserialize<_i44.TerminateSessionRequest>(data['data']);
    }
    if (dataClassName == 'CreateTeamRequest') {
      return deserialize<_i45.CreateTeamRequest>(data['data']);
    }
    if (dataClassName == 'DeleteTeamRequest') {
      return deserialize<_i46.DeleteTeamRequest>(data['data']);
    }
    if (dataClassName == 'InviteTeamMemberRequest') {
      return deserialize<_i47.InviteTeamMemberRequest>(data['data']);
    }
    if (dataClassName == 'LeaveTeamRequest') {
      return deserialize<_i48.LeaveTeamRequest>(data['data']);
    }
    if (dataClassName == 'RemoveMemberRequest') {
      return deserialize<_i49.RemoveMemberRequest>(data['data']);
    }
    if (dataClassName == 'RespondToInvitationRequest') {
      return deserialize<_i50.RespondToInvitationRequest>(data['data']);
    }
    if (dataClassName == 'RevokeInvitationRequest') {
      return deserialize<_i51.RevokeInvitationRequest>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i52.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i53.TeamMember>(data['data']);
    }
    if (dataClassName == 'TransferTeamOwnershipRequest') {
      return deserialize<_i54.TransferTeamOwnershipRequest>(data['data']);
    }
    if (dataClassName == 'UpdateMemberRoleRequest') {
      return deserialize<_i55.UpdateMemberRoleRequest>(data['data']);
    }
    if (dataClassName == 'UpdateTeamRequest') {
      return deserialize<_i56.UpdateTeamRequest>(data['data']);
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
