<?php
include "../connect.php";

$alldata=array();



$alldata['status']='success';

$alldata['catigories']=Getdata('categores',null,false);

$alldata['status']='success';

$alldata['items']=Getdata('items',"`i_discount`!=0",false);


echo json_encode($alldata);
