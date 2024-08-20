<?php


define("MB",1048576);

function fillterrequest($post){

   return htmlspecialchars(strip_tags($_POST[$post]));
   
   }


function uploadfile($dir,$uploadname){

    global $msgerror;
    
  if (isset($_FILES[$uploadname])) {
  
   $filename=round(1,4000).$_FILES[$uploadname]['name'];
    
   $filetmp=$_FILES[$uploadname]['tmp_name'];
   
   $filesize=$_FILES[$uploadname]['size'];
   
   $allawext=array('jpg','mp3','mp4','png','gif');
   
   $exttoarray=explode( ".",$filename);
   
   
   $ext=end($exttoarray);
   
   
   $ext=strtolower($ext);
   
   if(!empty($filename) && !in_array($ext,$allawext)){
      $msgerror[]="EXT";
   }
   
   if ($filesize>10 * MB) {
      $msgerror[]="size";
   }
   

   
   if (empty($msgerror)) {
      
   
   move_uploaded_file($filetmp,$dir."/".$filename);
   
   return $filename;
  } 
  else{

   return "fail";
  }
    }else{
      
     return "empty";
    }
   
    
    
    }
    





function deletefile($dir,$file_name){
    
if (file_exists($dir."/".$file_name)) {
   unlink($dir."/".$file_name);
}else{

echo "this fiel not exsist";

}

}







function dateup(){

date_default_timezone_set('Africa/Cairo');

    $datenow=date_create();
    
    $date=date_format($datenow,"Y/m/d  h:i:s A");
    
    return $date;
    
    
    
    }
    



function check_email($request){

  $email="gmail.com";
   
  $ex=explode("@",$request);
  
  $end=end($ex);

  if ($end==$email) {
   return true;
  }else{
   return false;
  }

}


function INSETDATA($table,$data,$json=true){

   global $connect;

$key=array_keys($data);
$val=array_values($data);
$columns=implode(',',$key);
$value=implode("','", $val);
$values = "'".$value."'";



$pre=$connect->prepare("INSERT INTO $table ($columns) VALUES ($values)");

$pre->execute();


$count=$pre->rowCount();

if ($json==true) {
  


   if($count>0){
   
       echo json_encode(array("status"=>"success"));
       
   }else{
   
       echo json_encode(array("status"=>"failed"));
   
   }
}

return $count;

}




function UPDATEDATA($table,$data,$where,$json=true){

   global $connect;



$keys=array_keys($data);
$values=array_values($data);
$value=implode(",",$values);
$k=implode("`=?,`",$keys);
$columns="`".$k."`=?";


$pre= $connect->prepare("UPDATE `$table` SET $columns WHERE $where");

$pre->execute(
   array(
$value
   )
);
   $count=$pre->rowCount();

   if ($json==true) {

      if($count>0){
    
         echo json_encode(
            array(
               "status"=>"success"
            )
         );
     }else{
     
         echo json_encode(
            array(
               "status"=>"failure"
            )
         );
     
     }
   }
   return $count;
 
}






function Getdata($table,$where=null,$json=true){

   global $connect;

  if ($where==null) {

   $pre= $connect->prepare("SELECT * FROM `$table`");

$pre->execute();

$data=$pre->fetchAll(PDO::FETCH_ASSOC);

$count= $pre->rowCount();

if ($json==true) {

  if($count>0){

    echo json_encode(array("status"=>"success","data"=>$data));
}else{

   echo json_encode(array("status"=>"failed"));

}
}else if($json==false){

   if ($count>0) {
      
      return $data;
}else{
    echo json_encode(array("status"=>"failed"));
   }

}

  }else{

   $pre= $connect->prepare("SELECT * FROM `$table` WHERE $where");

   $pre->execute();
   
  $data=$pre->fetchAll(PDO::FETCH_ASSOC);
   
   $count= $pre->rowCount();
   
  if ($json==true) {
  
    if ($count>0) {
      echo json_encode(
         array(
            "status"=>"success",
            "data"=>$data,
         )
         );
    }else{
      echo
      json_encode(
         array(

            "status"=>"failure",

         )
         );
    }

  }else if($json==false){

   if ($count>0) {
     
     return $data;
     
    }else{
       
      return $count;
    }

  }
   


  }
}


function sendvericode($email,$verifycode){
         $to=$email;
         $title='verifycode';
         $body='This Is Verification Code '. $verifycode;
         $header="From: support@mansoursayed.com .\n.CC:mansourmans136@gmail.com";
         mail($to,$title,$body,$header);


}






function insertnotification($title,$message,$topic,$pageid,$pagename,$userid)
{

global $connect;

$pre=$connect->prepare("INSERT INTO `notification`(`notif_title`,`notif_message`,`notif_topic`,`notif_userid`)
 VALUES('$title','$message','$topic','$userid') ");

$pre->execute();

$count=$pre->rowCount();


if ($count > 0) {

   sendGCM($title,$message,$topic,$pageid,$pagename);

}else{

   echo json_encode(
      array(
         "status"=>"failure",
      )
   );
}

};






function sendGCM($title, $message, $topic, $pageid, $pagename)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "AAAARYkvbMg:APA91bH6LFwNPql0TD3ACa_IuNSe8LPn4cz_w1VQ396JOPyIk3vGZ6rOBNfMa4MnuAVlL7EkvVAyFnJrCamx4fP4FmuaC2Ai_u8DEbB0xbvwKAPqi3MHw7F_gqQS3bVytHAF1QpvpwiD",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}