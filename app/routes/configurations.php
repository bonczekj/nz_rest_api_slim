<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 05.02.2018
 * Time: 0:10
 */

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

//include_once './data/tabCenters.inc';

$app->get('/configuration/getdb', function (Request $request, Response $response, array $args) {
    //$tabCenters = new tabCenters();
    try {
        $settings = include(dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'home/settings.php');
        $settingsDB = $settings['settings']['db'];
        $settingsDB['pass'] = '';
        $response->getBody()->write(json_encode($settingsDB));
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

$app->post('/configuration/setdb', function (Request $request, Response $response, array $args) {
    //$tabCenters = new tabCenters();
    try {
        $json = $request->getBody();
        $data = json_decode($json, true); // parse the JSON into an assoc. array
        $settings = include(dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'home/settings.php');
        if ($data['seccode'] <> $settings['settings']['seccode']) {
            throw new Exception('Chybný bezpečnostní kód. ');
        }
        $settingsDB = $settings['settings']['db'];
        $settingsDB['host'] = $data['host'];
        $settingsDB['dbname'] = $data['dbname'];
        $settingsDB['user'] = $data['user'];
        $settingsDB['pass'] = $data['pass'];
        $settings['settings']['db'] = $settingsDB;
        file_put_contents(dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'home/settings.php', '<?php return ' . var_export($settings, true) . ';');
        $response->getBody()->write('Nastavení bylo změněno');
        //return $response->withHeader('Content-Type', 'application/json')
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(200, 'OK');
    }
    catch(Exception $e)
    {
        $response->getBody()->write($e->getMessage());
        return $response->withHeader('Content-Type', 'text/plain')
            ->withStatus(460, 'Error');
    }
});

