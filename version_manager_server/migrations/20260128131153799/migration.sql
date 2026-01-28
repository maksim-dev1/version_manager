BEGIN;

--
-- ACTION ALTER TABLE
--
DROP INDEX "namespace_unique_idx";
DROP INDEX "owner_user_idx";
DROP INDEX "owner_team_idx";
DROP INDEX "api_key_hash_idx";
CREATE UNIQUE INDEX "application_namespace_unique_idx" ON "applications" USING btree ("namespace");
CREATE INDEX "application_owner_user_idx" ON "applications" USING btree ("ownerUserId");
CREATE INDEX "application_owner_team_idx" ON "applications" USING btree ("ownerTeamId");
CREATE INDEX "application_api_key_hash_idx" ON "applications" USING btree ("apiKeyHash");
--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
DROP INDEX "team_idx";
DROP INDEX "user_idx";
DROP INDEX "status_idx";
DROP INDEX "team_user_unique_idx";
ALTER TABLE "team_members" DROP COLUMN "invitedBy";
ALTER TABLE "team_members" ADD COLUMN "invitedById" uuid;
CREATE INDEX "team_member_team_idx" ON "team_members" USING btree ("teamId");
CREATE INDEX "team_member_user_idx" ON "team_members" USING btree ("userId");
CREATE INDEX "team_member_status_idx" ON "team_members" USING btree ("status");
CREATE INDEX "team_member_invited_by_idx" ON "team_members" USING btree ("invitedById");
CREATE UNIQUE INDEX "team_member_team_user_unique_idx" ON "team_members" USING btree ("teamId", "userId");
--
-- ACTION ALTER TABLE
--
DROP INDEX "owner_idx";
CREATE INDEX "team_owner_idx" ON "teams" USING btree ("ownerId");
--
-- ACTION ALTER TABLE
--
--
-- ACTION ALTER TABLE
--
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "applications"
    ADD CONSTRAINT "applications_fk_0"
    FOREIGN KEY("ownerUserId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "applications"
    ADD CONSTRAINT "applications_fk_1"
    FOREIGN KEY("ownerTeamId")
    REFERENCES "teams"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "store_links"
    ADD CONSTRAINT "store_links_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "team_members"
    ADD CONSTRAINT "team_members_fk_0"
    FOREIGN KEY("teamId")
    REFERENCES "teams"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "team_members"
    ADD CONSTRAINT "team_members_fk_1"
    FOREIGN KEY("userId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "team_members"
    ADD CONSTRAINT "team_members_fk_2"
    FOREIGN KEY("invitedById")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "teams"
    ADD CONSTRAINT "teams_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "serverpod_auth_core_user"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "version_check_logs"
    ADD CONSTRAINT "version_check_logs_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "version_check_logs"
    ADD CONSTRAINT "version_check_logs_fk_1"
    FOREIGN KEY("versionId")
    REFERENCES "versions"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "versions"
    ADD CONSTRAINT "versions_fk_0"
    FOREIGN KEY("applicationId")
    REFERENCES "applications"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "versions"
    ADD CONSTRAINT "versions_fk_1"
    FOREIGN KEY("recommendedVersionId")
    REFERENCES "versions"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR version_manager
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('version_manager', '20260128131153799', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260128131153799', "timestamp" = now();

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
