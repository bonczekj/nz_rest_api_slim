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
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());
    }
});
