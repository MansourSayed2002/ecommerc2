<?php

include '../../connect.php';


$email=fillterrequest('email');

$verifycode=fillterrequest('verifycode');


$pre=$connect->prepare("SELECT *FROM `admin` WHERE `admin_email`=? AND `admin_verifycode`=?");
   
$pre->execute(array(
    $email,$verifycode,
));

$count=$pre->rowCount();

if($count>0){
    
$data=array(
    "admin_approve"=>1,
);

UPDATEDATA("admin",$data,"`admin_email`='$email'");
}else{

    echo json_encode(
        array(
            "status"=>"failed"
        )
    );

}