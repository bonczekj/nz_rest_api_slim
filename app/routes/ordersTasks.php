<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabOrdersTasks.inc';

$app->post('/orderstasks', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersTasks = new tabOrdersTasks();
        $stmt = $tabOrdersTasks->readAll($data['id']);
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

$app->post('/orderstasks/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersTasks = new tabOrdersTasks();
        $tabOrdersTasks->delete($data['idtask'], $data['idorder']);
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

$app->post('/orderstasks/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersTasks = new tabOrdersTasks();
        $tabOrdersTasks->insert($data);
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

$app->post('/orderstasks/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersTasks = new tabOrdersTasks();
        $tabOrdersTasks->update($data);
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

