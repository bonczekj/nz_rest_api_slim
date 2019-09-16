<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

include_once './data/tabDocuments.inc';

$app->get('/docs', function (Request $request, Response $response, array $args) {
    try {
        $tabDocuments = new tabDocuments();
        $stmt = $tabDocuments->readAll();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
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

$app->post('/documents/update', function (Request $request, Response $response, array $args) {
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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/documents/delete', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();
    //$logger = new logger();
    //$logger->insert($json, "");
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $tabDocuments->delete($data['id']);
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

$app->post('/documents/create', function (Request $request, Response $response, array $args) {
    try {
    $json = $request->getBody();
    $data = json_decode($json, true); // parse the JSON into an assoc. array
    $tabDocuments = new tabDocuments();
    $lastId = $tabDocuments->insert( $data['type'], $data['filename'], $data['description'], $data['expiration']);
    $response->getBody()->write(json_encode($lastId));
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

$app->post('/fileupload', function (Request $request, Response $response, array $args) {
    try {
        $logger = new logger();
        $directory = $this->get('upload_directory');
        $files = $request->getUploadedFiles();
        foreach ($files as &$value) {
            $uploadedFile = $value;
        }

        //$file = $files['file'];

        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $fileName = $uploadedFile->getClientFilename();
            //$logger->insert(json_encode($uploadedFile->file), $uploadedFile->getStream()->getMetadata('uri'));
            //$path = pathinfo($uploadedFile->file, PATHINFO_DIRNAME);
            $techName = moveUploadedFile($directory, $uploadedFile);
            $tabDocuments = new tabDocuments();
            $fileId = $tabDocuments->insert( '', $fileName, '', null, $techName);
            return $response->withJson(['docID' => $fileId])->withStatus(200, 'OK')
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
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/fileupload1', function (Request $request, Response $response, array $args) {
    try {
        $directory = $this->get('upload_directory');
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array

        /*$files = $request->getUploadedFiles();
        foreach ($files as &$value) {
            $uploadedFile = $value;
        }*/

        //$file = $files['file'];

        $fileContent = base64_decode($data['content']);

        $extension = pathinfo($data['name'], PATHINFO_EXTENSION);
        $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
        $fileName = sprintf('%s.%0.8s', $basename, $extension);

        if (file_put_contents( $directory . DIRECTORY_SEPARATOR . $fileName, $fileContent ) === false) {
            return $response
                ->withJson([
                    'error' => 'Nothing was uploaded'
                ])->withStatus(460)
                ->withHeader('Content-Type', 'application/json');
        }else {
            $tabDocuments = new tabDocuments();
            $fileId = $tabDocuments->insert( '', $data['name'], '', null, $fileName);
            return $response->withJson(['docID' => $fileId])->withStatus(200, 'OK')
                            ->withHeader('Content-Type', 'application/json');
        }
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

function moveUploadedFile($directory, $uploadedFile){
        $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
        $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
        $filename = sprintf('%s.%0.8s', $basename, $extension);
        $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);
        return $filename;
}

$app->post('/filedownload', function (Request $request, Response $response, array $args) {
    try {
        $directory = $this->get('upload_directory');

        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabDocuments = new tabDocuments();
        $document = $tabDocuments->readDocument($data['iddocument']);

        $file = $directory . DIRECTORY_SEPARATOR . $document['techname'];

        if (file_exists($file)){
            $fh = fopen($file, 'rb');
            $stream = new \Slim\Http\Stream($fh); // create a stream instance for the response body
            return $response->withHeader('Content-Type', 'application/force-download')
                ->withHeader('Content-Type', 'application/octet-stream')
                ->withHeader('Content-Type', 'application/download')
                ->withHeader('Content-Description', 'File Transfer')
                ->withHeader('Content-Transfer-Encoding', 'binary')
                ->withHeader('Content-Disposition', 'attachment; filename="' . $document['filename'] . '"')
                ->withHeader('Expires', '0')
                ->withHeader('Cache-Control', 'must-revalidate, post-check=0, pre-check=0')
                ->withHeader('Pragma', 'public')
                ->withHeader('Content-Length', filesize($file))
                ->withBody($stream); // all stream contents will be sent to the response
        }else {
            throw new Exception('Dokument nebyl nalezen');
        }
        //readfile($file);
        //return $response;
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

$app->post('/fut', function (Request $request, Response $response, array $args) {
    try {
        $directory = $this->get('upload_directory');
        $response->getBody()->write(dirname(getcwd()). " ");
        $response->getBody()->write(dirname(__DIR__)." ");
        $response->getBody()->write(dirname(dirname(getcwd())). " ");
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});
