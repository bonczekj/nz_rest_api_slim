<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabOrdersTasks.inc';

$app->post('/orderstasks', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
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
        return $response->withHeader('Content-Type', 'application/json')
                        ->withStatus(460, 'Error')
                        ->withBody($e->getMessage());
    }
});
/*
$app->post('/ordersdocuments/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOffersDocuments = new tabOffersDocuments();
        $tabOffersDocuments->delete($data['idorder'], $data['iddocument']);
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

$app->post('/ordersdocuments/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabDocuments = new tabDocuments();
        $tabOffersDocuments = new tabOffersDocuments();
        foreach($data as $doc) { //foreach element in $arr
            $lastId = $tabDocuments->insert( '', $doc['filename'], '', null);
            $tabOffersDocuments->insert($doc['idoffer'], $lastId, $doc['typeRS'] );
        }
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
*/
