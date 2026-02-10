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
import 'apps/application.dart' as _i3;
import 'apps/create_application_request.dart' as _i4;
import 'apps/create_application_response.dart' as _i5;
import 'apps/delete_application_request.dart' as _i6;
import 'apps/regenerate_api_key_request.dart' as _i7;
import 'apps/regenerate_api_key_response.dart' as _i8;
import 'apps/request_api_key_regeneration_request.dart' as _i9;
import 'apps/request_api_key_regeneration_response.dart' as _i10;
import 'apps/store_link.dart' as _i11;
import 'apps/store_link_entry.dart' as _i12;
import 'apps/toggle_application_status_request.dart' as _i13;
import 'apps/transfer_application_ownership_request.dart' as _i14;
import 'apps/update_application_request.dart' as _i15;
import 'apps/version.dart' as _i16;
import 'auth/auth_response.dart' as _i17;
import 'auth/auth_session.dart' as _i18;
import 'auth/check_email.dart' as _i19;
import 'auth/check_email_and_send_code_response.dart' as _i20;
import 'auth/common.dart' as _i21;
import 'auth/common_success.dart' as _i22;
import 'auth/login.dart' as _i23;
import 'auth/refresh_token.dart' as _i24;
import 'auth/register.dart' as _i25;
import 'auth/register_send_code.dart' as _i26;
import 'auth/register_set_password.dart' as _i27;
import 'auth/register_verify_code.dart' as _i28;
import 'auth/send_code_response.dart' as _i29;
import 'auth/token_pair_response.dart' as _i30;
import 'auth/user.dart' as _i31;
import 'auth/verification_code.dart' as _i32;
import 'auth/verify_code_response.dart' as _i33;
import 'enums/owner_type.dart' as _i34;
import 'enums/platform_type.dart' as _i35;
import 'enums/response_status_type.dart' as _i36;
import 'enums/team_member_status_type.dart' as _i37;
import 'enums/team_role_type.dart' as _i38;
import 'enums/verification_putpose_type.dart' as _i39;
import 'exceptions/invalid_data_exception.dart' as _i40;
import 'exceptions/too_many_attempts_exception.dart' as _i41;
import 'greetings/greeting.dart' as _i42;
import 'logs/version_check_log.dart' as _i43;
import 'sessions/session_info.dart' as _i44;
import 'sessions/terminate_session_request.dart' as _i45;
import 'teams/create_team_request.dart' as _i46;
import 'teams/delete_team_request.dart' as _i47;
import 'teams/invite_team_member_request.dart' as _i48;
import 'teams/leave_team_request.dart' as _i49;
import 'teams/remove_member_request.dart' as _i50;
import 'teams/respond_to_invitation_request.dart' as _i51;
import 'teams/revoke_invitation_request.dart' as _i52;
import 'teams/team.dart' as _i53;
import 'teams/team_member.dart' as _i54;
import 'teams/transfer_team_ownership_request.dart' as _i55;
import 'teams/update_member_role_request.dart' as _i56;
import 'teams/update_team_request.dart' as _i57;
import 'package:version_manager_server/src/generated/apps/application.dart'
    as _i58;
import 'package:version_manager_server/src/generated/sessions/session_info.dart'
    as _i59;
import 'package:version_manager_server/src/generated/teams/team.dart' as _i60;
import 'package:version_manager_server/src/generated/teams/team_member.dart'
    as _i61;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
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
      name: 'version_check_logs',
      dartName: 'VersionCheckLog',
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
          name: 'versionId',
          columnType: _i2.ColumnType.uuid,
          isNullable: true,
          dartType: 'UuidValue?',
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
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:PlatformType',
        ),
        _i2.ColumnDefinition(
          name: 'osVersion',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'deviceId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'locale',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'deviceModel',
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
          name: 'responseStatus',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ResponseStatusType',
        ),
        _i2.ColumnDefinition(
          name: 'checkedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'version_check_logs_fk_0',
          columns: ['applicationId'],
          referenceTable: 'applications',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'version_check_logs_fk_1',
          columns: ['versionId'],
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
          indexName: 'version_check_logs_pkey',
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
          indexName: 'log_application_idx',
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
          indexName: 'log_version_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'versionId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'log_device_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'deviceId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'log_checked_at_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'checkedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'log_platform_idx',
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
          indexName: 'log_app_checked_composite_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'applicationId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'checkedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'log_app_platform_checked_composite_idx',
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
              definition: 'checkedAt',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'log_device_checked_composite_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'deviceId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'checkedAt',
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

    if (t == _i3.Application) {
      return _i3.Application.fromJson(data) as T;
    }
    if (t == _i4.CreateApplicationRequest) {
      return _i4.CreateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i5.CreateApplicationResponse) {
      return _i5.CreateApplicationResponse.fromJson(data) as T;
    }
    if (t == _i6.DeleteApplicationRequest) {
      return _i6.DeleteApplicationRequest.fromJson(data) as T;
    }
    if (t == _i7.RegenerateApiKeyRequest) {
      return _i7.RegenerateApiKeyRequest.fromJson(data) as T;
    }
    if (t == _i8.RegenerateApiKeyResponse) {
      return _i8.RegenerateApiKeyResponse.fromJson(data) as T;
    }
    if (t == _i9.RequestApiKeyRegenerationRequest) {
      return _i9.RequestApiKeyRegenerationRequest.fromJson(data) as T;
    }
    if (t == _i10.RequestApiKeyRegenerationResponse) {
      return _i10.RequestApiKeyRegenerationResponse.fromJson(data) as T;
    }
    if (t == _i11.StoreLink) {
      return _i11.StoreLink.fromJson(data) as T;
    }
    if (t == _i12.StoreLinkEntry) {
      return _i12.StoreLinkEntry.fromJson(data) as T;
    }
    if (t == _i13.ToggleApplicationStatusRequest) {
      return _i13.ToggleApplicationStatusRequest.fromJson(data) as T;
    }
    if (t == _i14.TransferApplicationOwnershipRequest) {
      return _i14.TransferApplicationOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i15.UpdateApplicationRequest) {
      return _i15.UpdateApplicationRequest.fromJson(data) as T;
    }
    if (t == _i16.Version) {
      return _i16.Version.fromJson(data) as T;
    }
    if (t == _i17.AuthResponse) {
      return _i17.AuthResponse.fromJson(data) as T;
    }
    if (t == _i18.AuthSession) {
      return _i18.AuthSession.fromJson(data) as T;
    }
    if (t == _i19.CheckEmailRequest) {
      return _i19.CheckEmailRequest.fromJson(data) as T;
    }
    if (t == _i20.CheckEmailAndSendCodeResponse) {
      return _i20.CheckEmailAndSendCodeResponse.fromJson(data) as T;
    }
    if (t == _i21.UserPublic) {
      return _i21.UserPublic.fromJson(data) as T;
    }
    if (t == _i22.SuccessResponse) {
      return _i22.SuccessResponse.fromJson(data) as T;
    }
    if (t == _i23.LoginRequest) {
      return _i23.LoginRequest.fromJson(data) as T;
    }
    if (t == _i24.RefreshTokenRequest) {
      return _i24.RefreshTokenRequest.fromJson(data) as T;
    }
    if (t == _i25.RegisterRequest) {
      return _i25.RegisterRequest.fromJson(data) as T;
    }
    if (t == _i26.RegisterSendCodeRequest) {
      return _i26.RegisterSendCodeRequest.fromJson(data) as T;
    }
    if (t == _i27.RegisterSetPasswordRequest) {
      return _i27.RegisterSetPasswordRequest.fromJson(data) as T;
    }
    if (t == _i28.RegisterVerifyCodeRequest) {
      return _i28.RegisterVerifyCodeRequest.fromJson(data) as T;
    }
    if (t == _i29.SendCodeResponse) {
      return _i29.SendCodeResponse.fromJson(data) as T;
    }
    if (t == _i30.TokenPairResponse) {
      return _i30.TokenPairResponse.fromJson(data) as T;
    }
    if (t == _i31.User) {
      return _i31.User.fromJson(data) as T;
    }
    if (t == _i32.VerificationCode) {
      return _i32.VerificationCode.fromJson(data) as T;
    }
    if (t == _i33.VerifyCodeResponse) {
      return _i33.VerifyCodeResponse.fromJson(data) as T;
    }
    if (t == _i34.OwnerType) {
      return _i34.OwnerType.fromJson(data) as T;
    }
    if (t == _i35.PlatformType) {
      return _i35.PlatformType.fromJson(data) as T;
    }
    if (t == _i36.ResponseStatusType) {
      return _i36.ResponseStatusType.fromJson(data) as T;
    }
    if (t == _i37.TeamMemberStatusType) {
      return _i37.TeamMemberStatusType.fromJson(data) as T;
    }
    if (t == _i38.TeamRoleType) {
      return _i38.TeamRoleType.fromJson(data) as T;
    }
    if (t == _i39.VerificationPurposeType) {
      return _i39.VerificationPurposeType.fromJson(data) as T;
    }
    if (t == _i40.InvalidDataException) {
      return _i40.InvalidDataException.fromJson(data) as T;
    }
    if (t == _i41.TooManyAttemptsException) {
      return _i41.TooManyAttemptsException.fromJson(data) as T;
    }
    if (t == _i42.Greeting) {
      return _i42.Greeting.fromJson(data) as T;
    }
    if (t == _i43.VersionCheckLog) {
      return _i43.VersionCheckLog.fromJson(data) as T;
    }
    if (t == _i44.SessionInfo) {
      return _i44.SessionInfo.fromJson(data) as T;
    }
    if (t == _i45.TerminateSessionRequest) {
      return _i45.TerminateSessionRequest.fromJson(data) as T;
    }
    if (t == _i46.CreateTeamRequest) {
      return _i46.CreateTeamRequest.fromJson(data) as T;
    }
    if (t == _i47.DeleteTeamRequest) {
      return _i47.DeleteTeamRequest.fromJson(data) as T;
    }
    if (t == _i48.InviteTeamMemberRequest) {
      return _i48.InviteTeamMemberRequest.fromJson(data) as T;
    }
    if (t == _i49.LeaveTeamRequest) {
      return _i49.LeaveTeamRequest.fromJson(data) as T;
    }
    if (t == _i50.RemoveMemberRequest) {
      return _i50.RemoveMemberRequest.fromJson(data) as T;
    }
    if (t == _i51.RespondToInvitationRequest) {
      return _i51.RespondToInvitationRequest.fromJson(data) as T;
    }
    if (t == _i52.RevokeInvitationRequest) {
      return _i52.RevokeInvitationRequest.fromJson(data) as T;
    }
    if (t == _i53.Team) {
      return _i53.Team.fromJson(data) as T;
    }
    if (t == _i54.TeamMember) {
      return _i54.TeamMember.fromJson(data) as T;
    }
    if (t == _i55.TransferTeamOwnershipRequest) {
      return _i55.TransferTeamOwnershipRequest.fromJson(data) as T;
    }
    if (t == _i56.UpdateMemberRoleRequest) {
      return _i56.UpdateMemberRoleRequest.fromJson(data) as T;
    }
    if (t == _i57.UpdateTeamRequest) {
      return _i57.UpdateTeamRequest.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Application?>()) {
      return (data != null ? _i3.Application.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.CreateApplicationRequest?>()) {
      return (data != null ? _i4.CreateApplicationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.CreateApplicationResponse?>()) {
      return (data != null
              ? _i5.CreateApplicationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i6.DeleteApplicationRequest?>()) {
      return (data != null ? _i6.DeleteApplicationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.RegenerateApiKeyRequest?>()) {
      return (data != null ? _i7.RegenerateApiKeyRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.RegenerateApiKeyResponse?>()) {
      return (data != null ? _i8.RegenerateApiKeyResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.RequestApiKeyRegenerationRequest?>()) {
      return (data != null
              ? _i9.RequestApiKeyRegenerationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i10.RequestApiKeyRegenerationResponse?>()) {
      return (data != null
              ? _i10.RequestApiKeyRegenerationResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i11.StoreLink?>()) {
      return (data != null ? _i11.StoreLink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.StoreLinkEntry?>()) {
      return (data != null ? _i12.StoreLinkEntry.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ToggleApplicationStatusRequest?>()) {
      return (data != null
              ? _i13.ToggleApplicationStatusRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i14.TransferApplicationOwnershipRequest?>()) {
      return (data != null
              ? _i14.TransferApplicationOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i15.UpdateApplicationRequest?>()) {
      return (data != null
              ? _i15.UpdateApplicationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i16.Version?>()) {
      return (data != null ? _i16.Version.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.AuthResponse?>()) {
      return (data != null ? _i17.AuthResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.AuthSession?>()) {
      return (data != null ? _i18.AuthSession.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.CheckEmailRequest?>()) {
      return (data != null ? _i19.CheckEmailRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.CheckEmailAndSendCodeResponse?>()) {
      return (data != null
              ? _i20.CheckEmailAndSendCodeResponse.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i21.UserPublic?>()) {
      return (data != null ? _i21.UserPublic.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.SuccessResponse?>()) {
      return (data != null ? _i22.SuccessResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.LoginRequest?>()) {
      return (data != null ? _i23.LoginRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.RefreshTokenRequest?>()) {
      return (data != null ? _i24.RefreshTokenRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.RegisterRequest?>()) {
      return (data != null ? _i25.RegisterRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.RegisterSendCodeRequest?>()) {
      return (data != null ? _i26.RegisterSendCodeRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.RegisterSetPasswordRequest?>()) {
      return (data != null
              ? _i27.RegisterSetPasswordRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i28.RegisterVerifyCodeRequest?>()) {
      return (data != null
              ? _i28.RegisterVerifyCodeRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i29.SendCodeResponse?>()) {
      return (data != null ? _i29.SendCodeResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.TokenPairResponse?>()) {
      return (data != null ? _i30.TokenPairResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.User?>()) {
      return (data != null ? _i31.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.VerificationCode?>()) {
      return (data != null ? _i32.VerificationCode.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.VerifyCodeResponse?>()) {
      return (data != null ? _i33.VerifyCodeResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.OwnerType?>()) {
      return (data != null ? _i34.OwnerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.PlatformType?>()) {
      return (data != null ? _i35.PlatformType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.ResponseStatusType?>()) {
      return (data != null ? _i36.ResponseStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i37.TeamMemberStatusType?>()) {
      return (data != null ? _i37.TeamMemberStatusType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i38.TeamRoleType?>()) {
      return (data != null ? _i38.TeamRoleType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.VerificationPurposeType?>()) {
      return (data != null ? _i39.VerificationPurposeType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i40.InvalidDataException?>()) {
      return (data != null ? _i40.InvalidDataException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i41.TooManyAttemptsException?>()) {
      return (data != null
              ? _i41.TooManyAttemptsException.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i42.Greeting?>()) {
      return (data != null ? _i42.Greeting.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.VersionCheckLog?>()) {
      return (data != null ? _i43.VersionCheckLog.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.SessionInfo?>()) {
      return (data != null ? _i44.SessionInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.TerminateSessionRequest?>()) {
      return (data != null ? _i45.TerminateSessionRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i46.CreateTeamRequest?>()) {
      return (data != null ? _i46.CreateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i47.DeleteTeamRequest?>()) {
      return (data != null ? _i47.DeleteTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i48.InviteTeamMemberRequest?>()) {
      return (data != null ? _i48.InviteTeamMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i49.LeaveTeamRequest?>()) {
      return (data != null ? _i49.LeaveTeamRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i50.RemoveMemberRequest?>()) {
      return (data != null ? _i50.RemoveMemberRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.RespondToInvitationRequest?>()) {
      return (data != null
              ? _i51.RespondToInvitationRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i52.RevokeInvitationRequest?>()) {
      return (data != null ? _i52.RevokeInvitationRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.Team?>()) {
      return (data != null ? _i53.Team.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i54.TeamMember?>()) {
      return (data != null ? _i54.TeamMember.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i55.TransferTeamOwnershipRequest?>()) {
      return (data != null
              ? _i55.TransferTeamOwnershipRequest.fromJson(data)
              : null)
          as T;
    }
    if (t == _i1.getType<_i56.UpdateMemberRoleRequest?>()) {
      return (data != null ? _i56.UpdateMemberRoleRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i57.UpdateTeamRequest?>()) {
      return (data != null ? _i57.UpdateTeamRequest.fromJson(data) : null) as T;
    }
    if (t == List<_i35.PlatformType>) {
      return (data as List)
              .map((e) => deserialize<_i35.PlatformType>(e))
              .toList()
          as T;
    }
    if (t == List<_i11.StoreLink>) {
      return (data as List).map((e) => deserialize<_i11.StoreLink>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i11.StoreLink>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i11.StoreLink>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i16.Version>) {
      return (data as List).map((e) => deserialize<_i16.Version>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i16.Version>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i16.Version>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i43.VersionCheckLog>) {
      return (data as List)
              .map((e) => deserialize<_i43.VersionCheckLog>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i43.VersionCheckLog>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i43.VersionCheckLog>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i12.StoreLinkEntry>) {
      return (data as List)
              .map((e) => deserialize<_i12.StoreLinkEntry>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i12.StoreLinkEntry>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i12.StoreLinkEntry>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == _i1.getType<List<_i35.PlatformType>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i35.PlatformType>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i18.AuthSession>) {
      return (data as List)
              .map((e) => deserialize<_i18.AuthSession>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i18.AuthSession>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i18.AuthSession>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i32.VerificationCode>) {
      return (data as List)
              .map((e) => deserialize<_i32.VerificationCode>(e))
              .toList()
          as T;
    }
    if (t == _i1.getType<List<_i32.VerificationCode>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i32.VerificationCode>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i53.Team>) {
      return (data as List).map((e) => deserialize<_i53.Team>(e)).toList() as T;
    }
    if (t == _i1.getType<List<_i53.Team>?>()) {
      return (data != null
              ? (data as List).map((e) => deserialize<_i53.Team>(e)).toList()
              : null)
          as T;
    }
    if (t == List<_i54.TeamMember>) {
      return (data as List).map((e) => deserialize<_i54.TeamMember>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i54.TeamMember>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i54.TeamMember>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i3.Application>) {
      return (data as List).map((e) => deserialize<_i3.Application>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i3.Application>?>()) {
      return (data != null
              ? (data as List)
                    .map((e) => deserialize<_i3.Application>(e))
                    .toList()
              : null)
          as T;
    }
    if (t == List<_i58.Application>) {
      return (data as List)
              .map((e) => deserialize<_i58.Application>(e))
              .toList()
          as T;
    }
    if (t == List<_i59.SessionInfo>) {
      return (data as List)
              .map((e) => deserialize<_i59.SessionInfo>(e))
              .toList()
          as T;
    }
    if (t == List<_i60.Team>) {
      return (data as List).map((e) => deserialize<_i60.Team>(e)).toList() as T;
    }
    if (t == List<_i61.TeamMember>) {
      return (data as List).map((e) => deserialize<_i61.TeamMember>(e)).toList()
          as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _i3.Application => 'Application',
      _i4.CreateApplicationRequest => 'CreateApplicationRequest',
      _i5.CreateApplicationResponse => 'CreateApplicationResponse',
      _i6.DeleteApplicationRequest => 'DeleteApplicationRequest',
      _i7.RegenerateApiKeyRequest => 'RegenerateApiKeyRequest',
      _i8.RegenerateApiKeyResponse => 'RegenerateApiKeyResponse',
      _i9.RequestApiKeyRegenerationRequest =>
        'RequestApiKeyRegenerationRequest',
      _i10.RequestApiKeyRegenerationResponse =>
        'RequestApiKeyRegenerationResponse',
      _i11.StoreLink => 'StoreLink',
      _i12.StoreLinkEntry => 'StoreLinkEntry',
      _i13.ToggleApplicationStatusRequest => 'ToggleApplicationStatusRequest',
      _i14.TransferApplicationOwnershipRequest =>
        'TransferApplicationOwnershipRequest',
      _i15.UpdateApplicationRequest => 'UpdateApplicationRequest',
      _i16.Version => 'Version',
      _i17.AuthResponse => 'AuthResponse',
      _i18.AuthSession => 'AuthSession',
      _i19.CheckEmailRequest => 'CheckEmailRequest',
      _i20.CheckEmailAndSendCodeResponse => 'CheckEmailAndSendCodeResponse',
      _i21.UserPublic => 'UserPublic',
      _i22.SuccessResponse => 'SuccessResponse',
      _i23.LoginRequest => 'LoginRequest',
      _i24.RefreshTokenRequest => 'RefreshTokenRequest',
      _i25.RegisterRequest => 'RegisterRequest',
      _i26.RegisterSendCodeRequest => 'RegisterSendCodeRequest',
      _i27.RegisterSetPasswordRequest => 'RegisterSetPasswordRequest',
      _i28.RegisterVerifyCodeRequest => 'RegisterVerifyCodeRequest',
      _i29.SendCodeResponse => 'SendCodeResponse',
      _i30.TokenPairResponse => 'TokenPairResponse',
      _i31.User => 'User',
      _i32.VerificationCode => 'VerificationCode',
      _i33.VerifyCodeResponse => 'VerifyCodeResponse',
      _i34.OwnerType => 'OwnerType',
      _i35.PlatformType => 'PlatformType',
      _i36.ResponseStatusType => 'ResponseStatusType',
      _i37.TeamMemberStatusType => 'TeamMemberStatusType',
      _i38.TeamRoleType => 'TeamRoleType',
      _i39.VerificationPurposeType => 'VerificationPurposeType',
      _i40.InvalidDataException => 'InvalidDataException',
      _i41.TooManyAttemptsException => 'TooManyAttemptsException',
      _i42.Greeting => 'Greeting',
      _i43.VersionCheckLog => 'VersionCheckLog',
      _i44.SessionInfo => 'SessionInfo',
      _i45.TerminateSessionRequest => 'TerminateSessionRequest',
      _i46.CreateTeamRequest => 'CreateTeamRequest',
      _i47.DeleteTeamRequest => 'DeleteTeamRequest',
      _i48.InviteTeamMemberRequest => 'InviteTeamMemberRequest',
      _i49.LeaveTeamRequest => 'LeaveTeamRequest',
      _i50.RemoveMemberRequest => 'RemoveMemberRequest',
      _i51.RespondToInvitationRequest => 'RespondToInvitationRequest',
      _i52.RevokeInvitationRequest => 'RevokeInvitationRequest',
      _i53.Team => 'Team',
      _i54.TeamMember => 'TeamMember',
      _i55.TransferTeamOwnershipRequest => 'TransferTeamOwnershipRequest',
      _i56.UpdateMemberRoleRequest => 'UpdateMemberRoleRequest',
      _i57.UpdateTeamRequest => 'UpdateTeamRequest',
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
      case _i3.Application():
        return 'Application';
      case _i4.CreateApplicationRequest():
        return 'CreateApplicationRequest';
      case _i5.CreateApplicationResponse():
        return 'CreateApplicationResponse';
      case _i6.DeleteApplicationRequest():
        return 'DeleteApplicationRequest';
      case _i7.RegenerateApiKeyRequest():
        return 'RegenerateApiKeyRequest';
      case _i8.RegenerateApiKeyResponse():
        return 'RegenerateApiKeyResponse';
      case _i9.RequestApiKeyRegenerationRequest():
        return 'RequestApiKeyRegenerationRequest';
      case _i10.RequestApiKeyRegenerationResponse():
        return 'RequestApiKeyRegenerationResponse';
      case _i11.StoreLink():
        return 'StoreLink';
      case _i12.StoreLinkEntry():
        return 'StoreLinkEntry';
      case _i13.ToggleApplicationStatusRequest():
        return 'ToggleApplicationStatusRequest';
      case _i14.TransferApplicationOwnershipRequest():
        return 'TransferApplicationOwnershipRequest';
      case _i15.UpdateApplicationRequest():
        return 'UpdateApplicationRequest';
      case _i16.Version():
        return 'Version';
      case _i17.AuthResponse():
        return 'AuthResponse';
      case _i18.AuthSession():
        return 'AuthSession';
      case _i19.CheckEmailRequest():
        return 'CheckEmailRequest';
      case _i20.CheckEmailAndSendCodeResponse():
        return 'CheckEmailAndSendCodeResponse';
      case _i21.UserPublic():
        return 'UserPublic';
      case _i22.SuccessResponse():
        return 'SuccessResponse';
      case _i23.LoginRequest():
        return 'LoginRequest';
      case _i24.RefreshTokenRequest():
        return 'RefreshTokenRequest';
      case _i25.RegisterRequest():
        return 'RegisterRequest';
      case _i26.RegisterSendCodeRequest():
        return 'RegisterSendCodeRequest';
      case _i27.RegisterSetPasswordRequest():
        return 'RegisterSetPasswordRequest';
      case _i28.RegisterVerifyCodeRequest():
        return 'RegisterVerifyCodeRequest';
      case _i29.SendCodeResponse():
        return 'SendCodeResponse';
      case _i30.TokenPairResponse():
        return 'TokenPairResponse';
      case _i31.User():
        return 'User';
      case _i32.VerificationCode():
        return 'VerificationCode';
      case _i33.VerifyCodeResponse():
        return 'VerifyCodeResponse';
      case _i34.OwnerType():
        return 'OwnerType';
      case _i35.PlatformType():
        return 'PlatformType';
      case _i36.ResponseStatusType():
        return 'ResponseStatusType';
      case _i37.TeamMemberStatusType():
        return 'TeamMemberStatusType';
      case _i38.TeamRoleType():
        return 'TeamRoleType';
      case _i39.VerificationPurposeType():
        return 'VerificationPurposeType';
      case _i40.InvalidDataException():
        return 'InvalidDataException';
      case _i41.TooManyAttemptsException():
        return 'TooManyAttemptsException';
      case _i42.Greeting():
        return 'Greeting';
      case _i43.VersionCheckLog():
        return 'VersionCheckLog';
      case _i44.SessionInfo():
        return 'SessionInfo';
      case _i45.TerminateSessionRequest():
        return 'TerminateSessionRequest';
      case _i46.CreateTeamRequest():
        return 'CreateTeamRequest';
      case _i47.DeleteTeamRequest():
        return 'DeleteTeamRequest';
      case _i48.InviteTeamMemberRequest():
        return 'InviteTeamMemberRequest';
      case _i49.LeaveTeamRequest():
        return 'LeaveTeamRequest';
      case _i50.RemoveMemberRequest():
        return 'RemoveMemberRequest';
      case _i51.RespondToInvitationRequest():
        return 'RespondToInvitationRequest';
      case _i52.RevokeInvitationRequest():
        return 'RevokeInvitationRequest';
      case _i53.Team():
        return 'Team';
      case _i54.TeamMember():
        return 'TeamMember';
      case _i55.TransferTeamOwnershipRequest():
        return 'TransferTeamOwnershipRequest';
      case _i56.UpdateMemberRoleRequest():
        return 'UpdateMemberRoleRequest';
      case _i57.UpdateTeamRequest():
        return 'UpdateTeamRequest';
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
    if (dataClassName == 'Application') {
      return deserialize<_i3.Application>(data['data']);
    }
    if (dataClassName == 'CreateApplicationRequest') {
      return deserialize<_i4.CreateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'CreateApplicationResponse') {
      return deserialize<_i5.CreateApplicationResponse>(data['data']);
    }
    if (dataClassName == 'DeleteApplicationRequest') {
      return deserialize<_i6.DeleteApplicationRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyRequest') {
      return deserialize<_i7.RegenerateApiKeyRequest>(data['data']);
    }
    if (dataClassName == 'RegenerateApiKeyResponse') {
      return deserialize<_i8.RegenerateApiKeyResponse>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationRequest') {
      return deserialize<_i9.RequestApiKeyRegenerationRequest>(data['data']);
    }
    if (dataClassName == 'RequestApiKeyRegenerationResponse') {
      return deserialize<_i10.RequestApiKeyRegenerationResponse>(data['data']);
    }
    if (dataClassName == 'StoreLink') {
      return deserialize<_i11.StoreLink>(data['data']);
    }
    if (dataClassName == 'StoreLinkEntry') {
      return deserialize<_i12.StoreLinkEntry>(data['data']);
    }
    if (dataClassName == 'ToggleApplicationStatusRequest') {
      return deserialize<_i13.ToggleApplicationStatusRequest>(data['data']);
    }
    if (dataClassName == 'TransferApplicationOwnershipRequest') {
      return deserialize<_i14.TransferApplicationOwnershipRequest>(
        data['data'],
      );
    }
    if (dataClassName == 'UpdateApplicationRequest') {
      return deserialize<_i15.UpdateApplicationRequest>(data['data']);
    }
    if (dataClassName == 'Version') {
      return deserialize<_i16.Version>(data['data']);
    }
    if (dataClassName == 'AuthResponse') {
      return deserialize<_i17.AuthResponse>(data['data']);
    }
    if (dataClassName == 'AuthSession') {
      return deserialize<_i18.AuthSession>(data['data']);
    }
    if (dataClassName == 'CheckEmailRequest') {
      return deserialize<_i19.CheckEmailRequest>(data['data']);
    }
    if (dataClassName == 'CheckEmailAndSendCodeResponse') {
      return deserialize<_i20.CheckEmailAndSendCodeResponse>(data['data']);
    }
    if (dataClassName == 'UserPublic') {
      return deserialize<_i21.UserPublic>(data['data']);
    }
    if (dataClassName == 'SuccessResponse') {
      return deserialize<_i22.SuccessResponse>(data['data']);
    }
    if (dataClassName == 'LoginRequest') {
      return deserialize<_i23.LoginRequest>(data['data']);
    }
    if (dataClassName == 'RefreshTokenRequest') {
      return deserialize<_i24.RefreshTokenRequest>(data['data']);
    }
    if (dataClassName == 'RegisterRequest') {
      return deserialize<_i25.RegisterRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSendCodeRequest') {
      return deserialize<_i26.RegisterSendCodeRequest>(data['data']);
    }
    if (dataClassName == 'RegisterSetPasswordRequest') {
      return deserialize<_i27.RegisterSetPasswordRequest>(data['data']);
    }
    if (dataClassName == 'RegisterVerifyCodeRequest') {
      return deserialize<_i28.RegisterVerifyCodeRequest>(data['data']);
    }
    if (dataClassName == 'SendCodeResponse') {
      return deserialize<_i29.SendCodeResponse>(data['data']);
    }
    if (dataClassName == 'TokenPairResponse') {
      return deserialize<_i30.TokenPairResponse>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i31.User>(data['data']);
    }
    if (dataClassName == 'VerificationCode') {
      return deserialize<_i32.VerificationCode>(data['data']);
    }
    if (dataClassName == 'VerifyCodeResponse') {
      return deserialize<_i33.VerifyCodeResponse>(data['data']);
    }
    if (dataClassName == 'OwnerType') {
      return deserialize<_i34.OwnerType>(data['data']);
    }
    if (dataClassName == 'PlatformType') {
      return deserialize<_i35.PlatformType>(data['data']);
    }
    if (dataClassName == 'ResponseStatusType') {
      return deserialize<_i36.ResponseStatusType>(data['data']);
    }
    if (dataClassName == 'TeamMemberStatusType') {
      return deserialize<_i37.TeamMemberStatusType>(data['data']);
    }
    if (dataClassName == 'TeamRoleType') {
      return deserialize<_i38.TeamRoleType>(data['data']);
    }
    if (dataClassName == 'VerificationPurposeType') {
      return deserialize<_i39.VerificationPurposeType>(data['data']);
    }
    if (dataClassName == 'InvalidDataException') {
      return deserialize<_i40.InvalidDataException>(data['data']);
    }
    if (dataClassName == 'TooManyAttemptsException') {
      return deserialize<_i41.TooManyAttemptsException>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i42.Greeting>(data['data']);
    }
    if (dataClassName == 'VersionCheckLog') {
      return deserialize<_i43.VersionCheckLog>(data['data']);
    }
    if (dataClassName == 'SessionInfo') {
      return deserialize<_i44.SessionInfo>(data['data']);
    }
    if (dataClassName == 'TerminateSessionRequest') {
      return deserialize<_i45.TerminateSessionRequest>(data['data']);
    }
    if (dataClassName == 'CreateTeamRequest') {
      return deserialize<_i46.CreateTeamRequest>(data['data']);
    }
    if (dataClassName == 'DeleteTeamRequest') {
      return deserialize<_i47.DeleteTeamRequest>(data['data']);
    }
    if (dataClassName == 'InviteTeamMemberRequest') {
      return deserialize<_i48.InviteTeamMemberRequest>(data['data']);
    }
    if (dataClassName == 'LeaveTeamRequest') {
      return deserialize<_i49.LeaveTeamRequest>(data['data']);
    }
    if (dataClassName == 'RemoveMemberRequest') {
      return deserialize<_i50.RemoveMemberRequest>(data['data']);
    }
    if (dataClassName == 'RespondToInvitationRequest') {
      return deserialize<_i51.RespondToInvitationRequest>(data['data']);
    }
    if (dataClassName == 'RevokeInvitationRequest') {
      return deserialize<_i52.RevokeInvitationRequest>(data['data']);
    }
    if (dataClassName == 'Team') {
      return deserialize<_i53.Team>(data['data']);
    }
    if (dataClassName == 'TeamMember') {
      return deserialize<_i54.TeamMember>(data['data']);
    }
    if (dataClassName == 'TransferTeamOwnershipRequest') {
      return deserialize<_i55.TransferTeamOwnershipRequest>(data['data']);
    }
    if (dataClassName == 'UpdateMemberRoleRequest') {
      return deserialize<_i56.UpdateMemberRoleRequest>(data['data']);
    }
    if (dataClassName == 'UpdateTeamRequest') {
      return deserialize<_i57.UpdateTeamRequest>(data['data']);
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
      case _i3.Application:
        return _i3.Application.t;
      case _i11.StoreLink:
        return _i11.StoreLink.t;
      case _i16.Version:
        return _i16.Version.t;
      case _i18.AuthSession:
        return _i18.AuthSession.t;
      case _i31.User:
        return _i31.User.t;
      case _i32.VerificationCode:
        return _i32.VerificationCode.t;
      case _i43.VersionCheckLog:
        return _i43.VersionCheckLog.t;
      case _i53.Team:
        return _i53.Team.t;
      case _i54.TeamMember:
        return _i54.TeamMember.t;
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
