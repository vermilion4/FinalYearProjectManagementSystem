<?php
require_once("includes/header.php");
require_once("includes/config.php");
?>

<?php
//php section for getting area interest and suggested topics

  $db = new mysqli('localhost','root','','fyp_management_system');
  
  $query = "SELECT id,name FROM area_interest";
  $result = $db->query($query);

  while($row = $result->fetch_assoc()){
    $ais[] = array("id" => $row['id'], "val" => $row['name']);
  }

  $query = "SELECT id, aid, name FROM suggested_topics where assigned = 0";
  $result = $db->query($query);

  while($row = $result->fetch_assoc()){
    $st[$row['aid']][] = array("id" => $row['id'], "val" => $row['name']);
  }

//convert origins and destination gotten to JSON format
  $Ais = json_encode($ais);
  $St = json_encode($st);


?>




<title>Register | FYP Management System</title>

<script type='text/javascript'>
      <?php

//receive and store JSON formatted origins and destination gotten above
        echo "var ais = $Ais; \n";
        echo "var st = $St; \n";
      ?>

     
function loadais(){
        var select = document.getElementById("ai");
        select.onchange = updatest;
        for(var i = 0; i < ais.length; i++){
          select.options[i] = new Option(ais[i].val,ais[i].id);          
        }
		
      }
	  
	 //update suggested topics      
function updatest(){
        var AiSelect = this;
        var aiid = this.value;
        var stSelect = document.getElementById("st");
        stSelect.options.length = 0; //delete all options if any present
		
        for(var i = 0; i < st[aiid].length; i++){
          stSelect.options[i] = new Option(st[aiid][i].val,st[aiid][i].id);
        }
		
		 var sele = document.getElementById("st");
		 var b = sele.options[sele.selectedIndex].value;
		
		//get projectName i.e selected text
		var a = sele.options[sele.selectedIndex].text;
		document.getElementById("pname").value=a;
		
		//get supervisors name and ID 
		  $.ajax({
           type: 'post',
           url: 'getsupervisor.php',
           data: {
            get_sel:b
           },
          success: function (response) {
		  var res = response.split("-");
		    document.getElementById("sid").value=res[0];
            document.getElementById("sname").value=res[1]; 
           }
          });
		
		
      }
	  
	  
function setSupervisor(sel)
	{

     var sel = sel.options[sel.selectedIndex].value; 
          
	//get projectName i.e selected text
	var sele = document.getElementById("st");
	var a = sele.options[sele.selectedIndex].text;
	document.getElementById("pname").value=a;  

     //get supervisor
	  $.ajax({
           type: 'post',
           url: 'getsupervisor.php',
           data: {
            get_sel:sel
           },
          success: function (response) {
		  var res = response.split("-");
		    document.getElementById("sid").value=res[0];
            document.getElementById("sname").value=res[1]; 
           }
          });


	}
</script>
</head>

<body class="hold-transition login-page" onload='loadais()'>

<section>
<div class="login-logo">
    <a href="<?php echo siteroot;?>"><img src="./img/logo_type.png" alt="fyp_logo" width="360" length="52"></a>
  </div>
<div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                    <!--Code for register student starts here-->
                    <div class="register-box-body">

                        <div class="box-header">
                            <h4 class="text-center ">Register Here</h4>
                        </div>

                        <form id="registerStudent" name="registerStudent" action="insert.php" method="post" data-toggle="validator">

                            <div class="form-group has-feedback">
                                <input type="number" min="000001" max="99999" name="cms" class="form-control" placeholder="Enter regno" required/>
                                <span class="glyphicon glyphicon-asterisk form-control-feedback"></span>
                            </div>

                            <div class="form-group has-feedback">
                                <input type="text" name="name" pattern="[a-zA-Z][a-zA-Z ]{4,}"  class="form-control" placeholder="Enter Full name" maxlength="30" minlength="5" required/> <!--TODO : Regex for name-->
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>

                            <div class="form-group has-feedback">
                                <label>Gender </label>
                                <input type="radio" name="gender" value="male" checked> Male
                                <input type="radio" name="gender" value="female"> Female<br>
                            </div>

                            <div class="form-group has-feedback">
                                <input type="email" name="email" class="form-control" placeholder="Enter Email" required/>
                                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                            </div>

                            <div class="form-group has-feedback">
                                <input type="text" name="contact" pattern="[0-9]+" minlength="10" maxlength="11" class="form-control bfh-phone"  placeholder="Phone Number" /> <!--TODO : Add pattern for number here-->
                                <span class="glyphicon glyphicon-phone form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                               <select name="batch" class="form-control" required>
                                   
                                    <?php
                                    $sqlGet = "SELECT * FROM batch WHERE isActive= 1 ORDER BY createdDtm DESC";
                                    $result = $conn->query($sqlGet);
                                    if ($result->num_rows > 0) {
                                        while ($row = $result->fetch_assoc()) { ?>
                                            <option value="<?php echo $row['batchId'];?>"><?php echo $row['batchName']; ?></option>
                                        <?php
                                        }
                                    }
                                    ?>
                                </select>
                            </div>

                            <div class="form-group has-feedback">
                                <input type="text" name="password" class="form-control" placeholder="Enter Password" />
                                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                            </div>

                           
						Area of Interest
						   <div class="form-group has-feedback">
                               <select id="ai" name="ai" class="form-control" required>
							  
                                   
                                   
                                </select>
                            </div>
                            
						Suggested Topics	
							<div class="form-group has-feedback">
                               <select id="st" onchange="setSupervisor(this);" name="st" class="form-control" required>
							   
                                   
                                   
                                </select>
								<input id="pname" type="hidden" name="pname"  required/> 
                            </div>
							
							Assigned Supervisor
							<div class="form-group has-feedback">
                                <input id="sname" type="text" name="sname"  class="form-control" placeholder="Supervisor" maxlength="70" minlength="5" required/> 
								 <input id="sid" type="hidden" name="sid"  required/> 
								 
                                <span class="glyphicon glyphicon-user form-control-feedback"></span>
                            </div>
						   

                            <div class="box-footer ">
                                <div class="checkbox pull-left">
                                    <label>
                                        <input type="checkbox" name="emailSend" value="false" checked> Do not send email to user
                                    </label>
                                </div>
                                <div class="form-group pull-right">
                                <a href="<?php echo siteroot; ?>" class="btn  btn-default btn-sm  "> Back</a>
                                <button type="submit" name="btnRegisterStudent" class="btn btn-primary btn-sm">Register</button>
                                </div>
                            </div>

                        </form>

                    </div>
                    <!--Code for register student ends here-->

                </div>
                <div class="col-md-2"></div>

            </div>
</section>



<?php require_once("includes/required_js.php");?>
</body>
</html>
