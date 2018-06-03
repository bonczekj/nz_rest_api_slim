<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.05.2018
 * Time: 1:27
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabUsers.inc';

$app->post('/login', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array

        //$logger = new logger();
        //$logger->insert($json, "");

        $tabUsers = new tabUsers();
        $user = $tabUsers->login( $data['username'], $data['password']);
        //$user->token = apiToken($user->email);
        $userData = '{"userData": ' .json_encode($user) . '}';
        $response->getBody()->write($userData);
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

$app->post('/login/changepassword', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabUsers = new tabUsers();
        $user = $tabUsers->changePassword( $data['email'], $data['password']);
        return $response->withHeader('Content-Type', 'text/html')
            ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});
