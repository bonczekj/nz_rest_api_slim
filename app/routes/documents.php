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
    try {
    $tabDocuments = new tabDocuments();
    $stmt = $tabDocuments->readAll();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    //$response->setStatus(200);
    //$response->headers->set('Content-Type', 'application/json');
    $response->getBody()->write(json_encode($data));
    //$response->write(json_encode($data));
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

$app->post('/documents', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    //$logger = new logger();
    //$logger->insert($json, "");
    $tabDocuments = new tabDocuments();
    $id = $data['id'];
    $tabDocuments->update( $data['id'], $data['type'], $data['filename'], $data['description'], $data['expiration']);
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

$app->post('/documents/delete', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();
    $logger = new logger();
    $logger->insert($json, "");
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $tabDocuments->delete($data['id']);
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

$app->post('/documents/create', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();
    $logger = new logger();
    $logger->insert($json, "");
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $lastId = $tabDocuments->insert( $data['type'], $data['filename'], $data['description'], $data['expiration']);
    $response->getBody()->write(json_encode($lastId));
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

$app->post('/file', function (Request $request, Response $response, array $args) {
    try {
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
            ])->withStatus(200, 'OK')
              ->withHeader('Content-Type', 'application/json');
        }else {
            return $response
                ->withJson([
                    'error' => 'Nothing was uploaded'
                ])->withStatus(460)
                  ->withHeader('Content-Type', 'application/json');
        }
    }
    catch(Exception $e)
    {
        return $response->withHeader('Content-Type', 'application/json')
            ->withStatus(460, 'Error')
            ->withBody($e->getMessage());
    }
});

function moveUploadedFile($directory, $uploadedFile){
        $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
        $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
        $filename = sprintf('%s.%0.8s', $basename, $extension);
        $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);
        return $filename;
}
