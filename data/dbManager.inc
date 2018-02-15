<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 18.01.2018
 * Time: 9:36
 */

class dbManager{

    private $host = "localhost";
    private $db_name = "nz_db";
    private $username = "jirka";
    private $password = "jirka";
    private $conn;

    // get the dbManager connection
    public function getConnection(){

        $this->conn = null;

        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  // To turn on error mode for debugging errors
            $this->conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);  // To get maximum sql injection protection
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
        return $this->conn;
    }
}
?>