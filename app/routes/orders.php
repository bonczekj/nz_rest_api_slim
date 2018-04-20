<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabOrders.inc';

$app->get('/orders', function (Request $request, Response $response, array $args) {
    try {
        $tabOrders = new tabOrders();
        $stmt = $tabOrders->readAll();
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
});

$app->post('/orders', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrders = new tabOrders();
        $tabOrders->update( $data['id'], $data['name'], $data['customer'], $data['processdate'], $data['processtime'], $data['deliverytype'], $data['errand'], $data['winprice'], $data['price'] );
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(460, 'Error')
                        ->withBody($e->getMessage());
    }
});

$app->post('/orders/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrders = new tabOrders();
        $tabOrders->delete($data['id']);
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(460, 'Error')
                        ->withBody($e->getMessage());
    }
});

$app->post('/orders/create', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabOrders = new tabOrders();
        $tabOrders->insert( $data['id'], $data['name'], $data['customer'], $data['$processdate'], $data['$processtime'], $data['$deliverytype'], $data['$errand'], $data['$winprice'], $data['$price'] );
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(460, 'Error')
                        ->withBody($e->getMessage());
    }
});

