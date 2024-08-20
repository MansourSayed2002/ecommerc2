<?php

include "../connect.php";


$id=fillterrequest('id');

Getdata("users","`users_id`='$id'");

?>