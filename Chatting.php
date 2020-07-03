<?php
require_once("includes/config.php");
session_start();

$_SESSION['fullname'] = $_SESSION["usrnm"];

$selectedID = $_POST["userID"];
$selectedUsername = $_POST['username'];


$selected_Username_Table = $_SESSION["usrnm"]."_".$selectedUsername;
$reversed_selected_Username_Table = $selectedUsername."_".$_SESSION["usrnm"];

$selected_Username_Table_uploads = $_SESSION["usrnm"]."_".$selectedUsername."_uploads";
$reversed_selected_Username_Table_uploads = $selectedUsername."_".$_SESSION["usrnm"]."_uploads";



setcookie("default_clicked_on_username",$selectedUsername,time() + (86400 * 30));
setcookie("Selected_Username_Table",$selected_Username_Table,time() + (86400 * 30));
setcookie("Reversed_selected_Username_Table",$reversed_selected_Username_Table,time() + (86400 * 30));

setcookie("selected_Username_Table_uploads",$selected_Username_Table_uploads,time() + (86400 * 30));
setcookie("reversed_selected_Username_Table_uploads",$reversed_selected_Username_Table_uploads,time() + (86400 * 30));
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

require "includes/config.php";
  $query = "SELECT * FROM correcttable ORDER BY ID";
  $run = $conn->query($query);
  while($row = $run->fetch_array()) :

    $username = $row["Usernames"];
  	$profile_pic_query = "SELECT * FROM student WHERE studentName = '$username'";
  	$execute_command_query = mysqli_query($connection_String,$profile_pic_query);
    $get_profile = mysqli_fetch_assoc($execute_command_query);

  if($row["Usernames"]==$_SESSION["usrnm"]){
    if($get_profile["studentImage"]==""){
       echo "<div class='sender'><span class='original_sender'><div class='shape_sender'>".$row["Messages"]."</div></span><img class='general_profile_sender' src='Profile_Pictures/default.png' height='35' width='35' title='".$row["Usernames"]."'/></div>";
    }else{
        $username_picture = $get_profile["studentImage"];
        echo "<div class='sender'><span class='original_sender'><div class='shape_sender'>".$row["Messages"]."</div></span><img class='general_profile_sender' src='Profile_Pictures/$username_picture' height='35' width='35' title='".$row["Usernames"]."'/></div>";
    }

 }else{

 	if($get_profile["studentImage"]==""){
       echo "<div class='receiver'><img class='general_profile_receiver' src='Profile_Pictures/default.png' height='35' width='35' title='".$row["Usernames"]."'/><span class='original_receiver'><div class='shape_receiver'>".$row["Messages"]."</div></span></div>";
        setcookie("last_username",$row["Usernames"],time() + (86400 * 30));
				echo "<script>$('#get_chat_logs').stop().animate({scrollTop:$('#get_chat_logs')[0].scrollHeight},800);</script>";
    }else{
        $username_picture = $get_profile["studentImage"];
        echo "<div class='receiver'><img class='general_profile_receiver' src='Profile_Pictures/$username_picture' height='35' width='35' title='".$row["Usernames"]."'/><span class='original_receiver'><div class='shape_receiver'>".$row["Messages"]."</div></span></div>";
        setcookie("last_username",$row["Usernames"],time() + (86400 * 30));
				echo "<script>$('#get_chat_logs').stop().animate({scrollTop:$('#get_chat_logs')[0].scrollHeight},800);</script>";

    }

 }

 endwhile; 

 $host = "localhost";
  $user = "root";
  $password = "";
  $database = "fyp_management_system";


$connection_String = mysqli_connect($host,$user,$password,$database);

$execute_command_query = mysqli_query($connection_String,$command_query);

$check_table_existence = mysqli_num_rows($execute_command_query);

$execute_command_query_uploads = mysqli_query($connection_String,$command_query_uploads);

$check_uploads_table_existence = mysqli_num_rows($execute_command_query_uploads);

if($check_table_existence>0){

	include "Chat_Log.php";

}else{

	$create_table_query = "CREATE TABLE $selected_Username_Table(ID INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, Messages LONGTEXT NOT NULL, Time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, Usernames VARCHAR(50) NOT NULL)";

	$execute_create_table_query = mysqli_query($connection_String,$create_table_query)or die(mysqli_error($connection_String));

	if($execute_create_table_query){

		include "Chat_Log.php";
	}
}


if($check_uploads_table_existence>0){

	include "Chat_Log.php";

}else{

	$create_uploads_table_query = "CREATE TABLE $selected_Username_Table_uploads(ID INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, File VARCHAR(100) NOT NULL, Type  VARCHAR(10) NOT NULL, Size INT(11) NOT NULL)";

	$execute_create_uploads_table_query = mysqli_query($connection_String,$create_uploads_table_query)or die(mysqli_error($connection_String));

	if($execute_create_uploads_table_query){

		include "Chat_Log.php";
	}
}



?>
