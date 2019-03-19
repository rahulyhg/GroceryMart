<?php
session_start();
$servername = "localhost";
$server_user = "root";
$server_pass = "";
$dbname = "grocery_db";
$email = $_SESSION['email'];
$role = $_SESSION['role'];
$con = new mysqli($servername, $server_user, $server_pass, $dbname);
?>