<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/dbModify.inc';

$app->post('/dbupdate', function (Request $request, Response $response, array $args) {
    try {
        $dbModify = new dbModify();
        $dbModify->dbupdate();
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'Saved');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/dbbackup', function (Request $request, Response $response, array $args) {
    try {
        $dbManager = new dbManager();
        $dbManager->createBackup($this->get('backup_directory'));
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(200, 'Saved');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

