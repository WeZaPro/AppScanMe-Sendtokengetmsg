<?php

$host = "localhost";
$db_user= "root";
$db_password = "";
$db_name = "gettokentosendmsg";

$con = mysqli_connect($host,$db_user,$db_password,$db_name);
if($con)
    echo "Connection Success...";
else
    echo "Connect error....";




?>