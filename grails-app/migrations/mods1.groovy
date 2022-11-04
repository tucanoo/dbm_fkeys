databaseChangeLog = {

    changeSet(author: "dave (generated)", id: "1667573897990-4") {
        addForeignKeyConstraint(baseColumnNames: "id,REV", baseTableName: "live_hole_aud", constraintName: "FK2tp8llxifjw4drmi0nnypab8f", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id,REV", referencedTableName: "live_abstract_hole_aud", validate: "true")
    }

    changeSet(author: "dave (generated)", id: "1667573897990-5") {
        dropForeignKeyConstraint(baseTableName: "live_hole_aud", constraintName: "FK2tp8llxifjw4drmi0nnypab8f")
    }

    changeSet(author: "dave (generated)", id: "1667573897990-1") {
        dropDefaultValue(columnDataType: "varchar(100)", columnName: "display_name", tableName: "live_seller_aud")
    }

    changeSet(author: "dave (generated)", id: "1667573897990-2") {
        dropUniqueConstraint(constraintName: "UC_LIVE_SELLER_STATESELLER_ID_COL", tableName: "live_seller_state")
    }

    changeSet(author: "dave (generated)", id: "1667573897990-3") {
        addUniqueConstraint(columnNames: "seller_id", constraintName: "UC_LIVE_SELLER_STATESELLER_ID_COL", tableName: "live_seller_state")
    }
}
