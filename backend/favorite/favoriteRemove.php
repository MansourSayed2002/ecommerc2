<?php

include'../connect.php';

$userid=fillterrequest('userid');

$itemid=fillterrequest('itemid');

$data=array(

"favorite_userid"=>$userid,

"favorite_itemsid"=>$itemid,
);


$pre=$connect->prepare("DELETE FROM `favorite` WHERE `favorite_userid`=? AND `favorite_itemsid`=?");

$pre->execute(
    array(
        $userid,$itemid
    )
);

$count=$pre->rowCount();


if($count>0){

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