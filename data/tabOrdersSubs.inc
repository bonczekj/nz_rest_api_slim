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

    /**
     * @param $idorder
     * @return PDOStatement
     */
    public function readAll($idorder){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->vName. ' where idorder = ?' );
        $query->bindValue(1, $idorder, PDO::PARAM_STR);
        $query->execute();
        return $query;
    }

    /**
     * @param $idorder
     * @param $ico
     * @throws Exception
     */
    //function insert($idorder, $ico)
    function insert($data)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, ico) VALUES (?, ?)');
            $query->bindValue(1, $data['idorder'], PDO::PARAM_STR);
            $query->bindValue(2, $data['ico'], PDO::PARAM_STR);
            $query->execute();
            $lastId = $this->conn->lastInsertId();
            return $lastId;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    /**
     * @param $idorder
     * @param $idsub
     * @param $ico
     * @throws Exception
     */
    //function update($idorder, $idsub, $ico)
    function update($data)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' set ico = ? where idsub = ? and idorder = ?');
            $query->bindValue(1, $data['ico'], PDO::PARAM_STR);
            $query->bindValue(2, $data['idsub'], PDO::PARAM_STR);
            $query->bindValue(3, $data['idorder'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    /**
     * @param $idsub
     * @param $idorder
     * @throws Exception
     */
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