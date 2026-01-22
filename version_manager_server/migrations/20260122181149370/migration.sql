BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "version_settings" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "app_versions" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_versions" (
    "id" bigserial PRIMARY KEY,
    "applicationId" uuid NOT NULL,
    "version" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "platform" text NOT NULL DEFAULT 'unknown'::text,
    "changelog" text NOT NULL,
    "isBlocked" boolean NOT NULL DEFAULT false,
    "blockReason" text,
    "recommendedUpdate" boolean NOT NULL DEFAULT false,
    "storeLinks" json NOT NULL,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--
-- ACTION DROP TABLE
--
DROP TABLE "applications" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "applications" (
    "id" bigserial PRIMARY KEY,
    "packageName" text NOT NULL,
    "appName" text NOT NULL,
    "description" text NOT NULL,
    "iconUrl" text NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260122181149370', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260122181149370', "timestamp" = now();

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
