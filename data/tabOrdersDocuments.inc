<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";
include_once "./data/tabDocuments.inc";

class tabOrdersDocuments extends dbTable
{
    protected $tabName = 'ordersdocuments';
    protected $v_tabName = 'v_ordersdocuments';

    public function readAll($idorder){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->v_tabName. ' where idorder = ? order by path, filename' );
        $query->bindValue(1, $idorder, PDO::PARAM_STR);
        $query->execute();
        return $query;
    }

    function insert($idorder, $iddocument, $typeRS, $ico)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, iddocument, typeRS, ico) VALUES (?, ?, ?, ?)');
            $query->bindValue(1, $idorder, PDO::PARAM_STR);
            $query->bindValue(2, $iddocument, PDO::PARAM_INT);
            $query->bindValue(3, $typeRS, PDO::PARAM_STR);
            $query->bindValue(4, $ico, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function delete($idorder, $iddocument)
    {
        try {
            $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idorder = ? and iddocument = ?');
            $query->bindParam(1, $idorder, PDO::PARAM_STR);
            $query->bindParam(2, $iddocument, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }
}