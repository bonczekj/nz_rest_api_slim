<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabOffers extends dbTable
{
    protected $tabName = 'offers';

    public function readAll(){
        $querystr = "SELECT id, name, customer, processdate, processtime, deliverytype, errand, winprice, price FROM " . $this->tabName;
        $stmt = $this->read_data($querystr);
        return $stmt;
    }

    function insert($id, $name, $customer, $processdate, $processtime, $deliverytype, $errand, $winprice, $price)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (id, name, customer, processdate, processtime, deliverytype, errand, winprice, price ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $id, PDO::PARAM_STR);
            $query->bindValue(2, $name, PDO::PARAM_STR);
            $query->bindValue(3, $customer, PDO::PARAM_STR);
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

    function update($id, $name, $customer, $processdate, $processtime, $deliverytype, $errand, $winprice, $price)
    {
        $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET name = ?, customer = ?, processdate = ?, processtime = ?, deliverytype = ?, errand = ?, winprice = ?, price = ? where id = ? ');
        $query->bindValue(1, $name, PDO::PARAM_STR);
        $query->bindValue(2, $customer, PDO::PARAM_STR);
        $query->bindValue(3, $processdate, PDO::PARAM_STR);
        $query->bindValue(4, $processtime, PDO::PARAM_STR);
        $query->bindValue(5, $deliverytype, PDO::PARAM_STR);
        $query->bindValue(6, $errand, PDO::PARAM_STR);
        $query->bindValue(7, $winprice, PDO::PARAM_INT);
        $query->bindValue(8, $price, PDO::PARAM_INT);
        $query->bindValue(9, $id, PDO::PARAM_STR);
        $query->execute();
    }

    function delete($id)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where id = ?');
        $query->bindParam(1, $id, PDO::PARAM_STR);
        $query->execute();
    }
}