<?php
include '../includes/connect.php';
$email1 = $_SESSION['email'];


// $name = htmlspecialchars($_POST['Name']);
$firstname = htmlspecialchars($_POST['Name_f']);
$lastname = htmlspecialchars($_POST['Name_l']);
$password =  htmlspecialchars($_POST['password']);
//$phone = $_POST['phone'];
$email = htmlspecialchars($_POST['email']);
//$address = htmlspecialchars($_POST['address']);
$sql = "UPDATE Users SET Name_f = '$firstname',Name_l='$lastname', Password='$password', Email='$email' WHERE Email = '$email1';";
if($con->query($sql)==true){
	$_SESSION['email'] = $email;
}
header("location: ../details.php");
?>