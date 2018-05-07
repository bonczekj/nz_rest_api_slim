<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabCustomers.inc';

$app->get('/customers', function (Request $request, Response $response, array $args) {
    try {
        $tabCustomers = new tabCustomers();
        $stmt = $tabCustomers->readCust();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
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

$app->get('/subcontractors', function (Request $request, Response $response, array $args) {
    try {
        $tabCustomers = new tabCustomers();
        $stmt = $tabCustomers->readSub();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
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

$app->post('/customers/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabCustomers = new tabCustomers();
        $tabCustomers->update( $data['ico'], $data['name'], $data['profession'], $data['address']);
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

$app->post('/customers/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabCustomers = new tabCustomers();
        $tabCustomers->delete($data['ico']);
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

$app->post('/customers/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabCustomers = new tabCustomers();
            $tabCustomers->insert( $data['ico'], $data['name'], $data['profession'], $data['address'], $data['sub']);
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

$app->post('/customers/ares', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $logger = new logger();
        $logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabCustomers = new tabCustomers();
        $dataAres = $tabCustomers->readAres( $data['ico']);
        if ($dataAres['name'] == ''){
            $modifiedBody = $response->getBody();
            $modifiedBody->write($dataAres['status']);
            return $response->withBody($modifiedBody)->withStatus(460, $dataAres['status'])
                            ->withHeader('Content-Type', 'text/html')
                            ->withHeader('charset', 'utf-8');
        }
        $response->getBody()->write(json_encode($dataAres));
        return $response->withHeader('Content-Type', 'application/json')
            ->withHeader('Accept', 'application/json')
            ->withStatus(200, 'OK');
            //->withBody(json_encode($dataAres));
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());
    }
});
