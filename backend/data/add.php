<?php

include "../connect.php";


$id_user=fillterrequest($_POST['id']);

$tilte=fillterrequest($_POST['note_title']);

$content=fillterrequest($_POST['note_content']);


$image=uploadfile('image');

$date=dateup();


if ($image!="fail") {

   

    $pre= $connect->prepare("INSERT INTO `notes`(`id_user` ,`note_title`, `note_content`,`date`,`image`) VALUES (?,?,?,?,? )");

    $pre->execute(
         array(
          $id_user,$tilte,$content,$date,$image
         )
    );
    
    
    
    $count= $pre->rowCount();
    
    if($count>0){
    
        echo json_encode(array("status"=>"success"));
    }else{
    
        echo json_encode(array("status"=>"failed"));
    
    }
}else{
    
    echo json_encode(array("status"=>"fail image"));


}