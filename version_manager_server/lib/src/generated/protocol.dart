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
import 'package:serverpod/protocol.dart' as _i2;
import 'api/check_version_error_response.dart' as _i3;
import 'api/check_version_request.dart' as _i4;
import 'api/check_version_response.dart' as _i5;
import 'api/recommended_version_info.dart' as _i6;
import 'api/store_link_info.dart' as _i7;
import 'apps/application.dart' as _i8;
import 'apps/create_application_request.dart' as _i9;
import 'apps/create_application_response.dart' as _i10;
import 'apps/delete_application_request.dart' as _i11;
import 'apps/regenerate_api_key_request.dart' as _i12;
import 'apps/regenerate_api_key_response.dart' as _i13;
import 'apps/request_api_key_regeneration_request.dart' as _i14;
import 'apps/request_api_key_regeneration_response.dart' as _i15;
import 'apps/store_link.dart' as _i16;
import 'apps/store_link_entry.dart' as _i17;
import 'apps/toggle_application_status_request.dart' as _i18;
import 'apps/transfer_application_ownership_request.dart' as _i19;
import 'apps/update_application_request.dart' as _i20;
import 'auth/auth_response.dart' as _i21;
import 'auth/auth_session.dart' as _i22;
import 'auth/check_email.dart' as _i23;
import 'auth/check_email_and_send_code_response.dart' as _i24;
import 'auth/common.dart' as _i25;
import 'auth/common_success.dart' as _i26;
import 'auth/login.dart' as _i27;
import 'auth/refresh_token.dart' as _i28;
import 'auth/register.dart' as _i29;
import 'auth/register_send_code.dart' as _i30;
import 'auth/register_set_password.dart' as _i31;
import 'auth/register_verify_code.dart' as _i32;
import 'auth/send_code_response.dart' as _i33;
import 'auth/token_pair_response.dart' as _i34;
import 'auth/user.dart' as _i35;
import 'auth/verification_code.dart' as _i36;
import 'auth/verify_code_response.dart' as _i37;
import 'enums/owner_type.dart' as _i38;
import 'enums/platform_type.dart' as _i39;
import 'enums/recommendation_frequency_type.dart' as _i40;
import 'enums/response_status_type.dart' as _i41;
import 'enums/team_member_status_type.dart' as _i42;
import 'enums/team_role_type.dart' as _i43;
import 'enums/update_priority_type.dart' as _i44;
import 'enums/verification_putpose_type.dart' as _i45;
import 'exceptions/invalid_data_exception.dart' as _i46;
import 'exceptions/too_many_attempts_exception.dart' as _i47;
import 'greetings/greeting.dart' as _i48;
import 'sessions/session_info.dart' as _i49;
import 'sessions/terminate_session_request.dart' as _i50;
import 'statistics/app_instance.dart' as _i51;
import 'statistics/cumulative_users_entry.dart' as _i52;
import 'statistics/daily_active_users_entry.dart' as _i53;
import 'statistics/daily_active_users_response.dart' as _i54;
import 'statistics/daily_check_summary.dart' as _i55;
import 'statistics/daily_dimension_summary.dart' as _i56;
import 'statistics/device_model_statistics_entry.dart' as _i57;
import 'statistics/geo_statistics_response.dart' as _i58;
import 'statistics/heatmap_entry.dart' as _i59;
import 'statistics/locale_statistics_entry.dart' as _i60;
import 'statistics/os_version_statistics_entry.dart' as _i61;
import 'statistics/platform_statistics_entry.dart' as _i62;
import 'statistics/platform_statistics_response.dart' as _i63;
import 'statistics/statistics_export_data.dart' as _i64;
import 'statistics/statistics_filter.dart' as _i65;
import 'statistics/statistics_overview_response.dart' as _i66;
import 'statistics/time_analytics_response.dart' as _i67;
import 'statistics/version_adoption_timeline_entry.dart' as _i68;
import 'statistics/version_statistics_entry.dart' as _i69;
import 'statistics/version_statistics_response.dart' as _i70;
import 'teams/create_team_request.dart' as _i71;
import 'teams/delete_team_request.dart' as _i72;
import 'teams/invite_team_member_request.dart' as _i73;
import 'teams/leave_team_request.dart' as _i74;
import 'teams/remove_member_request.dart' as _i75;
import 'teams/respond_to_invitation_request.dart' as _i76;
import 'teams/revoke_invitation_request.dart' as _i77;
import 'teams/team.dart' as _i78;
import 'teams/team_member.dart' as _i79;
import 'teams/transfer_team_ownership_request.dart' as _i80;
import 'teams/update_member_role_request.dart' as _i81;
import 'teams/update_team_request.dart' as _i82;
import 'versions/create_version_request.dart' as _i83;
import 'versions/delete_version_request.dart' as _i84;
import 'versions/next_build_number_response.dart' as _i85;
import 'versions/set_version_recommendation_request.dart' as _i86;
import 'versions/toggle_version_block_request.dart' as _i87;
import 'versions/update_version_request.dart' as _i88;
import 'versions/version.dart' as _i89;
import 'versions/version_detail_response.dart' as _i90;
import 'versions/version_list_item.dart' as _i91;
import 'versions/version_list_response.dart' as _i92;
import 'package:version_manager_server/src/generated/apps/application.dart'
    as _i93;
import 'package:version_manager_server/src/generated/sessions/session_info.dart'
    as _i94;
import 'package:version_manager_server/src/generated/teams/team.dart' as _i95;
import 'package:version_manager_server/src/generated/teams/team_member.dart'
    as _i96;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'app_instances',
      dartName: 'AppInstance',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'instanceId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PlatformType',
        ),
        _i2.ColumnDefinition(
          name: 'firstSeenAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'lastSeenAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'lastActiveDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'app_instances_fk_0',
          columns: ['applicationId'],
          referenceTable: 'applications',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'app_instances_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_app_instance_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'instanceId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_application_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_first_seen_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'firstSeenAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_last_seen_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'lastSeenAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'ai_app_platform_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'platform',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'applications',
      dartName: 'Application',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'namespace',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'iconUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'platforms',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:PlatformType>',
        ),
        _i2.ColumnDefinition(
          name: 'ownerType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:OwnerType',
        ),
        _i2.ColumnDefinition(
          name: 'ownerUserId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'ownerTeamId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'apiKeyHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'apiKeyLast4',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'apiKeyCreatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'apiKeyLastRegeneratedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'applications_fk_0',
          columns: ['ownerUserId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'applications_fk_1',
          columns: ['ownerTeamId'],
          referenceTable: 'teams',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'applications_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'application_namespace_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'namespace',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'application_owner_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerUserId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'application_owner_team_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerTeamId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'application_api_key_hash_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'apiKeyHash',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'auth_sessions',
      dartName: 'AuthSession',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'tokenHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'refreshTokenHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'deviceInfo',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'ipAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userAgent',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'refreshExpiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'lastActivityAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'revokedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'auth_sessions_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'auth_sessions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_session_token_hash_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tokenHash',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_session_refresh_token_hash_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'refreshTokenHash',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_session_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_session_is_active_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'isActive',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'auth_session_expires_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'expiresAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'daily_check_summaries',
      dartName: 'DailyCheckSummary',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PlatformType',
        ),
        _i2.ColumnDefinition(
          name: 'buildNumber',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'versionNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'uniqueDevices',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'newDevices',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'totalChecks',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'blockedChecks',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'updateAvailableChecks',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'activeChecks',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'errorChecks',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'avgProcessingTimeMs',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'maxProcessingTimeMs',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'daily_check_summaries_fk_0',
          columns: ['applicationId'],
          referenceTable: 'applications',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'daily_check_summaries_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'dcs_app_date_platform_build_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'platform',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dcs_application_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dcs_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dcs_app_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dcs_platform_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'platform',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'daily_dimension_summaries',
      dartName: 'DailyDimensionSummary',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'date',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'dimensionType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dimensionValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PlatformType',
        ),
        _i2.ColumnDefinition(
          name: 'checkCount',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'daily_dimension_summaries_fk_0',
          columns: ['applicationId'],
          referenceTable: 'applications',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'daily_dimension_summaries_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'dds_app_date_dim_val_plat_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dimensionType',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dimensionValue',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'platform',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dds_application_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dds_app_date_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dds_app_dim_type_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dimensionType',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'dds_app_date_dim_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'date',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'dimensionType',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'store_links',
      dartName: 'StoreLink',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PlatformType',
        ),
        _i2.ColumnDefinition(
          name: 'storeName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'url',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'store_links_fk_0',
          columns: ['applicationId'],
          referenceTable: 'applications',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'store_links_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'store_link_application_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'store_link_platform_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'platform',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'store_link_app_platform_url_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'platform',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'url',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'team_members',
      dartName: 'TeamMember',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'teamId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'role',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TeamRoleType',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TeamMemberStatusType',
          columnDefault: '\'invited\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'invitedById',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'invitedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'joinedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'invitationExpiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'team_members_fk_0',
          columns: ['teamId'],
          referenceTable: 'teams',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'team_members_fk_1',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'team_members_fk_2',
          columns: ['invitedById'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'team_members_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'team_member_team_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'teamId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'team_member_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'team_member_status_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'status',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'team_member_invited_by_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'invitedById',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'team_member_team_user_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'teamId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'teams',
      dartName: 'Team',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'ownerId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'teams_fk_0',
          columns: ['ownerId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'teams_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'team_owner_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'ownerId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'users',
      dartName: 'User',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'passwordHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'displayName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'avatarUrl',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isEmailVerified',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'emailVerifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'lastLoginAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'users_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_email_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'verification_codes',
      dartName: 'VerificationCode',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'purpose',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:VerificationPurposeType',
        ),
        _i2.ColumnDefinition(
          name: 'codeHash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'expiresAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'isUsed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'usedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'attemptsUsed',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '0',
        ),
        _i2.ColumnDefinition(
          name: 'maxAttempts',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
          columnDefault: '5',
        ),
        _i2.ColumnDefinition(
          name: 'resendAvailableAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'ipAddress',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userAgent',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'verification_codes_fk_0',
          columns: ['userId'],
          referenceTable: 'users',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'verification_codes_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'verification_code_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'email',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'verification_code_purpose_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'purpose',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'verification_code_user_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'verification_code_expires_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'expiresAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'verification_code_is_used_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'isUsed',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'versions',
      dartName: 'Version',
      schema: 'public',
      module: 'version_manager',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue?',
          columnDefault: 'gen_random_uuid_v7()',
        ),
        _i2.ColumnDefinition(
          name: 'applicationId',
          columnType: _i2.ColumnType.uuid,
          isNullable: false,
          dartType: 'UuidValue',
        ),
        _i2.ColumnDefinition(
          name: 'versionNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'buildNumber',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'changelog',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isBlocked',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'blockReason',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'recommendedVersionId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
        ),
        _i2.ColumnDefinition(
          name: 'recommendationFrequency',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'protocol:RecommendationFrequencyType?',
        ),
        _i2.ColumnDefinition(
          name: 'recommendationEveryNthLaunch',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'recommendationPeriodHours',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'versions_fk_0',
          columns: ['applicationId'],
          referenceTable: 'applications',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'versions_fk_1',
          columns: ['recommendedVersionId'],
          referenceTable: 'versions',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.setNull,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'versions_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'version_application_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'version_build_number_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildNumber',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'version_recommended_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'recommendedVersionId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'version_app_version_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'versionNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'version_app_build_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'buildNumber',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

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

    if (t == _i3.CheckVersionErrorResponse) {
      return _i3.CheckVersionErrorResponse.fromJson(data) as T;
    }
    if (t == _i4.CheckVersionRequest) {
      return _i4.CheckVersionRequest.fromJson(data) as T;
    }
    if (t == _i5.CheckVersionResponse) {
      return _i5.CheckVersionResponse.fromJson(data) as T;
    }
    if (t == _i6.RecommendedVersionInfo) {
      return _i6.RecommendedVersionInfo.fromJson(data) as T;
    }
    if (t == _i7.StoreLinkInfo) {
      return _i7.StoreLinkInfo.fromJson(data) as T;
    }
    if (t == _i8.Application) {
      return _i8.Application.fromJson(data) as T;
    }
    if (t == _i9.CreateApplicationRequest) {
      return _i9.CreateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i10.CreateApplicationResponse) {
      return _i10.CreateApplicationResponse.fromJson(data) as T;
    }
    if (t == _i11.DeleteApplicationRequest) {
      return _i11.DeleteApplicationRequest.fromJson(data) as T;
    }
    if (t == _i12.RegenerateApiKeyRequest) {
      return _i12.RegenerateApiKeyRequest.fromJson(data) as T;
    }
    if (t == _i13.RegenerateApiKeyResponse) {
      return _i13.RegenerateApiKeyResponse.fromJson(data) as T;
    }
    if (t == _i14.RequestApiKeyRegenerationRequest) {
      return _i14.RequestApiKeyRegenerationRequest.fromJson(data) as T;
    }
    if (t == _i15.RequestApiKeyRegenerationResponse) {
      return _i15.RequestApiKeyRegenerationResponse.fromJson(data) as T;
    }
    if (t == _i16.StoreLink) {
      return _i16.StoreLink.fromJson(data) as T;
    }
    if (t == _i17.StoreLinkEntry) {
      return _i17.StoreLinkEntry.fromJson(data) as T;
    }
    if (t == _i18.ToggleApplicationStatusRequest) {
      return _i18.ToggleApplicationStatusRequest.fromJson(data) as T;
    }
    if (t == _i19.TransferApplicationOwnershipRequest) {
      return _i19.TransferApplicationOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i20.UpdateApplicationRequest) {
      return _i20.UpdateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i21.AuthResponse) {
      return _i21.AuthResponse.fromJson(data) as T;
    }
    if (t == _i22.AuthSession) {
      return _i22.AuthSession.fromJson(data) as T;
    }
    if (t == _i23.CheckEmailRequest) {
      return _i23.CheckEmailRequest.fromJson(data) as T;
    }
    if (t == _i24.CheckEmailAndSendCodeResponse) {
      return _i24.CheckEmailAndSendCodeResponse.fromJson(data) as T;
    }
    if (t == _i25.UserPublic) {
      return _i25.UserPublic.fromJson(data) as T;
    }
    if (t == _i26.SuccessResponse) {
      return _i26.SuccessResponse.fromJson(data) as T;
    }
    if (t == _i27.LoginRequest) {
      return _i27.LoginRequest.fromJson(data) as T;
    }
    if (t == _i28.RefreshTokenRequest) {
      return _i28.RefreshTokenRequest.fromJson(data) as T;
    }
    if (t == _i29.RegisterRequest) {
      return _i29.RegisterRequest.fromJson(data) as T;
    }
    if (t == _i30.RegisterSendCodeRequest) {
      return _i30.RegisterSendCodeRequest.fromJson(data) as T;
    }
    if (t == _i31.RegisterSetPasswordRequest) {
      return _i31.RegisterSetPasswordRequest.fromJson(data) as T;
    }
    if (t == _i32.RegisterVerifyCodeRequest) {
      return _i32.RegisterVerifyCodeRequest.fromJson(data) as T;
    }
    if (t == _i33.SendCodeResponse) {
      return _i33.SendCodeResponse.fromJson(data) as T;
    }
    if (t == _i34.TokenPairResponse) {
      return _i34.TokenPairResponse.fromJson(data) as T;
    }
    if (t == _i35.User) {
      return _i35.User.fromJson(data) as T;
    }
    if (t == _i36.VerificationCode) {
      return _i36.VerificationCode.fromJson(data) as T;
    }
    if (t == _i37.VerifyCodeResponse) {
      return _i37.VerifyCodeResponse.fromJson(data) as T;
    }
    if (t == _i38.OwnerType) {
      return _i38.OwnerType.fromJson(data) as T;
    }
    if (t == _i39.PlatformType) {
      return _i39.PlatformType.fromJson(data) as T;
    }
    if (t == _i40.RecommendationFrequencyType) {
      return _i40.RecommendationFrequencyType.fromJson(data) as T;
    }
    if (t == _i41.ResponseStatusType) {
      return _i41.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i42.TeamMemberStatusType) {
      return _i42.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i43.TeamRoleType) {
      return _i43.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i44.UpdatePriorityType) {
      return _i44.UpdatePriorityType.fromJson(data) as T;
    }
    if (t == _i45.VerificationPurposeType) {
      return _i45.VerificationPurposeType.fromJson(data) as T;
    }
    if (t == _i46.InvalidDataException) {
      return _i46.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i47.TooManyAttemptsException) {
      return _i47.TooManyAttemptsException.fromJson(data) as T;
    }
    if (t == _i48.Greeting) {
      return _i48.Greeting.fromJson(data) as T;
    }
    if (t == _i49.SessionInfo) {
      return _i49.SessionInfo.fromJson(data) as T;
    }
    if (t == _i50.TerminateSessionRequest) {
      return _i50.TerminateSessionRequest.fromJson(data) as T;
    }
    if (t == _i51.AppInstance) {
      return _i51.AppInstance.fromJson(data) as T;
    }
    if (t == _i52.CumulativeUsersEntry) {
      return _i52.CumulativeUsersEntry.fromJson(data) as T;
    }
    if (t == _i53.DailyActiveUsersEntry) {
      return _i53.DailyActiveUsersEntry.fromJson(data) as T;
    }
    if (t == _i54.DailyActiveUsersResponse) {
      return _i54.DailyActiveUsersResponse.fromJson(data) as T;
    }
    if (t == _i55.DailyCheckSummary) {
      return _i55.DailyCheckSummary.fromJson(data) as T;
    }
    if (t == _i56.DailyDimensionSummary) {
      return _i56.DailyDimensionSummary.fromJson(data) as T;
    }
    if (t == _i57.DeviceModelStatisticsEntry) {
      return _i57.DeviceModelStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i58.GeoStatisticsResponse) {
      return _i58.GeoStatisticsResponse.fromJson(data) as T;
    }
    if (t == _i59.HeatmapEntry) {
      return _i59.HeatmapEntry.fromJson(data) as T;
    }
    if (t == _i60.LocaleStatisticsEntry) {
      return _i60.LocaleStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i61.OsVersionStatisticsEntry) {
      return _i61.OsVersionStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i62.PlatformStatisticsEntry) {
      return _i62.PlatformStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i63.PlatformStatisticsResponse) {
      return _i63.PlatformStatisticsResponse.fromJson(data) as T;
    }
    if (t == _i64.StatisticsExportData) {
      return _i64.StatisticsExportData.fromJson(data) as T;
    }
    if (t == _i65.StatisticsFilter) {
      return _i65.StatisticsFilter.fromJson(data) as T;
    }
    if (t == _i66.StatisticsOverviewResponse) {
      return _i66.StatisticsOverviewResponse.fromJson(data) as T;
    }
    if (t == _i67.TimeAnalyticsResponse) {
      return _i67.TimeAnalyticsResponse.fromJson(data) as T;
    }
    if (t == _i68.VersionAdoptionTimelineEntry) {
      return _i68.VersionAdoptionTimelineEntry.fromJson(data) as T;
    }
    if (t == _i69.VersionStatisticsEntry) {
      return _i69.VersionStatisticsEntry.fromJson(data) as T;
    }
    if (t == _i70.VersionStatisticsResponse) {
      return _i70.VersionStatisticsResponse.fromJson(data) as T;
    }
    if (t == _i71.CreateTeamRequest) {
      return _i71.CreateTeamRequest.fromJson(data) as T;
    }
    if (t == _i72.DeleteTeamRequest) {
      return _i72.DeleteTeamRequest.fromJson(data) as T;
    }
    if (t == _i73.InviteTeamMemberRequest) {
      return _i73.InviteTeamMemberRequest.fromJson(data) as T;
    }
    if (t == _i74.LeaveTeamRequest) {
      return _i74.LeaveTeamRequest.fromJson(data) as T;
    }
    if (t == _i75.RemoveMemberRequest) {
      return _i75.RemoveMemberRequest.fromJson(data) as T;
    }
    if (t == _i76.RespondToInvitationRequest) {
      return _i76.RespondToInvitationRequest.fromJson(data) as T;
    }
    if (t == _i77.RevokeInvitationRequest) {
      return _i77.RevokeInvitationRequest.fromJson(data) as T;
    }
    if (t == _i78.Team) {
      return _i78.Team.fromJson(data) as T;
    }
    if (t == _i79.TeamMember) {
      return _i79.TeamMember.fromJson(data) as T;
    }
    if (t == _i80.TransferTeamOwnershipRequest) {
      return _i80.TransferTeamOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i81.UpdateMemberRoleRequest) {
      return _i81.UpdateMemberRoleRequest.fromJson(data) as T;
    }
    if (t == _i82.UpdateTeamRequest) {
      return _i82.UpdateTeamRequest.fromJson(data) as T;
    }
    if (t == _i83.CreateVersionRequest) {
      return _i83.CreateVersionRequest.fromJson(data) as T;
    }
    if (t == _i84.DeleteVersionRequest) {
      return _i84.DeleteVersionRequest.fromJson(data) as T;
    }
    if (t == _i85.NextBuildNumberResponse) {
      return _i85.NextBuildNumberResponse.fromJson(data) as T;
    }
    if (t == _i86.SetVersionRecommendationRequest) {
      return _i86.SetVersionRecommendationRequest.fromJson(data) as T;
    }
    if (t == _i87.ToggleVersionBlockRequest) {
      return _i87.ToggleVersionBlockRequest.fromJson(data) as T;
    }
    if (t == _i88.UpdateVersionRequest) {
      return _i88.UpdateVersionRequest.fromJson(data) as T;
    }
    if (t == _i89.Version) {
      return _i89.Version.fromJson(data) as T;
    }
    if (t == _i90.VersionDetailResponse) {
      return _i90.VersionDetailResponse.fromJson(data) as T;
    }
    if (t == _i91.VersionListItem) {
      return _i91.VersionListItem.fromJson(data) as T;
    }
    if (t == _i92.VersionListResponse) {
      return _i92.VersionListResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.CheckVersionErrorResponse?>()) {
      return (data != null
              ? _i3.CheckVersionErrorResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i4.CheckVersionRequest?>()) {
      return (data != null ? _i4.CheckVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.CheckVersionResponse?>()) {
      return (data != null ? _i5.CheckVersionResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.RecommendedVersionInfo?>()) {
      return (data != null ? _i6.RecommendedVersionInfo.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.StoreLinkInfo?>()) {
      return (data != null ? _i7.StoreLinkInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Application?>()) {
      return (data != null ? _i8.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.CreateApplicationRequest?>()) {
      return (data != null ? _i9.CreateApplicationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.CreateApplicationResponse?>()) {
      return (data != null
              ? _i10.CreateApplicationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.DeleteApplicationRequest?>()) {
      return (data != null
              ? _i11.DeleteApplicationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i12.RegenerateApiKeyRequest?>()) {
      return (data != null ? _i12.RegenerateApiKeyRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.RegenerateApiKeyResponse?>()) {
      return (data != null
              ? _i13.RegenerateApiKeyResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.RequestApiKeyRegenerationRequest?>()) {
      return (data != null
              ? _i14.RequestApiKeyRegenerationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.RequestApiKeyRegenerationResponse?>()) {
      return (data != null
              ? _i15.RequestApiKeyRegenerationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i16.StoreLink?>()) {
      return (data != null ? _i16.StoreLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.StoreLinkEntry?>()) {
      return (data != null ? _i17.StoreLinkEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.ToggleApplicationStatusRequest?>()) {
      return (data != null
              ? _i18.ToggleApplicationStatusRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i19.TransferApplicationOwnershipRequest?>()) {
      return (data != null
              ? _i19.TransferApplicationOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i20.UpdateApplicationRequest?>()) {
      return (data != null
              ? _i20.UpdateApplicationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i21.AuthResponse?>()) {
      return (data != null ? _i21.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.AuthSession?>()) {
      return (data != null ? _i22.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.CheckEmailRequest?>()) {
      return (data != null ? _i23.CheckEmailRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.CheckEmailAndSendCodeResponse?>()) {
      return (data != null
              ? _i24.CheckEmailAndSendCodeResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i25.UserPublic?>()) {
      return (data != null ? _i25.UserPublic.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.SuccessResponse?>()) {
      return (data != null ? _i26.SuccessResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.LoginRequest?>()) {
      return (data != null ? _i27.LoginRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.RefreshTokenRequest?>()) {
      return (data != null ? _i28.RefreshTokenRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.RegisterRequest?>()) {
      return (data != null ? _i29.RegisterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.RegisterSendCodeRequest?>()) {
      return (data != null ? _i30.RegisterSendCodeRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.RegisterSetPasswordRequest?>()) {
      return (data != null
              ? _i31.RegisterSetPasswordRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i32.RegisterVerifyCodeRequest?>()) {
      return (data != null
              ? _i32.RegisterVerifyCodeRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i33.SendCodeResponse?>()) {
      return (data != null ? _i33.SendCodeResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.TokenPairResponse?>()) {
      return (data != null ? _i34.TokenPairResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.User?>()) {
      return (data != null ? _i35.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.VerificationCode?>()) {
      return (data != null ? _i36.VerificationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.VerifyCodeResponse?>()) {
      return (data != null ? _i37.VerifyCodeResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.OwnerType?>()) {
      return (data != null ? _i38.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.PlatformType?>()) {
      return (data != null ? _i39.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.RecommendationFrequencyType?>()) {
      return (data != null
              ? _i40.RecommendationFrequencyType.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i41.ResponseStatusType?>()) {
      return (data != null ? _i41.ResponseStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i42.TeamMemberStatusType?>()) {
      return (data != null ? _i42.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i43.TeamRoleType?>()) {
      return (data != null ? _i43.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.UpdatePriorityType?>()) {
      return (data != null ? _i44.UpdatePriorityType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.VerificationPurposeType?>()) {
      return (data != null ? _i45.VerificationPurposeType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.InvalidDataException?>()) {
      return (data != null ? _i46.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.TooManyAttemptsException?>()) {
      return (data != null
              ? _i47.TooManyAttemptsException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i48.Greeting?>()) {
      return (data != null ? _i48.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.SessionInfo?>()) {
      return (data != null ? _i49.SessionInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.TerminateSessionRequest?>()) {
      return (data != null ? _i50.TerminateSessionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.AppInstance?>()) {
      return (data != null ? _i51.AppInstance.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i52.CumulativeUsersEntry?>()) {
      return (data != null ? _i52.CumulativeUsersEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.DailyActiveUsersEntry?>()) {
      return (data != null ? _i53.DailyActiveUsersEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i54.DailyActiveUsersResponse?>()) {
      return (data != null
              ? _i54.DailyActiveUsersResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i55.DailyCheckSummary?>()) {
      return (data != null ? _i55.DailyCheckSummary.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i56.DailyDimensionSummary?>()) {
      return (data != null ? _i56.DailyDimensionSummary.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i57.DeviceModelStatisticsEntry?>()) {
      return (data != null
              ? _i57.DeviceModelStatisticsEntry.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i58.GeoStatisticsResponse?>()) {
      return (data != null ? _i58.GeoStatisticsResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i59.HeatmapEntry?>()) {
      return (data != null ? _i59.HeatmapEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.LocaleStatisticsEntry?>()) {
      return (data != null ? _i60.LocaleStatisticsEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i61.OsVersionStatisticsEntry?>()) {
      return (data != null
              ? _i61.OsVersionStatisticsEntry.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i62.PlatformStatisticsEntry?>()) {
      return (data != null ? _i62.PlatformStatisticsEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i63.PlatformStatisticsResponse?>()) {
      return (data != null
              ? _i63.PlatformStatisticsResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i64.StatisticsExportData?>()) {
      return (data != null ? _i64.StatisticsExportData.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i65.StatisticsFilter?>()) {
      return (data != null ? _i65.StatisticsFilter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.StatisticsOverviewResponse?>()) {
      return (data != null
              ? _i66.StatisticsOverviewResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i67.TimeAnalyticsResponse?>()) {
      return (data != null ? _i67.TimeAnalyticsResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i68.VersionAdoptionTimelineEntry?>()) {
      return (data != null
              ? _i68.VersionAdoptionTimelineEntry.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i69.VersionStatisticsEntry?>()) {
      return (data != null ? _i69.VersionStatisticsEntry.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i70.VersionStatisticsResponse?>()) {
      return (data != null
              ? _i70.VersionStatisticsResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i71.CreateTeamRequest?>()) {
      return (data != null ? _i71.CreateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i72.DeleteTeamRequest?>()) {
      return (data != null ? _i72.DeleteTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i73.InviteTeamMemberRequest?>()) {
      return (data != null ? _i73.InviteTeamMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i74.LeaveTeamRequest?>()) {
      return (data != null ? _i74.LeaveTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i75.RemoveMemberRequest?>()) {
      return (data != null ? _i75.RemoveMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i76.RespondToInvitationRequest?>()) {
      return (data != null
              ? _i76.RespondToInvitationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i77.RevokeInvitationRequest?>()) {
      return (data != null ? _i77.RevokeInvitationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i78.Team?>()) {
      return (data != null ? _i78.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i79.TeamMember?>()) {
      return (data != null ? _i79.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i80.TransferTeamOwnershipRequest?>()) {
      return (data != null
              ? _i80.TransferTeamOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i81.UpdateMemberRoleRequest?>()) {
      return (data != null ? _i81.UpdateMemberRoleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i82.UpdateTeamRequest?>()) {
      return (data != null ? _i82.UpdateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i83.CreateVersionRequest?>()) {
      return (data != null ? _i83.CreateVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i84.DeleteVersionRequest?>()) {
      return (data != null ? _i84.DeleteVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i85.NextBuildNumberResponse?>()) {
      return (data != null ? _i85.NextBuildNumberResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i86.SetVersionRecommendationRequest?>()) {
      return (data != null
              ? _i86.SetVersionRecommendationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i87.ToggleVersionBlockRequest?>()) {
      return (data != null
              ? _i87.ToggleVersionBlockRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i88.UpdateVersionRequest?>()) {
      return (data != null ? _i88.UpdateVersionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i89.Version?>()) {
      return (data != null ? _i89.Version.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i90.VersionDetailResponse?>()) {
      return (data != null ? _i90.VersionDetailResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i91.VersionListItem?>()) {
      return (data != null ? _i91.VersionListItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i92.VersionListResponse?>()) {
      return (data != null ? _i92.VersionListResponse.fromJson(data) : null)
          as T;
    }
    if (t == List<_i7.StoreLinkInfo>) {
      return (data as List)
              .map((e) => deserialize<_i7.StoreLinkInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i39.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i39.PlatformType>(e))
              .toList()
          as T;
    }
    if (t == List<_i16.StoreLink>) {
      return (data as List).map((e) => deserialize<_i16.StoreLink>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.StoreLink>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i16.StoreLink>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i89.Version>) {
      return (data as List).map((e) => deserialize<_i89.Version>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i89.Version>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i89.Version>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i51.AppInstance>) {
      return (data as List)
              .map((e) => deserialize<_i51.AppInstance>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i51.AppInstance>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i51.AppInstance>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i55.DailyCheckSummary>) {
      return (data as List)
              .map((e) => deserialize<_i55.DailyCheckSummary>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i55.DailyCheckSummary>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i55.DailyCheckSummary>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i56.DailyDimensionSummary>) {
      return (data as List)
              .map((e) => deserialize<_i56.DailyDimensionSummary>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i56.DailyDimensionSummary>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i56.DailyDimensionSummary>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i17.StoreLinkEntry>) {
      return (data as List)
              .map((e) => deserialize<_i17.StoreLinkEntry>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i17.StoreLinkEntry>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i17.StoreLinkEntry>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i39.PlatformType>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i39.PlatformType>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i22.AuthSession>) {
      return (data as List)
              .map((e) => deserialize<_i22.AuthSession>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i22.AuthSession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i22.AuthSession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i36.VerificationCode>) {
      return (data as List)
              .map((e) => deserialize<_i36.VerificationCode>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i36.VerificationCode>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i36.VerificationCode>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i78.Team>) {
      return (data as List).map((e) => deserialize<_i78.Team>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i78.Team>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i78.Team>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i79.TeamMember>) {
      return (data as List).map((e) => deserialize<_i79.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i79.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i79.TeamMember>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i8.Application>) {
      return (data as List).map((e) => deserialize<_i8.Application>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i8.Application>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i8.Application>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i53.DailyActiveUsersEntry>) {
      return (data as List)
              .map((e) => deserialize<_i53.DailyActiveUsersEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i52.CumulativeUsersEntry>) {
      return (data as List)
              .map((e) => deserialize<_i52.CumulativeUsersEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.LocaleStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i60.LocaleStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i62.PlatformStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i62.PlatformStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i61.OsVersionStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i61.OsVersionStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i57.DeviceModelStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i57.DeviceModelStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.HeatmapEntry>) {
      return (data as List)
              .map((e) => deserialize<_i59.HeatmapEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i69.VersionStatisticsEntry>) {
      return (data as List)
              .map((e) => deserialize<_i69.VersionStatisticsEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i68.VersionAdoptionTimelineEntry>) {
      return (data as List)
              .map((e) => deserialize<_i68.VersionAdoptionTimelineEntry>(e))
              .toList()
          as T;
    }
    if (t == List<_i91.VersionListItem>) {
      return (data as List)
              .map((e) => deserialize<_i91.VersionListItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i93.Application>) {
      return (data as List)
              .map((e) => deserialize<_i93.Application>(e))
              .toList()
          as T;
    }
    if (t == List<_i94.SessionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i94.SessionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i95.Team>) {
      return (data as List).map((e) => deserialize<_i95.Team>(e)).toList() as T;
    }
    if (t == List<_i96.TeamMember>) {
      return (data as List).map((e) => deserialize<_i96.TeamMember>(e)).toList()
          as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i3.CheckVersionErrorResponse => 'CheckVersionErrorResponse',
      _i4.CheckVersionRequest => 'CheckVersionRequest',
      _i5.CheckVersionResponse => 'CheckVersionResponse',
      _i6.RecommendedVersionInfo => 'RecommendedVersionInfo',
      _i7.StoreLinkInfo => 'StoreLinkInfo',
      _i8.Application => 'Application',
      _i9.CreateApplicationRequest => 'CreateApplicationRequest',
      _i10.CreateApplicationResponse => 'CreateApplicationResponse',
      _i11.DeleteApplicationRequest => 'DeleteApplicationRequest',
      _i12.RegenerateApiKeyRequest => 'RegenerateApiKeyRequest',
      _i13.RegenerateApiKeyResponse => 'RegenerateApiKeyResponse',
      _i14.RequestApiKeyRegenerationRequest =>
        'RequestApiKeyRegenerationRequest',
      _i15.RequestApiKeyRegenerationResponse =>
        'RequestApiKeyRegenerationResponse',
      _i16.StoreLink => 'StoreLink',
      _i17.StoreLinkEntry => 'StoreLinkEntry',
      _i18.ToggleApplicationStatusRequest => 'ToggleApplicationStatusRequest',
      _i19.TransferApplicationOwnershipRequest =>
        'TransferApplicationOwnershipRequest',
      _i20.UpdateApplicationRequest => 'UpdateApplicationRequest',
      _i21.AuthResponse => 'AuthResponse',
      _i22.AuthSession => 'AuthSession',
      _i23.CheckEmailRequest => 'CheckEmailRequest',
      _i24.CheckEmailAndSendCodeResponse => 'CheckEmailAndSendCodeResponse',
      _i25.UserPublic => 'UserPublic',
      _i26.SuccessResponse => 'SuccessResponse',
      _i27.LoginRequest => 'LoginRequest',
      _i28.RefreshTokenRequest => 'RefreshTokenRequest',
      _i29.RegisterRequest => 'RegisterRequest',
      _i30.RegisterSendCodeRequest => 'RegisterSendCodeRequest',
      _i31.RegisterSetPasswordRequest => 'RegisterSetPasswordRequest',
      _i32.RegisterVerifyCodeRequest => 'RegisterVerifyCodeRequest',
      _i33.SendCodeResponse => 'SendCodeResponse',
      _i34.TokenPairResponse => 'TokenPairResponse',
      _i35.User => 'User',
      _i36.VerificationCode => 'VerificationCode',
      _i37.VerifyCodeResponse => 'VerifyCodeResponse',
      _i38.OwnerType => 'OwnerType',
      _i39.PlatformType => 'PlatformType',
      _i40.RecommendationFrequencyType => 'RecommendationFrequencyType',
      _i41.ResponseStatusType => 'ResponseStatusType',
      _i42.TeamMemberStatusType => 'TeamMemberStatusType',
      _i43.TeamRoleType => 'TeamRoleType',
      _i44.UpdatePriorityType => 'UpdatePriorityType',
      _i45.VerificationPurposeType => 'VerificationPurposeType',
      _i46.InvalidDataException => 'InvalidDataException',
      _i47.TooManyAttemptsException => 'TooManyAttemptsException',
      _i48.Greeting => 'Greeting',
      _i49.SessionInfo => 'SessionInfo',
      _i50.TerminateSessionRequest => 'TerminateSessionRequest',
      _i51.AppInstance => 'AppInstance',
      _i52.CumulativeUsersEntry => 'CumulativeUsersEntry',
      _i53.DailyActiveUsersEntry => 'DailyActiveUsersEntry',
      _i54.DailyActiveUsersResponse => 'DailyActiveUsersResponse',
      _i55.DailyCheckSummary => 'DailyCheckSummary',
      _i56.DailyDimensionSummary => 'DailyDimensionSummary',
      _i57.DeviceModelStatisticsEntry => 'DeviceModelStatisticsEntry',
      _i58.GeoStatisticsResponse => 'GeoStatisticsResponse',
      _i59.HeatmapEntry => 'HeatmapEntry',
      _i60.LocaleStatisticsEntry => 'LocaleStatisticsEntry',
      _i61.OsVersionStatisticsEntry => 'OsVersionStatisticsEntry',
      _i62.PlatformStatisticsEntry => 'PlatformStatisticsEntry',
      _i63.PlatformStatisticsResponse => 'PlatformStatisticsResponse',
      _i64.StatisticsExportData => 'StatisticsExportData',
      _i65.StatisticsFilter => 'StatisticsFilter',
      _i66.StatisticsOverviewResponse => 'StatisticsOverviewResponse',
      _i67.TimeAnalyticsResponse => 'TimeAnalyticsResponse',
      _i68.VersionAdoptionTimelineEntry => 'VersionAdoptionTimelineEntry',
      _i69.VersionStatisticsEntry => 'VersionStatisticsEntry',
      _i70.VersionStatisticsResponse => 'VersionStatisticsResponse',
      _i71.CreateTeamRequest => 'CreateTeamRequest',
      _i72.DeleteTeamRequest => 'DeleteTeamRequest',
      _i73.InviteTeamMemberRequest => 'InviteTeamMemberRequest',
      _i74.LeaveTeamRequest => 'LeaveTeamRequest',
      _i75.RemoveMemberRequest => 'RemoveMemberRequest',
      _i76.RespondToInvitationRequest => 'RespondToInvitationRequest',
      _i77.RevokeInvitationRequest => 'RevokeInvitationRequest',
      _i78.Team => 'Team',
      _i79.TeamMember => 'TeamMember',
      _i80.TransferTeamOwnershipRequest => 'TransferTeamOwnershipRequest',
      _i81.UpdateMemberRoleRequest => 'UpdateMemberRoleRequest',
      _i82.UpdateTeamRequest => 'UpdateTeamRequest',
      _i83.CreateVersionRequest => 'CreateVersionRequest',
      _i84.DeleteVersionRequest => 'DeleteVersionRequest',
      _i85.NextBuildNumberResponse => 'NextBuildNumberResponse',
      _i86.SetVersionRecommendationRequest => 'SetVersionRecommendationRequest',
      _i87.ToggleVersionBlockRequest => 'ToggleVersionBlockRequest',
      _i88.UpdateVersionRequest => 'UpdateVersionRequest',
      _i89.Version => 'Version',
      _i90.VersionDetailResponse => 'VersionDetailResponse',
      _i91.VersionListItem => 'VersionListItem',
      _i92.VersionListResponse => 'VersionListResponse',
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
      case _i3.CheckVersionErrorResponse():
        return 'CheckVersionErrorResponse';
      case _i4.CheckVersionRequest():
        return 'CheckVersionRequest';
      case _i5.CheckVersionResponse():
        return 'CheckVersionResponse';
      case _i6.RecommendedVersionInfo():
        return 'RecommendedVersionInfo';
      case _i7.StoreLinkInfo():
        return 'StoreLinkInfo';
      case _i8.Application():
        return 'Application';
      case _i9.CreateApplicationRequest():
        return 'CreateApplicationRequest';
      case _i10.CreateApplicationResponse():
        return 'CreateApplicationResponse';
      case _i11.DeleteApplicationRequest():
        return 'DeleteApplicationRequest';
      case _i12.RegenerateApiKeyRequest():
        return 'RegenerateApiKeyRequest';
      case _i13.RegenerateApiKeyResponse():
        return 'RegenerateApiKeyResponse';
      case _i14.RequestApiKeyRegenerationRequest():
        return 'RequestApiKeyRegenerationRequest';
      case _i15.RequestApiKeyRegenerationResponse():
        return 'RequestApiKeyRegenerationResponse';
      case _i16.StoreLink():
        return 'StoreLink';
      case _i17.StoreLinkEntry():
        return 'StoreLinkEntry';
      case _i18.ToggleApplicationStatusRequest():
        return 'ToggleApplicationStatusRequest';
      case _i19.TransferApplicationOwnershipRequest():
        return 'TransferApplicationOwnershipRequest';
      case _i20.UpdateApplicationRequest():
        return 'UpdateApplicationRequest';
      case _i21.AuthResponse():
        return 'AuthResponse';
      case _i22.AuthSession():
        return 'AuthSession';
      case _i23.CheckEmailRequest():
        return 'CheckEmailRequest';
      case _i24.CheckEmailAndSendCodeResponse():
        return 'CheckEmailAndSendCodeResponse';
      case _i25.UserPublic():
        return 'UserPublic';
      case _i26.SuccessResponse():
        return 'SuccessResponse';
      case _i27.LoginRequest():
        return 'LoginRequest';
      case _i28.RefreshTokenRequest():
        return 'RefreshTokenRequest';
      case _i29.RegisterRequest():
        return 'RegisterRequest';
      case _i30.RegisterSendCodeRequest():
        return 'RegisterSendCodeRequest';
      case _i31.RegisterSetPasswordRequest():
        return 'RegisterSetPasswordRequest';
      case _i32.RegisterVerifyCodeRequest():
        return 'RegisterVerifyCodeRequest';
      case _i33.SendCodeResponse():
        return 'SendCodeResponse';
      case _i34.TokenPairResponse():
        return 'TokenPairResponse';
      case _i35.User():
        return 'User';
      case _i36.VerificationCode():
        return 'VerificationCode';
      case _i37.VerifyCodeResponse():
        return 'VerifyCodeResponse';
      case _i38.OwnerType():
        return 'OwnerType';
      case _i39.PlatformType():
        return 'PlatformType';
      case _i40.RecommendationFrequencyType():
        return 'RecommendationFrequencyType';
      case _i41.ResponseStatusType():
        return 'ResponseStatusType';
      case _i42.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i43.TeamRoleType():
        return 'TeamRoleType';
      case _i44.UpdatePriorityType():
        return 'UpdatePriorityType';
      case _i45.VerificationPurposeType():
        return 'VerificationPurposeType';
      case _i46.InvalidDataException():
        return 'InvalidDataException';
      case _i47.TooManyAttemptsException():
        return 'TooManyAttemptsException';
      case _i48.Greeting():
        return 'Greeting';
      case _i49.SessionInfo():
        return 'SessionInfo';
      case _i50.TerminateSessionRequest():
        return 'TerminateSessionRequest';
      case _i51.AppInstance():
        return 'AppInstance';
      case _i52.CumulativeUsersEntry():
        return 'CumulativeUsersEntry';
      case _i53.DailyActiveUsersEntry():
        return 'DailyActiveUsersEntry';
      case _i54.DailyActiveUsersResponse():
        return 'DailyActiveUsersResponse';
      case _i55.DailyCheckSummary():
        return 'DailyCheckSummary';
      case _i56.DailyDimensionSummary():
        return 'DailyDimensionSummary';
      case _i57.DeviceModelStatisticsEntry():
        return 'DeviceModelStatisticsEntry';
      case _i58.GeoStatisticsResponse():
        return 'GeoStatisticsResponse';
      case _i59.HeatmapEntry():
        return 'HeatmapEntry';
      case _i60.LocaleStatisticsEntry():
        return 'LocaleStatisticsEntry';
      case _i61.OsVersionStatisticsEntry():
        return 'OsVersionStatisticsEntry';
      case _i62.PlatformStatisticsEntry():
        return 'PlatformStatisticsEntry';
      case _i63.PlatformStatisticsResponse():
        return 'PlatformStatisticsResponse';
      case _i64.StatisticsExportData():
        return 'StatisticsExportData';
      case _i65.StatisticsFilter():
        return 'StatisticsFilter';
      case _i66.StatisticsOverviewResponse():
        return 'StatisticsOverviewResponse';
      case _i67.TimeAnalyticsResponse():
        return 'TimeAnalyticsResponse';
      case _i68.VersionAdoptionTimelineEntry():
        return 'VersionAdoptionTimelineEntry';
      case _i69.VersionStatisticsEntry():
        return 'VersionStatisticsEntry';
      case _i70.VersionStatisticsResponse():
        return 'VersionStatisticsResponse';
      case _i71.CreateTeamRequest():
        return 'CreateTeamRequest';
      case _i72.DeleteTeamRequest():
        return 'DeleteTeamRequest';
      case _i73.InviteTeamMemberRequest():
        return 'InviteTeamMemberRequest';
      case _i74.LeaveTeamRequest():
        return 'LeaveTeamRequest';
      case _i75.RemoveMemberRequest():
        return 'RemoveMemberRequest';
      case _i76.RespondToInvitationRequest():
        return 'RespondToInvitationRequest';
      case _i77.RevokeInvitationRequest():
        return 'RevokeInvitationRequest';
      case _i78.Team():
        return 'Team';
      case _i79.TeamMember():
        return 'TeamMember';
      case _i80.TransferTeamOwnershipRequest():
        return 'TransferTeamOwnershipRequest';
      case _i81.UpdateMemberRoleRequest():
        return 'UpdateMemberRoleRequest';
      case _i82.UpdateTeamRequest():
        return 'UpdateTeamRequest';
      case _i83.CreateVersionRequest():
        return 'CreateVersionRequest';
      case _i84.DeleteVersionRequest():
        return 'DeleteVersionRequest';
      case _i85.NextBuildNumberResponse():
        return 'NextBuildNumberResponse';
      case _i86.SetVersionRecommendationRequest():
        return 'SetVersionRecommendationRequest';
      case _i87.ToggleVersionBlockRequest():
        return 'ToggleVersionBlockRequest';
      case _i88.UpdateVersionRequest():
        return 'UpdateVersionRequest';
      case _i89.Version():
        return 'Version';
      case _i90.VersionDetailResponse():
        return 'VersionDetailResponse';
      case _i91.VersionListItem():
        return 'VersionListItem';
      case _i92.VersionListResponse():
        return 'VersionListResponse';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
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
      return deserialize<_i3.CheckVersionErrorResponse>(data['data']);
    }
    if (dataClassName == 'CheckVersionRequest') {
      return deserialize<_i4.CheckVersionRequest>(data['data']);
    }
    if (dataClassName == 'CheckVersionResponse') {
      return deserialize<_i5.CheckVersionResponse>(data['data']);
    }
    if (dataClassName == 'RecommendedVersionInfo') {
      return deserialize<_i6.RecommendedVersionInfo>(data['data']);
    }
    if (dataClassName == 'StoreLinkInfo') {
      return deserialize<_i7.StoreLinkInfo>(data['data']);
    }
    if (dataClassName == 'Application') {
      return deserialize<_i8.Application>(data['data']);
    }
    if (dataClassName == 'CreateApplicationRequest') {
      return deserialize<_i9.CreateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'CreateApplicationResponse') {
      return deserialize<_i10.CreateApplicationResponse>(data['data']);
    }
    if (dataClassName == 'DeleteApplicationRequest') {
      return deserialize<_i11.DeleteApplicationRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyRequest') {
      return deserialize<_i12.RegenerateApiKeyRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyResponse') {
      return deserialize<_i13.RegenerateApiKeyResponse>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationRequest') {
      return deserialize<_i14.RequestApiKeyRegenerationRequest>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationResponse') {
      return deserialize<_i15.RequestApiKeyRegenerationResponse>(data['data']);
    }
    if (dataClassName == 'StoreLink') {
      return deserialize<_i16.StoreLink>(data['data']);
    }
    if (dataClassName == 'StoreLinkEntry') {
      return deserialize<_i17.StoreLinkEntry>(data['data']);
    }
    if (dataClassName == 'ToggleApplicationStatusRequest') {
      return deserialize<_i18.ToggleApplicationStatusRequest>(data['data']);
    }
    if (dataClassName == 'TransferApplicationOwnershipRequest') {
      return deserialize<_i19.TransferApplicationOwnershipRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateApplicationRequest') {
      return deserialize<_i20.UpdateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i21.AuthResponse>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i22.AuthSession>(data['data']);
    }
    if (dataClassName == 'CheckEmailRequest') {
      return deserialize<_i23.CheckEmailRequest>(data['data']);
    }
    if (dataClassName == 'CheckEmailAndSendCodeResponse') {
      return deserialize<_i24.CheckEmailAndSendCodeResponse>(data['data']);
    }
    if (dataClassName == 'UserPublic') {
      return deserialize<_i25.UserPublic>(data['data']);
    }
    if (dataClassName == 'SuccessResponse') {
      return deserialize<_i26.SuccessResponse>(data['data']);
    }
    if (dataClassName == 'LoginRequest') {
      return deserialize<_i27.LoginRequest>(data['data']);
    }
    if (dataClassName == 'RefreshTokenRequest') {
      return deserialize<_i28.RefreshTokenRequest>(data['data']);
    }
    if (dataClassName == 'RegisterRequest') {
      return deserialize<_i29.RegisterRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSendCodeRequest') {
      return deserialize<_i30.RegisterSendCodeRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSetPasswordRequest') {
      return deserialize<_i31.RegisterSetPasswordRequest>(data['data']);
    }
    if (dataClassName == 'RegisterVerifyCodeRequest') {
      return deserialize<_i32.RegisterVerifyCodeRequest>(data['data']);
    }
    if (dataClassName == 'SendCodeResponse') {
      return deserialize<_i33.SendCodeResponse>(data['data']);
    }
    if (dataClassName == 'TokenPairResponse') {
      return deserialize<_i34.TokenPairResponse>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i35.User>(data['data']);
    }
    if (dataClassName == 'VerificationCode') {
      return deserialize<_i36.VerificationCode>(data['data']);
    }
    if (dataClassName == 'VerifyCodeResponse') {
      return deserialize<_i37.VerifyCodeResponse>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i38.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i39.PlatformType>(data['data']);
    }
    if (dataClassName == 'RecommendationFrequencyType') {
      return deserialize<_i40.RecommendationFrequencyType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i41.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i42.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i43.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'UpdatePriorityType') {
      return deserialize<_i44.UpdatePriorityType>(data['data']);
    }
    if (dataClassName == 'VerificationPurposeType') {
      return deserialize<_i45.VerificationPurposeType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i46.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'TooManyAttemptsException') {
      return deserialize<_i47.TooManyAttemptsException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i48.Greeting>(data['data']);
    }
    if (dataClassName == 'SessionInfo') {
      return deserialize<_i49.SessionInfo>(data['data']);
    }
    if (dataClassName == 'TerminateSessionRequest') {
      return deserialize<_i50.TerminateSessionRequest>(data['data']);
    }
    if (dataClassName == 'AppInstance') {
      return deserialize<_i51.AppInstance>(data['data']);
    }
    if (dataClassName == 'CumulativeUsersEntry') {
      return deserialize<_i52.CumulativeUsersEntry>(data['data']);
    }
    if (dataClassName == 'DailyActiveUsersEntry') {
      return deserialize<_i53.DailyActiveUsersEntry>(data['data']);
    }
    if (dataClassName == 'DailyActiveUsersResponse') {
      return deserialize<_i54.DailyActiveUsersResponse>(data['data']);
    }
    if (dataClassName == 'DailyCheckSummary') {
      return deserialize<_i55.DailyCheckSummary>(data['data']);
    }
    if (dataClassName == 'DailyDimensionSummary') {
      return deserialize<_i56.DailyDimensionSummary>(data['data']);
    }
    if (dataClassName == 'DeviceModelStatisticsEntry') {
      return deserialize<_i57.DeviceModelStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'GeoStatisticsResponse') {
      return deserialize<_i58.GeoStatisticsResponse>(data['data']);
    }
    if (dataClassName == 'HeatmapEntry') {
      return deserialize<_i59.HeatmapEntry>(data['data']);
    }
    if (dataClassName == 'LocaleStatisticsEntry') {
      return deserialize<_i60.LocaleStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'OsVersionStatisticsEntry') {
      return deserialize<_i61.OsVersionStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'PlatformStatisticsEntry') {
      return deserialize<_i62.PlatformStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'PlatformStatisticsResponse') {
      return deserialize<_i63.PlatformStatisticsResponse>(data['data']);
    }
    if (dataClassName == 'StatisticsExportData') {
      return deserialize<_i64.StatisticsExportData>(data['data']);
    }
    if (dataClassName == 'StatisticsFilter') {
      return deserialize<_i65.StatisticsFilter>(data['data']);
    }
    if (dataClassName == 'StatisticsOverviewResponse') {
      return deserialize<_i66.StatisticsOverviewResponse>(data['data']);
    }
    if (dataClassName == 'TimeAnalyticsResponse') {
      return deserialize<_i67.TimeAnalyticsResponse>(data['data']);
    }
    if (dataClassName == 'VersionAdoptionTimelineEntry') {
      return deserialize<_i68.VersionAdoptionTimelineEntry>(data['data']);
    }
    if (dataClassName == 'VersionStatisticsEntry') {
      return deserialize<_i69.VersionStatisticsEntry>(data['data']);
    }
    if (dataClassName == 'VersionStatisticsResponse') {
      return deserialize<_i70.VersionStatisticsResponse>(data['data']);
    }
    if (dataClassName == 'CreateTeamRequest') {
      return deserialize<_i71.CreateTeamRequest>(data['data']);
    }
    if (dataClassName == 'DeleteTeamRequest') {
      return deserialize<_i72.DeleteTeamRequest>(data['data']);
    }
    if (dataClassName == 'InviteTeamMemberRequest') {
      return deserialize<_i73.InviteTeamMemberRequest>(data['data']);
    }
    if (dataClassName == 'LeaveTeamRequest') {
      return deserialize<_i74.LeaveTeamRequest>(data['data']);
    }
    if (dataClassName == 'RemoveMemberRequest') {
      return deserialize<_i75.RemoveMemberRequest>(data['data']);
    }
    if (dataClassName == 'RespondToInvitationRequest') {
      return deserialize<_i76.RespondToInvitationRequest>(data['data']);
    }
    if (dataClassName == 'RevokeInvitationRequest') {
      return deserialize<_i77.RevokeInvitationRequest>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i78.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i79.TeamMember>(data['data']);
    }
    if (dataClassName == 'TransferTeamOwnershipRequest') {
      return deserialize<_i80.TransferTeamOwnershipRequest>(data['data']);
    }
    if (dataClassName == 'UpdateMemberRoleRequest') {
      return deserialize<_i81.UpdateMemberRoleRequest>(data['data']);
    }
    if (dataClassName == 'UpdateTeamRequest') {
      return deserialize<_i82.UpdateTeamRequest>(data['data']);
    }
    if (dataClassName == 'CreateVersionRequest') {
      return deserialize<_i83.CreateVersionRequest>(data['data']);
    }
    if (dataClassName == 'DeleteVersionRequest') {
      return deserialize<_i84.DeleteVersionRequest>(data['data']);
    }
    if (dataClassName == 'NextBuildNumberResponse') {
      return deserialize<_i85.NextBuildNumberResponse>(data['data']);
    }
    if (dataClassName == 'SetVersionRecommendationRequest') {
      return deserialize<_i86.SetVersionRecommendationRequest>(data['data']);
    }
    if (dataClassName == 'ToggleVersionBlockRequest') {
      return deserialize<_i87.ToggleVersionBlockRequest>(data['data']);
    }
    if (dataClassName == 'UpdateVersionRequest') {
      return deserialize<_i88.UpdateVersionRequest>(data['data']);
    }
    if (dataClassName == 'Version') {
      return deserialize<_i89.Version>(data['data']);
    }
    if (dataClassName == 'VersionDetailResponse') {
      return deserialize<_i90.VersionDetailResponse>(data['data']);
    }
    if (dataClassName == 'VersionListItem') {
      return deserialize<_i91.VersionListItem>(data['data']);
    }
    if (dataClassName == 'VersionListResponse') {
      return deserialize<_i92.VersionListResponse>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i8.Application:
        return _i8.Application.t;
      case _i16.StoreLink:
        return _i16.StoreLink.t;
      case _i22.AuthSession:
        return _i22.AuthSession.t;
      case _i35.User:
        return _i35.User.t;
      case _i36.VerificationCode:
        return _i36.VerificationCode.t;
      case _i51.AppInstance:
        return _i51.AppInstance.t;
      case _i55.DailyCheckSummary:
        return _i55.DailyCheckSummary.t;
      case _i56.DailyDimensionSummary:
        return _i56.DailyDimensionSummary.t;
      case _i78.Team:
        return _i78.Team.t;
      case _i79.TeamMember:
        return _i79.TeamMember.t;
      case _i89.Version:
        return _i89.Version.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'version_manager';

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
      return _i2.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
