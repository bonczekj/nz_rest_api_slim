<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabOrdersSubsDetail extends dbTable
{
    protected $tabName = 'orderssubsdetail';
    protected $vName = 'v_orderssubsdetail';


    public function readAll(){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->vName );
        $query->execute();
        return $query;
    }

    /**
     * @param $idsub
     * @return PDOStatement
     */
    public function readOrd($idorder){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->vName. ' where idorder = ?' );
        $query->bindValue(1, $idorder, PDO::PARAM_STR);
        $query->execute();
        return $query;
    }

    public function readSub($idsub){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->vName. ' where idsub = ?' );
        $query->bindValue(1, $idsub, PDO::PARAM_INT);
        $query->execute();
        return $query;
    }

    /**
     * @param $data
     * @throws Exception
     */
    function insert($data)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, idsub, taskdate, finished, price, invoice, planinvdate) VALUES (?, ?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $data['idorder'], PDO::PARAM_STR);
            $query->bindValue(2, $data['idsub'], PDO::PARAM_INT);
            $query->bindValue(3, $data['taskdate'], PDO::PARAM_STR);
            $query->bindValue(4, $data['finished'], PDO::PARAM_STR);
            $query->bindValue(5, $data['price'], PDO::PARAM_INT);
            $query->bindValue(6, $data['invoice'], PDO::PARAM_STR);
            $query->bindValue(7, $data['planinvdate'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    /**
     * @param $data
     * @throws Exception
     */
    function update($data)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' set taskdate = ?, finished = ?, price = ?, invoice = ?, planinvdate = ?  where idsubdetail = ?');
            $query->bindValue(1, $data['taskdate'], PDO::PARAM_STR);
            $query->bindValue(2, $data['finished'], PDO::PARAM_STR);
            $query->bindValue(3, $data['price'], PDO::PARAM_INT);
            $query->bindValue(4, $data['invoice'], PDO::PARAM_STR);
            $query->bindValue(5, $data['planinvdate'], PDO::PARAM_STR);
            $query->bindValue(6, $data['idsubdetail'], PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    /**
     * @param $idsubdetil
     * @throws Exception
     */
    function delete($idsubdetail)
    {
        try {
            $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idsubdetail = ?');
            $query->bindParam(1, $idsubdetail, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }
}