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
DROP TABLE "version_check_logs" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "version_check_daily_summaries" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_instances" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "instanceId" text NOT NULL,
    "platform" text NOT NULL,
    "firstSeenAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastSeenAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastActiveDate" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "ai_app_instance_unique_idx" ON "app_instances" USING btree ("applicationId", "instanceId");
CREATE INDEX "ai_application_idx" ON "app_instances" USING btree ("applicationId");
CREATE INDEX "ai_first_seen_idx" ON "app_instances" USING btree ("applicationId", "firstSeenAt");
CREATE INDEX "ai_last_seen_idx" ON "app_instances" USING btree ("applicationId", "lastSeenAt");
CREATE INDEX "ai_app_platform_idx" ON "app_instances" USING btree ("applicationId", "platform");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "daily_check_summaries" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "platform" text NOT NULL,
    "buildNumber" bigint NOT NULL,
    "versionNumber" text NOT NULL,
    "uniqueDevices" bigint NOT NULL DEFAULT 0,
    "newDevices" bigint NOT NULL DEFAULT 0,
    "totalChecks" bigint NOT NULL DEFAULT 0,
    "blockedChecks" bigint NOT NULL DEFAULT 0,
    "updateAvailableChecks" bigint NOT NULL DEFAULT 0,
    "activeChecks" bigint NOT NULL DEFAULT 0,
    "errorChecks" bigint NOT NULL DEFAULT 0,
    "avgProcessingTimeMs" bigint,
    "maxProcessingTimeMs" bigint,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "dcs_app_date_platform_build_unique_idx" ON "daily_check_summaries" USING btree ("applicationId", "date", "platform", "buildNumber");
CREATE INDEX "dcs_application_idx" ON "daily_check_summaries" USING btree ("applicationId");
CREATE INDEX "dcs_date_idx" ON "daily_check_summaries" USING btree ("date");
CREATE INDEX "dcs_app_date_idx" ON "daily_check_summaries" USING btree ("applicationId", "date");
CREATE INDEX "dcs_platform_date_idx" ON "daily_check_summaries" USING btree ("platform", "date");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "daily_dimension_summaries" (
    "id" uuid PRIMARY KEY DEFAULT gen_random_uuid_v7(),
    "applicationId" uuid NOT NULL,
    "date" timestamp without time zone NOT NULL,
    "dimensionType" text NOT NULL,
    "dimensionValue" text NOT NULL,
    "platform" text NOT NULL,
    "checkCount" bigint NOT NULL DEFAULT 0
);

-- Indexes
CREATE UNIQUE INDEX "dds_app_date_dim_val_plat_unique_idx" ON "daily_dimension_summaries" USING btree ("applicationId", "date", "dimensionType", "dimensionValue", "platform");
CREATE INDEX "dds_application_idx" ON "daily_dimension_summaries" USING btree ("applicationId");
CREATE INDEX "dds_app_date_idx" ON "daily_dimension_summaries" USING btree ("applicationId", "date");
CREATE INDEX "dds_app_dim_type_idx" ON "daily_dimension_summaries" USING btree ("applicationId", "dimensionType");
CREATE INDEX "dds_app_date_dim_idx" ON "daily_dimension_summaries" USING btree ("applicationId", "date", "dimensionType");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "app_instances"
    ADD CONSTRAINT "app_instances_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "daily_check_summaries"
    ADD CONSTRAINT "daily_check_summaries_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "daily_dimension_summaries"
    ADD CONSTRAINT "daily_dimension_summaries_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260217174301840', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260217174301840', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();


COMMIT;
