<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['clientlogin'])==0)
    {   
header('location:index.php');
}
else{
if(isset($_POST['book']))
{
$Client_ID=$_SESSION['eid'];
 $eventtype=$_POST['eventtype'];
$date=$_POST['date'];  
$est=$_POST['est'];
$eet=$_POST['eet'];
$venue=$_POST['venue'];
$description=$_POST['description'];  
$status=0;
$isread=0;
if($Etime > $Stime){
                $error=" Etime should be greater than Stime ";
           }
$sql="INSERT INTO tblbookings(EventType,Venue,Stime,Etime,Date,Description,Status,IsRead,Client_ID) VALUES(:eventtype,:venue,:est,:eet,:date,:description,:status,:isread,:Client_ID)";
$query = $dbh->prepare($sql);
$query->bindParam(':eventtype',$eventtype,PDO::PARAM_STR);
$query->bindParam(':date',$date,PDO::PARAM_STR);
$query->bindParam(':est',$est,PDO::PARAM_STR);
$query->bindParam(':eet',$eet,PDO::PARAM_STR);
$query->bindParam(':venue',$venue,PDO::PARAM_STR);
$query->bindParam(':description',$description,PDO::PARAM_STR);
$query->bindParam(':status',$status,PDO::PARAM_STR);
$query->bindParam(':isread',$isread,PDO::PARAM_STR);
$query->bindParam(':Client_ID',$Client_ID,PDO::PARAM_STR);
$query->execute();
$lastInsertId = $dbh->lastInsertId();
if($lastInsertId)
{
$msg="Event Booked successfully";
}
else 
{
$error="Something went wrong. Please try again";
}

}

    ?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <!-- Title -->
        <title>Client | Book an Event</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet"> 
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
  <style>
        .errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
        </style>
 
 <script type="text/javascript">
    $(function() {
        $( "#mask1" ).datepicker({  minDate: new Date() });
    });
</script>

    </head>
    <body>
  <?php include('includes/header.php');?>
            
       <?php include('includes/sidebar.php');?>
   <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Book an Event</div>
                    </div>
                    <div class="col s12 m12 l8">
                        <div class="card">
                            <div class="card-content">
                                <form id="example-form" method="post" name="addemp">
                                    <div>
                                        <h3>Book an Event</h3>
                                        <section>
                                            <div class="wizard-content">
                                                <div class="row">
                                                    <div class="col m12">
                                                        <div class="row">
     <?php if($error){?><div class="errorWrap"><strong>ERROR </strong>:<?php echo htmlentities($error); ?> </div><?php } 
                else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>


 <div class="input-field col  s12">
<select  name="eventtype" autocomplete="off">
<option value="">Select event type...</option>
<?php $sql = "SELECT  EventType from tbleventype";
$query = $dbh -> prepare($sql);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{   ?>                                            
<option value="<?php echo htmlentities($result->EventType);?>"><?php echo htmlentities($result->EventType);?></option>
<?php }} ?>
</select>
</div>


<div class="input-field col m6 s12">
<label for="fromdate">Event  Date</label>
<input placeholder="" id="mask1" name="date" class="masked" type="date" data-inputmask="'alias': 'date'"   required>
</div>
<div class="input-field col m6 s12">
<label for="start time"></label>
<select type="text" class="form-control" name="est" required="true">
							 	<option value="">Select Starting Time</option>
							 	<option value="1 a.m">1 a.m</option>
							 	<option value="2 a.m">2 a.m</option>
							 	<option value="3 a.m">3 a.m</option>
							 	<option value="4 a.m">4 a.m</option>
							 	<option value="5 a.m">5 a.m</option>
							 	<option value="6 a.m">6 a.m</option>
							 	<option value="7 a.m">7 a.m</option>
							 	<option value="8 a.m">8 a.m"</option>
							 	<option value="9 a.m">9 a.m</option>
							 	<option value="10 a.m">10 a.m</option>
							 	<option value="11 a.m">11 a.m</option>
							 	<option value="12 p.m">12 a.m</option>
							 	<option value="1 p.m">1 p.m</option>
							 	<option value="2 p.m">2 p.m</option>
							 	<option value="3 p.m">3 p.m</option>
							 	<option value="4 p.m">4 p.m</option>
							 	<option value="5 p.m">5 p.m</option>
							 	<option value="6 p.m">6 p.m</option>
							 	<option value="7 p.m">7 p.m</option>
							 	<option value="8 p.m">8 p.m</option>
							 	<option value="9 p.m">9 p.m</option>
							 	<option value="10 p.m">10 p.m</option>
							 	<option value="10 p.m">10 p.m</option>
							 	<option value="12 a.m">12 a.m</option>
							 </select>
</div>
<div class="input-field col m6 s12">
<label for="todate"></label>
<select type="text" class="form-control" name="eet" required="true">
							 	<option value="">Select Ending Time</option>
							 	<option value="1 a.m">1 a.m</option>
							 	<option value="2 a.m">2 a.m</option>
							 	<option value="3 a.m">3 a.m</option>
							 	<option value="4 a.m">4 a.m</option>
							 	<option value="5 a.m">5 a.m</option>
							 	<option value="6 a.m">6 a.m</option>
							 	<option value="7 a.m">7 a.m</option>
							 	<option value="8 a.m">8 a.m"</option>
							 	<option value="9 a.m">9 a.m</option>
							 	<option value="10 a.m">10 a.m</option>
							 	<option value="11 a.m">11 a.m</option>
							 	<option value="12 p.m">12 a.m</option>
							 	<option value="1 p.m">1 p.m</option>
							 	<option value="2 p.m">2 p.m</option>
							 	<option value="3 p.m">3 p.m</option>
							 	<option value="4 p.m">4 p.m</option>
							 	<option value="5 p.m">5 p.m</option>
							 	<option value="6 p.m">6 p.m</option>
							 	<option value="7 p.m">7 p.m</option>
							 	<option value="8 p.m">8 p.m</option>
							 	<option value="9 p.m">9 p.m</option>
							 	<option value="10 p.m">10 p.m</option>
							 	<option value="10 p.m">10 p.m</option>
							 	<option value="12 a.m">12 a.m</option>
							 </select>
</div>
<div class="input-field col m12 s12">
<label for="venue">Venue</label>    

<textarea id="venue" name="venue" class="materialize-textarea" required></textarea>
</div>
<div class="input-field col m12 s12">
<label for="birthdate">Comments</label>    

<textarea id="textarea1" name="description" class="materialize-textarea" length="500" required></textarea>
</div>
</div>
      <button type="submit" name="book" id="book" class="waves-effect waves-light btn indigo m-b-xs">Book</button>                                             

                                                </div>
                                            </div>
                                        </section>
                                     
                                    
                                        </section>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div class="left-sidebar-hover"></div>
        
        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/js/alpha.min.js"></script>
        <script src="assets/js/pages/form_elements.js"></script>
          <script src="assets/js/pages/form-input-mask.js"></script>
             <script src="assets/plugins/jquery-inputmask/jquery.inputmask.bundle.js"></script>
    </body>
</html>
<?php } ?> 