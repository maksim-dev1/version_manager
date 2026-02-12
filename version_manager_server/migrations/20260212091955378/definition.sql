BEGIN;

--
-- Function: gen_random_uuid_v7()
-- Source: https://gist.github.com/kjmph/5bd772b2c2df145aa645b837da7eca74
-- License: MIT (copyright notice included on the generator source code).
--
create or replace function gen_random_uuid_v7()
returns uuid
as $$
begin
  -- use random v4 uuid as starting point (which has the same variant we need)
  -- then overlay timestamp
  -- then set version 7 by flipping the 2 and 1 bit in the version 4 string
  return encode(
    set_bit(
      set_bit(
        overlay(uuid_send(gen_random_uuid())
                placing substring(int8send(floor(extract(epoch from clock_timestamp()) * 1000)::bigint) from 3)
                from 1 for 6
        ),
        52, 1
      ),
      53, 1
    ),
    'hex')::uuid;
end
$$
language plpgsql
volatile;

--
-- Class Application as table applications
--
CREATE TABLE "applications" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "namespace" text NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL DEFAULT ''::text,
    "iconUrl" text,
    "platforms" json NOT NULL,
    "ownerType" text NOT NULL,
    "ownerUserId" uuid,
    "ownerTeamId" uuid,
    "isActive" boolean NOT NULL DEFAULT true,
    "apiKeyHash" text NOT NULL,
    "apiKeyLast4" text NOT NULL DEFAULT ''::text,
    "apiKeyCreatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "apiKeyLastRegeneratedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "application_namespace_unique_idx" ON "applications" USING btree ("namespace");
CREATE INDEX "application_owner_user_idx" ON "applications" USING btree ("ownerUserId");
CREATE INDEX "application_owner_team_idx" ON "applications" USING btree ("ownerTeamId");
CREATE INDEX "application_api_key_hash_idx" ON "applications" USING btree ("apiKeyHash");

--
-- Class AuthSession as table auth_sessions
--
CREATE TABLE "auth_sessions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid NOT NULL,
    "tokenHash" text NOT NULL,
    "refreshTokenHash" text NOT NULL,
    "deviceInfo" text,
    "ipAddress" text,
    "userAgent" text,
    "expiresAt" timestamp without time zone NOT NULL,
    "refreshExpiresAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastActivityAt" timestamp without time zone,
    "isActive" boolean NOT NULL DEFAULT true,
    "revokedAt" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "auth_session_token_hash_unique_idx" ON "auth_sessions" USING btree ("tokenHash");
CREATE UNIQUE INDEX "auth_session_refresh_token_hash_unique_idx" ON "auth_sessions" USING btree ("refreshTokenHash");
CREATE INDEX "auth_session_user_idx" ON "auth_sessions" USING btree ("userId");
CREATE INDEX "auth_session_is_active_idx" ON "auth_sessions" USING btree ("isActive");
CREATE INDEX "auth_session_expires_idx" ON "auth_sessions" USING btree ("expiresAt");

--
-- Class StoreLink as table store_links
--
CREATE TABLE "store_links" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "platform" text NOT NULL,
    "storeName" text NOT NULL,
    "url" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "store_link_application_idx" ON "store_links" USING btree ("applicationId");
CREATE INDEX "store_link_platform_idx" ON "store_links" USING btree ("platform");
CREATE UNIQUE INDEX "store_link_app_platform_url_unique_idx" ON "store_links" USING btree ("applicationId", "platform", "url");

--
-- Class TeamMember as table team_members
--
CREATE TABLE "team_members" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "teamId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    "role" text NOT NULL,
    "status" text NOT NULL DEFAULT 'invited'::text,
    "invitedById" uuid,
    "invitedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "joinedAt" timestamp without time zone,
    "invitationExpiresAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "team_member_team_idx" ON "team_members" USING btree ("teamId");
CREATE INDEX "team_member_user_idx" ON "team_members" USING btree ("userId");
CREATE INDEX "team_member_status_idx" ON "team_members" USING btree ("status");
CREATE INDEX "team_member_invited_by_idx" ON "team_members" USING btree ("invitedById");
CREATE UNIQUE INDEX "team_member_team_user_unique_idx" ON "team_members" USING btree ("teamId", "userId");

--
-- Class Team as table teams
--
CREATE TABLE "teams" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "description" text,
    "ownerId" uuid NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "team_owner_idx" ON "teams" USING btree ("ownerId");

--
-- Class User as table users
--
CREATE TABLE "users" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "email" text NOT NULL,
    "passwordHash" text NOT NULL,
    "firstName" text,
    "lastName" text,
    "displayName" text,
    "avatarUrl" text,
    "phone" text,
    "isEmailVerified" boolean NOT NULL DEFAULT false,
    "emailVerifiedAt" timestamp without time zone,
    "isActive" boolean NOT NULL DEFAULT true,
    "lastLoginAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "user_email_unique_idx" ON "users" USING btree ("email");

--
-- Class VerificationCode as table verification_codes
--
CREATE TABLE "verification_codes" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "userId" uuid,
    "email" text NOT NULL,
    "purpose" text NOT NULL,
    "codeHash" text NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isUsed" boolean NOT NULL DEFAULT false,
    "usedAt" timestamp without time zone,
    "attemptsUsed" bigint NOT NULL DEFAULT 0,
    "maxAttempts" bigint NOT NULL DEFAULT 5,
    "resendAvailableAt" timestamp without time zone,
    "ipAddress" text,
    "userAgent" text
);

-- Indexes
CREATE INDEX "verification_code_email_idx" ON "verification_codes" USING btree ("email");
CREATE INDEX "verification_code_purpose_idx" ON "verification_codes" USING btree ("purpose");
CREATE INDEX "verification_code_user_idx" ON "verification_codes" USING btree ("userId");
CREATE INDEX "verification_code_expires_idx" ON "verification_codes" USING btree ("expiresAt");
CREATE INDEX "verification_code_is_used_idx" ON "verification_codes" USING btree ("isUsed");

--
-- Class VersionCheckDailySummary as table version_check_daily_summaries
--
CREATE TABLE "version_check_daily_summaries" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "platform" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "versionNumber" text NOT NULL,
    "totalChecks" bigint NOT NULL DEFAULT 0,
    "uniqueDevices" bigint NOT NULL DEFAULT 0,
    "blockedChecks" bigint NOT NULL DEFAULT 0,
    "updateAvailableChecks" bigint NOT NULL DEFAULT 0,
    "activeChecks" bigint NOT NULL DEFAULT 0,
    "errorChecks" bigint NOT NULL DEFAULT 0,
    "newInstalls" bigint NOT NULL DEFAULT 0,
    "upgrades" bigint NOT NULL DEFAULT 0,
    "avgProcessingTimeMs" bigint,
    "maxProcessingTimeMs" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "summary_application_idx" ON "version_check_daily_summaries" USING btree ("applicationId");
CREATE INDEX "summary_date_idx" ON "version_check_daily_summaries" USING btree ("date");
CREATE UNIQUE INDEX "summary_app_date_platform_build_unique_idx" ON "version_check_daily_summaries" USING btree ("applicationId", "date", "platform", "buildNumber");
CREATE INDEX "summary_app_date_idx" ON "version_check_daily_summaries" USING btree ("applicationId", "date");
CREATE INDEX "summary_platform_date_idx" ON "version_check_daily_summaries" USING btree ("platform", "date");

--
-- Class VersionCheckLog as table version_check_logs
--
CREATE TABLE "version_check_logs" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "versionId" uuid,
    "versionNumber" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "platform" text NOT NULL,
    "osVersion" text,
    "deviceId" text,
    "locale" text,
    "deviceModel" text,
    "screenWidth" bigint,
    "screenHeight" bigint,
    "timezone" text,
    "frameworkVersion" text,
    "connectionType" text,
    "buildType" text,
    "cpuArchitecture" text,
    "totalRamMb" bigint,
    "freeStorageMb" bigint,
    "deviceLanguage" text,
    "isLowPowerMode" boolean,
    "sdkVersion" text,
    "ipAddress" text,
    "userAgent" text,
    "country" text,
    "responseStatus" text NOT NULL,
    "updatePriority" text,
    "processingTimeMs" bigint,
    "isFirstCheck" boolean,
    "isNewVersion" boolean,
    "checkedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "log_application_idx" ON "version_check_logs" USING btree ("applicationId");
CREATE INDEX "log_version_idx" ON "version_check_logs" USING btree ("versionId");
CREATE INDEX "log_device_idx" ON "version_check_logs" USING btree ("deviceId");
CREATE INDEX "log_checked_at_idx" ON "version_check_logs" USING btree ("checkedAt");
CREATE INDEX "log_platform_idx" ON "version_check_logs" USING btree ("platform");
CREATE INDEX "log_app_checked_composite_idx" ON "version_check_logs" USING btree ("applicationId", "checkedAt");
CREATE INDEX "log_app_platform_checked_composite_idx" ON "version_check_logs" USING btree ("applicationId", "platform", "checkedAt");
CREATE INDEX "log_device_checked_composite_idx" ON "version_check_logs" USING btree ("deviceId", "checkedAt");

--
-- Class Version as table versions
--
CREATE TABLE "versions" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "versionNumber" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "changelog" text NOT NULL,
    "isBlocked" boolean NOT NULL DEFAULT false,
    "blockReason" text,
    "recommendedVersionId" uuid,
    "recommendationFrequency" text,
    "recommendationEveryNthLaunch" bigint,
    "recommendationPeriodHours" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "version_application_idx" ON "versions" USING btree ("applicationId");
CREATE INDEX "version_build_number_idx" ON "versions" USING btree ("buildNumber");
CREATE INDEX "version_recommended_idx" ON "versions" USING btree ("recommendedVersionId");
CREATE UNIQUE INDEX "version_app_version_unique_idx" ON "versions" USING btree ("applicationId", "versionNumber");
CREATE UNIQUE INDEX "version_app_build_unique_idx" ON "versions" USING btree ("applicationId", "buildNumber");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "userId" text,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "applications" table
--
ALTER TABLE ONLY "applications"
    ADD CONSTRAINT "applications_fk_0"
    FOREIGN KEY("ownerUserId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "applications"
    ADD CONSTRAINT "applications_fk_1"
    FOREIGN KEY("ownerTeamId")
    REFERENCES "teams"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "auth_sessions" table
--
ALTER TABLE ONLY "auth_sessions"
    ADD CONSTRAINT "auth_sessions_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "store_links" table
--
ALTER TABLE ONLY "store_links"
    ADD CONSTRAINT "store_links_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "team_members" table
--
ALTER TABLE ONLY "team_members"
    ADD CONSTRAINT "team_members_fk_0"
    FOREIGN KEY("teamId")
    REFERENCES "teams"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "team_members"
    ADD CONSTRAINT "team_members_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "team_members"
    ADD CONSTRAINT "team_members_fk_2"
    FOREIGN KEY("invitedById")
    REFERENCES "users"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "teams" table
--
ALTER TABLE ONLY "teams"
    ADD CONSTRAINT "teams_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "verification_codes" table
--
ALTER TABLE ONLY "verification_codes"
    ADD CONSTRAINT "verification_codes_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "version_check_daily_summaries" table
--
ALTER TABLE ONLY "version_check_daily_summaries"
    ADD CONSTRAINT "version_check_daily_summaries_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "version_check_logs" table
--
ALTER TABLE ONLY "version_check_logs"
    ADD CONSTRAINT "version_check_logs_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "version_check_logs"
    ADD CONSTRAINT "version_check_logs_fk_1"
    FOREIGN KEY("versionId")
    REFERENCES "versions"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "versions" table
--
ALTER TABLE ONLY "versions"
    ADD CONSTRAINT "versions_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "versions"
    ADD CONSTRAINT "versions_fk_1"
    FOREIGN KEY("recommendedVersionId")
    REFERENCES "versions"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260212091955378', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260212091955378', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
