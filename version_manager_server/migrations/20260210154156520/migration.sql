BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "applications" ADD COLUMN "apiKeyLast4" text NOT NULL DEFAULT ''::text;

--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260210154156520', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260210154156520', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
