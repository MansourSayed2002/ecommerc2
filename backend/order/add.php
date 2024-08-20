<?php

include "../connect.php";

$userid=fillterrequest('userid');

$delivery=fillterrequest('delivery');

$paymentmethod=fillterrequest('paymentmethod');

$address=fillterrequest('address');

$price=fillterrequest('price');

$couponid=fillterrequest('couponid');

$pricedelivery=fillterrequest('pricedelivary');

$discountcoupon=fillterrequest('discountcoupon');

if ($delivery == "0") {

    $pricedelivery = 0;
}

$totalprice = $pricedelivery +($price- ($price * $discountcoupon / 100));

$now=date('Y-m-d');

//Getdata('coupon',"`coupon_name`='$coupon' AND `coupon_expiredata` > '$now' AND `coupon_count` > '0' ");


$pre= $connect->prepare("SELECT * FROM `coupon` WHERE `coupon_id`='$couponid' AND `coupon_expiredata` > '$now' AND `coupon_count` > '0'");

$pre->execute();

$count= $pre->rowCount();

if($count > 0){
    
        $pre= $connect->prepare("UPDATE `coupon` SET `coupon_count` = `coupon_count` - 1 WHERE `coupon_id`=$couponid");
        $pre->execute();
}


$data=array(
    "orders_userid" => $userid,

    "orders_delivery" => $delivery,

    "orders_paymentmethod" =>$paymentmethod,

    "orders_address"=>$address,

    "orders_price"=>$price,

    "orders_coupon"=>$couponid,

    "orders_pricedelivary"=>$pricedelivery,

    "orders_totalprice"=>$totalprice,

   

);

$count= INSETDATA('orders',$data,false);


if ($count > 0) {
   
$pre=$connect->prepare('SELECT MAX(`orders_id`) FROM `orders`');

$pre->execute();

$maxid=$pre->fetchColumn();

$data=array(
    "cart_orders"=> $maxid,
);

UPDATEDATA("cart",$data,"`cart_userid`='$userid' AND `cart_orders`='0' ");
insertnotification("Order","You have new order","Admin","none","none","$userid");

}
