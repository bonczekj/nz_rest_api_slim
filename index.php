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


$container = new \Slim\Container;
//$container['upload_directory'] = dirname(getcwd()).'\documents';
//$container['upload_directory'] = __DIR__ . '../../home/documents/';
$container['upload_directory'] = dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'tmp'.DIRECTORY_SEPARATOR.'documents';
//$container['upload_directory'] = dirname(dirname(getcwd())).'/home/documents';
$app = new \Slim\App($container);

//$app = new \Slim\App;
//$container = $app->getContainer();
//$container['upload_directory'] = __DIR__ . '/uploads';

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

include './app/routes/documents.php';
include './app/routes/doctype.php';
include './app/routes/users.php';
include './app/routes/customers.php';
include './app/routes/offers.php';
include './app/routes/offersDocuments.php';
include './app/routes/orders.php';
include './app/routes/ordersDocuments.php';
include './app/routes/ordersTasks.php';
include './app/routes/ordersCentTasks.php';
include './app/routes/ordersSubs.php';
include './app/routes/ordersSubsDetail.php';
include './app/routes/tasks.php';
include './app/routes/login.php';
include './app/routes/centers.php';
include './app/routes/configurations.php';
include './app/routes/log.php';
include './app/routes/SQLmodify.php';

$app->run();