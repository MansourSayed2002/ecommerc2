<?php

$delivaryid=fillterrequest('delivaryid');

$typeactive=fillterrequest('typeactive');


$data=array(
    "delivary_active"=>$typeactive,
);

UPDATEDATA("delivary",$data,"`delivary_id`='$delivaryid'");