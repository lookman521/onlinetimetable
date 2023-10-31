<?php

require "connection.php";


if(isset($_POST["register"])){

    $name = $_POST["name"];
    $email = $_POST["email"];
    $role = $_POST["role"];
    $password = $_POST["password"];
    $encrypt_password = md5($password);

    //check if user exist
    $sql_check = "SELECT * FROM users WHERE email = '$email'";
    $query_check = mysqli_query($connection,$sql_check);
    if(mysqli_fetch_assoc($query_check)){
        //user exists
        $error = "User already exist";
    }else{
         //insert into DB
        $sql = "INSERT INTO users(name,email,role,password) 
               VALUES('$name','$email','$role','$encrypt_password')";
        $query = mysqli_query($connection,$sql) or die("Cant save data");
        $success = "Registration successfully";
    }  
}

if(isset($_POST["login"])){

    $email = $_POST["email"];
    $password = $_POST["password"];
    $encrypt_password = md5($password);

    //check if user exist
    $sql_check2 = "SELECT * FROM users WHERE email = '$email'";
    $query_check2 = mysqli_query($connection,$sql_check2);
    if(mysqli_fetch_assoc($query_check2)){
       //check if email and password exist
       $sql_check = "SELECT * FROM users WHERE email = '$email' AND password = '$encrypt_password'";
       $query_check = mysqli_query($connection,$sql_check);
       if($result = mysqli_fetch_assoc($query_check)){
       //Login to dashboard
       $_SESSION["user"] = $result;
    if($result["role"] == "student"){
        header("location: student.php");
    }elseif ($result["role"] == "lecturer") {
        header("location: lecturer.php");
    }else{
     header("location: admin.php");
    } 
          
       $success = "User logged in";       
     }else{ 
    //user password wrong
    $error = "User password wrong";
}  
       }else{
        //user not found
        $error = "User email not found";
  } 
}


if(isset($_POST["add-course"])){
    $course_code = $_POST["course_code"];
    $course_title = $_POST["course_title"];
    $college = $_POST["college"];
    $dept = $_POST["dept"];
    //sql

    $sql = "INSERT INTO courses(course_code, course_title, dept, college) VALUES('$course_code', '$course_title', '$dept', '$college')";
    $query = mysqli_query($connection,$sql);
    
    if($query){
        $success = "Course added";
    }else{
        $error = "Unable to add Course";
    }
}

if(isset($_GET["delete_course"]) && !empty($_GET["delete_course"])){
    $id = $_GET["delete_course"];
    //sql
    $sql = "DELETE FROM courses WHERE id = '$id'";
    $query = mysqli_query($connection,$sql);

    if($query){
        $success = "course deleted";
    }else{
        $error = "Unable to delete course";
    }

}

if(isset($_POST["edit_course"])){
    $course_code = $_POST["course_code"];
    $course_title = $_POST["course_title"];
    $college = $_POST["college"];
    $dept = $_POST["dept"];
    $edit_id = $_GET["edit_id"];
    //sql
    $sql = "UPDATE courses SET course_code = '$course_code', course_title = '$course_title',
            college = ' $college', dept = '$dept' WHERE id = '$edit_id'";
    $query = mysqli_query($connection,$sql);
    if($query){
        $success = "course updated";
    }else{
        $error = "Unable to update course";
    }

}

if(isset($_POST["add-invigilator"])){
    $name = $_POST["name"];
    $phone = $_POST["phone"];
    //sql
    $sql = "INSERT INTO invigilators(name, phone) VALUES('$name', '$phone')";
    $query = mysqli_query($connection,$sql);
    
    if($query){
        $success = "invigilator added";
    }else{
        $error = "Unable to add invigilator";
    }
}

if(isset($_GET["delete_invigilator"]) && !empty($_GET["delete_invigilator"])){
    $id = $_GET["delete_invigilator"];
    //sql
    $sql = "DELETE FROM invigilators WHERE id = '$id'";
    $query = mysqli_query($connection,$sql);

    if($query){
        $success = "invigilator deleted";
    }else{
        $error = "Unable to delete invigilator";
    }

}

if(isset($_POST["edit_invigilator"])){
    $name = $_POST["name"];
    $phone = $_POST["phone"];
    $edit_id = $_GET["edit_id"];
    //sql
    $sql = "UPDATE invigilators SET name = '$name', phone = '$phone' WHERE id = '$edit_id'";
    $query = mysqli_query($connection,$sql);
    if($query){
        $success = "invigilator updated";
    }else{
        $error = "Unable to update invigilator";
    }

}


if(isset($_POST["add_timetable"])){
    $course_id = $_POST["course_id"];
    $date_ = $_POST["date_"];
    $day_ = $_POST["day_"];
    $venue = $_POST["venue"];
    $from_ = $_POST["from_"];
    $to_ = $_POST["to_"];

    // Handle the invigilator IDs as an array
    $invigilator_ids = $_POST["invigilator_id"];

    // Build the SQL query dynamically based on the number of selected invigilators
    $sql = "INSERT INTO timetable(course_id,date_,day_,venue,from_,to_,invigilator_id) VALUES";

    $values = array();

    foreach ($invigilator_ids as $invigilator_id) {
        // Escape and add each set of values to the $values array
        $values[] = "('$course_id', '$date_', '$day_', '$venue', '$from_', '$to_', '$invigilator_id')";
    }

    $sql .= implode(", ", $values);

    $query = mysqli_query($connection, $sql);

    if($query){
        $success = "Timetable added";
    }else{
        $error = "Unable to add timetable";
    }
}


if(isset($_GET["delete_timetable"]) && !empty($_GET["delete_timetable"])){
    $id = $_GET["delete_timetable"];
    //sql
    $sql = "DELETE FROM timetable WHERE id = '$id'";
    $query = mysqli_query($connection,$sql);

    if($query){
        $success = "timetable deleted";
    }else{
        $error = "Unable to delete timetable";
    }

}




?>