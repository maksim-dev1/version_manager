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
import 'api/check_version_error_response.dart' as _i2;
import 'api/check_version_request.dart' as _i3;
import 'api/check_version_response.dart' as _i4;
import 'api/recommended_version_info.dart' as _i5;
import 'api/store_link_info.dart' as _i6;
import 'apps/application.dart' as _i7;
import 'apps/create_application_request.dart' as _i8;
import 'apps/create_application_response.dart' as _i9;
import 'apps/delete_application_request.dart' as _i10;
import 'apps/regenerate_api_key_request.dart' as _i11;
import 'apps/regenerate_api_key_response.dart' as _i12;
import 'apps/request_api_key_regeneration_request.dart' as _i13;
import 'apps/request_api_key_regeneration_response.dart' as _i14;
import 'apps/store_link.dart' as _i15;
import 'apps/store_link_entry.dart' as _i16;
import 'apps/toggle_application_status_request.dart' as _i17;
import 'apps/transfer_application_ownership_request.dart' as _i18;
import 'apps/update_application_request.dart' as _i19;
import 'auth/auth_response.dart' as _i20;
import 'auth/auth_session.dart' as _i21;
import 'auth/check_email.dart' as _i22;
import 'auth/check_email_and_send_code_response.dart' as _i23;
import 'auth/common.dart' as _i24;
import 'auth/common_success.dart' as _i25;
import 'auth/login.dart' as _i26;
import 'auth/refresh_token.dart' as _i27;
import 'auth/register.dart' as _i28;
import 'auth/register_send_code.dart' as _i29;
import 'auth/register_set_password.dart' as _i30;
import 'auth/register_verify_code.dart' as _i31;
import 'auth/send_code_response.dart' as _i32;
import 'auth/token_pair_response.dart' as _i33;
import 'auth/user.dart' as _i34;
import 'auth/verification_code.dart' as _i35;
import 'auth/verify_code_response.dart' as _i36;
import 'enums/owner_type.dart' as _i37;
import 'enums/platform_type.dart' as _i38;
import 'enums/recommendation_frequency_type.dart' as _i39;
import 'enums/response_status_type.dart' as _i40;
import 'enums/team_member_status_type.dart' as _i41;
import 'enums/team_role_type.dart' as _i42;
import 'enums/update_priority_type.dart' as _i43;
import 'enums/verification_putpose_type.dart' as _i44;
import 'exceptions/invalid_data_exception.dart' as _i45;
import 'exceptions/too_many_attempts_exception.dart' as _i46;
import 'greetings/greeting.dart' as _i47;
import 'sessions/session_info.dart' as _i48;
import 'sessions/terminate_session_request.dart' as _i49;
import 'statistics/app_instance.dart' as _i50;
import 'statistics/cumulative_users_entry.dart' as _i51;
import 'statistics/daily_active_users_entry.dart' as _i52;
import 'statistics/daily_active_users_response.dart' as _i53;
import 'statistics/daily_check_summary.dart' as _i54;
import 'statistics/daily_dimension_summary.dart' as _i55;
import 'statistics/device_model_statistics_entry.dart' as _i56;
import 'statistics/geo_statistics_response.dart' as _i57;
import 'statistics/heatmap_entry.dart' as _i58;
import 'statistics/locale_statistics_entry.dart' as _i59;
import 'statistics/os_version_statistics_entry.dart' as _i60;
import 'statistics/platform_statistics_entry.dart' as _i61;
import 'statistics/platform_statistics_response.dart' as _i62;
import 'statistics/statistics_export_data.dart' as _i63;
import 'statistics/statistics_filter.dart' as _i64;
import 'statistics/statistics_overview_response.dart' as _i65;
import 'statistics/time_analytics_response.dart' as _i66;
import 'statistics/version_adoption_timeline_entry.dart' as _i67;
import 'statistics/version_statistics_entry.dart' as _i68;
import 'statistics/version_statistics_response.dart' as _i69;
import 'teams/create_team_request.dart' as _i70;
import 'teams/delete_team_request.dart' as _i71;
import 'teams/invite_team_member_request.dart' as _i72;
import 'teams/leave_team_request.dart' as _i73;
import 'teams/remove_member_request.dart' as _i74;
import 'teams/respond_to_invitation_request.dart' as _i75;
import 'teams/revoke_invitation_request.dart' as _i76;
import 'teams/team.dart' as _i77;
import 'teams/team_member.dart' as _i78;
import 'teams/transfer_team_ownership_request.dart' as _i79;
import 'teams/update_member_role_request.dart' as _i80;
import 'teams/update_team_request.dart' as _i81;
import 'versions/create_version_request.dart' as _i82;
import 'versions/delete_version_request.dart' as _i83;
import 'versions/next_build_number_response.dart' as _i84;
import 'versions/set_version_recommendation_request.dart' as _i85;
import 'versions/toggle_version_block_request.dart' as _i86;
import 'versions/update_version_request.dart' as _i87;
import 'versions/version.dart' as _i88;
import 'versions/version_detail_response.dart' as _i89;
import 'versions/version_list_item.dart' as _i90;
import 'versions/version_list_response.dart' as _i91;
import 'package:version_manager_client/src/protocol/apps/application.dart'
    as _i92;
import 'package:version_manager_client/src/protocol/sessions/session_info.dart'
    as _i93;
import 'package:version_manager_client/src/protocol/teams/team.dart' as _i94;
import 'package:version_manager_client/src/protocol/teams/team_member.dart'
    as _i95;
export 'api/check_version_error_response.dart';
export 'api/check_version_request.dart';
export 'api/check_version_response.dart';
export 'api/recommended_version_info.dart';
export 'api/store_link_info.dart';
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
export 'enums/recommendation_frequency_type.dart';
export 'enums/response_status_type.dart';
export 'enums/team_member_status_type.dart';
export 'enums/team_role_type.dart';
export 'enums/update_priority_type.dart';
export 'enums/verification_putpose_type.dart';
export 'exceptions/invalid_data_exception.dart';
export 'exceptions/too_many_attempts_exception.dart';
export 'greetings/greeting.dart';
export 'sessions/session_info.dart';
export 'sessions/terminate_session_request.dart';
export 'statistics/app_instance.dart';
export 'statistics/cumulative_users_entry.dart';
export 'statistics/daily_active_users_entry.dart';
export 'statistics/daily_active_users_response.dart';
export 'statistics/daily_check_summary.dart';
export 'statistics/daily_dimension_summary.dart';
export 'statistics/device_model_statistics_entry.dart';
export 'statistics/geo_statistics_response.dart';
export 'statistics/heatmap_entry.dart';
export 'statistics/locale_statistics_entry.dart';
export 'statistics/os_version_statistics_entry.dart';
export 'statistics/platform_statistics_entry.dart';
export 'statistics/platform_statistics_response.dart';
export 'statistics/statistics_export_data.dart';
export 'statistics/statistics_filter.dart';
export 'statistics/statistics_overview_response.dart';
export 'statistics/time_analytics_response.dart';
export 'statistics/version_adoption_timeline_entry.dart';
export 'statistics/version_statistics_entry.dart';
export 'statistics/version_statistics_response.dart';
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
export 'versions/create_version_request.dart';
export 'versions/delete_version_request.dart';
export 'versions/next_build_number_response.dart';
export 'versions/set_version_recommendation_request.dart';
export 'versions/toggle_version_block_request.dart';
export 'versions/update_version_request.dart';
export 'versions/version.dart';
export 'versions/version_detail_response.dart';
export 'versions/version_list_item.dart';
export 'versions/version_list_response.dart';
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

    if (t == _i2.CheckVersionErrorResponse) {
      return _i2.CheckVersionErrorResponse.fromJson(data) as T;
    }
    if (t == _i3.CheckVersionRequest) {
      return _i3.CheckVersionRequest.fromJson(data) as T;
    }
    if (t == _i4.CheckVersionResponse) {
      return _i4.CheckVersionResponse.fromJson(data) as T;
    }
    if (t == _i5.RecommendedVersionInfo) {
      return _i5.RecommendedVersionInfo.fromJson(data) as T;
    }
    if (t == _i6.StoreLinkInfo) {
      return _i6.StoreLinkInfo.fromJson(data) as T;
    }
    if (t == _i7.Application) {
      return _i7.Application.fromJson(data) as T;
    }
    if (t == _i8.CreateApplicationRequest) {
      return _i8.CreateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i9.CreateApplicationResponse) {
      return _i9.CreateApplicationResponse.fromJson(data) as T;
    }
    if (t == _i10.DeleteApplicationRequest) {
      return _i10.DeleteApplicationRequest.fromJson(data) as T;
    }
    if (t == _i11.RegenerateApiKeyRequest) {
      return _i11.RegenerateApiKeyRequest.fromJson(data) as T;
    }
    if (t == _i12.RegenerateApiKeyResponse) {
      return _i12.RegenerateApiKeyResponse.fromJson(data) as T;
    }
    if (t == _i13.RequestApiKeyRegenerationRequest) {
      return _i13.RequestApiKeyRegenerationRequest.fromJson(data) as T;
    }
    if (t == _i14.RequestApiKeyRegenerationResponse) {
      return _i14.RequestApiKeyRegenerationResponse.fromJson(data) as T;
    }
    if (t == _i15.StoreLink) {
      return _i15.StoreLink.fromJson(data) as T;
    }
    if (t == _i16.StoreLinkEntry) {
      return _i16.StoreLinkEntry.fromJson(data) as T;
    }
    if (t == _i17.ToggleApplicationStatusRequest) {
      return _i17.ToggleApplicationStatusRequest.fromJson(data) as T;
    }
    if (t == _i18.TransferApplicationOwnershipRequest) {
      return _i18.TransferApplicationOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i19.UpdateApplicationRequest) {
      return _i19.UpdateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i20.AuthResponse) {
      return _i20.AuthResponse.fromJson(data) as T;
    }
    if (t == _i21.AuthSession) {
      return _i21.AuthSession.fromJson(data) as T;
    }
    if (t == _i22.CheckEmailRequest) {
      return _i22.CheckEmailRequest.fromJson(data) as T;
    }
    if (t == _i23.CheckEmailAndSendCodeResponse) {
      return _i23.CheckEmailAndSendCodeResponse.fromJson(data) as T;
    }
    if (t == _i24.UserPublic) {
      return _i24.UserPublic.fromJson(data) as T;
    }
    if (t == _i25.SuccessResponse) {
      return _i25.SuccessResponse.fromJson(data) as T;
    }
    if (t == _i26.LoginRequest) {
      return _i26.LoginRequest.fromJson(data) as T;
    }
    if (t == _i27.RefreshTokenRequest) {
      return _i27.RefreshTokenRequest.fromJson(data) as T;
    }
    if (t == _i28.RegisterRequest) {
      return _i28.RegisterRequest.fromJson(data) as T;
    }
    if (t == _i29.RegisterSendCodeRequest) {
      return _i29.RegisterSendCodeRequest.fromJson(data) as T;
    }
    if (t == _i30.RegisterSetPasswordRequest) {
      return _i30.RegisterSetPasswordRequest.fromJson(data) as T;
    }
    if (t == _i31.RegisterVerifyCodeRequest) {
      return _i31.RegisterVerifyCodeRequest.fromJson(data) as T;
    }
    if (t == _i32.SendCodeResponse) {
      return _i32.SendCodeResponse.fromJson(data) as T;
    }
    if (t == _i33.TokenPairResponse) {
      return _i33.TokenPairResponse.fromJson(data) as T;
    }
    if (t == _i34.User) {
      return _i34.User.fromJson(data) as T;
    }
    if (t == _i35.VerificationCode) {
      return _i35.VerificationCode.fromJson(data) as T;
    }
    if (t == _i36.VerifyCodeResponse) {
      return _i36.VerifyCodeResponse.fromJson(data) as T;
    }
    if (t == _i37.OwnerType) {
      return _i37.OwnerType.fromJson(data) as T;
    }
    if (t == _i38.PlatformType) {
      return _i38.PlatformType.fromJson(data) as T;
    }
    if (t == _i39.RecommendationFrequencyType) {
      return _i39.RecommendationFrequencyType.fromJson(data) as T;
    }
    if (t == _i40.ResponseStatusType) {
      return _i40.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i41.TeamMemberStatusType) {
      return _i41.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i42.TeamRoleType) {
      return _i42.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i43.UpdatePriorityType) {
      return _i43.UpdatePriorityType.fromJson(data) as T;
    }
    if (t == _i44.VerificationPurposeType) {
      return _i44.VerificationPurposeType.fromJson(data) as T;
    }
    if (t == _i45.InvalidDataException) {
      return _i45.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i46.TooManyAttemptsException) {
      return _i46.TooManyAttemptsException.fromJson(data) as T;
    }
    if (t == _i47.Greeting) {
      return _i47.Greeting.fromJson(data) as T;
    }
    if (t == _i48.SessionInfo) {
      return _i48.SessionInfo.fromJson(data) as T;
    }
    if (t == _i49.TerminateSessionRequest) {
      return _i49.TerminateSessionRequest.fromJson(data) as T;
    }
    if (t == _i50.AppInstance) {
      return _i50.AppInstance.fromJson(data) as T;
    }
    if (t == _i51.CumulativeUsersEntry) {
      return _i51.CumulativeUsersEntry.fromJson(data) as T;
    }
    if (t == _i52.DailyActiveUsersEntry) {
      return _i52.DailyActiveUsersEntry.fromJson(data) as T;
    }
    if (t == _i53.DailyActiveUsersResponse) {
      return _i53.DailyActiveUsersResponse.fromJson(data) as T;
    }
    if (t == _i54.DailyCheckSummary) {
      return _i54.DailyCheckSummary.fromJson(data) as T;
    }
    if (t == _i55.DailyDimensionSummary) {
      return _i55.DailyDimensionSummary.fromJson(data) as T;
    }
    if (t == _i56.DeviceModelStatisticsEntry) {
      return _i56.DeviceModelStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i57.GeoStatisticsResponse) {
      return _i57.GeoStatisticsResponse.fromJson(data) as T;
    }
    if (t == _i58.HeatmapEntry) {
      return _i58.HeatmapEntry.fromJson(data) as T;
    }
    if (t == _i59.LocaleStatisticsEntry) {
      return _i59.LocaleStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i60.OsVersionStatisticsEntry) {
      return _i60.OsVersionStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i61.PlatformStatisticsEntry) {
      return _i61.PlatformStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i62.PlatformStatisticsResponse) {
      return _i62.PlatformStatisticsResponse.fromJson(data) as T;
    }
    if (t == _i63.StatisticsExportData) {
      return _i63.StatisticsExportData.fromJson(data) as T;
    }
    if (t == _i64.StatisticsFilter) {
      return _i64.StatisticsFilter.fromJson(data) as T;
    }
    if (t == _i65.StatisticsOverviewResponse) {
      return _i65.StatisticsOverviewResponse.fromJson(data) as T;
    }
    if (t == _i66.TimeAnalyticsResponse) {
      return _i66.TimeAnalyticsResponse.fromJson(data) as T;
    }
    if (t == _i67.VersionAdoptionTimelineEntry) {
      return _i67.VersionAdoptionTimelineEntry.fromJson(data) as T;
    }
    if (t == _i68.VersionStatisticsEntry) {
      return _i68.VersionStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i69.VersionStatisticsResponse) {
      return _i69.VersionStatisticsResponse.fromJson(data) as T;
    }
    if (t == _i70.CreateTeamRequest) {
      return _i70.CreateTeamRequest.fromJson(data) as T;
    }
    if (t == _i71.DeleteTeamRequest) {
      return _i71.DeleteTeamRequest.fromJson(data) as T;
    }
    if (t == _i72.InviteTeamMemberRequest) {
      return _i72.InviteTeamMemberRequest.fromJson(data) as T;
    }
    if (t == _i73.LeaveTeamRequest) {
      return _i73.LeaveTeamRequest.fromJson(data) as T;
    }
    if (t == _i74.RemoveMemberRequest) {
      return _i74.RemoveMemberRequest.fromJson(data) as T;
    }
    if (t == _i75.RespondToInvitationRequest) {
      return _i75.RespondToInvitationRequest.fromJson(data) as T;
    }
    if (t == _i76.RevokeInvitationRequest) {
      return _i76.RevokeInvitationRequest.fromJson(data) as T;
    }
    if (t == _i77.Team) {
      return _i77.Team.fromJson(data) as T;
    }
    if (t == _i78.TeamMember) {
      return _i78.TeamMember.fromJson(data) as T;
    }
    if (t == _i79.TransferTeamOwnershipRequest) {
      return _i79.TransferTeamOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i80.UpdateMemberRoleRequest) {
      return _i80.UpdateMemberRoleRequest.fromJson(data) as T;
    }
    if (t == _i81.UpdateTeamRequest) {
      return _i81.UpdateTeamRequest.fromJson(data) as T;
    }
    if (t == _i82.CreateVersionRequest) {
      return _i82.CreateVersionRequest.fromJson(data) as T;
    }
    if (t == _i83.DeleteVersionRequest) {
      return _i83.DeleteVersionRequest.fromJson(data) as T;
    }
    if (t == _i84.NextBuildNumberResponse) {
      return _i84.NextBuildNumberResponse.fromJson(data) as T;
    }
    if (t == _i85.SetVersionRecommendationRequest) {
      return _i85.SetVersionRecommendationRequest.fromJson(data) as T;
    }
    if (t == _i86.ToggleVersionBlockRequest) {
      return _i86.ToggleVersionBlockRequest.fromJson(data) as T;
    }
    if (t == _i87.UpdateVersionRequest) {
      return _i87.UpdateVersionRequest.fromJson(data) as T;
    }
    if (t == _i88.Version) {
      return _i88.Version.fromJson(data) as T;
    }
    if (t == _i89.VersionDetailResponse) {
      return _i89.VersionDetailResponse.fromJson(data) as T;
    }
    if (t == _i90.VersionListItem) {
      return _i90.VersionListItem.fromJson(data) as T;
    }
    if (t == _i91.VersionListResponse) {
      return _i91.VersionListResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.CheckVersionErrorResponse?>()) {
      return (data != null
              ? _i2.CheckVersionErrorResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i3.CheckVersionRequest?>()) {
      return (data != null ? _i3.CheckVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.CheckVersionResponse?>()) {
      return (data != null ? _i4.CheckVersionResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.RecommendedVersionInfo?>()) {
      return (data != null ? _i5.RecommendedVersionInfo.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.StoreLinkInfo?>()) {
      return (data != null ? _i6.StoreLinkInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Application?>()) {
      return (data != null ? _i7.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.CreateApplicationRequest?>()) {
      return (data != null ? _i8.CreateApplicationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.CreateApplicationResponse?>()) {
      return (data != null
              ? _i9.CreateApplicationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i10.DeleteApplicationRequest?>()) {
      return (data != null
              ? _i10.DeleteApplicationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.RegenerateApiKeyRequest?>()) {
      return (data != null ? _i11.RegenerateApiKeyRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.RegenerateApiKeyResponse?>()) {
      return (data != null
              ? _i12.RegenerateApiKeyResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i13.RequestApiKeyRegenerationRequest?>()) {
      return (data != null
              ? _i13.RequestApiKeyRegenerationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.RequestApiKeyRegenerationResponse?>()) {
      return (data != null
              ? _i14.RequestApiKeyRegenerationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.StoreLink?>()) {
      return (data != null ? _i15.StoreLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.StoreLinkEntry?>()) {
      return (data != null ? _i16.StoreLinkEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ToggleApplicationStatusRequest?>()) {
      return (data != null
              ? _i17.ToggleApplicationStatusRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i18.TransferApplicationOwnershipRequest?>()) {
      return (data != null
              ? _i18.TransferApplicationOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i19.UpdateApplicationRequest?>()) {
      return (data != null
              ? _i19.UpdateApplicationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i20.AuthResponse?>()) {
      return (data != null ? _i20.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.AuthSession?>()) {
      return (data != null ? _i21.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.CheckEmailRequest?>()) {
      return (data != null ? _i22.CheckEmailRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.CheckEmailAndSendCodeResponse?>()) {
      return (data != null
              ? _i23.CheckEmailAndSendCodeResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i24.UserPublic?>()) {
      return (data != null ? _i24.UserPublic.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.SuccessResponse?>()) {
      return (data != null ? _i25.SuccessResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.LoginRequest?>()) {
      return (data != null ? _i26.LoginRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.RefreshTokenRequest?>()) {
      return (data != null ? _i27.RefreshTokenRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.RegisterRequest?>()) {
      return (data != null ? _i28.RegisterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.RegisterSendCodeRequest?>()) {
      return (data != null ? _i29.RegisterSendCodeRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.RegisterSetPasswordRequest?>()) {
      return (data != null
              ? _i30.RegisterSetPasswordRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i31.RegisterVerifyCodeRequest?>()) {
      return (data != null
              ? _i31.RegisterVerifyCodeRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i32.SendCodeResponse?>()) {
      return (data != null ? _i32.SendCodeResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.TokenPairResponse?>()) {
      return (data != null ? _i33.TokenPairResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.User?>()) {
      return (data != null ? _i34.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.VerificationCode?>()) {
      return (data != null ? _i35.VerificationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.VerifyCodeResponse?>()) {
      return (data != null ? _i36.VerifyCodeResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.OwnerType?>()) {
      return (data != null ? _i37.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.PlatformType?>()) {
      return (data != null ? _i38.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.RecommendationFrequencyType?>()) {
      return (data != null
              ? _i39.RecommendationFrequencyType.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i40.ResponseStatusType?>()) {
      return (data != null ? _i40.ResponseStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.TeamMemberStatusType?>()) {
      return (data != null ? _i41.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.TeamRoleType?>()) {
      return (data != null ? _i42.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.UpdatePriorityType?>()) {
      return (data != null ? _i43.UpdatePriorityType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i44.VerificationPurposeType?>()) {
      return (data != null ? _i44.VerificationPurposeType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.InvalidDataException?>()) {
      return (data != null ? _i45.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.TooManyAttemptsException?>()) {
      return (data != null
              ? _i46.TooManyAttemptsException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i47.Greeting?>()) {
      return (data != null ? _i47.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.SessionInfo?>()) {
      return (data != null ? _i48.SessionInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.TerminateSessionRequest?>()) {
      return (data != null ? _i49.TerminateSessionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.AppInstance?>()) {
      return (data != null ? _i50.AppInstance.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i51.CumulativeUsersEntry?>()) {
      return (data != null ? _i51.CumulativeUsersEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.DailyActiveUsersEntry?>()) {
      return (data != null ? _i52.DailyActiveUsersEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.DailyActiveUsersResponse?>()) {
      return (data != null
              ? _i53.DailyActiveUsersResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i54.DailyCheckSummary?>()) {
      return (data != null ? _i54.DailyCheckSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.DailyDimensionSummary?>()) {
      return (data != null ? _i55.DailyDimensionSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i56.DeviceModelStatisticsEntry?>()) {
      return (data != null
              ? _i56.DeviceModelStatisticsEntry.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i57.GeoStatisticsResponse?>()) {
      return (data != null ? _i57.GeoStatisticsResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.HeatmapEntry?>()) {
      return (data != null ? _i58.HeatmapEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.LocaleStatisticsEntry?>()) {
      return (data != null ? _i59.LocaleStatisticsEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i60.OsVersionStatisticsEntry?>()) {
      return (data != null
              ? _i60.OsVersionStatisticsEntry.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i61.PlatformStatisticsEntry?>()) {
      return (data != null ? _i61.PlatformStatisticsEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i62.PlatformStatisticsResponse?>()) {
      return (data != null
              ? _i62.PlatformStatisticsResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i63.StatisticsExportData?>()) {
      return (data != null ? _i63.StatisticsExportData.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i64.StatisticsFilter?>()) {
      return (data != null ? _i64.StatisticsFilter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.StatisticsOverviewResponse?>()) {
      return (data != null
              ? _i65.StatisticsOverviewResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i66.TimeAnalyticsResponse?>()) {
      return (data != null ? _i66.TimeAnalyticsResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i67.VersionAdoptionTimelineEntry?>()) {
      return (data != null
              ? _i67.VersionAdoptionTimelineEntry.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i68.VersionStatisticsEntry?>()) {
      return (data != null ? _i68.VersionStatisticsEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i69.VersionStatisticsResponse?>()) {
      return (data != null
              ? _i69.VersionStatisticsResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i70.CreateTeamRequest?>()) {
      return (data != null ? _i70.CreateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.DeleteTeamRequest?>()) {
      return (data != null ? _i71.DeleteTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i72.InviteTeamMemberRequest?>()) {
      return (data != null ? _i72.InviteTeamMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i73.LeaveTeamRequest?>()) {
      return (data != null ? _i73.LeaveTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i74.RemoveMemberRequest?>()) {
      return (data != null ? _i74.RemoveMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i75.RespondToInvitationRequest?>()) {
      return (data != null
              ? _i75.RespondToInvitationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i76.RevokeInvitationRequest?>()) {
      return (data != null ? _i76.RevokeInvitationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i77.Team?>()) {
      return (data != null ? _i77.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i78.TeamMember?>()) {
      return (data != null ? _i78.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i79.TransferTeamOwnershipRequest?>()) {
      return (data != null
              ? _i79.TransferTeamOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i80.UpdateMemberRoleRequest?>()) {
      return (data != null ? _i80.UpdateMemberRoleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i81.UpdateTeamRequest?>()) {
      return (data != null ? _i81.UpdateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i82.CreateVersionRequest?>()) {
      return (data != null ? _i82.CreateVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i83.DeleteVersionRequest?>()) {
      return (data != null ? _i83.DeleteVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i84.NextBuildNumberResponse?>()) {
      return (data != null ? _i84.NextBuildNumberResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i85.SetVersionRecommendationRequest?>()) {
      return (data != null
              ? _i85.SetVersionRecommendationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i86.ToggleVersionBlockRequest?>()) {
      return (data != null
              ? _i86.ToggleVersionBlockRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i87.UpdateVersionRequest?>()) {
      return (data != null ? _i87.UpdateVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i88.Version?>()) {
      return (data != null ? _i88.Version.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i89.VersionDetailResponse?>()) {
      return (data != null ? _i89.VersionDetailResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i90.VersionListItem?>()) {
      return (data != null ? _i90.VersionListItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i91.VersionListResponse?>()) {
      return (data != null ? _i91.VersionListResponse.fromJson(data) : null)
          as T;
    }
    if (t == List<_i6.StoreLinkInfo>) {
      return (data as List)
              .map((e) => deserialize<_i6.StoreLinkInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i38.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i38.PlatformType>(e))
              .toList()
          as T;
    }
    if (t == List<_i15.StoreLink>) {
      return (data as List).map((e) => deserialize<_i15.StoreLink>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i15.StoreLink>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i15.StoreLink>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i88.Version>) {
      return (data as List).map((e) => deserialize<_i88.Version>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i88.Version>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i88.Version>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i50.AppInstance>) {
      return (data as List)
              .map((e) => deserialize<_i50.AppInstance>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i50.AppInstance>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i50.AppInstance>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i54.DailyCheckSummary>) {
      return (data as List)
              .map((e) => deserialize<_i54.DailyCheckSummary>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i54.DailyCheckSummary>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i54.DailyCheckSummary>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i55.DailyDimensionSummary>) {
      return (data as List)
              .map((e) => deserialize<_i55.DailyDimensionSummary>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i55.DailyDimensionSummary>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i55.DailyDimensionSummary>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.StoreLinkEntry>) {
      return (data as List)
              .map((e) => deserialize<_i16.StoreLinkEntry>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.StoreLinkEntry>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.StoreLinkEntry>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i38.PlatformType>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i38.PlatformType>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i21.AuthSession>) {
      return (data as List)
              .map((e) => deserialize<_i21.AuthSession>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i21.AuthSession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i21.AuthSession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i35.VerificationCode>) {
      return (data as List)
              .map((e) => deserialize<_i35.VerificationCode>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i35.VerificationCode>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i35.VerificationCode>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i77.Team>) {
      return (data as List).map((e) => deserialize<_i77.Team>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i77.Team>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i77.Team>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i78.TeamMember>) {
      return (data as List).map((e) => deserialize<_i78.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i78.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i78.TeamMember>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i7.Application>) {
      return (data as List).map((e) => deserialize<_i7.Application>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i7.Application>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i7.Application>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i52.DailyActiveUsersEntry>) {
      return (data as List)
              .map((e) => deserialize<_i52.DailyActiveUsersEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i51.CumulativeUsersEntry>) {
      return (data as List)
              .map((e) => deserialize<_i51.CumulativeUsersEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.LocaleStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i59.LocaleStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i61.PlatformStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i61.PlatformStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.OsVersionStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i60.OsVersionStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i56.DeviceModelStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i56.DeviceModelStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i58.HeatmapEntry>) {
      return (data as List)
              .map((e) => deserialize<_i58.HeatmapEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.VersionStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i68.VersionStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i67.VersionAdoptionTimelineEntry>) {
      return (data as List)
              .map((e) => deserialize<_i67.VersionAdoptionTimelineEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i90.VersionListItem>) {
      return (data as List)
              .map((e) => deserialize<_i90.VersionListItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i92.Application>) {
      return (data as List)
              .map((e) => deserialize<_i92.Application>(e))
              .toList()
          as T;
    }
    if (t == List<_i93.SessionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i93.SessionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i94.Team>) {
      return (data as List).map((e) => deserialize<_i94.Team>(e)).toList() as T;
    }
    if (t == List<_i95.TeamMember>) {
      return (data as List).map((e) => deserialize<_i95.TeamMember>(e)).toList()
          as T;
    }
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i2.CheckVersionErrorResponse => 'CheckVersionErrorResponse',
      _i3.CheckVersionRequest => 'CheckVersionRequest',
      _i4.CheckVersionResponse => 'CheckVersionResponse',
      _i5.RecommendedVersionInfo => 'RecommendedVersionInfo',
      _i6.StoreLinkInfo => 'StoreLinkInfo',
      _i7.Application => 'Application',
      _i8.CreateApplicationRequest => 'CreateApplicationRequest',
      _i9.CreateApplicationResponse => 'CreateApplicationResponse',
      _i10.DeleteApplicationRequest => 'DeleteApplicationRequest',
      _i11.RegenerateApiKeyRequest => 'RegenerateApiKeyRequest',
      _i12.RegenerateApiKeyResponse => 'RegenerateApiKeyResponse',
      _i13.RequestApiKeyRegenerationRequest =>
        'RequestApiKeyRegenerationRequest',
      _i14.RequestApiKeyRegenerationResponse =>
        'RequestApiKeyRegenerationResponse',
      _i15.StoreLink => 'StoreLink',
      _i16.StoreLinkEntry => 'StoreLinkEntry',
      _i17.ToggleApplicationStatusRequest => 'ToggleApplicationStatusRequest',
      _i18.TransferApplicationOwnershipRequest =>
        'TransferApplicationOwnershipRequest',
      _i19.UpdateApplicationRequest => 'UpdateApplicationRequest',
      _i20.AuthResponse => 'AuthResponse',
      _i21.AuthSession => 'AuthSession',
      _i22.CheckEmailRequest => 'CheckEmailRequest',
      _i23.CheckEmailAndSendCodeResponse => 'CheckEmailAndSendCodeResponse',
      _i24.UserPublic => 'UserPublic',
      _i25.SuccessResponse => 'SuccessResponse',
      _i26.LoginRequest => 'LoginRequest',
      _i27.RefreshTokenRequest => 'RefreshTokenRequest',
      _i28.RegisterRequest => 'RegisterRequest',
      _i29.RegisterSendCodeRequest => 'RegisterSendCodeRequest',
      _i30.RegisterSetPasswordRequest => 'RegisterSetPasswordRequest',
      _i31.RegisterVerifyCodeRequest => 'RegisterVerifyCodeRequest',
      _i32.SendCodeResponse => 'SendCodeResponse',
      _i33.TokenPairResponse => 'TokenPairResponse',
      _i34.User => 'User',
      _i35.VerificationCode => 'VerificationCode',
      _i36.VerifyCodeResponse => 'VerifyCodeResponse',
      _i37.OwnerType => 'OwnerType',
      _i38.PlatformType => 'PlatformType',
      _i39.RecommendationFrequencyType => 'RecommendationFrequencyType',
      _i40.ResponseStatusType => 'ResponseStatusType',
      _i41.TeamMemberStatusType => 'TeamMemberStatusType',
      _i42.TeamRoleType => 'TeamRoleType',
      _i43.UpdatePriorityType => 'UpdatePriorityType',
      _i44.VerificationPurposeType => 'VerificationPurposeType',
      _i45.InvalidDataException => 'InvalidDataException',
      _i46.TooManyAttemptsException => 'TooManyAttemptsException',
      _i47.Greeting => 'Greeting',
      _i48.SessionInfo => 'SessionInfo',
      _i49.TerminateSessionRequest => 'TerminateSessionRequest',
      _i50.AppInstance => 'AppInstance',
      _i51.CumulativeUsersEntry => 'CumulativeUsersEntry',
      _i52.DailyActiveUsersEntry => 'DailyActiveUsersEntry',
      _i53.DailyActiveUsersResponse => 'DailyActiveUsersResponse',
      _i54.DailyCheckSummary => 'DailyCheckSummary',
      _i55.DailyDimensionSummary => 'DailyDimensionSummary',
      _i56.DeviceModelStatisticsEntry => 'DeviceModelStatisticsEntry',
      _i57.GeoStatisticsResponse => 'GeoStatisticsResponse',
      _i58.HeatmapEntry => 'HeatmapEntry',
      _i59.LocaleStatisticsEntry => 'LocaleStatisticsEntry',
      _i60.OsVersionStatisticsEntry => 'OsVersionStatisticsEntry',
      _i61.PlatformStatisticsEntry => 'PlatformStatisticsEntry',
      _i62.PlatformStatisticsResponse => 'PlatformStatisticsResponse',
      _i63.StatisticsExportData => 'StatisticsExportData',
      _i64.StatisticsFilter => 'StatisticsFilter',
      _i65.StatisticsOverviewResponse => 'StatisticsOverviewResponse',
      _i66.TimeAnalyticsResponse => 'TimeAnalyticsResponse',
      _i67.VersionAdoptionTimelineEntry => 'VersionAdoptionTimelineEntry',
      _i68.VersionStatisticsEntry => 'VersionStatisticsEntry',
      _i69.VersionStatisticsResponse => 'VersionStatisticsResponse',
      _i70.CreateTeamRequest => 'CreateTeamRequest',
      _i71.DeleteTeamRequest => 'DeleteTeamRequest',
      _i72.InviteTeamMemberRequest => 'InviteTeamMemberRequest',
      _i73.LeaveTeamRequest => 'LeaveTeamRequest',
      _i74.RemoveMemberRequest => 'RemoveMemberRequest',
      _i75.RespondToInvitationRequest => 'RespondToInvitationRequest',
      _i76.RevokeInvitationRequest => 'RevokeInvitationRequest',
      _i77.Team => 'Team',
      _i78.TeamMember => 'TeamMember',
      _i79.TransferTeamOwnershipRequest => 'TransferTeamOwnershipRequest',
      _i80.UpdateMemberRoleRequest => 'UpdateMemberRoleRequest',
      _i81.UpdateTeamRequest => 'UpdateTeamRequest',
      _i82.CreateVersionRequest => 'CreateVersionRequest',
      _i83.DeleteVersionRequest => 'DeleteVersionRequest',
      _i84.NextBuildNumberResponse => 'NextBuildNumberResponse',
      _i85.SetVersionRecommendationRequest => 'SetVersionRecommendationRequest',
      _i86.ToggleVersionBlockRequest => 'ToggleVersionBlockRequest',
      _i87.UpdateVersionRequest => 'UpdateVersionRequest',
      _i88.Version => 'Version',
      _i89.VersionDetailResponse => 'VersionDetailResponse',
      _i90.VersionListItem => 'VersionListItem',
      _i91.VersionListResponse => 'VersionListResponse',
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
      case _i2.CheckVersionErrorResponse():
        return 'CheckVersionErrorResponse';
      case _i3.CheckVersionRequest():
        return 'CheckVersionRequest';
      case _i4.CheckVersionResponse():
        return 'CheckVersionResponse';
      case _i5.RecommendedVersionInfo():
        return 'RecommendedVersionInfo';
      case _i6.StoreLinkInfo():
        return 'StoreLinkInfo';
      case _i7.Application():
        return 'Application';
      case _i8.CreateApplicationRequest():
        return 'CreateApplicationRequest';
      case _i9.CreateApplicationResponse():
        return 'CreateApplicationResponse';
      case _i10.DeleteApplicationRequest():
        return 'DeleteApplicationRequest';
      case _i11.RegenerateApiKeyRequest():
        return 'RegenerateApiKeyRequest';
      case _i12.RegenerateApiKeyResponse():
        return 'RegenerateApiKeyResponse';
      case _i13.RequestApiKeyRegenerationRequest():
        return 'RequestApiKeyRegenerationRequest';
      case _i14.RequestApiKeyRegenerationResponse():
        return 'RequestApiKeyRegenerationResponse';
      case _i15.StoreLink():
        return 'StoreLink';
      case _i16.StoreLinkEntry():
        return 'StoreLinkEntry';
      case _i17.ToggleApplicationStatusRequest():
        return 'ToggleApplicationStatusRequest';
      case _i18.TransferApplicationOwnershipRequest():
        return 'TransferApplicationOwnershipRequest';
      case _i19.UpdateApplicationRequest():
        return 'UpdateApplicationRequest';
      case _i20.AuthResponse():
        return 'AuthResponse';
      case _i21.AuthSession():
        return 'AuthSession';
      case _i22.CheckEmailRequest():
        return 'CheckEmailRequest';
      case _i23.CheckEmailAndSendCodeResponse():
        return 'CheckEmailAndSendCodeResponse';
      case _i24.UserPublic():
        return 'UserPublic';
      case _i25.SuccessResponse():
        return 'SuccessResponse';
      case _i26.LoginRequest():
        return 'LoginRequest';
      case _i27.RefreshTokenRequest():
        return 'RefreshTokenRequest';
      case _i28.RegisterRequest():
        return 'RegisterRequest';
      case _i29.RegisterSendCodeRequest():
        return 'RegisterSendCodeRequest';
      case _i30.RegisterSetPasswordRequest():
        return 'RegisterSetPasswordRequest';
      case _i31.RegisterVerifyCodeRequest():
        return 'RegisterVerifyCodeRequest';
      case _i32.SendCodeResponse():
        return 'SendCodeResponse';
      case _i33.TokenPairResponse():
        return 'TokenPairResponse';
      case _i34.User():
        return 'User';
      case _i35.VerificationCode():
        return 'VerificationCode';
      case _i36.VerifyCodeResponse():
        return 'VerifyCodeResponse';
      case _i37.OwnerType():
        return 'OwnerType';
      case _i38.PlatformType():
        return 'PlatformType';
      case _i39.RecommendationFrequencyType():
        return 'RecommendationFrequencyType';
      case _i40.ResponseStatusType():
        return 'ResponseStatusType';
      case _i41.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i42.TeamRoleType():
        return 'TeamRoleType';
      case _i43.UpdatePriorityType():
        return 'UpdatePriorityType';
      case _i44.VerificationPurposeType():
        return 'VerificationPurposeType';
      case _i45.InvalidDataException():
        return 'InvalidDataException';
      case _i46.TooManyAttemptsException():
        return 'TooManyAttemptsException';
      case _i47.Greeting():
        return 'Greeting';
      case _i48.SessionInfo():
        return 'SessionInfo';
      case _i49.TerminateSessionRequest():
        return 'TerminateSessionRequest';
      case _i50.AppInstance():
        return 'AppInstance';
      case _i51.CumulativeUsersEntry():
        return 'CumulativeUsersEntry';
      case _i52.DailyActiveUsersEntry():
        return 'DailyActiveUsersEntry';
      case _i53.DailyActiveUsersResponse():
        return 'DailyActiveUsersResponse';
      case _i54.DailyCheckSummary():
        return 'DailyCheckSummary';
      case _i55.DailyDimensionSummary():
        return 'DailyDimensionSummary';
      case _i56.DeviceModelStatisticsEntry():
        return 'DeviceModelStatisticsEntry';
      case _i57.GeoStatisticsResponse():
        return 'GeoStatisticsResponse';
      case _i58.HeatmapEntry():
        return 'HeatmapEntry';
      case _i59.LocaleStatisticsEntry():
        return 'LocaleStatisticsEntry';
      case _i60.OsVersionStatisticsEntry():
        return 'OsVersionStatisticsEntry';
      case _i61.PlatformStatisticsEntry():
        return 'PlatformStatisticsEntry';
      case _i62.PlatformStatisticsResponse():
        return 'PlatformStatisticsResponse';
      case _i63.StatisticsExportData():
        return 'StatisticsExportData';
      case _i64.StatisticsFilter():
        return 'StatisticsFilter';
      case _i65.StatisticsOverviewResponse():
        return 'StatisticsOverviewResponse';
      case _i66.TimeAnalyticsResponse():
        return 'TimeAnalyticsResponse';
      case _i67.VersionAdoptionTimelineEntry():
        return 'VersionAdoptionTimelineEntry';
      case _i68.VersionStatisticsEntry():
        return 'VersionStatisticsEntry';
      case _i69.VersionStatisticsResponse():
        return 'VersionStatisticsResponse';
      case _i70.CreateTeamRequest():
        return 'CreateTeamRequest';
      case _i71.DeleteTeamRequest():
        return 'DeleteTeamRequest';
      case _i72.InviteTeamMemberRequest():
        return 'InviteTeamMemberRequest';
      case _i73.LeaveTeamRequest():
        return 'LeaveTeamRequest';
      case _i74.RemoveMemberRequest():
        return 'RemoveMemberRequest';
      case _i75.RespondToInvitationRequest():
        return 'RespondToInvitationRequest';
      case _i76.RevokeInvitationRequest():
        return 'RevokeInvitationRequest';
      case _i77.Team():
        return 'Team';
      case _i78.TeamMember():
        return 'TeamMember';
      case _i79.TransferTeamOwnershipRequest():
        return 'TransferTeamOwnershipRequest';
      case _i80.UpdateMemberRoleRequest():
        return 'UpdateMemberRoleRequest';
      case _i81.UpdateTeamRequest():
        return 'UpdateTeamRequest';
      case _i82.CreateVersionRequest():
        return 'CreateVersionRequest';
      case _i83.DeleteVersionRequest():
        return 'DeleteVersionRequest';
      case _i84.NextBuildNumberResponse():
        return 'NextBuildNumberResponse';
      case _i85.SetVersionRecommendationRequest():
        return 'SetVersionRecommendationRequest';
      case _i86.ToggleVersionBlockRequest():
        return 'ToggleVersionBlockRequest';
      case _i87.UpdateVersionRequest():
        return 'UpdateVersionRequest';
      case _i88.Version():
        return 'Version';
      case _i89.VersionDetailResponse():
        return 'VersionDetailResponse';
      case _i90.VersionListItem():
        return 'VersionListItem';
      case _i91.VersionListResponse():
        return 'VersionListResponse';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'CheckVersionErrorResponse') {
      return deserialize<_i2.CheckVersionErrorResponse>(data['data']);
    }
    if (dataClassName == 'CheckVersionRequest') {
      return deserialize<_i3.CheckVersionRequest>(data['data']);
    }
    if (dataClassName == 'CheckVersionResponse') {
      return deserialize<_i4.CheckVersionResponse>(data['data']);
    }
    if (dataClassName == 'RecommendedVersionInfo') {
      return deserialize<_i5.RecommendedVersionInfo>(data['data']);
    }
    if (dataClassName == 'StoreLinkInfo') {
      return deserialize<_i6.StoreLinkInfo>(data['data']);
    }
    if (dataClassName == 'Application') {
      return deserialize<_i7.Application>(data['data']);
    }
    if (dataClassName == 'CreateApplicationRequest') {
      return deserialize<_i8.CreateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'CreateApplicationResponse') {
      return deserialize<_i9.CreateApplicationResponse>(data['data']);
    }
    if (dataClassName == 'DeleteApplicationRequest') {
      return deserialize<_i10.DeleteApplicationRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyRequest') {
      return deserialize<_i11.RegenerateApiKeyRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyResponse') {
      return deserialize<_i12.RegenerateApiKeyResponse>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationRequest') {
      return deserialize<_i13.RequestApiKeyRegenerationRequest>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationResponse') {
      return deserialize<_i14.RequestApiKeyRegenerationResponse>(data['data']);
    }
    if (dataClassName == 'StoreLink') {
      return deserialize<_i15.StoreLink>(data['data']);
    }
    if (dataClassName == 'StoreLinkEntry') {
      return deserialize<_i16.StoreLinkEntry>(data['data']);
    }
    if (dataClassName == 'ToggleApplicationStatusRequest') {
      return deserialize<_i17.ToggleApplicationStatusRequest>(data['data']);
    }
    if (dataClassName == 'TransferApplicationOwnershipRequest') {
      return deserialize<_i18.TransferApplicationOwnershipRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateApplicationRequest') {
      return deserialize<_i19.UpdateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i20.AuthResponse>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i21.AuthSession>(data['data']);
    }
    if (dataClassName == 'CheckEmailRequest') {
      return deserialize<_i22.CheckEmailRequest>(data['data']);
    }
    if (dataClassName == 'CheckEmailAndSendCodeResponse') {
      return deserialize<_i23.CheckEmailAndSendCodeResponse>(data['data']);
    }
    if (dataClassName == 'UserPublic') {
      return deserialize<_i24.UserPublic>(data['data']);
    }
    if (dataClassName == 'SuccessResponse') {
      return deserialize<_i25.SuccessResponse>(data['data']);
    }
    if (dataClassName == 'LoginRequest') {
      return deserialize<_i26.LoginRequest>(data['data']);
    }
    if (dataClassName == 'RefreshTokenRequest') {
      return deserialize<_i27.RefreshTokenRequest>(data['data']);
    }
    if (dataClassName == 'RegisterRequest') {
      return deserialize<_i28.RegisterRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSendCodeRequest') {
      return deserialize<_i29.RegisterSendCodeRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSetPasswordRequest') {
      return deserialize<_i30.RegisterSetPasswordRequest>(data['data']);
    }
    if (dataClassName == 'RegisterVerifyCodeRequest') {
      return deserialize<_i31.RegisterVerifyCodeRequest>(data['data']);
    }
    if (dataClassName == 'SendCodeResponse') {
      return deserialize<_i32.SendCodeResponse>(data['data']);
    }
    if (dataClassName == 'TokenPairResponse') {
      return deserialize<_i33.TokenPairResponse>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i34.User>(data['data']);
    }
    if (dataClassName == 'VerificationCode') {
      return deserialize<_i35.VerificationCode>(data['data']);
    }
    if (dataClassName == 'VerifyCodeResponse') {
      return deserialize<_i36.VerifyCodeResponse>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i37.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i38.PlatformType>(data['data']);
    }
    if (dataClassName == 'RecommendationFrequencyType') {
      return deserialize<_i39.RecommendationFrequencyType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i40.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i41.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i42.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'UpdatePriorityType') {
      return deserialize<_i43.UpdatePriorityType>(data['data']);
    }
    if (dataClassName == 'VerificationPurposeType') {
      return deserialize<_i44.VerificationPurposeType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i45.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'TooManyAttemptsException') {
      return deserialize<_i46.TooManyAttemptsException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i47.Greeting>(data['data']);
    }
    if (dataClassName == 'SessionInfo') {
      return deserialize<_i48.SessionInfo>(data['data']);
    }
    if (dataClassName == 'TerminateSessionRequest') {
      return deserialize<_i49.TerminateSessionRequest>(data['data']);
    }
    if (dataClassName == 'AppInstance') {
      return deserialize<_i50.AppInstance>(data['data']);
    }
    if (dataClassName == 'CumulativeUsersEntry') {
      return deserialize<_i51.CumulativeUsersEntry>(data['data']);
    }
    if (dataClassName == 'DailyActiveUsersEntry') {
      return deserialize<_i52.DailyActiveUsersEntry>(data['data']);
    }
    if (dataClassName == 'DailyActiveUsersResponse') {
      return deserialize<_i53.DailyActiveUsersResponse>(data['data']);
    }
    if (dataClassName == 'DailyCheckSummary') {
      return deserialize<_i54.DailyCheckSummary>(data['data']);
    }
    if (dataClassName == 'DailyDimensionSummary') {
      return deserialize<_i55.DailyDimensionSummary>(data['data']);
    }
    if (dataClassName == 'DeviceModelStatisticsEntry') {
      return deserialize<_i56.DeviceModelStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'GeoStatisticsResponse') {
      return deserialize<_i57.GeoStatisticsResponse>(data['data']);
    }
    if (dataClassName == 'HeatmapEntry') {
      return deserialize<_i58.HeatmapEntry>(data['data']);
    }
    if (dataClassName == 'LocaleStatisticsEntry') {
      return deserialize<_i59.LocaleStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'OsVersionStatisticsEntry') {
      return deserialize<_i60.OsVersionStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'PlatformStatisticsEntry') {
      return deserialize<_i61.PlatformStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'PlatformStatisticsResponse') {
      return deserialize<_i62.PlatformStatisticsResponse>(data['data']);
    }
    if (dataClassName == 'StatisticsExportData') {
      return deserialize<_i63.StatisticsExportData>(data['data']);
    }
    if (dataClassName == 'StatisticsFilter') {
      return deserialize<_i64.StatisticsFilter>(data['data']);
    }
    if (dataClassName == 'StatisticsOverviewResponse') {
      return deserialize<_i65.StatisticsOverviewResponse>(data['data']);
    }
    if (dataClassName == 'TimeAnalyticsResponse') {
      return deserialize<_i66.TimeAnalyticsResponse>(data['data']);
    }
    if (dataClassName == 'VersionAdoptionTimelineEntry') {
      return deserialize<_i67.VersionAdoptionTimelineEntry>(data['data']);
    }
    if (dataClassName == 'VersionStatisticsEntry') {
      return deserialize<_i68.VersionStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'VersionStatisticsResponse') {
      return deserialize<_i69.VersionStatisticsResponse>(data['data']);
    }
    if (dataClassName == 'CreateTeamRequest') {
      return deserialize<_i70.CreateTeamRequest>(data['data']);
    }
    if (dataClassName == 'DeleteTeamRequest') {
      return deserialize<_i71.DeleteTeamRequest>(data['data']);
    }
    if (dataClassName == 'InviteTeamMemberRequest') {
      return deserialize<_i72.InviteTeamMemberRequest>(data['data']);
    }
    if (dataClassName == 'LeaveTeamRequest') {
      return deserialize<_i73.LeaveTeamRequest>(data['data']);
    }
    if (dataClassName == 'RemoveMemberRequest') {
      return deserialize<_i74.RemoveMemberRequest>(data['data']);
    }
    if (dataClassName == 'RespondToInvitationRequest') {
      return deserialize<_i75.RespondToInvitationRequest>(data['data']);
    }
    if (dataClassName == 'RevokeInvitationRequest') {
      return deserialize<_i76.RevokeInvitationRequest>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i77.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i78.TeamMember>(data['data']);
    }
    if (dataClassName == 'TransferTeamOwnershipRequest') {
      return deserialize<_i79.TransferTeamOwnershipRequest>(data['data']);
    }
    if (dataClassName == 'UpdateMemberRoleRequest') {
      return deserialize<_i80.UpdateMemberRoleRequest>(data['data']);
    }
    if (dataClassName == 'UpdateTeamRequest') {
      return deserialize<_i81.UpdateTeamRequest>(data['data']);
    }
    if (dataClassName == 'CreateVersionRequest') {
      return deserialize<_i82.CreateVersionRequest>(data['data']);
    }
    if (dataClassName == 'DeleteVersionRequest') {
      return deserialize<_i83.DeleteVersionRequest>(data['data']);
    }
    if (dataClassName == 'NextBuildNumberResponse') {
      return deserialize<_i84.NextBuildNumberResponse>(data['data']);
    }
    if (dataClassName == 'SetVersionRecommendationRequest') {
      return deserialize<_i85.SetVersionRecommendationRequest>(data['data']);
    }
    if (dataClassName == 'ToggleVersionBlockRequest') {
      return deserialize<_i86.ToggleVersionBlockRequest>(data['data']);
    }
    if (dataClassName == 'UpdateVersionRequest') {
      return deserialize<_i87.UpdateVersionRequest>(data['data']);
    }
    if (dataClassName == 'Version') {
      return deserialize<_i88.Version>(data['data']);
    }
    if (dataClassName == 'VersionDetailResponse') {
      return deserialize<_i89.VersionDetailResponse>(data['data']);
    }
    if (dataClassName == 'VersionListItem') {
      return deserialize<_i90.VersionListItem>(data['data']);
    }
    if (dataClassName == 'VersionListResponse') {
      return deserialize<_i91.VersionListResponse>(data['data']);
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
