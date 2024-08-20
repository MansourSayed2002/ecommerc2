<?php

include "../connect.php";

$userid=fillterrequest('userid');

$itemid=fillterrequest('itemid');

$pre=$connect->prepare("DELETE  FROM `cart` WHERE 
`cart_userid`=? AND`cart_itemid`=? AND `cart_id`=
(SELECT cart.cart_id FROM `cart` WHERE `cart_userid`='$userid' AND`cart_itemid`='$itemid' LIMIT 1)");

$pre->execute(
    array(
        $userid,$itemid,
    )
);

$count=$pre->rowCount();

if ($count > 0) {
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