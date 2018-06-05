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

    function insert($data)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (ico, name, profession, address, sub, dealtype) VALUES (?, ?, ?, ?, ?, ?)');
            $query->bindValue(1, $data['ico'], PDO::PARAM_STR);
            $query->bindValue(2, $data['name'], PDO::PARAM_STR);
            $query->bindValue(3, $data['profession'], PDO::PARAM_STR);
            $query->bindValue(4, $data['address'], PDO::PARAM_STR);
            $query->bindValue(5, $data['sub'], PDO::PARAM_INT);
            $query->bindValue(6, $data['dealtype'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function update($data)
    {
        $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET name = ?, profession = ?, address = ?, dealtype = ? where ico = ? ');
        $query->bindValue(1, $data['name'], PDO::PARAM_STR);
        $query->bindValue(2, $data['profession'], PDO::PARAM_STR);
        $query->bindValue(3, $data['address'], PDO::PARAM_STR);
        $query->bindValue(4, $data['dealtype'], PDO::PARAM_STR);
        $query->bindValue(5, $data['ico'], PDO::PARAM_STR);
        $query->execute();
    }

    function delete($ico)
    {
        $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where ico = ?');
        $query->bindParam(1, $ico, PDO::PARAM_STR, 10);
        $query->execute();
    }
}