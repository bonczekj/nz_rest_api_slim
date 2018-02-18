<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabOffers.inc';

$app->get('/offers', function (Request $request, Response $response, array $args) {
    $tabOffers = new tabOffers();
    $stmt = $tabOffers->readAll();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $response->getBody()->write(json_encode($data));
    return $response->withHeader('Content-Type', 'application/json')
        ->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->post('/offers', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabOffers = new tabOffers();
    $tabOffers->update( $data['id'], $data['name'], $data['customer'], $data['processdate'], $data['processtime'], $data['deliverytype'], $data['errand'], $data['winprice'], $data['price'] );
    return $response->withHeader('Content-Type', 'application/json')
                    ->withHeader('Access-Control-Allow-Origin', '*');
});

$app->post('/offers/delete', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabOffers = new tabOffers();
    $tabOffers->delete($data['id']);
    return $response->withHeader('Content-Type', 'application/json')
        ->withHeader('Access-Control-Allow-Origin', '*');
});

$app->post('/offers/create', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabOffers = new tabOffers();
    try {
        $tabOffers->insert( $data['id'], $data['name'], $data['customer'], $data['$processdate'], $data['$processtime'], $data['$deliverytype'], $data['$errand'], $data['$winprice'], $data['$price'] );
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
