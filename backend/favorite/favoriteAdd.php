<?php

include'../connect.php';

$userid=fillterrequest('userid');

$itemid=fillterrequest('itemid');

$data=array(

"favorite_userid"=>$userid,

"favorite_itemsid"=>$itemid,
);


INSETDATA('favorite',$data);