<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include "./data/dbTable.inc";

class tabDocuments extends dbTable
{
    protected $tabName = 'documents';

    public function readAll(){
        try {
            $querystr = "SELECT id, type, filename, description, expiration FROM " . $this->tabName . " where type <>'' ";
            $stmt = $this->read_data($querystr);
            return $stmt;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
        }
    }

    function insert($type, $filename, $description, $expiration)
    {
        try {
            $filename = basename($filename);
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (type, filename, description, expiration) VALUES (?, ?, ?, ?)');
            $query->bindValue(1, $type, PDO::PARAM_STR);
            $query->bindValue(2, $filename, PDO::PARAM_STR);
            $query->bindValue(3, $description, PDO::PARAM_STR);
/*            if (is_null($expiration)){
                $query->bindValue(4, $expiration, PDO::PARAM_NULL);
            }
            else{
                $query->bindValue(4, $expiration, PDO::PARAM_STR);
            }*/
            $query->bindValue(4, $expiration, PDO::PARAM_STR);
            $query->execute();
            $lastId = $this->conn->lastInsertId();
            return $lastId;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
        }
    }

    function update($id, $type, $filename, $description, $expiration)
    {
        try {
            $filename = basename($filename);
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET type = ?, filename = ?, description = ?, expiration = ? where id = ?');
            $query->bindParam(1, $type, PDO::PARAM_STR, 10);
            $query->bindParam(2, $filename, PDO::PARAM_STR, 255);
            $query->bindParam(3, $description, PDO::PARAM_STR, 200);
            $query->bindParam(4, $expiration, PDO::PARAM_INT, 30);
            $query->bindParam(5, $id, PDO::PARAM_INT, 10);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function delete($id)
    {
        try {
            $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where id = ?');
            $query->bindParam(1, $id, PDO::PARAM_INT, 10);
            $query->execute();
            }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }
}