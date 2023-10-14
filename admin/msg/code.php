<?php
// ob_start();
 //  session_start();
  // $regno = $_SESSION['userid'];
  include('includes/config.php');

        // username and password sent from form 

	   $id = $_POST['id'];
      // $message =$_POST['message']; 
     $query = "SELECT pcontact,pname FROM students WHERE id='$id'";  
	 $result = $db->query($query);
	 if($result->num_rows>0){
		while($row=$result->fetch_assoc()){
			
			
			
require_once('AfricasTalkingGateway.php');
// Specify your authentication credentials
$username   = "cbc";
$apikey     = "c81cdf1f3069e5aecc22b1cfc4e5d85bf5d3d48174e473a811d5cec1238e9649";
/*
     $quer= "SELECT phone,regno FROM student WHERE regno='$regno' ";  
	 $resul = $db->quer($quer);
	 if($resul->num_rows>0){
		while($row=$resul->fetch_assoc()){
		*/	

// Specify the numbers that you want to send to in a comma-separated list
// Please ensure you include the country code (+254 for Kenya in this case)
$recipients =$row["pcontact"];
$names=['edward dume'];
//loop through that and send the message
    $recipient=$row["pcontact"];
 //$message="register your new SIM is :".$row["pname"];
$message =  $_POST['message'];  
// Create a new instance of our awesome gateway class
$gateway    = new AfricasTalkingGateway($username, $apikey);

try 
{ 
  // Thats it, hit send and we'll take care of the rest. 
  $results = $gateway->sendMessage($recipient, $message);
			
  foreach($results as $result) {
    // status is either "Success" or "error message"
    echo " Number: " .$result->number;
    echo " Status: " .$result->status;
    echo " MessageId: " .$result->messageId;
    echo " Cost: "   .$result->cost."\n";
	header("refresh:0;url=thome.html");
  }
}
catch ( AfricasTalkingGatewayException $e )
{
  echo "Encountered an error while sending: ".$e->getMessage();
}

// DONE!!! 

}
//header("refresh:1;url=verif.php");

	   }
   else
       {
		    
       // header("refresh:1;url=codelog.php");
        print'error';
      }
	  ob_end_clean();
	  echo'</p>';
	  
?>