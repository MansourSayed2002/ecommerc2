<?php

include "../connect.php";

$userid=fillterrequest('userid');

$data=Getdata("cartview","`cart_userid`='$userid'",false);

$pre=$connect->prepare(" SELECT SUM(cartview.discountsumprice) as discounttotalprice,
SUM(cartview.sumprice) as totalprice,
COUNT(cartview.countitems) as totalcount 
FROM cartview GROUP BY cartview.cart_userid");



 $pre->execute();

 $total=$pre->fetch(PDO::FETCH_ASSOC);

 $count=$pre->rowCount();

 if ($count>0) {
    
echo json_encode(
    array(
        "status"=>"success",
        "data"=>$data,
        "total"=>$total,
        
    )
);

 }else{

echo json_encode(
    array(
        "status"=>"failure",
    )
);

 }