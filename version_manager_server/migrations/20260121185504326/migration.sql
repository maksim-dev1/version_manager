BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_versions" (
    "id" bigserial PRIMARY KEY,
    "applicationId" bigint NOT NULL,
    "version" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "platform" text NOT NULL,
    "downloadUrl" text NOT NULL,
    "isBlocked" boolean NOT NULL DEFAULT false,
    "blockReason" text,
    "isMandatory" boolean NOT NULL DEFAULT false,
    "releaseNotes" text,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "fileSize" bigint,
    "minOsVersion" text
);

-- Indexes
CREATE UNIQUE INDEX "application_version_idx" ON "app_versions" USING btree ("applicationId", "version", "platform");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "applications" (
    "id" bigserial PRIMARY KEY,
    "packageName" text NOT NULL,
    "displayName" text NOT NULL,
    "description" text,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "isActive" boolean NOT NULL DEFAULT true,
    "apiKey" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "version_settings" (
    "id" bigserial PRIMARY KEY,
    "applicationId" bigint NOT NULL,
    "platform" text NOT NULL,
    "minimumVersion" text NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "app_platform_idx" ON "version_settings" USING btree ("applicationId", "platform");


--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260121185504326', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260121185504326', "timestamp" = now();

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
