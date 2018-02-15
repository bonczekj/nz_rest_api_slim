<?php
/**
 * Created by PhpStorm.
 * User: Jirka
 * Date: 29.01.2018
 * Time: 20:29
 */

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// include database and object files
//require_once 'REST/database.inc';
//require_once 'REST/game.inc';
require_once '../tables/tabDocuments.inc';

$tabDocuments = new tabDocuments();
$stmt = $tabDocuments->readAll();
$num = $stmt->rowCount();
$rows = array();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

$tabDocuments->insert( 'test01', 'c:\temp\pokus1.pdf', 'Popis dokumentu 1', NULL);
$tabDocuments->insert( 'test02', 'c:\temp\pokus2.pdf', 'Popis dokumentu 1', date("2018-02-01"));
//echo $tabDocuments->insert( 'type01', 'c:\temp\pokus2.pdf', 'Popis dokumentu 2', '2050-12-31');

