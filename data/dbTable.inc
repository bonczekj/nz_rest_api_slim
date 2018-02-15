<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:52
 */

include_once './data/dbManager.inc';
//require_once '../../vendor/autoload.php';

abstract class dbTable
{
    protected $conn;

    public function __construct(){
        $dbManager = new dbManager();
        $db = $dbManager->getConnection();
        $this->conn = $db;
    }

    public function __destruct()
    {
        $this->conn = null;
    }

    protected function read_data($querystr){
        $stmt = $this->conn->prepare($querystr);
        $stmt->execute();
        return $stmt;
    }

}