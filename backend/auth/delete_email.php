<?php

include "../connect.php";


$idusers=fillterrequest($_POST['id']);




$pre= $connect->prepare("DELETE FROM `users` WHERE `id`=?");

$pre->execute(
    array(
        $idusers
    )
);



$count= $pre->rowCount();

if($count>0){

    echo json_encode(array("status"=>"success"));
}else{

    echo json_encode(array("status"=>"failed"));

}