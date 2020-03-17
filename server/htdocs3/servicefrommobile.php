<?php

require "init.php";

$api_url = "https://fcm.googleapis.com/fcm/send";
$server_key = "key=AAAAeYzZat4:APA91bEAaNeZHKa8nfSAdo8bQA4VOyWEJmYCCcGIPuLyix1p3MeHw0vMDPyhhcGPFEv-GXtS3gTeas8iTBQG-hi-MK3KiAuG1Dp6u7xPghFBmbTvPQIsBxRzGxw03-EY2-FSrBXNxkc5";
  
$color = "#f1c40f";

//ยังไม่ได้เช็ค Error กรณีค่าที่คีย์เข้ามาไม่มีใน database
// $id รับค่าจาก html
$id = $_POST['id'];


//$sql = "select id,token,msg,imgurl from tbl_token_imgurl where id = $id " ;
$sql = "select id,products,token,msg from qry_view1 where id = $id " ;

$result = mysqli_query($con,$sql );
$row = mysqli_fetch_row($result);

$num_rows = mysqli_num_rows ( $result );

// $title รับค่าจาก Mobile
//$title = $_POST['title'];

//ดึงค่าจาก Database
$key_token = $row[2];
$key_product = $row[1];
$key_msg = $row[3];
//$key_imgurl = $row[3];

$key_product_count = $key_product ;

 // call data from msg
 $json = "{
	\"to\" : \"$key_token\",
	\"priority\" : \"high\",
	\"collapse_key\" : \"type_a\",

	\"notification\" : {
	  \"body\"  : \"$num_rows\", 
	  \"title\" : \"$key_product_count\",
	  \"image\"  : \"$key_imgurl\",
	  \"color\" : \"$color\"
	  },

	  \"data\" : {
		\"body\"  : \"$num_rows\", 
	    \"title\" : \"$key_product_count\",
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