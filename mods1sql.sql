--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: changelog.groovy
--  Ran at: 04/11/22 16:05
--  Against: dbrown@localhost@jdbc:mysql://localhost:3307/nexx_dbm_fkeys?useUnicode=true&characterEncoding=UTF-8
--  Liquibase version: 4.9.1
--  *********************************************************************

--  Lock Database
UPDATE nexx_dbm_fkeys.DATABASECHANGELOGLOCK SET `LOCKED` = 1, LOCKEDBY = 'DADS-PC (172.31.160.1)', LOCKGRANTED = NOW() WHERE ID = 1 AND `LOCKED` = 0;

--  Changeset mods1.groovy::1667573897990-4::dave (generated)
ALTER TABLE nexx_dbm_fkeys.live_hole_aud ADD CONSTRAINT FK2tp8llxifjw4drmi0nnypab8f FOREIGN KEY (id, REV) REFERENCES nexx_dbm_fkeys.live_abstract_hole_aud (id, REV);

INSERT INTO nexx_dbm_fkeys.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1667573897990-4', 'dave (generated)', 'mods1.groovy', NOW(), 1, '8:adf91684602140eda2051cace5cbe628', 'addForeignKeyConstraint baseTableName=live_hole_aud, constraintName=FK2tp8llxifjw4drmi0nnypab8f, referencedTableName=live_abstract_hole_aud', '', 'EXECUTED', NULL, NULL, '4.9.1', '7574344803');

--  Changeset mods1.groovy::1667573897990-5::dave (generated)
ALTER TABLE nexx_dbm_fkeys.live_hole_aud DROP FOREIGN KEY FK2tp8llxifjw4drmi0nnypab8f;

INSERT INTO nexx_dbm_fkeys.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1667573897990-5', 'dave (generated)', 'mods1.groovy', NOW(), 2, '8:a65f5cc1d753e03d9d26d422d186f38c', 'dropForeignKeyConstraint baseTableName=live_hole_aud, constraintName=FK2tp8llxifjw4drmi0nnypab8f', '', 'EXECUTED', NULL, NULL, '4.9.1', '7574344803');

--  Changeset mods1.groovy::1667573897990-1::dave (generated)
ALTER TABLE nexx_dbm_fkeys.live_seller_aud ALTER display_name DROP DEFAULT;

INSERT INTO nexx_dbm_fkeys.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1667573897990-1', 'dave (generated)', 'mods1.groovy', NOW(), 3, '8:8e131c5c748a3d5c14887a873831fac4', 'dropDefaultValue columnName=display_name, tableName=live_seller_aud', '', 'EXECUTED', NULL, NULL, '4.9.1', '7574344803');

--  Changeset mods1.groovy::1667573897990-2::dave (generated)
ALTER TABLE nexx_dbm_fkeys.live_seller_state DROP KEY UC_LIVE_SELLER_STATESELLER_ID_COL;

INSERT INTO nexx_dbm_fkeys.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1667573897990-2', 'dave (generated)', 'mods1.groovy', NOW(), 4, '8:0565539c08e18d5fa4440d345e62c4c1', 'dropUniqueConstraint constraintName=UC_LIVE_SELLER_STATESELLER_ID_COL, tableName=live_seller_state', '', 'EXECUTED', NULL, NULL, '4.9.1', '7574344803');

--  Changeset mods1.groovy::1667573897990-3::dave (generated)
ALTER TABLE nexx_dbm_fkeys.live_seller_state ADD CONSTRAINT UC_LIVE_SELLER_STATESELLER_ID_COL UNIQUE (seller_id);

INSERT INTO nexx_dbm_fkeys.DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1667573897990-3', 'dave (generated)', 'mods1.groovy', NOW(), 5, '8:50277de7b186f511e2b34187c020b5fb', 'addUniqueConstraint constraintName=UC_LIVE_SELLER_STATESELLER_ID_COL, tableName=live_seller_state', '', 'EXECUTED', NULL, NULL, '4.9.1', '7574344803');

--  Release Database Lock
UPDATE nexx_dbm_fkeys.DATABASECHANGELOGLOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

