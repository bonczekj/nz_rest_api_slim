<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabOrders extends dbTable
{
    protected $tabName = 'orders';
    protected $v_Orders = 'v_orders';

    public function readAll($archive, $searchValue){

        try {
            $archiveInt = $archive ? 1 : 0;
            if ($searchValue) {
                $searchValue = '%'.$searchValue.'%';
                $stmt = $this->conn->prepare("SELECT * FROM " . $this->tabName . " where archive = ? and ( id like ? or name like ? or customer like ?)");
                $stmt->bindValue(1, $archiveInt, PDO::PARAM_INT);
                $stmt->bindValue(2, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(3, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(4, $searchValue, PDO::PARAM_STR);
            }else{
                $stmt = $this->conn->prepare("SELECT * FROM " . $this->tabName . " where archive = ?");
                $stmt->bindValue(1, $archiveInt, PDO::PARAM_INT);
            }
            $stmt->execute();
            return $stmt;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    /*public function readById($id){
        try {
            $query = $this->conn->prepare("SELECT * FROM " . $this->v_Orders . " where id = ?");
            $query->bindValue(1, $id, PDO::PARAM_STR);
            $query->execute();
            return $query;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }*/

    function getID(){
        try {
            $year = date('Y').'%';
            $query = $this->conn->prepare('SELECT id FROM ' . $this->tabName .' where id like ? order by id desc') ;
            $query->bindValue(1, $year, PDO::PARAM_STR);
            $query->execute();
            $data = $query->fetchAll(PDO::FETCH_ASSOC);
            $lastID = (int) substr ( $data[0]["id"], 4);
            $newID = date('Y').sprintf( '%02d', $lastID + 1 );
            return $newID;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    //function insert($name, $customer, $processdate, $processtime, $deliverytype, $errand, $winprice, $price, $idoffer)
    function insert($data)
    {
        $id = $this->getID();
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (id, name, customer, processdate, processtime, deliverytype, errand, winprice, price, idoffer) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');

            /*$query->bindValue(1, $id, PDO::PARAM_STR);
            $query->bindValue(2, $name, PDO::PARAM_STR);
            $query->bindValue(3, $customer, PDO::PARAM_STR);
            $query->bindValue(4, $processdate, PDO::PARAM_STR);
            $query->bindValue(5, $processtime, PDO::PARAM_STR);
            $query->bindValue(6, $deliverytype, PDO::PARAM_STR);
            $query->bindValue(7, $errand, PDO::PARAM_STR);
            $query->bindValue(8, $winprice, PDO::PARAM_INT);
            $query->bindValue(9, $price, PDO::PARAM_INT);
            $query->bindValue(10, $idoffer, PDO::PARAM_STR);*/

            $query->bindValue(1, $id, PDO::PARAM_STR);
            $query->bindValue(2, $data['name'], PDO::PARAM_STR);
            $query->bindValue(3, $data['customer'], PDO::PARAM_STR);
            $query->bindValue(4, $data['processdate'], PDO::PARAM_STR);
            $query->bindValue(5, $data['processtime'], PDO::PARAM_STR);
            $query->bindValue(6, $data['deliverytype'], PDO::PARAM_STR);
            $query->bindValue(7, $data['errand'], PDO::PARAM_STR);
            $query->bindValue(8, $data['winprice'], PDO::PARAM_INT);
            $query->bindValue(9, $data['price'], PDO::PARAM_INT);

            if(empty($data['idoffer'])){
                $data['idoffer'] = null;
            }
            $query->bindValue(10, $data['idoffer'], PDO::PARAM_STR);
            $query->execute();

            $query1 = $this->conn->prepare("SELECT * FROM " . $this->tabName . " where id = ?");
            $query1->bindValue(1, $id, PDO::PARAM_STR);
            $query1->execute();
            return $query1->fetch(PDO::FETCH_ASSOC);
        }
        catch(PDOException $e)
        {
            //print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($id, $name, $customer, $processdate, $processtime, $deliverytype, $errand, $winprice, $price, $price_w, $price_d, $price_r, $archive)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET name = ?, customer = ?, processdate = ?, processtime = ?, deliverytype = ?, errand = ?, winprice = ?, price = ? , price_w = ? , price_d = ? , price_r = ?, archive = ? where id = ? ');
            $query->bindValue(1, $name, PDO::PARAM_STR);
            $query->bindValue(2, $customer, PDO::PARAM_STR);
            $query->bindValue(3, $processdate, PDO::PARAM_STR);
            $query->bindValue(4, $processtime, PDO::PARAM_STR);
            $query->bindValue(5, $deliverytype, PDO::PARAM_STR);
            $query->bindValue(6, $errand, PDO::PARAM_STR);
            $query->bindValue(7, $winprice, PDO::PARAM_INT);
            $query->bindValue(8, $price, PDO::PARAM_INT);
            $query->bindValue(9, $price_w, PDO::PARAM_INT);
            $query->bindValue(10, $price_d, PDO::PARAM_INT);
            $query->bindValue(11, $price_r, PDO::PARAM_INT);
            $query->bindValue(12, $archive, PDO::PARAM_INT);
            $query->bindValue(13, $id, PDO::PARAM_STR);
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
            $query->bindParam(1, $id, PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function linkoffer($id, $idoffer)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET idoffer = ? where id = ? ');
            $query->bindValue(1, $idoffer, PDO::PARAM_INT);
            $query->bindValue(2, $id, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

}