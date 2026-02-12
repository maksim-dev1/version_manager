BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "version_check_daily_summaries" DROP COLUMN "consentGivenCount";
ALTER TABLE "version_check_daily_summaries" DROP COLUMN "avgAppLaunchCount";
ALTER TABLE "version_check_daily_summaries" DROP COLUMN "avgAppUsageDurationSec";
--
-- ACTION ALTER TABLE
--
DROP INDEX "log_response_status_idx";
DROP INDEX "log_build_type_idx";
DROP INDEX "log_app_version_composite_idx";
DROP INDEX "log_app_status_composite_idx";
DROP INDEX "log_locale_idx";
DROP INDEX "log_country_idx";
DROP INDEX "log_sdk_version_idx";
DROP INDEX "log_consent_idx";
ALTER TABLE "version_check_logs" DROP COLUMN "appInstallTime";
ALTER TABLE "version_check_logs" DROP COLUMN "appLaunchCount";
ALTER TABLE "version_check_logs" DROP COLUMN "lastUpdateCheckAt";
ALTER TABLE "version_check_logs" DROP COLUMN "appUsageDurationSec";
ALTER TABLE "version_check_logs" DROP COLUMN "consentGiven";

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
