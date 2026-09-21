<?php

namespace code\revoke\Application\Core;

use OxidEsales\Eshop\Core\DatabaseProvider;

class Events
{
    public static function onActivate(): void
    {
        self::ensureRevokeTable();
    }

    public static function onDeactivate(): void
    {
    }

    private static function ensureRevokeTable(): void
    {
        DatabaseProvider::getDb()->execute(
            'CREATE TABLE IF NOT EXISTS `code_revoke` (
                `OXID` char(32) NOT NULL,
                `OXINSERT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `CODE_ACTIVE` tinyint(1) NOT NULL DEFAULT 1,
                `CODE_ARTICLE` text NOT NULL,
                `CODE_ORDERED` varchar(255) NOT NULL,
                `CODE_ORDERNR` varchar(255) NOT NULL,
                `CODE_NAME` varchar(255) NOT NULL,
                `CODE_EMAIL` varchar(255) NOT NULL,
                `CODE_ADDRESS` text NOT NULL,
                `CODE_MESSAGE` text NOT NULL,
                PRIMARY KEY (`OXID`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
        );
    }
}
