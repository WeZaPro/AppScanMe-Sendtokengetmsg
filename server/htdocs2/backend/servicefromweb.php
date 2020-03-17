<?php

require "init.php";

$api_url = "https://fcm.googleapis.com/fcm/send";
$server_key = "key=AAAAeYzZat4:APA91bEAaNeZHKa8nfSAdo8bQA4VOyWEJmYCCcGIPuLyix1p3MeHw0vMDPyhhcGPFEv-GXtS3gTeas8iTBQG-hi-MK3KiAuG1Dp6u7xPghFBmbTvPQIsBxRzGxw03-EY2-FSrBXNxkc5";
  
$color = "#f1c40f";

//ยังไม่ได้เช็ค Error กรณีค่าที่คีย์เข้ามาไม่มีใน database
// $id รับค่าจาก html
$id = $_POST['id'];

$sql = "select id,token,msg,imgurl from tbl_token_imgurl where id = $id " ;

$result = mysqli_query($con,$sql );

$row = mysqli_fetch_row($result);

// $title รับค่าจาก html
$title = $_POST['title'];

//ดึงค่าจาก Database
$key_token = $row[1];
$key_msg = $row[2];
$key_imgurl = $row[3];

 // call data from msg
 $json = "{
	\"to\" : \"$key_token\",
	\"priority\" : \"high\",
	\"collapse_key\" : \"type_a\",

	\"notification\" : {
	  \"body\"  : \"$key_msg\", 
	  \"title\" : \"$title\",
	  \"image\"  : \"$key_imgurl\",
	  \"color\" : \"$color\"
	  },

	  \"data\" : {
		\"body\"  : \"$key_msg\",
		\"title\" : \"$title\",
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
 
?>