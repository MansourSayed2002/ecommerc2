<?php

include "../connect.php";


$name= fillterrequest('users_name');

$email=fillterrequest('users_email');

$password= fillterrequest('users_password');

$verfiycode=rand(1000,9999);


   

$pre=$connect->prepare("SELECT *FROM `users` WHERE `users_email`=?");
   
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
    "users_name"=>$name,
    "users_email"=>$email,
    "users_password"=>$password,
    "users_verifycode"=>$verfiycode,

);
//sendvericode($email,$verfiycode);
INSETDATA("users",$data);

    }






