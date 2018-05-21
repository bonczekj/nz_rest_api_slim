<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";
include_once "./data/tabDocuments.inc";

class tabOrdersTasks extends dbTable
{
    protected $tabName = 'orderstasks';

    public function readAll($idorder){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->tabName. ' where idorder = ?' );
        $query->bindValue(1, $idorder, PDO::PARAM_STR);
        $query->execute();
        return $query;
    }

    function insert($idorder, $taskdate, $taskdesc, $finished, $price)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, taskdate, taskdesc, finished, price) VALUES (?, ?, ?, ?, ?)');
            $query->bindValue(1, $idorder, PDO::PARAM_STR);
            $query->bindValue(2, $taskdate, PDO::PARAM_INT);
            $query->bindValue(3, $taskdesc, PDO::PARAM_STR);
            $query->bindValue(4, $finished, PDO::PARAM_INT);
            $query->bindValue(5, $price, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($idtask, $idorder, $taskdate, $taskdesc, $finished, $price)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' set taskdate = ?, taskdesc = ?, finished = ?, price = ? where idtask = ? and idorder = ?');
            $query->bindValue(1, $taskdate, PDO::PARAM_INT);
            $query->bindValue(2, $taskdesc, PDO::PARAM_STR);
            $query->bindValue(3, $finished, PDO::PARAM_INT);
            $query->bindValue(4, $price, PDO::PARAM_INT);
            $query->bindValue(5, $idtask, PDO::PARAM_INT);
            $query->bindValue(6, $idorder, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function delete($idtask, $idorder)
    {
        try {
            $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idtask = ? and idorder = ?');
            $query->bindParam(1, $idtask, PDO::PARAM_INT);
            $query->bindParam(2, $idorder, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }
}