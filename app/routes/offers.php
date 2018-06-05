<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabOffers.inc';

$app->get('/offers', function (Request $request, Response $response, array $args) {
    try {
        $params = $request->getQueryParams();
        $searchValue = $params['search'];
        $tabOffers = new tabOffers();
        $stmt = $tabOffers->readAll($searchValue);
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

$app->post('/offers/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();

        //$logger = new logger();
        //$logger->insert($json, "");

        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOffers = new tabOffers();
        $tabOffers->update( $data['id'], $data['name'], $data['ico'], $data['processdate'], $data['processtime'], $data['deliverytype'], $data['errand'], $data['winprice'], $data['price'] );
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

$app->post('/offers/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();

        //$logger = new logger();
        //$logger->insert($json, "");

        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOffers = new tabOffers();
        $tabOffers->delete($data['id']);
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

$app->post('/offers/create', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();

    //$logger = new logger();
    //$logger->insert($json, "");

    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabOffers = new tabOffers();
        $tabOffers->insert( $data['name'], $data['ico'], $data['processdate'], $data['processtime'], $data['deliverytype'], $data['errand'], $data['winprice'], $data['price'] );
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

$app->post('/offers/createorder', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array

        //$logger = new logger();
        //$logger->insert($json, "");

        $tabOffers = new tabOffers();
        $order = $tabOffers->createorder( $data );
        $response->getBody()->write(json_encode($order));
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

