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
DROP TABLE "app_versions" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "applications" CASCADE;

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
    "ownerUserId" uuid,
    "ownerTeamId" uuid,
    "isActive" boolean NOT NULL DEFAULT true,
    "apiKeyHash" text NOT NULL,
    "apiKeyCreatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "apiKeyLastRegeneratedAt" timestamp without time zone,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "namespace_unique_idx" ON "applications" USING btree ("namespace");
CREATE INDEX "owner_user_idx" ON "applications" USING btree ("ownerUserId");
CREATE INDEX "owner_team_idx" ON "applications" USING btree ("ownerTeamId");
CREATE INDEX "api_key_hash_idx" ON "applications" USING btree ("apiKeyHash");

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
    "userId" uuid NOT NULL,
    "role" text NOT NULL,
    "status" text NOT NULL DEFAULT 'invited'::text,
    "invitedBy" uuid,
    "invitedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "joinedAt" timestamp without time zone,
    "invitationExpiresAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "team_idx" ON "team_members" USING btree ("teamId");
CREATE INDEX "user_idx" ON "team_members" USING btree ("userId");
CREATE INDEX "status_idx" ON "team_members" USING btree ("status");
CREATE UNIQUE INDEX "team_user_unique_idx" ON "team_members" USING btree ("teamId", "userId");

--
-- ACTION CREATE TABLE
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
CREATE INDEX "owner_idx" ON "teams" USING btree ("ownerId");

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
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260128124304605', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260128124304605', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
