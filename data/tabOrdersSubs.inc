<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabOrdersSubs extends dbTable
{
    protected $tabName = 'orderssubs';
    protected $vName = 'v_orderssubs';

    public function readAll($idorder){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->vName. ' where idorder = ?' );
        $query->bindValue(1, $idorder, PDO::PARAM_STR);
        $query->execute();
        return $query;
    }

    function insert($idorder, $ico, $taskdate, $finished, $price, $invoice)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, ico, taskdate, finished, price, invoice) VALUES (?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $idorder, PDO::PARAM_STR);
            $query->bindValue(2, $ico, PDO::PARAM_STR);
            $query->bindValue(3, $taskdate, PDO::PARAM_STR);
            $query->bindValue(4, $finished, PDO::PARAM_STR);
            $query->bindValue(5, $price, PDO::PARAM_INT);
            $query->bindValue(6, $invoice, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($idorder, $idsub, $ico, $taskdate, $finished, $price, $invoice)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' set ico = ?, taskdate = ?, finished = ?, price = ?, invoice = ?  where idsub = ? and idorder = ?');
            $query->bindValue(1, $ico, PDO::PARAM_STR);
            $query->bindValue(2, $taskdate, PDO::PARAM_STR);
            $query->bindValue(3, $finished, PDO::PARAM_STR);
            $query->bindValue(4, $price, PDO::PARAM_INT);
            $query->bindValue(5, $invoice, PDO::PARAM_STR);
            $query->bindValue(6, $idsub, PDO::PARAM_STR);
            $query->bindValue(7, $idorder, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function delete($idsub, $idorder)
    {
        try {
            $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idsub = ? and idorder = ?');
            $query->bindParam(1, $idsub, PDO::PARAM_INT);
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