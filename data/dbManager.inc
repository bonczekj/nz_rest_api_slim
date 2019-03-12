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
        $settings = include(dirname(dirname(getcwd())). DIRECTORY_SEPARATOR.'home'.DIRECTORY_SEPARATOR.'settings.php');
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

    public function createBackup($directory){
        if (!file_exists($directory) && !is_dir($directory)) {
            mkdir($directory);
        }
        $toDay = date('Ymd_His');
        $file = $directory.DIRECTORY_SEPARATOR.$this->db_name."_".$toDay.".sqldump";
        $cmd = "mysqldump --user=$this->username --password=$this->password --host=$this->host $this->db_name > $file";
        if ($this->host = 'localhost'){
            $cmd = "\"c:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump\" --user=$this->username --password=$this->password --host=$this->host $this->db_name > $file";
            //$cmd = "\"c:\Program Files\MySQL\MySQL Server 5.7\bin\mysqldump\" --user=$this->username --password=$this->password --host=$this->host $this->db_name --result-file=\"$file\"";
        }else{
            $cmd = "mysqldump --user=$this->username --password=$this->password --host=$this->host $this->db_name > $file";
            //$cmd = "mysqldump --user=$this->username --password=$this->password --host=$this->host $this->db_name --result-file=\"$file\"";
        }
        //exec($cmd);
        passthru($cmd);
        //passthru($cmd, $cmdresult);
        //return $cmdresult;
    }
}
?>