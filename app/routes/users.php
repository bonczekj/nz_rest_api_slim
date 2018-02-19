<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabUsers.inc';

$app->get('/users', function (Request $request, Response $response, array $args) {

    $tabUsers = new tabUsers();
    $stmt = $tabUsers->readAll();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $response->getBody()->write(json_encode($data));
    return $response->withHeader('Content-Type', 'application/json')
        //->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->post('/users/list', function (Request $request, Response $response, array $args) {

    $tabUsers = new tabUsers();
    $stmt = $tabUsers->readAll();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $response->getBody()->write(json_encode($data));
    return $response->withHeader('Content-Type', 'application/json')
        //->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->post('/users', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabUsers= new tabUsers();
    try {
        $tabUsers->update( $data['username'], $data['email'], $data['password'], $data['firstname'], $data['lastname']);
        return $response->withHeader('Content-Type', 'application/json')
                        ->withHeader('Access-Control-Allow-Origin', '*')
                        ->withStatus(201, 'Data uložena');

    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withStatus(202, 'Chyba při zpracování dat');
    }
});

$app->post('/users/delete', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabUsers= new tabUsers();
    $tabUsers->delete( $data['email'] );
    return $response->withHeader('Content-Type', 'application/json')
        ->withHeader('Access-Control-Allow-Origin', '*');
});

$app->post('/users/create', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabUsers= new tabUsers();
    try {
        $tabUsers->insert( $data['username'], $data['email'], $data['password'], $data['firstname'], $data['lastname']);
        return $response->withHeader('Content-Type', 'application/json')
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withStatus(200);
    }
    catch(Exception $e)
    {
        $response->setStatus(501);
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'application/json')
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withStatus(501);
    }
});

