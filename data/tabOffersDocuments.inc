<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";
include_once "./data/tabDocuments.inc";

class tabOffersDocuments extends dbTable
{
    protected $tabName = 'offersdocuments';

    public function readAll($idoffer){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->tabName. ', documents where iddocument = documents.id and  idoffer = ?' );
        $query->bindValue(1, $idoffer, PDO::PARAM_INT);
        $query->execute();
        return $query;
    }

    function insert($idoffer, $iddocument)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idoffer, iddocument) VALUES (?, ?)');
            $query->bindValue(1, $idoffer, PDO::PARAM_INT);
            $query->bindValue(2, $iddocument, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function delete($idoffer, $iddocument)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idoffer = ? and iddocument = ?');
        $query->bindParam(1, $idoffer, PDO::PARAM_INT);
        $query->bindParam(1, $iddocument, PDO::PARAM_INT);
        $query->execute();
    }
}