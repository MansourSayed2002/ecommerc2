<?php

include '../connect.php';

$userid=fillterrequest('userid');

$country=fillterrequest('country');

$city=fillterrequest('city');

$street=fillterrequest('street');

$lat=fillterrequest('lat');

$long=fillterrequest('long');

$data=array(

    "address_country"=>$country,
    "address_city"=>$city,
    "address_street"=>$street,
    "address_long"=>$long,
    "address_lat"=>$lat,
);

UPDATEDATA('address',$data,"`address_userid`='$userid'");