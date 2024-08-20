<?php

include'../connect.php';

$userid=fillterrequest('userid');

$pre=$connect->prepare("SELECT itemview.* FROM itemview
 INNER JOIN favorite ON favorite.favorite_userid=? AND favorite.favorite_itemsid=itemview.i_id"
 );

 $pre->execute(
    array(
        $userid,
    )
 );

 $data=$pre->fetchAll(PDO::FETCH_ASSOC);

 $count=$pre->rowCount();

 if($count >0){


echo json_encode(
    array(
        "status"=>"success",
        "data"=>$data,
    )
);

 }else{

echo json_encode(
    array(
        "status"=>"failure",
    )
);


 }
