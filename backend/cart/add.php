<?php

include "../connect.php";

$userid=fillterrequest('userid');

$itemid=fillterrequest('itemid');

$counter=fillterrequest('counter');

if ($counter=='0') {

    $pre=$connect->prepare("INSERT INTO `cart`
    (`cart_userid`,`cart_itemid`) VALUES (?,?)");
    
    $pre->execute(
        array(
            $userid,$itemid,
        )
    );
}else{

for ($i=1; $i <=$counter ; $i++) { 
   
$pre=$connect->prepare("INSERT INTO `cart`
(`cart_userid`,`cart_itemid`) VALUES (?,?)");

$pre->execute(
    array(
        $userid,$itemid,
    )
);
}

}





$count=$pre->rowCount();

if($count > 0){

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