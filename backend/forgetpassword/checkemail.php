<?php

include '../connect.php';

$email=fillterrequest('users_email');

$verifycode=rand(1000,9999);


$pre= $connect->prepare("SELECT  *FROM `users` WHERE `users_email`=?");


$pre->execute(
    array(
        $email,
    )
);


$count= $pre->rowCount();

if($count>0){

   
$data=array
(
    "users_verifycode"=>$verifycode,
);
UPDATEDATA("users",$data,"`users_email`='$email'");

//sendvericode($email,$verifycode);

}else{

    echo json_encode(
        array(
            "status"=>"failed"
        )
    );

}