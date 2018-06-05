<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";
include_once "./data/tabOrders.inc";

class tabOffers extends dbTable
{
    protected $tabName = 'offers';
    protected $v_offers = 'v_offers';

    public function readAll($searchValue){
        try {
            if ($searchValue) {
                $searchValue = '%'.$searchValue.'%';
                $stmt = $this->conn->prepare("SELECT * FROM " . $this->v_offers . " where ( id like ? or name like ? or customer like ?)");
                $stmt->bindValue(1, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(2, $searchValue, PDO::PARAM_STR);
                $stmt->bindValue(3, $searchValue, PDO::PARAM_STR);
            }else{
                $stmt = $this->conn->prepare("SELECT * FROM " . $this->v_offers);
            }
            $stmt->execute();
            return $stmt;
       }
        catch(Exception $e)
        {
            return $response->withHeader('Content-Type', 'application/json')
                ->withStatus(460, 'Error')
                ->withBody($e->getMessage());
        }

        //$querystr = "SELECT * FROM " . $this->v_offers;
        //$stmt = $this->read_data($querystr);
        //return $stmt;
    }

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

    function insert($name, $ico, $processdate, $processtime, $deliverytype, $errand, $winprice, $price)
    {
        $id = $this->getID();
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (id, name, ico, processdate, processtime, deliverytype, errand, winprice, price ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $id, PDO::PARAM_STR);
            $query->bindValue(2, $name, PDO::PARAM_STR);
            $query->bindValue(3, $ico, PDO::PARAM_STR);
            $query->bindValue(4, $processdate, PDO::PARAM_STR);
            $query->bindValue(5, $processtime, PDO::PARAM_STR);
            $query->bindValue(6, $deliverytype, PDO::PARAM_STR);
            $query->bindValue(7, $errand, PDO::PARAM_STR);
            $query->bindValue(8, $winprice, PDO::PARAM_INT);
            $query->bindValue(9, $price, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($id, $name, $ico, $processdate, $processtime, $deliverytype, $errand, $winprice, $price)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET name = ?, ico = ?, processdate = ?, processtime = ?, deliverytype = ?, errand = ?, winprice = ?, price = ? where id = ? ');
            $query->bindValue(1, $name, PDO::PARAM_STR);
            $query->bindValue(2, $ico, PDO::PARAM_STR);
            $query->bindValue(3, $processdate, PDO::PARAM_STR);
            $query->bindValue(4, $processtime, PDO::PARAM_STR);
            $query->bindValue(5, $deliverytype, PDO::PARAM_STR);
            $query->bindValue(6, $errand, PDO::PARAM_STR);
            $query->bindValue(7, $winprice, PDO::PARAM_INT);
            $query->bindValue(8, $price, PDO::PARAM_INT);
            $query->bindValue(9, $id, PDO::PARAM_STR);
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

    function createorder($data)
    {
        try {
            $tabOrders = new tabOrders();
            $newOrder = $tabOrders->insert($data);

            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET idorder = ? where id = ? ');
            $query->bindValue(1, $newOrder['id'], PDO::PARAM_STR);
            $query->bindValue(2, $data['id'], PDO::PARAM_STR);
            $query->execute();
            return $newOrder;
        }
        catch(PDOException $e)
        {
            //print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

}

