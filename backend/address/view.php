<?php

include '../connect.php';

$userid=fillterrequest('userid');



Getdata('address',"`address_userid`='$userid'");