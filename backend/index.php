<?php 


include 'connect.php';



$data=array(
    "c_name"=>"name_en",
    "c_name_ar"=>"name_ar",
    "c_image"=>"imagefile",
);



$values=array_values($data);
$value=implode(",",$values);


//print_r($values);

echo $value;


