<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
use Slim\Http\UploadedFile;

include_once './data/tabOffersDocuments.inc';

$app->post('/offersdocuments', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOffersDocuments = new tabOffersDocuments();
        $stmt = $tabOffersDocuments->readAll($data['id']);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $response->getBody()->write(json_encode($data));
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

$app->post('/offersdocuments/delete', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabOffersDocuments = new tabOffersDocuments();
        $tabOffersDocuments->delete($data['idoffer'], $data['iddocument']);
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

$app->post('/offersdocuments/create', function (Request $request, Response $response, array $args) {
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabDocuments = new tabDocuments();
        $tabOffersDocuments = new tabOffersDocuments();
        foreach($data as $doc) { //foreach element in $arr
            $lastId = $tabDocuments->insert( '', $doc['filename'], '', null);
            $tabOffersDocuments->insert($doc['idoffer'], $lastId, $doc['typeRS'] );
        }
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

$app->post('/offersdocuments/createupl', function (Request $request, Response $response, array $args) {
    try {
        $uploadedFiles = $request->getUploadedFiles();

        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $tabDocuments = new tabDocuments();
        $tabOffersDocuments = new tabOffersDocuments();

        $directory = $this->get('upload_directory');

        foreach ($uploadedFiles['files'] as $uploadedFile) {
            if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
                $filename = moveUploadedFile($directory, $uploadedFile);
                $response->write('uploaded ' . $filename . '<br/>');
            }
        }

        foreach($data as $doc) { //foreach element in $arr
            $lastId = $tabDocuments->insert( '', $doc['filename'], '', null);
            $tabOffersDocuments->insert($doc['idoffer'], $lastId, $doc['typeRS'] );
        }
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

/**
 * Moves the uploaded file to the upload directory and assigns it a unique name
 * to avoid overwriting an existing uploaded file.
 *
 * @param string $directory directory to which the file is moved
 * @param UploadedFile $uploaded file uploaded file to move
 * @return string filename of moved file
 */
function moveUploadedFile($directory, UploadedFile $uploadedFile)
{
    $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
    $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
    $filename = sprintf('%s.%0.8s', $basename, $extension);

    $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

    return $filename;
}