<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabTasks extends dbTable
{
    protected $tabName = 'orderstasks';

    public function readAll(){
        $querystr = "SELECT * FROM " . $this->tabName;
        $stmt = $this->read_data($querystr);
        return $stmt;
    }
/*
    function insert($type, $filename, $description, $expiration)
    {
        try {
            $filename = basename($filename);
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (type, filename, description, expiration) VALUES (?, ?, ?, ?)');
            $query->bindValue(1, $type, PDO::PARAM_STR);
            $query->bindValue(2, $filename, PDO::PARAM_STR);
            $query->bindValue(3, $description, PDO::PARAM_STR);
            $query->bindValue(4, $expiration, PDO::PARAM_STR);
            $query->execute();
            $lastId = $this->conn->lastInsertId();
            return $lastId;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    function update($id, $type, $filename, $description, $expiration)
    {
        $filename = basename($filename);
        $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET type = ?, filename = ?, description = ?, expiration = ? where id = ?');
        $query->bindParam(1, $type, PDO::PARAM_STR, 10);
        $query->bindParam(2, $filename, PDO::PARAM_STR, 255);
        $query->bindParam(3, $description, PDO::PARAM_STR, 200);
        $query->bindParam(4, $expiration, PDO::PARAM_INT, 30);
        $query->bindParam(5, $id, PDO::PARAM_INT, 10);
        $query->execute();
    }

    function delete($id)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where id = ?');
        $query->bindParam(1, $id, PDO::PARAM_INT, 10);
        $query->execute();
    }*/
}