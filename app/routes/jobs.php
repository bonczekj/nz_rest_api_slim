<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabJobs.inc';

$app->get('/jobs', function (Request $request, Response $response, array $args) {
    try {
    $tabTasks = new tabJobs();
    $stmt = $tabTasks->readAll();
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


