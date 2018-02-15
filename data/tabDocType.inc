<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabDocType extends dbTable
{
    protected $tabName = 'doctype';

    public function readAll(){
        $querystr = "SELECT type, description FROM " . $this->tabName;
        $stmt = $this->read_data($querystr);
        return $stmt;
    }

    function insert($type, $description)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (type, description) VALUES (?, ?)');
            $query->bindValue(1, $type, PDO::PARAM_STR);
            $query->bindValue(2, $description, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($type, $description)
    {
        $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET description = ? where type = ? ');
        $query->bindValue(1, $description, PDO::PARAM_STR);
        $query->bindValue(2, $type, PDO::PARAM_STR);
        $query->execute();
    }

    function delete($type)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where type = ?');
        $query->bindParam(1, $type, PDO::PARAM_STR, 10);
        $query->execute();
    }
}