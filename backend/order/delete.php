<?php

include '../connect.php';

$userid=fillterrequest('userid');

$orderid=fillterrequest('orderid');


$pre=$connect->prepare("DELETE FROM `orders`
 WHERE `orders_userid`='$userid' AND `orders_id`=$orderid AND `orders_status`='0'");

 $pre->execute();

 $count=$pre->rowCount();

 if($count > 0){
 echo json_encode(
    array(
        "status"=>"success",
    )
 );

 }else{

    echo json_encode(
        array(
            "status"=>"failure",
        )
     );
 }