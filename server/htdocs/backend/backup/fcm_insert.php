<?php

require "init.php";

$con = mysqli_connect($host,$db_user,$db_password,$db_name);
if($con)
    echo "Connection Success...";
else
    echo "Connect error....";


$fcm_token = $_POST["fcm_token"];
$fcm_msg = $_POST["fcm_msg"];
$fcm_id = $_POST["fcm_id"];

$sql = "INSERT INTO tbl_token_msg (id,token,msg) VALUES ('$fcm_id','$fcm_token','$fcm_msg')";
//$sql = "INSERT INTO fcm_info (fcm_token) VALUES ('TEST')";
mysqli_query($con,$sql);
mysqli_close($con);



?>