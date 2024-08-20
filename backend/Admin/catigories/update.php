<?php

include "../../connect.php";

$id=fillterrequest('id');

$name_en=fillterrequest('name_en');

$name_ar=fillterrequest('name_ar');

$image=fillterrequest('image');

$imagefile=uploadfile("../../upload/categories","file");

if ($imagefile=="empty") {

$pre=$connect->prepare("UPDATE `categores` SET `c_name`=?,`c_name_ar`=? WHERE `c_id`=?");

$pre->execute(

    array(

        $name_en,$name_ar,$id

    )
);

$count= $pre->rowCount();

 
}else{

    deletefile("../../upload/categories",$image);

    $pre=$connect->prepare("UPDATE `categores` SET `c_name`=?,`c_name_ar`=?,`c_image`=? WHERE `c_id`=?");

    $pre->execute(

        array(

            $name_en,$name_ar,$imagefile,$id

        )
    );
    
    $count= $pre->rowCount();
}



if ($count > 0) {
    echo json_encode(
        array(
            "status"=>"success",
        )
    );
}else{
    echo json_encode(
        array(
            "status"=>"failure",
        )
    );
}