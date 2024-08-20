<?php


$dbn="mysql:host=localhost;dbname=ecommerce";
$user='root';
$pass='';
$option=array(
    PDO::MYSQL_ATTR_INIT_COMMAND =>"SET NAMES UTF8"
);

try{
    $connect=new PDO($dbn,$user,$pass,$option);
    $connect->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    include "function.php";
}catch(PDOException $e){
   echo $e->getMessage();
}