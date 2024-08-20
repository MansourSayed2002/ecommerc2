<?php

include '../connect.php';


$idcat=fillterrequest('idcat');

//Getdata("items","`items_cat`='$idcat'");


$userid=fillterrequest('userid');



$pre= $connect->prepare("SELECT itemview.*,1 as favorite_a , (i_price - (i_price * i_discount / 100)) as discountprice  FROM itemview 
INNER JOIN favorite ON favorite.favorite_itemsid=itemview.i_id AND favorite.favorite_userid= $userid WHERE itemview.items_cat=$idcat
UNION ALL SELECT itemview.*,0 as favorite_a, (i_price-(i_price * i_discount/100)) as discountprice  FROM itemview WHERE itemview.items_cat=$idcat AND itemview.i_id NOT IN 
(SELECT itemview.i_id FROM itemview 
INNER JOIN favorite ON favorite.favorite_itemsid=itemview.i_id AND favorite.favorite_userid=$userid ) 

");

$pre->execute(
   
);

$data=$pre->fetchAll(PDO::FETCH_ASSOC);

$count= $pre->rowCount();

if($count>0){

    echo json_encode(array("status"=>"success","data"=>$data));

}else{

    echo json_encode(array("status"=>"failed"));

}

