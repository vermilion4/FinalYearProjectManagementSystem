<?php
// require_once("includes/header.php");
require_once("includes/config.php");

$clicked_on_username = $_COOKIE["default_clicked_on_username"];




  $host = "localhost";
  $user = "root";
  $pass = "";
  $database = "fyp_management_system";

  $connection_String = mysqli_connect($host,$user,$pass,$database);

  $get_user_profile_command = "SELECT * FROM student WHERE studentName='$clicked_on_username' LIMIT 1";
  $execute_get_profile_command = mysqli_query($connection_String,$get_user_profile_command);
  $get_individual_files = mysqli_fetch_assoc($execute_get_profile_command);


  $profile_user_first_name  =  $get_individual_files["studentName"];

  $profile_user_email  =  $get_individual_files["studentEmail"];
  
  $profile_user_profile_pic =  $get_individual_files["studentImage"];

    echo "<div id='my_profile_holder'>";
    if( $profile_user_profile_pic == "" ){
        echo "<img class='user_picture' src='Profile_Pictures/default.png'/>";
    }else{
        echo "<img class='user_picture' src='Profile_Pictures/$profile_user_profile_pic'/>";
    }
    echo "</div>";

    echo "<div id='details_holder'>";


    echo "<span><strong class='heading-style'>Email </strong>: <br><span class='word-styling'>".$profile_user_email."</span></span><br>";

   


    echo "</div>";

 ?>
