<?php

include "../connect.php";


$id_note=fillterrequest($_POST['id_note']);

$title=fillterrequest($_POST['note_title']);

$content=fillterrequest($_POST['note_content']);

$iamge=fillterrequest($_POST['image']);

$date=dateup();


if(isset($_FILES['image'])){

    deletefile("../upload",$image);
    $image=uploadfile('image');
}


    $pre= $connect->prepare("UPDATE `notes` SET `note_title` = ? , `note_content` = ? , `date` = ? , `image` = ? WHERE `id_note` = ?");

    $pre->execute(
        array(
            $title,$content,$date,$iamge,$id_note

        )
    );
    
    
    
    $count= $pre->rowCount();
    
    if($count>0){
    
        echo json_encode(array("status"=>"success"));
    }else{
    
        echo json_encode(array("status"=>"failed"));
    
    }

  