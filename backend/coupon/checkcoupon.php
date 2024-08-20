<?php

include '../connect.php';

$coupon=fillterrequest('coupon');

$now=date('Y-m-d');

//Getdata('coupon',"`coupon_name`='$coupon' AND `coupon_expiredata` > '$now' AND `coupon_count` > '0' ");




$pre= $connect->prepare("SELECT * FROM `coupon` WHERE `coupon_name`='$coupon' AND `coupon_expiredata` > '$now' AND `coupon_count` > '0'");

$pre->execute();

$data=$pre->fetch(PDO::FETCH_ASSOC);

$count= $pre->rowCount();


if($count>0){

    echo json_encode(
        array(
            "status"=>"success",
            "data"=>$data,

        ));
}else{

    echo json_encode(array("status"=>"failed"));

}

