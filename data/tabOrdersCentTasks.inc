<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 19:51
 */

include_once "./data/dbTable.inc";

class tabOrdersCentTasks extends dbTable
{
    protected $tabName = 'orderscenttasks';
    protected $v_tabName = 'v_orderscenttasks';

    public function readAll($idorder){
        $query = $this->conn->prepare('SELECT * FROM ' . $this->v_tabName. ' where idorder = ? order by taskdate' );
        $query->bindValue(1, $idorder, PDO::PARAM_STR);
        $query->execute();
        return $query;
    }

    //function insert($idorder, $taskdate, $taskdesc, $finished, $price)
    function insert($data)
    {
        try {
            $query = $this->conn->prepare('INSERT INTO ' . $this->tabName . ' (idorder, taskdate, taskcentdesc, finished, idcenter) VALUES (?, ?, ?, ?, ?)');
            $query->bindValue(1, $data['idorder'], PDO::PARAM_STR);
            $query->bindValue(2, $data['taskdate'], PDO::PARAM_STR);
            $query->bindValue(3, $data['taskcentdesc'], PDO::PARAM_STR);
            $query->bindValue(4, $data['finished'], PDO::PARAM_STR);
            $query->bindValue(5, $data['idcenter'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    //function update($idtask, $idorder, $taskdate, $taskdesc, $finished, $price)
    function update($data)
    {
        try {
            $query = $this->conn->prepare('UPDATE ' . $this->tabName . ' set taskdate = ?, taskcentdesc = ?, finished = ?, idcenter = ? where idtask = ? and idorder = ?');
            $query->bindValue(1, $data['taskdate'], PDO::PARAM_STR);
            $query->bindValue(2, $data['taskcentdesc'], PDO::PARAM_STR);
            $query->bindValue(3, $data['finished'], PDO::PARAM_STR);
            $query->bindValue(4, $data['idcenter'], PDO::PARAM_INT);
            $query->bindValue(5, $data['idtask'], PDO::PARAM_INT);
            $query->bindValue(6, $data['idorder'], PDO::PARAM_STR);
            $query->execute();
        }
        catch(PDOException $e)
        {
            print "Error!: " . $e->getMessage() . "<br/>";
            throw new Exception('Chyba při ukládání. '.$e->getMessage());
        }
    }

    function delete($idtask, $idorder)
    {
        try {
            $query = $this->conn->prepare('DELETE FROM ' . $this->tabName . ' where idtask = ? and idorder = ?');
            $query->bindParam(1, $idtask, PDO::PARAM_INT);
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