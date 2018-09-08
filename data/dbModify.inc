<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class dbModify extends dbTable
{
    private function existTableColumn($table, $field){
        //$query = $this->conn->prepare('UPDATE ' . $this->tabName . ' SET person = ? where idcenter = ? ');
        //$query->bindValue(1, $data["idcenter"], PDO::PARAM_STR);
        //$query->bindValue(2, $data["person"], PDO::PARAM_STR);
        $query  = $this->conn->prepare("SHOW COLUMNS FROM $table LIKE '$field'");
        try{
            $query->execute();
            if($query->fetchColumn()) {
                return true;
            }else{
                return false;
            }
        }catch(PDOException $e){die($e->getMessage());}
    }


    protected function alterDB($updStr){
        try {
            $query = $this->conn->prepare($updStr);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při modifikaci databáze. '.$e->getMessage());
        }
    }

    public function dbupdate()
    {
        if (!$this->existTableColumn( 'offers', 'delivered' )){
            $upd01 = "ALTER TABLE offers " .
                     "ADD COLUMN delivered VARCHAR(5) NULL AFTER archiv";
            $this->alterDB($upd01);

            $upd02 = "CREATE OR REPLACE VIEW v_offers AS ".
                     "SELECT ".
                     "offers.id AS id, ".
                        "offers.name AS name, ".
                        "offers.ico AS ico, ".
                        "customers.name AS customer, ".
                        "offers.processdate AS processdate, ".
                        "offers.processtime AS processtime, ".
                        "offers.deliverytype AS deliverytype, ".
                        "offers.errand AS errand, ".
                        "offers.winprice AS winprice, ".
                        "offers.price AS price, ".
                        "offers.idorder AS idorder, ".
                        "offers.delivered AS delivered, ".
                        "orders.name AS nameorder, ".
                        "orders.archive AS archive ".
                    "FROM ".
                    "((offers ".
                        "LEFT JOIN orders ON ((offers.idorder = orders.id))) ".
                        "LEFT JOIN customers ON ((offers.ico = customers.ico))) ".
                    "ORDER BY offers.id ";
            $this->alterDB($upd02);
        }
    }


}