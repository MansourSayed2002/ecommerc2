<?php

include "../connect.php";

$search=fillterrequest('search');


Getdata("itemview","i_name LIKE '%$search%' OR i_name_ar LIKE '%$search%'");