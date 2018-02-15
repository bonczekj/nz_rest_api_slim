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
$container['upload_directory'] = __DIR__ . '/uploads';

$app = new \Slim\App;

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

$app->run();