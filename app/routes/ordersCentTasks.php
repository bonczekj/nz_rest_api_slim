<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabOrdersCentTasks.inc';

$app->post('/orderscenttasks', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersCentTasks = new tabOrdersCentTasks();
        $stmt = $tabOrdersCentTasks->readAll($data['id']);
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

$app->post('/orderscenttasks/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersCentTasks = new tabOrdersCentTasks();
        $tabOrdersCentTasks->delete($data['idtask'], $data['idorder']);
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

$app->post('/orderscenttasks/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersCentTasks = new tabOrdersCentTasks();
        $tabOrdersCentTasks->insert($data);
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

$app->post('/orderscenttasks/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersCentTasks = new tabOrdersCentTasks();
        $tabOrdersCentTasks->update($data);
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

