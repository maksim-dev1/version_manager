BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "versions" ADD COLUMN "recommendationFrequency" text;
ALTER TABLE "versions" ADD COLUMN "recommendationEveryNthLaunch" bigint;
ALTER TABLE "versions" ADD COLUMN "recommendationPeriodHours" bigint;

--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260211102749760', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260211102749760', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
