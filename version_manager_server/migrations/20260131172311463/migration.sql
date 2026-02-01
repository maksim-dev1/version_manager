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
-- ACTION DROP TABLE
--
DROP TABLE "teams" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "team_members" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "versions" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "version_check_logs" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "store_links" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "applications" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_user" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_session" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_profile_image" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_profile" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_core_jwt_refresh_token" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_secret_challenge" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_rate_limited_request_attempt" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_passkey_challenge" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_passkey_account" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_google_account" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_firebase_account" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_email_account_request" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_email_account_password_reset_request" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_email_account" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "serverpod_auth_idp_apple_account" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "applications" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "namespace" text NOT NULL,
    "name" text NOT NULL,
    "description" text NOT NULL,
    "iconUrl" text,
    "platforms" json NOT NULL,
    "ownerType" text NOT NULL,
    "ownerUserId" bigint,
    "ownerTeamId" uuid,
    "isActive" boolean NOT NULL DEFAULT true,
    "apiKeyHash" text NOT NULL,
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
-- ACTION CREATE TABLE
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

--
-- ACTION CREATE TABLE
--
CREATE TABLE "team_members" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "teamId" uuid NOT NULL,
    "userId" bigint NOT NULL,
    "role" text NOT NULL,
    "status" text NOT NULL DEFAULT 'invited'::text,
    "invitedById" bigint,
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
-- ACTION CREATE TABLE
--
CREATE TABLE "teams" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "name" text NOT NULL,
    "description" text,
    "ownerId" bigint NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "team_owner_idx" ON "teams" USING btree ("ownerId");

--
-- ACTION CREATE TABLE
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
    "ipAddress" text,
    "responseStatus" text NOT NULL,
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
-- ACTION CREATE TABLE
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
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "store_links"
    ADD CONSTRAINT "store_links_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "teams"
    ADD CONSTRAINT "teams_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "users"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
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
-- ACTION CREATE FOREIGN KEY
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
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260131172311463', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260131172311463', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


--
-- MIGRATION VERSION FOR 'serverpod_auth_idp', 'serverpod_auth_core'
--
DELETE FROM "serverpod_migrations"WHERE "module" IN ('serverpod_auth_idp', 'serverpod_auth_core');

COMMIT;
