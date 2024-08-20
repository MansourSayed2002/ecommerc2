<?php

include '../../connect.php';

$orderid=fillterrequest('orderid');

$userid=fillterrequest('userid');


$data=array(
    "orders_status"=>1,
);

UPDATEDATA("orders",$data,"`orders_id`='$orderid' AND `orders_status` = '0' ");

insertnotification('Order',"Your order approve it","user$userid","none","pagename","$userid");

