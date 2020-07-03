<?php
$title = "FYPMS";
$subtitle = "Project Repository";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();
if (!isset($_SESSION["usrCMS"])) {
    header('Location: ' . 'index.php');
}
$studentId = $_SESSION['usrId'];

//Getting group id
$sql = "SELECT * FROM student WHERE student.studentId = '$studentId' LIMIT 1";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $groupId = $row['groupId'];

    }
}else{
    $groupId = $_SESSION["GroupID"];
}

//Get Project name
if (!is_null($groupId)){

    //Getting group id and Project Name from DATABASE
    //If groupLeader
    $sql = "SELECT * FROM student_group WHERE student_group.leaderId = '$studentId' LIMIT 1";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            $projectName = $row['projectName'];
        }
    }
    else{
        $projectName = $conn->query("SELECT projectName FROM student JOIN student_group ON student.groupId = student_group.groupId  WHERE student.studentId = '$studentId' LIMIT 1" )->fetch_object()->projectName;
    }

}


//Getting supervisor id and name
$sql = "SELECT facultyId FROM faculty_student_group WHERE faculty_student_group.groupId = '$groupId' LIMIT 1 ";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $supervisorId =  $row["facultyId"];
    }
    $sql_name = "SELECT facultyName FROM faculty WHERE faculty.facultyId = '$supervisorId' ";
    $result = $conn->query($sql_name);
            if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
            $supervisorName =  $row["facultyName"];
            }

        }
}

//Check if form is submitted by GET
if ($_SERVER['REQUEST_METHOD'] == 'GET') {


}

//Check if form is submitted by POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

}


?>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <?php require_once("includes/main-header.php"); ?>
    <?php require_once("includes/main-sidebar.php"); ?>
    <div class="content-wrapper">
        <?php require_once("includes/content-header.php"); ?>

        <section class="content" style="min-height: 700px">
            <div class="row">
                <?php
                if (!is_null($groupId)   ) { ?>

                    <div class="col-md-12">
                        <div class="box box-solid">
                            <!-- /.box-header -->
                            <div class="box-body">
                                <h3>Project Name:<?php echo $projectName?></h3>
                                <!--Supervisor Name-->
                                <h4>Supervisor:<?php
                                if (isset($supervisorName)){
                                    echo $supervisorName;
                                }else{ 
                                echo ' --- ';
                            }
                                
                                ?></h4>
                            </div>
                            <!-- /.box-body -->

                           
							<div class="box no-border">
                            <div class="box-header with-border">
                                <h3 class="box-title">Project Repository</h3>
                            </div>
                            <!-- /.box-header -->

                            <div class="box-body ">
                                <table class="table table-condensed ">
                                    <tr>
                                        <th>Title</th>
                                        <th>Project Material</th>
                                        <th>Uploaded <i class="fa fa-clock-o"></i></th>
                                        <th>Uploaded by</th>
                                    </tr>
                                    <?php
									//Getting group id
                                   $sql = "SELECT * FROM student WHERE student.studentId = '$studentId' LIMIT 1";
                                   $result = $conn->query($sql);

                                   if ($result->num_rows > 0) {
                                          // output data of each row
                                        while($row = $result->fetch_assoc()) {
                                       $groupId = $row['groupId'];

                                     }
									}
                                   // delete//$groupId = filter_input(INPUT_GET,'uploads',FILTER_SANITIZE_NUMBER_INT);

                                   //good way// $sql = "SELECT * FROM group_uploads WHERE groupId = '$groupId'";
									$sql = "SELECT * FROM tbl_projects JOIN student ON tbl_projects.studentid = student.studentID WHERE tbl_projects.studentid = '$studentId' LIMIT 10";

                                    $result = $conn->query($sql);

                                    if ($result->num_rows > 0) {
                                        // output data of each row
                                        while($row = $result->fetch_assoc()) { ?>
                                            <tr>
                                                <td><?php
                                                    $studentId = $row['studentid'];
                                                    $taskName = $conn->query("SELECT title FROM tbl_projects WHERE studentid = '$studentId' LIMIT 10")->fetch_object()->title;
                                                    echo $taskName;

                                                    ?>
                                                </td>
                                                <td><?php
                                                    $deliverableName=$row['projectfile'];
                                                    //$groupId = $row['groupId'];

                                                    //Getting batchId,batch Name from groupId
                                                   /* $batchId = $conn->query("SELECT batchId FROM student_group WHERE groupId = '$groupId' ")->fetch_object()->batchId;
                                                    $batchName = $conn->query("SELECT batchName FROM batch WHERE batchId = '$batchId' ")->fetch_object()->batchName;

                                                    $group = 'Group '.$groupId;*/

                                                    $location = siteroot."projectFiles/"."/".$deliverableName;
                                                    echo "<a href=\"$location\">$deliverableName</a>" ;

                                                    ?></td>
                                                    <td><?php echo $row['dateadded'];?></td>
                                                    <td><?php
                                                    $studentId =$row['studentId'];
                                                    //$studentName = $conn->query("SELECT studentName FROM student WHERE studentId = '$studentId' LIMIT 1")->fetch_object()->studentName;
                                                    //echo "<a href=\"studentProfile.php?id=$studentId\">$studentName</a>" ;
                                                    echo $row['studentName'];
                                                    ?>
                                                </td>
                                            </tr>

                                            <?php
                                        }
                                    }
                                    ?>
                                </table>
                            </div>
                            <!-- /.box-body -->
                        </div>
							
							
							
							
							
							
							
							
							
                            <div class="box-footer">
                                <a href="<?php echo siteroot;?>" class="btn btn-default btn-sm">Back</a>
                                <a href="addProject.php" class="btn btn-default btn-sm">Add Project</a>
                            </div>


                        </div>
                        <!-- /.box -->
                    </div>


                <?php } else if (is_null($groupId)) { ?>

                    <div class="col-md-12">
                        <div class="callout callout-info">
                            <h4>Can not show details</h4>

                            <p>You are not part of any group.Please form a group and try again</p>
                        </div>
                    </div>

                <?php
                }

                ?>


            </div>
        </section>
    </div>
    <?php
    require_once("includes/main-footer.php");
    ?>
</div>

<?php
require_once("includes/required_js.php");
?>



</body>
</html>