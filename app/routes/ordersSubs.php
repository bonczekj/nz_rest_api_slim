<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabOrdersSubs.inc';

$app->post('/orderssubs', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/orderssubs/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array

        $tabOrdersSubs = new tabOrdersSubs();
        $tabOrdersSubs->delete($data['idsub'], $data['idorder']);

        $tabOrdersSubsDetail = new tabOrdersSubsDetail();
        $tabOrdersSubsDetail->delete($data['idsubdetail']);

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

$app->post('/orderssubs/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersSubs = new tabOrdersSubs();
        //$tabOrdersSubs->insert($data['idorder'], $data['ico']);
        $lastId = $tabOrdersSubs->insert($data);

        $data['idsub'] = $lastId;
        $tabOrdersSubsDetail = new tabOrdersSubsDetail();
        $tabOrdersSubsDetail->insert($data);

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

$app->post('/orderssubs/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOrdersSubs = new tabOrdersSubs();
        //$tabOrdersSubs->update( $data['idorder'], $data['idsub'], $data['ico'], $data['taskdate'], $data['finished'], $data['price'], $data['invoice']);
        $tabOrdersSubs->update( $data );

        $tabOrdersSubsDetail = new tabOrdersSubsDetail();
        $tabOrdersSubsDetail->update($data);

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

