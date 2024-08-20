<?php

include "../../connect.php";

$name_en=fillterrequest('name_en');

$name_ar=fillterrequest('name_ar');

$image=uploadfile("../../Upload/categories",'image');

if ($image =="empty") {
   
$data=array(
    "c_name"=>$name_en,
    "c_name_ar"=>$name_ar,
   
);

}else{

$data=array(
    "c_name"=>$name_en,
    "c_name_ar"=>$name_ar,
    "c_image"=>$image,
);

}

INSETDATA("categores",$data);

