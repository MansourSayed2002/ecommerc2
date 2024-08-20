<?php

include '../connect.php';

$userid=fillterrequest('userid');

$addressid=fillterrequest('addressid');


$pre=$connect->prepare('DELETE FROM `address` WHERE `address_userid`=? AND `address_id`=?');

$pre->execute(
    array(
        $userid,$addressid
    )
);

$count=$pre->rowCount();


if($count>0){
   
    echo json_encode(array(
        "status"=>"success",

    ));
}else{

    echo json_encode(
        array(
            "status"=>"failure",
        )
        );
}