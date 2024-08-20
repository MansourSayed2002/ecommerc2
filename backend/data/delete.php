
<?php


include "../connect.php";



$id_note=fillterrequest($_POST['id_note']);

$file=fillterrequest($_POST['image']);


$pre=$connect->prepare('DELETE FROM `notes` WHERE `id_note`=?');

$pre->execute(
    array(
        $id_note
    )
);

$count=$pre->rowCount();


if($count>0){
    deletefile("../upload",$file);
    echo json_encode(array(
        "status"=>"success"

    ));
}else{

    echo json_encode(
        array(
            "status"=>"fail"
        )
        );
}