<?php

include '../../connect.php';

$orderid=fillterrequest('orderid');

$delivaryid=fillterrequest('delivaryid');


$data=array(
    "orders_status"=>2,
);

UPDATEDATA("orders",$data,"`orders_id`='$orderid' AND `orders_status` = '1' ");

insertnotification('Order',"You have new order","delivary$delivaryid","none","pagename","$delivaryid");