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
require './data/tabUsers.inc';
require './data/MyUnauthorizedException.inc';


$container = new \Slim\Container;
$container['upload_directory'] = dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'tmp'.DIRECTORY_SEPARATOR.'documents';
$container['backup_directory'] = dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'tmp'.DIRECTORY_SEPARATOR.'backup';
$app = new \Slim\App($container);


error_reporting(E_ALL & ~E_NOTICE);

$authError = function($request, $response, TokenAuthentication $tokenAuth) {
    $output = [];
    $output['error'] = [
        'msg' => $tokenAuth->getResponseMessage(),
        'token' => $tokenAuth->getResponseToken(),
        'status' => 401,
        'error' => true
    ];
    return $response->withJson($output, 401);
};

$authenticator = function($request, \Slim\Middleware\TokenAuthentication $tokenAuth){
    $token = $tokenAuth->findToken($request);
    $tabUsers = new tabUsers();
    $tokenStatus = $tabUsers->isTokenValid($token);
    if ($tokenStatus == 1){
        $tokenAuth->setResponseMessage('Neoprávněné přihlášení');
        try {
            $logger = new logger();
            $logger->insert(json_encode($token), 'Neoprávněné přihlášení');
        }
        catch(Exception $e)
        {
            $logger->insert('', $e->getMessage());
        }
        throw new MyUnauthorizedException();
    }elseif ($tokenStatus == 2){
        $tokenAuth->setResponseMessage('Vypršel časový limit přihlášení');
        //throw new \Slim\Middleware\TokenAuthentication\TokenNotFoundException('Vypršel časový limit přihlášení', 2);
        try {
            $logger = new logger();
            $logger->insert(json_encode($token), 'Vypršel časový limit přihlášení');
        }
        catch(Exception $e)
        {
            $logger->insert('', $e->getMessage());
        }
        throw new MyUnauthorizedException();
    }
};

$app->add(new LoggerMiddleware());

$app->add(new \Slim\Middleware\TokenAuthentication([
    'path' => '/jobs',
    'passthrough' => '/login',
    'authenticator' => $authenticator,
    "secure" => true,  // pro http
    //"error" => $authError
    //"relaxed" => ["localhost", "jiribonczek.000webhostapp.com"],
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
include './app/routes/jobs.php';
include './app/routes/login.php';
include './app/routes/centers.php';
include './app/routes/configurations.php';
include './app/routes/log.php';
include './app/routes/SQLmodify.php';

$app->run();