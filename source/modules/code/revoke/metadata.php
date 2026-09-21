<?php

$sMetadataVersion = '2.1';

$aModule = [
    'id'          => 'coderevoke',
    'title'       => 'CoDe Online-Widerrufsformular',
    'description' => [
        'de' => 'Frontend-Formular für Widerrufe mit Speicherung und optionaler Mail.',
        'en' => 'Frontend cancellation form with persistence and optional email.',
    ],
    'version'     => '1.2.0',
    'author'      => 'co-de.de Hans-Peter Busse',
    'url'         => 'https://www.co-de.de',
    'email'       => '',
    'thumbnail'   => 'out/pictures/code_logo.png',
    'extend'      => [],
    'controllers' => [
        'revoke' => \code\revoke\Application\Controller\RevokeController::class,
        'revokeadmin' => \code\revoke\Application\Controller\Admin\RevokeAdminController::class,
    ],
    'events'      => [
        'onActivate' => \code\revoke\Application\Core\Events::class . '::onActivate',
        'onDeactivate' => \code\revoke\Application\Core\Events::class . '::onDeactivate',
    ],
    'settings'    => [
        [
            'group' => 'main',
            'name'  => 'revoke_email',
            'type'  => 'str',
            'value' => 'busse@co-de.de',
        ],
    ],
];
