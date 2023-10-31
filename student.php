<?php  
session_start();

//check if user is not logged in
if(!isset($_SESSION["user"])){
    header("location: login.php");
}//check if logged in as user
// if($_SESSION["user"]["role"] == "user"){
//     header("location: all-questions.php");
// }
//header links
 require "inc/header.php"; ?>

 <div class="container">

 <?php
 //header content
 require './pages/header-home.php';
 include 'inc/process.php'; ?>

 <div class="container p-3">
     <div class="row justify-content-center">
         <div class="col-12 text-center">
             <h6>Al-Qalam University Katsina</h6>
             <h6>College of Computing and Information Science</h6>
         </div>
         <div class="col-10 ">
             <div class="container">
                 <h6 class="text-center">Timetable For Second Semester Examination 2022/2023 Session</h6>
                <?php 
                    if(isset($error)) {
                    ?>
                    <div class="alert alert-danger">
                        <strong><?php echo $error ?></strong>
                    </div>
                    <?php
                         }elseif (isset($success)) {
                    ?>
                    <div class="alert alert-success">
                    <strong><?php echo $success ?></strong>
                    </div>
                    <?php
                   }
                 ?>
                               <table class="table">
    <thead>
        <tr>
            <th scope="col">SN</th>  
            <th scope="col">Department</th>
            <th scope="col">Course</th>
            <th scope="col">Date</th>
            <th scope="col">Venue</th>
            <th scope="col">Time</th>
        </tr>
    </thead>
    <tbody>
        <?php
        // Query to fetch timetable information with related course and invigilator details
        $sql = "SELECT timetable.*, courses.course_code, courses.course_title, GROUP_CONCAT(invigilators.name SEPARATOR ',<br>') AS invigilator_names
                FROM timetable
                INNER JOIN courses ON timetable.course_id = courses.id
                INNER JOIN invigilators ON timetable.invigilator_id = invigilators.id
                GROUP BY timetable.course_id, timetable.date_, timetable.day_, timetable.venue, timetable.from_, timetable.to_";
        
        $query = mysqli_query($connection, $sql);
        $counter = 1;

        while ($result = mysqli_fetch_assoc($query)) {

            $course_id = $result["course_id"];
            $sql2 = "SELECT * FROM courses WHERE id='$course_id' ";
            $query2 = mysqli_query($connection, $sql2);
            $result2 = mysqli_fetch_assoc($query2);

            echo '<tr class="table-active">';
            echo '<td scope="row">' . $counter . '</td>';
            echo '<td scope="row">' . $result2["dept"] . '</td>';
            echo '<td scope="row">' . $result["course_code"] . ' ' . $result["course_title"] . '</td>';
            echo '<td>' . $result["date_"] . '<br>' . $result["day_"] . '</td>';
            echo '<td>' . $result["venue"] . '</td>';
             // Convert the time to AM or PM format
             $from_time = date("h:i A", strtotime($result["from_"]));
             $to_time = date("h:i A", strtotime($result["to_"]));
             echo '<td>' . $from_time . ' to ' . $to_time . '</td>';
             echo '</tr>';
            
            $counter++;
        }
        ?>
    </tbody>
</table>

                    </div> 
         </div>
     </div>
 </div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Category</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="" method="post">
              <label for="">Title</label>
              <div class="form-group">
                  <input type="text" class="form-control" name="name" placeholder="Enter title" id="" required>
              </div>
              <div class="my-3">
                  <button type="submit" class="btn btn-primary" name="category">Submit</button>
              </div>
          </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



<?php  
//footer content
require './pages/footer-home.php'; ?>

 </div>


 <?php
 //footer script
  require "inc/footer.php";  ?>