<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";
include_once "./data/Ares.inc";
include_once "./data/aresMF.inc";

class tabCustomers extends dbTable
{
    protected $tabName = 'customers';
    protected $vNameCust = 'v_customers';
    protected $vNameSub = 'v_subcustomers';

    public function readCust(){
        try {
            $querystr = "SELECT * FROM " . $this->vNameCust;
            $stmt = $this->read_data($querystr);
            return $stmt;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    public function readSub(){
        try {
            $querystr = "SELECT * FROM " . $this->vNameSub;
            $stmt = $this->read_data($querystr);
            return $stmt;
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    public function readAres($ico){
        //$ares = new ARES($ico); // Zadáte IČ
        //return $ares->getData();   // Získáte array s daty
        $aresMF = new aresMF($ico); // Zadáte IČ
        return $aresMF->getData();   // Získáte array s daty
    }

    function insert($ico, $name, $profession, $address, $sub)
    {

        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (ico, name, profession, address, sub) VALUES (?, ?, ?, ?, ?)');
            $query->bindValue(1, $ico, PDO::PARAM_STR);
            $query->bindValue(2, $name, PDO::PARAM_STR);
            $query->bindValue(3, $profession, PDO::PARAM_STR);
            $query->bindValue(4, $address, PDO::PARAM_STR);
            $query->bindValue(5, $sub, PDO::PARAM_INT);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($ico, $name, $profession, $address)
    {
        $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET name = ?, profession = ?, address = ? where ico = ? ');
        $query->bindValue(1, $name, PDO::PARAM_STR);
        $query->bindValue(2, $profession, PDO::PARAM_STR);
        $query->bindValue(3, $address, PDO::PARAM_STR);
        $query->bindValue(4, $ico, PDO::PARAM_STR);
        $query->execute();
    }

    function delete($ico)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where ico = ?');
        $query->bindParam(1, $ico, PDO::PARAM_STR, 10);
        $query->execute();
    }
}