<?php
$title = "FYPMS";
$subtitle = "Projects";
require_once("includes/header.php");
require_once("includes/config.php");
session_start();

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
       

                            <div class="box-body ">
                                <table class="table table-condensed ">
                                    <tr>
                                        <th>Title</th>
                                        <th>Project Material</th>
                                        <th>Uploaded <i class="fa fa-clock-o"></i></th>
                                        <th>Uploaded by</th>
                                    </tr>
                                    <?php
                                   $sql = "SELECT * FROM tbl_projects LIMIT 10";
                                   $result = $conn->query($sql);

                                   if ($result->num_rows > 0) {
                                          // output data of each row
                                        while($row = $result->fetch_assoc()) {
                                       $studentId = $row['studentid'];

                                     }
									}
                                   // delete//$groupId = filter_input(INPUT_GET,'uploads',FILTER_SANITIZE_NUMBER_INT);

                                   //good way// $sql = "SELECT * FROM group_uploads WHERE groupId = '$groupId'";
									$sql = "SELECT * FROM tbl_projects JOIN student ON tbl_projects.studentid = student.studentID LIMIT 10";

                                    $result = $conn->query($sql);

                                    if ($result->num_rows > 0) {
                                        // output data of each row
                                        while($row = $result->fetch_assoc()) { ?>
                                            <tr>
                                                <td><?php
                                                    $studentId = $row['studentid'];
                                                    $taskName = $row['title'];
                                                    echo $taskName;
                                                    ?>
                                                </td>
                                                <td><?php
                                                    $deliverableName=$row['projectfile'];
                                                    

                                                    $location = siteroot."projectFiles/"."/".$deliverableName;
                                                    echo "<a href=\"$location\">$deliverableName</a>" ;

                                                    ?></td>
                                                    <td><?php echo $row['dateadded'];?></td>
                                                    <td><?php
                                                    
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
                               
                            </div>


                        </div>
                        <!-- /.box -->
                    </div>



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