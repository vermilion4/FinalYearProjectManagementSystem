<header class="main-header">
<a href=<?php echo siteroot?> class="logo">
  <!-- mini logo for sidebar mini 50x50 pixels -->
  <span class="logo-mini"><b>FYP</b></span>
  <!-- logo for regular state and mobile devices -->
  <span class="logo-lg"><b>FYP</b><small>Management System</small></span>
</a>
<!-- Header Navbar: style can be found in header.less -->
<nav class="navbar navbar-static-top" role="navigation">
  <!-- Sidebar toggle button-->
  <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
    <span class="sr-only">Toggle navigation</span>
  </a>

 

  <div class="navbar-custom-menu">
    <ul class="nav navbar-nav">



        <?php

        //Student
        if(isset ($_SESSION["usrCMS"]) ){
            require_once ('requests-student.php');
            require_once ('dropdownStudentTasks.php');
        }
        //Supervisor
       if (isset ($_SESSION["facultyId"]) ){
            require_once ('requests-faculty.php');
        }
         //Coordinator

        ?>


      <!-- Tasks: style can be found in dropdown.less -->

      <!-- Notifications: style can be found in dropdown.less -->
<!--      --><?php //require_once ('notifications.php');?>
      <!-- Tasks: style can be found in dropdown.less -->

      

      <!-- User Account: style can be found in dropdown.less -->
      <li class="dropdown user user-menu">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          <img src="<?php if (isset($_SESSION['image'])){
                 echo 'public/profile_images/'.$_SESSION['image'];
             }else {echo 'public/profile_images/dummy.png';}?>" class="user-image" alt="User Image">
          <span class="hidden-xs"><?php echo $_SESSION["usrnm"]; ?></span>
        </a>
        <ul class="dropdown-menu">
          <!-- User image -->
          <li class="user-header">
            <img src="<?php if (isset($_SESSION['image'])){
                 echo 'public/profile_images/'.$_SESSION['image'];
             }else {echo 'public/profile_images/dummy.png';}?>"
             class="img-circle" alt="User Image">
            <p>
                <!--if student then show its CMS if other show its designation-->
              <?php echo $_SESSION["usrnm"]; ?>
                <small>[
                    <?php 
                    if(isset ($_SESSION["usrCMS"]) ){
                        echo $_SESSION["usrCMS"];
                    }
                    else if(isset ($_SESSION["design"]) ){
                            echo $_SESSION["design"];
                    }
                    else{
                            echo "";
                    }
	
                    ?>
                    ]</small>
            </p>
          </li>
          <!-- Menu Body -->
 <!--         <li class="user-body">
            <div class="row">
              <div class="col-xs-4 text-center">

                  <a href="#" >Profile</a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#">Settings</a>
              </div>
              <div class="col-xs-4 text-center">
                <a href="#">Groups</a>
              </div>
            </div> -->
            <!-- /.row -->
          </li>
          <!-- Menu Footer-->
          <li class="user-footer">
            <div class="pull-left">
                <?php
                //Check type of user

                //Student
                if(isset ($_SESSION["usrCMS"]) ){ ?>
                    <a href="studentProfile.php" class="btn btn-default btn-flat">Profile</a>
                    <?php
                }
                //Faculty
                else if(isset ($_SESSION["facultyId"]) ){ ?>
                    <a href="facultyProfile.php" class="btn btn-default btn-flat">Profile</a>
                    <?php
                }
                //Other users
                else { ?>
                    <button class="btn btn-default btn-flat" disabled>Profile</button>
                    <?php
                }


                ?>

            </div>
            <div class="pull-right">
            <form id="signout" action="home.php" method="post">
                    <a href="signout.php"  class="btn btn-default btn-flat">Sign out</a>
                    <input type="hidden" name="signout" value="signout"/>
            </form>

            </div>
          </li>
        </ul>
      </li>

    </ul>
  </div>
</nav>
</header>
