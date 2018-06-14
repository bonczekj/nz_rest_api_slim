<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 18.01.2018
 * Time: 9:36
 */

class dbManager{

    private $host = "";
    private $db_name = "";
    private $username = "";
    private $password = "";

    /*private $host = "localhost";
    private $db_name = "id4307761_en";
    private $username = "id4307761_jirka";
    private $password = "jirka";
    private $conn;*/

    public function __construct(){
        if ($_SERVER['SERVER_NAME'] === "jiribonczek.000webhostapp.com"){
            $this->host = "localhost";
            $this->db_name = "id4307761_en";
            $this->username = "id4307761_jirka";
            $this->password = "jirka";
        }elseif ($_SERVER['SERVER_NAME'] === "Xnz.atris.cz"){
            $this->host = "uvdb36.active24.cz";
            $this->db_name = "nzatriscztest";
            $this->username = "nzatriscztest";
            $this->password = "8AaRYzt0NE";
        }elseif ($_SERVER['SERVER_NAME'] === "nz.atris.cz"){
            $this->host = "uvdb36.active24.cz";
            $this->db_name = "nzatriscz";
            $this->username = "nzatriscz";
            $this->password = "WU3euMLu";
        }else{
            $this->host = "localhost";
            $this->db_name = "nz_db";
            $this->username = "jirka";
            $this->password = "jirka";
        }
    }

    // get the dbManager connection
    public function getConnection(){

        $this->conn = null;

        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);  // To turn on error mode for debugging errors
            $this->conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);  // To get maximum sql injection protection
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }
        return $this->conn;
    }
}
?>