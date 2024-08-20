<?php


include "../../connect.php";


$idcategories=fillterrequest('idcategories');

$pre=$connect->prepare("DELETE FROM `categores` WHERE `c_id`=$idcategories");

$pre->execute();

$count=$pre->rowCount();

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