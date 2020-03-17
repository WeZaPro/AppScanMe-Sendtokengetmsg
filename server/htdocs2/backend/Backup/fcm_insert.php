<?php

require "init.php";

$con = mysqli_connect($host,$db_user,$db_password,$db_name);
if($con)
    echo "Connection Success...";
else
    echo "Connect error....";


$fcm_token = $_POST["fcm_token"];
$fcm_msg = $_POST["fcm_msg"];
$fcm_imgurl = $_POST["fcm_imgurl"];
//$fcm_id = $_POST["fcm_id"];

//$sql = "INSERT INTO tbl_token_imgurl (id,token,msg,imgurl) VALUES ('$fcm_id','$fcm_token','$fcm_msg','$fcm_imgurl')";
$sql = "INSERT INTO tbl_token_imgurl (token,msg,imgurl) VALUES ('$fcm_token','$fcm_msg','$fcm_imgurl')";
mysqli_query($con,$sql);
mysqli_close($con);



?>