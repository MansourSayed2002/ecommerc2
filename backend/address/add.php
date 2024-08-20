<?php

include '../connect.php';

$userid=fillterrequest('userid');

$country=fillterrequest('country');

$city=fillterrequest('city');

$street=fillterrequest('street');

$lat=fillterrequest('lat');

$long=fillterrequest('long');

$pricedelivary=fillterrequest('pricedelivary');

$data=array(
    "address_userid"=>$userid,
    "address_country"=>$country,
    "address_city"=>$city,
    "address_street"=>$street,
    "address_long"=>$long,
    "address_lat"=>$lat,
    "address_pricedelivary"=>$pricedelivary,
);

INSETDATA('address',$data);