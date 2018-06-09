<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabCenters extends dbTable
{
    protected $tabName = 'centers';

    public function readAll(){
        try {
        $querystr = "SELECT * FROM " . $this->tabName;
        $stmt = $this->read_data($querystr);
        return $stmt;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při čtení dat. '.$e->getMessage());
        }
    }

    function insert($data)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idcenter, person) VALUES (?, ?)');
            $query->bindValue(1, $data["idcenter"], PDO::PARAM_STR);
            $query->bindValue(2, $data["person"], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }

    function update($data)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET person = ? where idcenter = ? ');
            $query->bindValue(1, $data["idcenter"], PDO::PARAM_STR);
            $query->bindValue(2, $data["person"], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }

    function delete($data)
    {
        try {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idcenter = ?');
        $query->bindParam(1, $data["idcenter"], PDO::PARAM_STR, 10);
        $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
//            die();
        }
    }


}