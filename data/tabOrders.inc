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
    protected $v_OrdersAll = 'v_orders_all';

    public function readAll($archive, $searchValue){

        try {
            $archiveInt = $archive ? 1 : 0;
            if ($searchValue) {
                $searchValue = '%'.$searchValue.'%';
                $stmt = $this->conn->prepare("SELECT * FROM " . $this->v_OrdersAll . " where archive = ? and ( id like ? or name like ? or customer like ? or status like ? or custid like ?) order by id");
                $stmt->bindValue(1, $archiveInt, PDO::PARAM_INT);
                $stmt->bindValue(2, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(3, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(4, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(5, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(6, $searchValue, PDO::PARAM_STR);
            }else{
                $stmt = $this->conn->prepare("SELECT * FROM " . $this->v_OrdersAll . " where archive = ? order by id");
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

    public function readById($id){
        try {
            $query = $this->conn->prepare("SELECT * FROM " . $this->v_OrdersAll . " where id = ?");
            $query->bindValue(1, $id, PDO::PARAM_STR);
            $query->execute();
            return $query;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při čtení. '.$e->getMessage());
        }
    }

    function getID(){
        try {
            $year = date('Y').'%';
            $query = $this->conn->prepare('SELECT id FROM ' . $this->tabName .' where id like ? order by id desc') ;
            $query->bindValue(1, $year, PDO::PARAM_STR);
            $query->execute();
            $data = $query->fetchAll(PDO::FETCH_ASSOC);
            $lastID = (int) substr ( $data[0]["id"], 4);
            $newID = date('Y').sprintf( '%03d', $lastID + 1 );
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
        if ($data["id"] != ''){
            $id = $data["id"];
        }else {
            $id = $this->getID();
        }
        try {
            $archiv = 0;
            if ($data['status'] == 'Archív'){
                $archiv = 1;
            }

            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (id, name, ico, processdate, processtime, deliverytype, errand, winprice, price, idoffer, idcenter, status, archive) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)');

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
            $query->bindValue(3, $data['ico'], PDO::PARAM_STR);
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
            $query->bindValue(11, $data['idcenter'], PDO::PARAM_STR);
            $query->bindValue(12, $data['status'], PDO::PARAM_STR);
            $query->bindValue(13, $archiv, PDO::PARAM_STR);
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

    //function update($id, $name, $ico, $processdate, $processtime, $deliverytype, $errand, $winprice, $price, $price_w, $price_d, $price_r, $archive)
    function update($data)
    {
        try {
            $archiv = 0;
            if ($data['status'] == 'Archív'){
                $archiv = 1;
            }
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET name = ?, ico = ?, processdate = ?, processtime = ?, deliverytype = ?, errand = ?, winprice = ?, price = ? , price_w = ? , price_d = ? , price_r = ?, archive = ?, idcenter = ?, status = ?, custid = ?, archive = ?  where id = ? ');
            $query->bindValue(1, $data['name'], PDO::PARAM_STR);
            $query->bindValue(2, $data['ico'], PDO::PARAM_STR);
            $query->bindValue(3, $data['processdate'], PDO::PARAM_STR);
            $query->bindValue(4, $data['processtime'], PDO::PARAM_STR);
            $query->bindValue(5, $data['deliverytype'], PDO::PARAM_STR);
            $query->bindValue(6, $data['errand'], PDO::PARAM_STR);
            $query->bindValue(7, $data['winprice'], PDO::PARAM_INT);
            $query->bindValue(8, $data['price'], PDO::PARAM_INT);
            $query->bindValue(9, $data['price_w'], PDO::PARAM_INT);
            $query->bindValue(10, $data['price_d'], PDO::PARAM_INT);
            $query->bindValue(11, $data['price_r'], PDO::PARAM_INT);
            $query->bindValue(12, $data['archive'], PDO::PARAM_INT);
            $query->bindValue(13, $data['idcenter'], PDO::PARAM_STR);
            $query->bindValue(14, $data['status'], PDO::PARAM_STR);
            $query->bindValue(15, $data['custid'], PDO::PARAM_STR);
            $query->bindValue(16, $archiv, PDO::PARAM_INT);
            $query->bindValue(17, $data['id'], PDO::PARAM_STR);
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
            $query = $this->conn->prepare('DELETE FROM orderscenttasks where idorder = ?');
            $query->bindParam(1, $id, PDO::PARAM_STR);
            $query->execute();
            $query = $this->conn->prepare('DELETE FROM ordersdocuments where idorder = ?');
            $query->bindParam(1, $id, PDO::PARAM_STR);
            $query->execute();
            $query = $this->conn->prepare('DELETE FROM orderssubs where idorder = ?');
            $query->bindParam(1, $id, PDO::PARAM_STR);
            $query->execute();
            $query = $this->conn->prepare('DELETE FROM orderssubsdetail where idorder = ?');
            $query->bindParam(1, $id, PDO::PARAM_STR);
            $query->execute();
            $query = $this->conn->prepare('DELETE FROM orderstasks where idorder = ?');
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