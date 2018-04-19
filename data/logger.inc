<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 19.04.2018
 * Time: 11:44
 */
include_once "./data/dbTable.inc";

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
            //throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }
}