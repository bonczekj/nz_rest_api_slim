<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 04.02.2018
 * Time: 23:26
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
require './vendor/autoload.php';
require './data/logger.inc';
$container['upload_directory'] = __DIR__ . '/uploads';

$app = new \Slim\App;

error_reporting(E_ALL & ~E_NOTICE);

//require_once './vendor/tuupola/slim-jwt-auth/src/JwtAuthentication.php';
//$app->add(new \Slim\Middleware\JwtAuthentication([
//$app->add(new \Tuupola\Middleware\JwtAuthentication([
/*$app->add(new \Tuupola\Middleware\JwtAuthentication([
    "secure" => true,  // pro http
    "relaxed" => ["localhost", "jiribonczek.000webhostapp.com"],
    "secret" => "heslo"
]));*/


$authenticator = function($request, \Slim\Middleware\TokenAuthentication $tokenAuth){

    # Search for token on header, parameter, cookie or attribute
/*
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $logger = new logger();
    $logger->insert($json, "");
*/

    $token = $tokenAuth->findToken($request);

    # Your method to make token validation
    //$user = User::auth_token($token);

    # If occured ok authentication continue to route
    # before end you can storage the user informations or whatever
};

$app->add(new LoggerMiddleware());

$app->add(new \Slim\Middleware\TokenAuthentication([
    //'path' => '/login',
    'passthrough' => '/login',
    'authenticator' => $authenticator,
    "secure" => true,  // pro http
    "relaxed" => ["localhost", "jiribonczek.000webhostapp.com"],
]));


$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    //$tabDocuments1 = new tabDocuments();
    $name = $args['name'];
    $response->getBody()->write("Hello, $name");
    return $response;
});

include './app/routes/documents.php';
include './app/routes/doctype.php';
include './app/routes/users.php';
include './app/routes/customers.php';
include './app/routes/offers.php';
include './app/routes/offersDocuments.php';
include './app/routes/orders.php';
include './app/routes/ordersDocuments.php';
include './app/routes/ordersTasks.php';
include './app/routes/ordersSubs.php';
include './app/routes/tasks.php';
include './app/routes/login.php';

$app->run();