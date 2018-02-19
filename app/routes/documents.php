<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include './data/tabDocuments.inc';

$app->get('/documents', function (Request $request, Response $response, array $args) {
    $tabDocuments = new tabDocuments();
    $stmt = $tabDocuments->readAll();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    //$response->setStatus(200);
    //$response->headers->set('Content-Type', 'application/json');
    $response->getBody()->write(json_encode($data));
    //$response->write(json_encode($data));
    return $response->withHeader('Content-Type', 'application/json')
                    ->withHeader('Access-Control-Allow-Origin', '*')
                    ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
                    ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->post('/documents', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $id = $data['id'];
    $tabDocuments->update( $data['id'], $data['type'], $data['filename'], $data['description'], $data['expiration']);
    return $response->withHeader('Content-Type', 'application/json')
                    ->withHeader('Access-Control-Allow-Origin', '*, http://localhost:3000')
                    ->withHeader('Access-Control-Allow-Headers', 'Accept, Content-Type, Access-Control-Allow-Origin, Access-Control-Allow-Headers, Access-Control-Allow-Methods, Authorization, Origin, x-requested-with, Content-Range, Content-Disposition, Content-Description')
                    ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, OPTIONS')
                    ->withStatus(201, 'Data saved');
});

$app->post('/documents/delete', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $tabDocuments->delete($data['id']);
    return $response->withHeader('Content-Type', 'application/json')
        ->withHeader('Access-Control-Allow-Origin', '*');
});

$app->post('/documents/create', function (Request $request, Response $response, array $args) {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $lastId = $tabDocuments->insert( $data['type'], $data['filename'], $data['description'], $data['expiration']);
    $response->getBody()->write(json_encode($lastId));
    return $response->withHeader('Content-Type', 'application/json')
                    ->withHeader('Access-Control-Allow-Origin', '*')
                    ->withHeader('Access-Control-Allow-Origin', '*');
});

$app->post('/file', function (Request $request, Response $response, array $args) {
    $directory = getcwd().'\uploads';
    $files = $request->getUploadedFiles();
    foreach ($files as &$value) {
        $uploadedFile = $value;
    }

    //$file = $files['file'];

    if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
        $fileName = moveUploadedFile($directory, $uploadedFile);
        return $response->withJson([
            'result' => [
                'fileName' => $fileName
            ],
        ])->withStatus(200)
          ->withHeader('Content-Type', 'application/json')
          ->withHeader('Access-Control-Allow-Origin', '*');
    }

    return $response
        ->withJson([
            'error' => 'Nothing was uploaded'
        ])->withStatus(415)
          ->withHeader('Content-Type', 'application/json')
          ->withHeader('Access-Control-Allow-Origin', '*');
});

function moveUploadedFile($directory, $uploadedFile){
        $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
        $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
        $filename = sprintf('%s.%0.8s', $basename, $extension);
        $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);
        return $filename;
}
