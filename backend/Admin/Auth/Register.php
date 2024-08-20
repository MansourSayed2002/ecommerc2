<?php

include "../../connect.php";


$email=fillterrequest('email');

$password= fillterrequest('password');


$pre= $connect->prepare("SELECT  *FROM `admin` WHERE `admin_email`=? AND `admin_password`=? ");

$pre->execute(
    array(
        $email,$password
    )
);

$data=$pre->fetch(PDO::FETCH_ASSOC);

$count= $pre->rowCount();

if($count>0){

    echo json_encode(
        array(
            "status"=>"success",
            "data"=>$data
        )
    );
}else{

    echo json_encode(
        array(
            "status"=>"failed"
        )
    );

}