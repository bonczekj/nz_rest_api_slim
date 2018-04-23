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
        $querystr = "SELECT username, email, firstname, lastname FROM " . $this->tabName;
        $stmt = $this->read_data($querystr);
        return $stmt;
    }

    function insert($username, $email, $password = "xxx", $firstname = "", $lastname = "")
    {
        $password = is_null($password) ? '' : $password;
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (username, email, password, firstname, lastname) VALUES (?, ?, ?, ?, ?)');
            $query->bindValue(1, $username, PDO::PARAM_STR);
            $query->bindValue(2, $email, PDO::PARAM_STR);
            $query->bindValue(3, $password, PDO::PARAM_STR);
            $query->bindValue(4, $firstname, PDO::PARAM_STR);
            $query->bindValue(5, $lastname, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }

    function update($username, $email, $password, $firstname, $lastname)
    {
        $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET username = ?, password = ?, firstname = ?, lastname = ? where email = ? ');
        $query->bindValue(1, $username, PDO::PARAM_STR);
        $query->bindValue(2, $password, PDO::PARAM_STR);
        $query->bindValue(3, $firstname, PDO::PARAM_STR);
        $query->bindValue(4, $lastname, PDO::PARAM_STR);
        $query->bindValue(5, $email, PDO::PARAM_STR);
        $query->execute();
    }

    function delete($email)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where email = ?');
        $query->bindParam(1, $email, PDO::PARAM_STR, 10);
        $query->execute();
    }
}