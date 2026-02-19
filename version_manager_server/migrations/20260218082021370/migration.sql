BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "daily_dimension_summaries" DROP COLUMN "checkCount";
ALTER TABLE "daily_dimension_summaries" ADD COLUMN "userCount" bigint NOT NULL DEFAULT 0;

--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260218082021370', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260218082021370', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
