<?php

require "init.php";

$api_url = "https://fcm.googleapis.com/fcm/send";
$server_key = "key=AAAAeYzZat4:APA91bEAaNeZHKa8nfSAdo8bQA4VOyWEJmYCCcGIPuLyix1p3MeHw0vMDPyhhcGPFEv-GXtS3gTeas8iTBQG-hi-MK3KiAuG1Dp6u7xPghFBmbTvPQIsBxRzGxw03-EY2-FSrBXNxkc5";
  
$color = "#f1c40f";

//$sql = "select token,msg from tbl_token_msg";
// call row msg = 555
$sql = "select token,msg from tbl_token_msg where id = '1' " ;

$result = mysqli_query($con,$sql );

$row = mysqli_fetch_row($result);


$key_token = $row[0];
$key_msg = $row[1];

//ตำแหน่ง  body ดึงข้อมูลจาก column msg / row ที่ id = 1
$title = $_POST['title'];
//$body = $_POST['body'];
$image = $_POST['image'];

//if($body == "555"){
//	$body = "FIVE FIVE FIVE";
//}


 // call data from msg
$json = "{
	    \"to\" : \"$key_token\",
		\"priority\" : \"high\",
		\"collapse_key\" : \"type_a\",

	    \"notification\" : {
	      \"body\"  : \"$key_msg\", 
		  \"title\" : \"$title\",
	      \"image\"  : \"$image\",
	      \"color\" : \"$color\"
		  },

		  \"data\" : {
			\"body\"  : \"$key_msg\",
			\"title\" : \"$title\",
			\"image\"  : \"$image\",
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