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

    private function  offersUpdate_01(){
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

    private function  ordersUpdate_01(){
        if (!$this->existTableColumn( 'orders', 'custid' )){
            $upd01 = "ALTER TABLE orders " .
                "ADD COLUMN custid VARCHAR(50) NULL AFTER status";
            $this->alterDB($upd01);
        }

            $upd02 = "CREATE OR REPLACE VIEW v_orders AS ".
                "SELECT ".
                "orders.id AS id, ".
                "orders.name AS name, ".
                "orders.ico AS ico, ".
                "customers.name AS customer, ".
                "orders.processdate AS processdate, ".
                "orders.processtime AS processtime, ".
                "orders.deliverytype AS deliverytype, ".
                "orders.errand AS errand, ".
                "orders.winprice AS winprice, ".
                "orders.price AS price, ".
                "orders.idoffer AS idoffer, ".
                "orders.price_w AS price_w, ".
                "orders.price_d AS price_d, ".
                "orders.price_r AS price_r, ".
                "orders.archive AS archive, ".
                "orders.archiveloc AS archiveloc, ".
                "orders.idcenter AS idcenter, ".
                "orders.status AS status, ".
                "orders.custid AS custid, ".
                "(SELECT SUM(orderssubsdetail.price) FROM orderssubsdetail ".
                    "WHERE (orderssubsdetail.idorder = orders.id)) AS subs ".
            "FROM (orders LEFT JOIN customers ON ((orders.ico = customers.ico))) ".
            "ORDER BY orders.id";

            $this->alterDB($upd02);

            $upd03 = "CREATE OR REPLACE VIEW v_orders_all AS ".
                     "SELECT ".
                    "orders.id AS id, ".
                    "orders.name AS name, ".
                    "orders.ico AS ico, ".
                    "customers.name AS customer, ".
                    "orders.processdate AS processdate, ".
                    "orders.processtime AS processtime, ".
                    "orders.deliverytype AS deliverytype, ".
                    "orders.errand AS errand, ".
                    "orders.winprice AS winprice, ".
                    "orders.price AS price, ".
                    "IFNULL(orders.price_w, 0) AS price_w, ".
                    "IFNULL(orders.price_d, 0) AS price_d, ".
                    "IFNULL(orders.price_r, 0) AS price_r, ".
                    "orders.archive AS archive, ".
                    "orders.archiveloc AS archiveloc, ".
                    "orders.idcenter AS idcenter, ".
                    "orders.status AS status, ".
                    "orders.custid AS custid, ".
                    "offers.id AS idoffer, ".
                    "offers.name AS idofferdesc, ".
                    "IFNULL((SELECT SUM(orderssubsdetail.price) FROM orderssubsdetail ".
                                "WHERE ((orderssubsdetail.idorder = orders.id) ".
                                    "AND (orderssubsdetail.invoice = true))), ".
                            "0) AS price_s, ".
                    "IFNULL((SELECT SUM(orderssubsdetail.price) FROM orderssubsdetail ".
                                "WHERE (orderssubsdetail.idorder = orders.id)), ".
                            "0) AS price_s_pl, ".
                    "IFNULL((SELECT SUM(orderstasks.price) FROM orderstasks ".
                                "WHERE ((orderstasks.idorder = orders.id) ".
                                    "AND (orderstasks.invoice = true))), ".
                            "0) AS price_c, ".
                    "IFNULL((SELECT SUM(orderstasks.price) FROM orderstasks ".
                                "WHERE (orderstasks.idorder = orders.id)), ".
                            "0) AS price_c_pl ".
                    "FROM ((orders LEFT JOIN offers ON ((offers.idorder = orders.id))) ".
                        "LEFT JOIN customers ON ((orders.ico = customers.ico))) ".
                    "ORDER BY orders.id";

            $this->alterDB($upd03);
        //}
    }

    private function  v_orders_all_Update_02(){
        $upd = "CREATE OR REPLACE VIEW v_orders_all AS ".
            "SELECT ".
            "orders.id AS id, ".
            "orders.name AS name, ".
            "orders.ico AS ico, ".
            "customers.name AS customer, ".
            "orders.processdate AS processdate, ".
            "orders.processtime AS processtime, ".
            "orders.deliverytype AS deliverytype, ".
            "orders.errand AS errand, ".
            "orders.winprice AS winprice, ".
            "orders.price AS price, ".
            "IFNULL(orders.price_w, 0) AS price_w, ".
            "IFNULL(orders.price_d, 0) AS price_d, ".
            "IFNULL(orders.price_r, 0) AS price_r, ".
            "orders.archive AS archive, ".
            "orders.archiveloc AS archiveloc, ".
            "orders.idcenter AS idcenter, ".
            "orders.status AS status, ".
            "orders.custid AS custid, ".
            "offers.id AS idoffer, ".
            "offers.name AS idofferdesc, ".
            "IFNULL((SELECT SUM(orderssubsdetail.price) FROM orderssubsdetail ".
            "WHERE ((orderssubsdetail.idorder = orders.id) ".
            "AND (orderssubsdetail.invoice = 'true'))), ".
            "0) AS price_s, ".
            "IFNULL((SELECT SUM(orderssubsdetail.price) FROM orderssubsdetail ".
            "WHERE (orderssubsdetail.idorder = orders.id)), ".
            "0) AS price_s_pl, ".
            "IFNULL((SELECT SUM(orderstasks.price) FROM orderstasks ".
            "WHERE ((orderstasks.idorder = orders.id) ".
            "AND (orderstasks.invoice = 'true'))), ".
            "0) AS price_c, ".
            "IFNULL((SELECT SUM(orderstasks.price) FROM orderstasks ".
            "WHERE (orderstasks.idorder = orders.id)), ".
            "0) AS price_c_pl ".
            "FROM ((orders LEFT JOIN offers ON ((offers.idorder = orders.id))) ".
            "LEFT JOIN customers ON ((orders.ico = customers.ico))) ".
            "ORDER BY orders.id";

        $this->alterDB($upd);
    }


    private function ordersUpdate_archiv(){
        $upd = "UPDATE orders SET archive='0';";
        $this->alterDB($upd);
        $upd = "UPDATE orders SET archive='1' WHERE status = 'Archív';";
        $this->alterDB($upd);
    }

    private function v_ordersSubDetails_Update_01(){
        $upd = "CREATE OR REPLACE VIEW v_orderssubsdetail AS ".
        "SELECT ".
        "orderssubsdetail.idsubdetail AS  idsubdetail,".
        "orderssubsdetail.idorder AS  idorder,".
        "orderssubsdetail.idsub AS  idsub,".
        "orderssubsdetail.taskdate AS  taskdate,".
        "orderssubsdetail.finished AS  finished,".
        "orderssubsdetail.price AS  price,".
        "orderssubsdetail.invoice AS  invoice,".
        "orderssubsdetail.planinvdate AS  planinvdate,".
        "orders.name AS  order_name,".
        "customers.ico AS  ico,".
        "customers.name AS  name,".
        "customers.mobil AS  mobil,".
        "customers.email AS  email ".
        "FROM ".
        "(orderssubsdetail ".
            "JOIN orderssubs ON (orderssubsdetail.idsub = orderssubs.idsub)".
            "JOIN customers ON (orderssubs.ico = customers.ico)".
            "JOIN orders ON (orderssubsdetail.idorder = orders.id) );";
        $this->alterDB($upd);
    }

    private function v_ordersTasks_Update_01(){
        $upd = "CREATE OR REPLACE VIEW v_orderstasks AS ".
        "SELECT ".
        "orderstasks.idtask AS idtask,".
        "orderstasks.idorder AS idorder,".
        "orderstasks.taskdate AS taskdate,".
        "orderstasks.taskdesc AS taskdesc,".
        "orderstasks.finished AS finished,".
        "orderstasks.price AS price,".
        "orderstasks.invoice AS invoice,".
        "orderstasks.planinvdate AS planinvdate,".
        "orderstasks.note AS note,".
        "orders.name AS name,".
        "orders.status AS status ".
        "FROM ".
        "(orderstasks JOIN orders) ".
        "WHERE ".
            "((orderstasks.idorder = orders.id) ".
            "AND (orderstasks.taskdate IS NOT NULL) ".
            "AND (UNIX_TIMESTAMP(orderstasks.taskdate) <> 0)) ".
            "AND ((orderstasks.finished IS NULL) or orderstasks.finished = '0000-00-00') ";
        $this->alterDB($upd);
    }

    public function dbupdate()
    {
        //offersUpdate_01();
        //$this->ordersUpdate_01();
        //$this->ordersUpdate_archiv();
        //$this->v_orders_all_Update_02();
        //$this->v_ordersSubDetails_Update_01();
        $this->v_ordersTasks_Update_01();
    }

}