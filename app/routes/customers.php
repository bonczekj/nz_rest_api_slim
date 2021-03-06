<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabCustomers.inc';

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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/customers/update', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array

        //$logger = new logger();
        //$logger->insert($json, "");

        $tabCustomers = new tabCustomers();
        $tabCustomers->update( $data);
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(200, 'Saved');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/customers/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabCustomers = new tabCustomers();
            $tabCustomers->insert($data);
            return $response->withHeader('Content-Type', 'application/json')
                ->withStatus(200, 'Saved');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/customers/ares', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        //$logger = new logger();
        //$logger->insert($json, "");
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabCustomers = new tabCustomers();
        $dataAres = $tabCustomers->readAres( $data['ico']);
        if ($dataAres['name'] == ''){
            $modifiedBody = $response->getBody();
            //$modifiedBody->write($dataAres['status']);
            $modifiedBody->write($dataAres['aresfile']);
            $modifiedBody->write($dataAres['aresurl']);
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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});
