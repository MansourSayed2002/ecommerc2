<?php  

include '../connect.php';

$orderid=fillterrequest('orderid');

//Getdata('detailsorderview',"`cart_orders`='$orderid'");

$pre=$connect->prepare("SELECT * FROM `detailsorderview` WHERE `cart_orders`='$orderid'");

$pre->execute();

$data=$pre->fetchAll(PDO::FETCH_ASSOC);

$count=$pre->rowCount();


if($count > 0){

echo json_encode(
    array(
        "status"=>"success",
        "data"=>$data,
    )
);

}else{
    
  echo  json_encode(
        array(
            "status"=>"failure",
        
        )
    );


}