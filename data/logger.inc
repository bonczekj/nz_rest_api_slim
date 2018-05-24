<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 19.04.2018
 * Time: 11:44
 */
//include_once "./data/dbTable.inc";
require_once "./data/dbTable.inc";

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

class LoggerMiddleware
{
    /**
     * Example middleware invokable class
     *
     * @param  \Psr\Http\Message\ServerRequestInterface $request  PSR7 request
     * @param  \Psr\Http\Message\ResponseInterface      $response PSR7 response
     * @param  callable                                 $next     Next middleware
     *
     * @return \Psr\Http\Message\ResponseInterface
     */
    public function __invoke($request, $response, $next)
    {
        $logger = new logger();
        $json = $request->getBody();
        if ($request->isPost()) {
            $logger->insert($json, "");
        }
        if ($request->isGet()) {
            //$logger->insert($json, "");
        }
        $response = $next($request, $response);
        if ($response->getStatusCode() != 200 ){
            $response->getBody()->rewind();
            $body = $response->getBody()->getContents();
            $logger->insert($json, $body);
        }
        return $response;
    }
}

class logger extends dbTable
{
    protected $tabName = 'logphp';

    public function insert($json, $message = null)
    {
        try {

            // Check message
            if($message == '') {
                //return array(status => false, message => 'Message is empty');
            }

            // Get IP address
            if( ($remote_addr = $_SERVER['REMOTE_ADDR']) == '') {
                $remote_addr = "REMOTE_ADDR_UNKNOWN";
            }

            // Get requested script
            if( ($request_uri = $_SERVER['REQUEST_URI']) == '') {
                $request_uri = "REQUEST_URI_UNKNOWN";
            }

            if (json_decode($json) == null){
                $json = null;
            }

            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (remote_addr, request_uri, message, json) VALUES (?, ?, ?, ?)');
            $query->bindValue(1, $remote_addr, PDO::PARAM_STR);
            $query->bindValue(2, $request_uri, PDO::PARAM_STR);
            $query->bindValue(3, $message, PDO::PARAM_STR);
            $query->bindValue(4, $json);
            $query->execute();
        }
        catch(PDOException $e)
        {
            //print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }
}