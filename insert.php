<?php
//require_once("includes/config.php");
$mysql_hostname = "localhost";
$mysql_user = "root";
$mysql_password = "";
$mysql_database = "fyp_management_system";
$bd = mysql_connect($mysql_hostname, $mysql_user, $mysql_password) or die("Could not connect database");
mysql_select_db($mysql_database, $bd) or die("Could not select database");



 $cms = $_POST['cms'];
            $name =  $_POST['name'];
            $gender =  $_POST['gender'];
            $email =  $_POST['email'];
            $contact =  $_POST['contact'];
            $batchId =  $_POST['batch'];
 $password = $_POST['password'];
 $isActive = 1;
 
 
 //get selected project name
 $projectName =  $_POST['pname'];
 
 //get id of the suggested topic select tag
 $projectId =  $_POST['st'];
 
 //get id of the supervisor
 $facultyId =  $_POST['sid'];        




mysql_query("INSERT INTO student (studentName, studentCMS, studentEmail, studentPhoneNo, studentGender, studentPassword, batchId, isActive)
VALUES ('$name', '$cms', '$email', '$contact', '$gender', '$password', '$batchId', '$isActive')"); 

$studentId = mysql_insert_id();

mysql_query("INSERT INTO student_group (projectName, batchId, leaderId) VALUES ('$projectName', '$batchId', '$studentId')");

$groupId = mysql_insert_id(); 

mysql_query("UPDATE student SET groupId='$groupId' , isLeader = '1' WHERE studentId = '$studentId'");


// insert/assign supervisor
mysql_query("INSERT INTO faculty_student_group (groupId, facultyId) VALUES ('$groupId', '$facultyId')");


mysql_query("UPDATE suggested_topics SET assigned='1' WHERE id = '$projectId'");

echo '<script language="javascript" type="text/javascript"> alert("Registration Succesfull!!");</script>';
echo '<script language="javascript" type="text/javascript"> window.location="index.php";</script>';
?>