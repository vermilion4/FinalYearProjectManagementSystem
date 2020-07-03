<?php
 require_once("includes/header.php");
// require_once("includes/config.php");
session_start();

$_SESSION['fullname'] = $_SESSION["usrnm"];
?>
<head>
<style type="text/css">

.sender,.receiver{
	background-color: #d8d4d4;
	width: 70%;
	margin-top: 2px;
	margin-bottom: 2px;
}

.receiver{
	float: left;
	text-align: left;
	margin-left: 15px;
}

.sender{
	float:right;
	text-align: right;

}


div[class="shape_receiver"]{
	background-color: white;
	padding: 5px 10px 5px 10px;
	border-radius: 0px 20px 20px 20px;
}

div[class="shape_sender"]{
	background-color: rgba(69, 162, 255, 0.93);
	padding: 0px 10px 5px 10px;
	border-radius: 20px 3px 20px 20px;
}

span[class="original_sender"]{
	color: white;
	display: inline-block;
	text-align: right;
}

span[class="original_receiver"]{
	color: gray;
	display: inline-block;
	text-align: left;
}

.general_profile_sender{
	border-radius: 50%;
	position: relative;

}

.general_profile_receiver{
	border-radius: 50%;
	margin-right: 4px;
}

</style>
</head>

<?php

  $host = "localhost";
  $user = "root";
  $password = "";
  $database = "fyp_management_system";

  $connection_String = mysqli_connect($host,$user,$password,$database);

	$users_last_name = $_SESSION["usrnm"];

  require "includes/config.php";
  $query = "SELECT * FROM public_messages ORDER BY Msg_ID ASC";
  $run = $conn->query($query);
  while($row = $run->fetch_array()) :

    $username = $row["Sender"];
  	$profile_pic_query = "SELECT * FROM student WHERE studentName = '$username'";
  	$execute_command_query = mysqli_query($connection_String,$profile_pic_query);
    $get_profile = mysqli_fetch_assoc($execute_command_query);

  if($row["Sender"]==$_SESSION["usrnm"]){
    if($get_profile["studentImage"]==""){
       echo "<div class='sender'><span class='original_sender'><div class='shape_sender'>".$row["Message"]."</div></span><img class='general_profile_sender' src='Profile_Pictures/default.png' height='35' width='35' title='".$row["Sender"]."'/></div>";
    }else{
        $username_picture = $get_profile["studentImage"];
        echo "<div class='sender'><span class='original_sender'><div class='shape_sender'>".$row["Message"]."</div></span><img class='general_profile_sender' src='Profile_Pictures/$username_picture' height='35' width='35' title='".$row["Sender"]."'/></div>";
    }

 }else{

 	if($get_profile["studentImage"]==""){
       echo "<div class='receiver'><img class='general_profile_receiver' src='Profile_Pictures/default.png' height='35' width='35' title='".$row["Sender"]."'/><span class='original_receiver'><div class='shape_receiver'>".$row["Message"]."</div></span></div>";
        setcookie("last_username",$row["Sender"],time() + (86400 * 30));
				echo "<script>$('#get_chat_logs').stop().animate({scrollTop:$('#get_chat_logs')[0].scrollHeight},800);</script>";
    }else{
        $username_picture = $get_profile["studentImage"];
        echo "<div class='receiver'><img class='general_profile_receiver' src='Profile_Pictures/$username_picture' height='35' width='35' title='".$row["Sender"]."'/><span class='original_receiver'><div class='shape_receiver'>".$row["Message"]."</div></span></div>";
        setcookie("last_username",$row["Sender"],time() + (86400 * 30));
				echo "<script>$('#get_chat_logs').stop().animate({scrollTop:$('#get_chat_logs')[0].scrollHeight},800);</script>";

    }

 }

 endwhile; ?>
