<?php
//require_once("includes/config.php");
$mysql_hostname = "localhost";
$mysql_user = "root";
$mysql_password = "";
$mysql_database = "fyp_management_system";
$bd = mysql_connect($mysql_hostname, $mysql_user, $mysql_password) or die("Could not connect database");
mysql_select_db($mysql_database, $bd) or die("Could not select database");



$res = $_POST['get_sel'];
 $find=mysql_query("select * from suggested_topics where id='$res'");

//error handle using if statement to check if any row is returned
if(mysql_num_rows($find) == 0){
					echo 'No record';
				}else{
 
 while($row = mysql_fetch_array($find))
  {
	
	$sf=$row['supervisorFaculty'];
	$sfn=$row['supervisorFacultyName'];
	//$regno=$row['RegNo'];
	//$phoneno=$row['Phoneno'];
	
  }
echo $sf."-".$sfn;
								
}
 exit;

?>