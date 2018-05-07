<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabOrdersSubs.inc';

$app->post('/orderssubs', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersSubs = new tabOrdersSubs();
        $stmt = $tabOrdersSubs->readAll($data['id']);
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

$app->post('/orderssubs/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersSubs = new tabOrdersSubs();
        $tabOrdersSubs->delete($data['idsub'], $data['idorder']);
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

$app->post('/orderssubs/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersSubs = new tabOrdersSubs();
        $tabOrdersSubs->insert($data['idorder'], $data['ico'], $data['taskdate'], $data['finished'], $data['price'], $data['invoice']);
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

$app->post('/orderssubs/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersSubs = new tabOrdersSubs();
        $tabOrdersSubs->update( $data['idorder'], $data['idsub'], $data['ico'], $data['taskdate'], $data['finished'], $data['price'], $data['invoice']);
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

