BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "app_instances" ADD COLUMN "lastBuildNumber" bigint;

--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260218123801588', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260218123801588', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
