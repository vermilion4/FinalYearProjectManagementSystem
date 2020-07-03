<?php
session_start();

$_SESSION['fullname'] = $_SESSION["usrnm"];


  $host = "localhost";
  $user = "root";
  $pass = "";
  $database = "fyp_management_system";

  $selected_username = $_SESSION["usrnm"];
  

  $connection_String = mysqli_connect($host,$user,$pass,$database);

  $command_query = "SELECT * FROM student WHERE studentName = '$selected_username' ";

  $execute_command_query = mysqli_query($connection_String,$command_query);

  while($row = mysqli_fetch_assoc($execute_command_query)){

    if($row["studentImage"]==""){
        echo "<img class='my_profile_pic' src='Profile_Pictures/default.png' title='Click to change profile picture'/>";
    }else{
        $picture_holder = $row["studentImage"];
        echo "<img class='my_profile_pic' src='Profile_Pictures/$picture_holder' title='Click to change profile picture'/>";
    }
  }

  mysqli_close($connection_String);


?>
