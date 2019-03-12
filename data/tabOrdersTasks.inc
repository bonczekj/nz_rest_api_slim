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

    //function insert($idorder, $taskdate, $taskdesc, $finished, $price)
    function insert($data)
    {
        try {
            if (empty($data['planinvdate'])){
                $data['planinvdate'] = null;
            }
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, taskdate, taskdesc, finished, price, invoice, note, planinvdate) VALUES (?, ?, ?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $data['idorder'], PDO::PARAM_STR);
            $query->bindValue(2, $data['taskdate'], PDO::PARAM_STR);
            $query->bindValue(3, $data['taskdesc'], PDO::PARAM_STR);
            $query->bindValue(4, $data['finished'], PDO::PARAM_STR);
            $query->bindValue(5, $data['price'], PDO::PARAM_INT);
            $query->bindValue(6, $data['invoice'], PDO::PARAM_STR);
            $query->bindValue(7, $data['note'], PDO::PARAM_STR);
            $query->bindValue(8, $data['planinvdate'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    //function update($idtask, $idorder, $taskdate, $taskdesc, $finished, $price)
    function update($data)
    {
        try {
            if (empty($data['planinvdate'])){
                $data['planinvdate'] = null;
            }
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' set taskdate = ?, taskdesc = ?, finished = ?, price = ?, invoice = ?, note = ?, planinvdate = ? where idtask = ? and idorder = ?');
            $query->bindValue(1, $data['taskdate'], PDO::PARAM_STR);
            $query->bindValue(2, $data['taskdesc'], PDO::PARAM_STR);
            $query->bindValue(3, $data['finished'], PDO::PARAM_STR);
            $query->bindValue(4, $data['price'], PDO::PARAM_INT);
            $query->bindValue(5, $data['invoice'], PDO::PARAM_STR);
            $query->bindValue(6, $data['note'], PDO::PARAM_STR);
            $query->bindValue(7, $data['planinvdate'], PDO::PARAM_STR);
            $query->bindValue(8, $data['idtask'], PDO::PARAM_INT);
            $query->bindValue(9, $data['idorder'], PDO::PARAM_STR);
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