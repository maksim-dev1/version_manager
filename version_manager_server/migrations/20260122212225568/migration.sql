BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_sessions" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "token" text NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "token_idx" ON "user_sessions" USING btree ("token");
CREATE INDEX "user_id_idx" ON "user_sessions" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "username" text NOT NULL,
    "passwordHash" text NOT NULL,
    "salt" text NOT NULL,
    "isActive" boolean NOT NULL DEFAULT true,
    "createdAt" timestamp without time zone NOT NULL,
    "updatedAt" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "username_idx" ON "users" USING btree ("username");


--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260122212225568', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260122212225568', "timestamp" = now();

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
