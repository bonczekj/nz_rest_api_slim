<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.05.2018
 * Time: 1:27
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabLog.inc';

$app->get('/getlog', function (Request $request, Response $response, array $args) {
    try {
        $tabLog = new tabLog();
        $stmt = $tabLog->read();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->get('/getlogerrors', function (Request $request, Response $response, array $args) {
    try {
        $tabLog = new tabLog();
        $stmt = $tabLog->read_errors();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});
