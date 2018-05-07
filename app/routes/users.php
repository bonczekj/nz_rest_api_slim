<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabUsers.inc';

$app->get('/users', function (Request $request, Response $response, array $args) {
    $tabUsers = new tabUsers();
    try {
        $stmt = $tabUsers->readAll();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());
    }
        //->withHeader('Access-Control-Allow-Origin', '*')
        //->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        //->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->post('/users/list', function (Request $request, Response $response, array $args) {
    try {
        $tabUsers = new tabUsers();
        $stmt = $tabUsers->readAll();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'OK');
            //->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            //->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());
    }
});

$app->post('/users', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabUsers= new tabUsers();
        $tabUsers->update( $data['username'], $data['email'], $data['password'], $data['firstname'], $data['lastname']);
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'Saved');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(460, 'Error')
                        ->withBody($e->getMessage());
    }
});

$app->post('/users/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabUsers= new tabUsers();
        $tabUsers->delete( $data['email'] );
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'Deleted');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            //->withHeader('Access-Control-Allow-Origin', '*')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());

    }
});

$app->post('/users/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabUsers= new tabUsers();
        $tabUsers->insert( $data['username'], $data['email'], $data['password'], $data['firstname'], $data['lastname']);
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(200, 'Created');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());
    }
});

