 <head>
  <style type="text/css">
  .my_profile_image{
      border-radius: 50%;
      cursor : hand;
  }

  .users_status_active{
    float: right;
    width: 10px;
    height: 10px;
    background-color: #16da16;
    border-radius: 50%;
    margin-right: 10px;
    margin-top: 13px;
    border: 2px solid rgba(0, 0, 0, 0.26);

  }

  .users_status_not_active{
    float: right;
    width: 10px;
    height: 10px;
    background-color: gray;
    border-radius: 50%;
    margin-right: 10px;
    margin-top: 13px;
    border: 2px solid rgba(0, 0, 0, 0.26);

  }
  </style>
 </head>

 <script type="text/javascript" src="js/js/jquery-3.1.1.min.js"></script>

<?php

$host = "localhost";
$user = "root";
$pass = "";
$database = "fyp_management_system";

$connection_String = mysqli_connect($host,$user,$pass,$database);

$command_query = "SELECT COUNT(*) AS total FROM users_online";

$execute_command_query = mysqli_query($connection_String,$command_query)or die(mysqli_error($connection_String));

$total_Users_Number = mysqli_fetch_assoc($execute_command_query);

echo "</br>";

echo "<span id='chat-logo'>"."Chat"."</span></br><hr>";

  $query_1 = "SELECT * FROM users_online WHERE status = 'online' ORDER BY ID ASC";
  $run = mysqli_query($connection_String,$query_1)or die(mysqli_error($connection_String));
  $userID = 0;
  while($row = mysqli_fetch_array($run)){
  	$userID++;
    $newusername = $row["first_name"];
    

    echo "<div>";

    echo "<ul>";

    $command_query = "SELECT * FROM student WHERE studentName = '$newusername'";

    $execute_command_query = mysqli_query($connection_String,$command_query);

    while($row = mysqli_fetch_assoc($execute_command_query)){

    if($row["studentImage"]==""){
        echo "<li class='users' id='$userID' name='$newusername'><img class='my_profile_image' src='Profile_Pictures/default.png' height='35' width='35'/>&nbsp;&nbsp;"."<strong>".$newusername."</strong><span class='users_status_active'></span></li>";
    }else{
        $username_picture = $row["studentImage"];
        echo "<li class='users' id='$userID' name='$newusername'><img class='my_profile_image' src='Profile_Pictures/$username_picture' height='35' width='35'/>&nbsp;&nbsp;"."<strong>".$newusername."</strong><span class='users_status_active'></span></li>";
    }
  }
    echo "</ul>";
    echo "</div>";
  }

  $query_2 = "SELECT * FROM users_online WHERE status = 'offline' ORDER BY ID DESC";
  $run = mysqli_query($connection_String,$query_2)or die(mysqli_error($connection_String));

  while($row = mysqli_fetch_array($run)){
    $userID++;
    $newusername = $row["first_name"];

    echo "<div>";

    echo "<ul>";

    $command_query = "SELECT * FROM student WHERE studentName = '$newusername' ";

    $execute_command_query = mysqli_query($connection_String,$command_query);

    while($row = mysqli_fetch_assoc($execute_command_query)){

    if($row["studentImage"]==""){
        echo "<li class='users' id='$userID' name='$newusername'><img class='my_profile_image' src='Profile_Pictures/default.png' height='35' width='35'/>&nbsp;&nbsp;"."<strong>".$newusername."</strong><span class='users_status_not_active'></span></li>";
    }else{
        $username_picture = $row["studentImage"];
        echo "<li class='users' id='$userID' name='$newusername'><img class='my_profile_image' src='Profile_Pictures/$username_picture' height='35' width='35'/>&nbsp;&nbsp;"."<strong>".$newusername."</strong><span class='users_status_not_active'></span></li>";
    }
  }
    echo "</ul>";
    echo "</div>";
  }

 ?>

<script type="text/javascript">
$(document).ready(function(){
$(".users").click(function(){
var idvalue = $(this).attr('id');
var userclicked = $(this).attr('name');

	$(function(){
    $.ajax({
      type: "POST",
      url: 'Chatting.php',
      data: ({userID:idvalue,
              username:userclicked
               }),
      success: function(data) {
      
      }
    });
  });

});
});
</script>
