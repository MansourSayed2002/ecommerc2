<?php

include '../connect.php';


$email=fillterrequest('users_email');

$verifycode=fillterrequest('users_verifycode');


$pre=$connect->prepare("SELECT *FROM `users` WHERE `users_email`=? AND `users_verifycode`=?");
   
$pre->execute(array(
    $email,$verifycode,
));

$count=$pre->rowCount();

if($count>0){
    
$data=array(
    "users_aprove"=>1,
);

UPDATEDATA("users",$data,"`users_email`='$email'");
}else{

    echo json_encode(
        array(
            "status"=>"failed"
        )
    );

}