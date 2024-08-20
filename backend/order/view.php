<?php

include '../connect.php';

$userid=fillterrequest('userid');

Getdata("ordersaddressview","`orders_userid`='$userid'");