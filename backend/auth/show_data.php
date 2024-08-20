<?php
include "../connect.php";


$email=fillterrequest($_POST['email']);


$pre= $connect->prepare("SELECT * FROM `users` WHERE `email`=?");

    $pre->execute(
     array(
        $email
     )
    );
    
    $date=$pre->fetch(PDO::FETCH_ASSOC);
    
    $count= $pre->rowCount();
    
    if($count>0){
    
        echo json_encode(array("status"=>"success","data"=>$date));
    }else{
    
        echo json_encode(array("status"=>"failed"));
    
    }


