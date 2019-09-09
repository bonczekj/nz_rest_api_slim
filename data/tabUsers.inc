<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabUsers extends dbTable
{
    protected $tabName = 'users';

    public function readAll(){
        try {
        $querystr = "SELECT username, email, firstname, lastname, salesData FROM " . $this->tabName;
        $stmt = $this->read_data($querystr);
        return $stmt;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při čtení dat. '.$e->getMessage());
//            die();
        }
    }

    //function insert($username, $email, $password = "xxx", $firstname = "", $lastname = "")
    function insert($data)
    {
        $password = is_null($data['password']) ? '123' : $data['password'];
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (username, email, password, firstname, lastname, salesdata, techdata, allowedIP) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $data['username'], PDO::PARAM_STR);
            $query->bindValue(2, $data['email'], PDO::PARAM_STR);
            $query->bindValue(3, $password, PDO::PARAM_STR);
            $query->bindValue(4, $data['firstname'], PDO::PARAM_STR);
            $query->bindValue(5, $data['lastname'], PDO::PARAM_STR);
            $query->bindValue(6, $data['salesData'], PDO::PARAM_INT);
            $query->bindValue(7, $data['techData'], PDO::PARAM_INT);
            $query->bindValue(8, $data['allowedIP'], PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }

    //function update($username, $email, $firstname, $lastname, $salesData)
    function update($data)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET username = ?, firstname = ?, lastname = ?, salesData = ? , techData = ?, allowedIP = ? where email = ? ');
            $query->bindValue(1, $data['username'], PDO::PARAM_STR);
            $query->bindValue(2, $data['firstname'], PDO::PARAM_STR);
            $query->bindValue(3, $data['lastname'], PDO::PARAM_STR);
            $query->bindValue(4, $data['salesData'], PDO::PARAM_INT);
            $query->bindValue(5, $data['techData'], PDO::PARAM_INT);
            $query->bindValue(6, $data['allowedIP'], PDO::PARAM_STR);
            $query->bindValue(7, $data['email'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }

    function delete($email)
    {
        try {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where email = ?');
        $query->bindParam(1, $email, PDO::PARAM_STR, 10);
        $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }

    public function login($username, $password){
        try {
            $query = $this->conn->prepare("SELECT username, email, firstname, lastname, salesData, techData, token, tokenExpire, allowedIP FROM " . $this->tabName. " where ( username = ? or email = ? ) and password = ?");
            $query->bindValue(1, $username, PDO::PARAM_STR);
            $query->bindValue(2, $username, PDO::PARAM_STR);
            $query->bindValue(3, $password, PDO::PARAM_STR);
            $query->execute();
            if ($query->rowCount() == 0){
                throw new Exception('Chybně zadaný uživatel nebo heslo.');
            }
            $data = $query->fetch(PDO::FETCH_OBJ);
            if ($data->allowedIP != null and $data->allowedIP != "") {
                if ($_SERVER['REMOTE_ADDR'] != $data->allowedIP){
                    throw new Exception('IP adresa není povolená pro vzdálený přístup');
                }
            }
            $data->token = bin2hex(openssl_random_pseudo_bytes(8)); //generate a random token
            $data->tokenExpire = date('Y-m-d H:i:s', strtotime('+1 hour'));//the expiration date will be in one hour from the current moment
            //$data->tokenExpire = date('Y-m-d H:i:s');//the expiration date will be in one hour from the current moment
            $this->updateToken($data->email, $data->token, $data->tokenExpire);
            return $data;
        }
        catch(PDOException $e)
        {
            throw new Exception('Chyba při přihlášení: '.$e->getMessage());
        }
    }

    private function updateToken($email, $token, $tokenExpire){
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET token = ?, tokenExpire = ? where email = ? ');
            $query->bindValue(1, $token, PDO::PARAM_STR);
            $query->bindValue(2, $tokenExpire);
            $query->bindValue(3, $email, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }

    }

    private function extendToken($token){
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET tokenExpire = ? where token = ? ');
            $query->bindValue(1, date('Y-m-d H:i:s', strtotime('+1 hour')));//the expiration date will be in one hour from the current moment);
            $query->bindValue(2, $token, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }

    }

    public function checkToken($token){
        try {
            $query = $this->conn->prepare("SELECT username, email, token, tokenExpire FROM " . $this->tabName. " where token = ?");
            $query->bindValue(1, $token, PDO::PARAM_STR);
            $query->execute();
            if ($query->rowCount() == 0){
                throw new Exception('Uživatel není přihlášený');
            }
            $data = $query->fetch(PDO::FETCH_OBJ);

            $data->token = bin2hex(openssl_random_pseudo_bytes(8)); //generate a random token
            $data->tokenExpire = date('Y-m-d H:i:s', strtotime('+1 hour'));//the expiration date will be in one hour from the current moment
            $this->updateToken($data->email, $data->token, $data->tokenExpire);
            return $data;
        }
        catch(PDOException $e)
        {
            throw new Exception('Chyba při přihlášení: '.$e->getMessage());
        }
    }


    public function changePassword($email, $password){
        try {
            $query = $this->conn->prepare("update " . $this->tabName. " set password = ? where email = ?");
            $query->bindValue(1, $password, PDO::PARAM_STR);
            $query->bindValue(2, $email, PDO::PARAM_STR);
            $query->execute();

            /*$to = "jiri.bonczek@volny.cz";
            $subject = "My subject";
            $txt = "Hello world!";
            $headers = "From: webmaster@example.com";
            mail($to, $subject, $txt, $headers);*/
        }
        catch(PDOException $e)
        {
            throw new Exception('Chyba při ukládání: '.$e->getMessage());
        }
    }

    public function isTokenValid($token){
        try {
            $query = $this->conn->prepare("SELECT username, tokenExpire FROM " . $this->tabName. " where token = ? ");
            $query->bindValue(1, $token, PDO::PARAM_STR);
            $query->execute();
            if ($query->rowCount() == 0){
                return 1;
                //throw new Exception('Chybně zadaný uživatel nebo heslo.');
            }
            $data = $query->fetch(PDO::FETCH_OBJ);
            if ($data->tokenExpire != "") {
                $now = date('Y-m-d H:i:s', strtotime('now'));;
                if ($data->tokenExpire < $now){
                    return 2;
                }
            }
            $data->tokenExpire = date('Y-m-d H:i:s', strtotime('+1 hour'));//the expiration date will be in one hour from the current moment
            $this->extendToken($token);
            return 0;
        }
        catch(PDOException $e)
        {
            throw new Exception('Chyba při přihlášení: '.$e->getMessage());
        }

    }
// test
}