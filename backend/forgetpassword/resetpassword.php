<?php

include '../connect.php';

$email=fillterrequest('users_email');

$password=fillterrequest('users_password');

$repassword=fillterrequest('re_users_password');

if($password==$repassword){


    $data=array
    (
    
    "users_password"=>$password,
    
    );
    
    UPDATEDATA("users",$data,"`users_email`='$email'");


}


