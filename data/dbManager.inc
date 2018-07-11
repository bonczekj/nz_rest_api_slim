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

    public function __construct(){
        $settings = include(dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'home/settings.php');
        $settingsDB = $settings['settings']['db'];
        $this->host = $settingsDB['host'];
        $this->db_name = $settingsDB['dbname'];
        $this->username = $settingsDB['user'];
        $this->password = $settingsDB['pass'];
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