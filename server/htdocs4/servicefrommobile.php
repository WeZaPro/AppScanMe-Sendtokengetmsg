<?php

require "init.php";

$api_url = "https://fcm.googleapis.com/fcm/send";
$server_key = "key=AAAAeYzZat4:APA91bEAaNeZHKa8nfSAdo8bQA4VOyWEJmYCCcGIPuLyix1p3MeHw0vMDPyhhcGPFEv-GXtS3gTeas8iTBQG-hi-MK3KiAuG1Dp6u7xPghFBmbTvPQIsBxRzGxw03-EY2-FSrBXNxkc5";
  
$color = "#f1c40f";

// insert data
$fcm_tokens = $_POST["fcm_token"];
$fcm_msgs = $_POST["fcm_msg"];
$fcm_pid = $_POST["fcm_id"];
$sql = "INSERT INTO tbl_token_imgurl (id,token,msg) VALUES ('$fcm_pid','$fcm_tokens','$fcm_msgs')";
mysqli_query($con,$sql);
//mysqli_close($con);


//$sql = "select id,token,msg,imgurl from tbl_token_imgurl where id = $id " ;
$sql = "select id,products,token,msg,imag_url from qry_view2 where id = '$fcm_pid' " ;
//$sql = "select id,products,token,msg,imag_url,count(0) AS `COUNT(*)` from qry_view2 where id = '$fcm_pid'" ;

$result = mysqli_query($con,$sql );
$row = mysqli_fetch_row($result);

// error คนละเครื่องเรียกซ้ำ Count นับผิด

$num_rows = mysqli_num_rows ( $result );

//ดึงค่าจาก Database
$key_product = $row[1];
$key_token = $row[2];
$key_msg = $row[3];
$key_imgurl = $row[4];

 // call data from msg
 // token ต้องใช้จาก ค่าที่รับเข้ามาจากเครื่อง เพราะจะได้ส่งกลับไปที่เครื่องนั้น
 $json = "{
	\"to\" : \"$fcm_tokens\",
	\"priority\" : \"high\",
	\"collapse_key\" : \"type_a\",

	\"notification\" : {
	  \"body\"  : \"$num_rows\", 
	  \"title\" : \"$key_product\",
	  \"image\"  : \"$key_imgurl\",
	  \"color\" : \"$color\"
	  },

	  \"data\" : {
		\"body\"  : \"$num_rows\", 
	    \"title\" : \"$key_product\",
		\"image\"  : \"$key_imgurl\",
		\"color\" : \"$color\"
		}
}";
 
$context = stream_context_create(array(
    'http' => array(
        'method' => "POST",
        'header' => "Authorization: ".$server_key."\r\n".
                    "Content-Type: application/json\r\n",
        'content' => "$json"
    )
));
 
$response = file_get_contents($api_url, FALSE, $context);
 
if($response === FALSE){
    die('Error');
}else{
    echo $response;
}

// test ใส่
mysqli_close($con);
 
?>