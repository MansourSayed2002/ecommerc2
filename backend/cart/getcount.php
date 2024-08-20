<?php

include "../connect.php";

$itemid=fillterrequest('itemid');

$userid=fillterrequest('userid');

$pre=$connect->prepare(" SELECT countitem FROM cartview
 WHERE `cart_itemid`='$itemid' AND `cart_userid`='$userid'");



$pre->execute();

$counter=$pre->fetchColumn();

$count=$pre->rowCount();


if($count > 0){

    echo json_encode(
        array(
    "status"=>"success",
    "counter"=>$counter,
        )
        );
    
    }else{
    
        echo json_encode(
            array(
        "status"=>"failure",
            )
            );
    
    
    }