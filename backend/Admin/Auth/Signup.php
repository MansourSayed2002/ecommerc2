<?php

include "../../connect.php";


$name= fillterrequest('name');

$email=fillterrequest('email');

$password= fillterrequest('password');

$verfiycode=rand(1000,9999);


   

$pre=$connect->prepare("SELECT *FROM `admin` WHERE `admin_email`=?");
   
$pre->execute(array(
    $email
));

$count=$pre->rowCount();

if ($count>0) {
    echo json_encode(
        array(
            "status"=>"failure",
            "message"=>"THE EMAIL IS A available",
        )
        );
    }else{
      

$data=array(
    "admin_name"=>$name,
    "admin_email"=>$email,
    "admin_password"=>$password,
    "admin_verifycode"=>$verfiycode,

);
//sendvericode($email,$verfiycode);
INSETDATA("admin",$data);

    }






