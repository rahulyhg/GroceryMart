<?php
include '../includes/connect.php';
$firstname = htmlspecialchars($_POST['firstname']);
$lastname = htmlspecialchars($_POST['lastname']);
$email = htmlspecialchars($_POST['email']);
$password = htmlspecialchars($_POST['password']);
$password = md5($password)
$phone = $_POST['phone'];

function number($length) {
    $result = '';

    for($i = 0; $i < $length; $i++) {
        $result .= mt_rand(0, 9);
    }

    return $result;
}

$sql_check = "select * from user where email=$email;";

if($con->query($sql_check)==true){
	//write java scipt code for error
}
else {
	$sql1 = "INSERT INTO users (Name_f, Name_l, Email, Password) VALUES ('$firstname','$lastname', '$email', '$password');";
	$con->query($sql1);	
	$sql2 = "SELECT c_id from users where username = $username; ";

	$row = mysqli_fetch_array($sql2);
	$c_id =$row["C_Id"];

	$sql3 = "insert into user_ph values($c_id,$phone);";
	$con->query($sql3)
}



// if($con->query($sql1)==true){
// 	$user_id =  $con->insert_id;
// 	$sql = "INSERT INTO wallet(customer_id) VALUES ($user_id)";
// 	if($con->query($sql)==true){
// 			$wallet_id =  $con->insert_id;
// 			$cc_number = number(16);
// 			$cvv_number = number(3);
// 			$sql = "INSERT INTO wallet_details(wallet_id, number, cvv) VALUES ($wallet_id, $cc_number, $cvv_number)";
// 			$con->query($sql);
// 		}
// }



header("location: ../login.php");
?>