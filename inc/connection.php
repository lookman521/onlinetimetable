<?php

$host = "localhost";
$database = "onlinetimetable";
$username = "root";
$password = "";
//connecting to the database
$connection = mysqli_connect($host, $username, $password, $database)
    or die("Database cannot connect");
