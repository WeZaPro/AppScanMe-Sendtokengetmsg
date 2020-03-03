<?php
// test MyTestNoti
require "init.php";

$api_url = "https://fcm.googleapis.com/fcm/send";
$server_key = "key=AAAAeYzZat4:APA91bEAaNeZHKa8nfSAdo8bQA4VOyWEJmYCCcGIPuLyix1p3MeHw0vMDPyhhcGPFEv-GXtS3gTeas8iTBQG-hi-MK3KiAuG1Dp6u7xPghFBmbTvPQIsBxRzGxw03-EY2-FSrBXNxkc5";
 
//$token_target ="cXY0QVrCQP6pXSXJ0giyzf:APA91bE145Y2VyP4PnlxlnJpHhtSoo4Yj4fFxTDjguAxrAeIv7Lu7e-kjMD_19u1j36KAVRO_yY7ozxitBnCT9FI65Ugz3yr-xRJi37O1mvOmtdFZnYhEb2EBVZTCOsyoi8cQ95txs3f";
 
$color = "#f1c40f";

//$sql = "select token from tokentosenddata";

$sql = "select token from tokentosenddata";
$sql_a = "select msg from tokentosenddata";

$result = mysqli_query($con,$sql );
$result_a = mysqli_query($con,$sql_a );

$row = mysqli_fetch_row($result);
$row_a = mysqli_fetch_row($result_a);

$key_token = $row[0];
$msg_show = $row_a[0];

//manual token
//$key_token="fFj9GHElQfSjXluAGPCGoh:APA91bE-kgnS8nr77JuzELYvCfTH1-D50IKrbkANfBPVsAYuR_-Ybq3_u6Xix1ZZNcmn8riOvagAr_6keJtOB9BO8zJgbx1o4XYWg3M6FzeNym0G-LOsFcZHxhflKe6z0NdKBs_aWBFK";

$temp_msg;

if($msg_show == "555"){
	$temp_msg = "FIVE FIVE FIVE";
}else{
	$temp_msg = $msg_show ;
}


//$title ="ขอให้พลังสถิตกับเจ้า";
//$body = "และสถิตย์กับเจ้าด้วย";

//$body= $_POST["message"];
//$body = $msg_show;
$title = $_POST['title'];
$image = $_POST['image'];


// ทดสอบใส่เงื่อนไข
//	if($body == "1"){
//		$sampleCondition = "Hello word";
//	}else{
//		$sampleCondition = $body;
//	}

//if($msg_show == "555"){
//	$sampleCondition = "Hello word";
//	}else{
//		$sampleCondition = $body;
//}
 
$json = "{
	    \"to\" : \"$key_token\",
		\"priority\" : \"high\",
		\"collapse_key\" : \"type_a\",

	    \"notification\" : {
	      \"body\"  : \"$temp_msg\",
		  \"title\" : \"$title\",
	      \"image\"  : \"$image\",
	      \"color\" : \"$color\"
		  },

		  \"data\" : {
			\"body\"  : \"$temp_msg\",
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