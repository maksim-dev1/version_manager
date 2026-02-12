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
-- ACTION CREATE TABLE
--
CREATE TABLE "version_check_daily_summaries" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "platform" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "versionNumber" text NOT NULL,
    "totalChecks" bigint NOT NULL DEFAULT 0,
    "uniqueDevices" bigint NOT NULL DEFAULT 0,
    "blockedChecks" bigint NOT NULL DEFAULT 0,
    "updateAvailableChecks" bigint NOT NULL DEFAULT 0,
    "activeChecks" bigint NOT NULL DEFAULT 0,
    "errorChecks" bigint NOT NULL DEFAULT 0,
    "newInstalls" bigint NOT NULL DEFAULT 0,
    "upgrades" bigint NOT NULL DEFAULT 0,
    "avgProcessingTimeMs" bigint,
    "maxProcessingTimeMs" bigint,
    "consentGivenCount" bigint NOT NULL DEFAULT 0,
    "avgAppLaunchCount" bigint,
    "avgAppUsageDurationSec" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "summary_application_idx" ON "version_check_daily_summaries" USING btree ("applicationId");
CREATE INDEX "summary_date_idx" ON "version_check_daily_summaries" USING btree ("date");
CREATE UNIQUE INDEX "summary_app_date_platform_build_unique_idx" ON "version_check_daily_summaries" USING btree ("applicationId", "date", "platform", "buildNumber");
CREATE INDEX "summary_app_date_idx" ON "version_check_daily_summaries" USING btree ("applicationId", "date");
CREATE INDEX "summary_platform_date_idx" ON "version_check_daily_summaries" USING btree ("platform", "date");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "version_check_logs" ADD COLUMN "screenWidth" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "screenHeight" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "timezone" text;
ALTER TABLE "version_check_logs" ADD COLUMN "frameworkVersion" text;
ALTER TABLE "version_check_logs" ADD COLUMN "connectionType" text;
ALTER TABLE "version_check_logs" ADD COLUMN "buildType" text;
ALTER TABLE "version_check_logs" ADD COLUMN "cpuArchitecture" text;
ALTER TABLE "version_check_logs" ADD COLUMN "totalRamMb" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "freeStorageMb" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "deviceLanguage" text;
ALTER TABLE "version_check_logs" ADD COLUMN "isLowPowerMode" boolean;
ALTER TABLE "version_check_logs" ADD COLUMN "appInstallTime" timestamp without time zone;
ALTER TABLE "version_check_logs" ADD COLUMN "appLaunchCount" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "lastUpdateCheckAt" timestamp without time zone;
ALTER TABLE "version_check_logs" ADD COLUMN "appUsageDurationSec" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "sdkVersion" text;
ALTER TABLE "version_check_logs" ADD COLUMN "consentGiven" boolean;
ALTER TABLE "version_check_logs" ADD COLUMN "userAgent" text;
ALTER TABLE "version_check_logs" ADD COLUMN "country" text;
ALTER TABLE "version_check_logs" ADD COLUMN "updatePriority" text;
ALTER TABLE "version_check_logs" ADD COLUMN "processingTimeMs" bigint;
ALTER TABLE "version_check_logs" ADD COLUMN "isFirstCheck" boolean;
ALTER TABLE "version_check_logs" ADD COLUMN "isNewVersion" boolean;
CREATE INDEX "log_response_status_idx" ON "version_check_logs" USING btree ("responseStatus");
CREATE INDEX "log_build_type_idx" ON "version_check_logs" USING btree ("buildType");
CREATE INDEX "log_app_version_composite_idx" ON "version_check_logs" USING btree ("applicationId", "buildNumber");
CREATE INDEX "log_app_status_composite_idx" ON "version_check_logs" USING btree ("applicationId", "responseStatus", "checkedAt");
CREATE INDEX "log_locale_idx" ON "version_check_logs" USING btree ("locale");
CREATE INDEX "log_country_idx" ON "version_check_logs" USING btree ("country");
CREATE INDEX "log_sdk_version_idx" ON "version_check_logs" USING btree ("sdkVersion");
CREATE INDEX "log_consent_idx" ON "version_check_logs" USING btree ("consentGiven");
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "version_check_daily_summaries"
    ADD CONSTRAINT "version_check_daily_summaries_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260211184035854', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260211184035854', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
