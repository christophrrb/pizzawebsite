<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags always come first -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Choose Pizza</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="css/choosepizza.css" />
</head>

<body>
  <h1>Choose Pizza</h1>
  <?php require 'connect.php';
  session_start();
  echo session_id();
  error_reporting(0);
  ?>

<?php
  if (isset($_SESSION['pizza'])) {
    //The toppings need to be put into a string before being pushed into the array.
    $array_id = $_REQUEST['row'];
    $_SESSION['array_splice'] =  $_REQUEST['row'];
    $pizza_array = array_slice($_SESSION['pizza'][$array_id], 1, 2);
    $topping_slice = array_slice($_SESSION['pizza'][$array_id], 3,1);
    $topping_implode = implode("", $topping_slice);
    $topping_explode = explode(", ", $topping_implode);

    $iteration = 0;
    while($iteration < sizeof($topping_explode)) {
      array_push($pizza_array, $topping_explode[$iteration]);
      $iteration++;
    }

    // $pizza_in_totality = array_push($pizza_array, $topping_implode);
    print_r($pizza_array);

    //Game plan: explode $topping_implode, but use a while loop to array_push() each  interation's value.
  } else {
    $toppingSplice = null;
    $toppingExplode = null;
  }
   ?>

<!-- Type of Pizza -->
  <div class="top-boxes">
  <div class="card">
  <div class="card-header">
    Type of Pizza
  </div>
  <div class="card-block">

    <form action="pizzaSummary.php" method="post">
    <?php
    $sql = ("SELECT pizza_desc FROM pizza_type");
    $result = $conn->query($sql);


      if ($result->num_rows > 0) {
      while ($row = $result->fetch_assoc()) {
        $pizza_desc = $row['pizza_desc'];

        //Consider calling a function instead of pooping the code here.
        if (in_array($pizza_desc, $pizza_array)) {
          echo "<tr>
                  <td>
                    <div class='form-check'>
                    <label class='form-check-label'>
                    <input class='form-check-input' type='radio' name='typeofPizza' value='".$pizza_desc."' checked>".
                    $pizza_desc."</label>
                    </div></td></tr>";
        } else {
        echo "<tr>
                <td>
                  <div class='form-check'>
                  <label class='form-check-label'>
                  <input class='form-check-input' type='radio' name='typeofPizza' value='".$pizza_desc."'>".
                  $pizza_desc."</label>
                  </div></td></tr>";
                }
              }

    //     echo "<div class='form-check'>
    //   <label class='form-check-label'>
    //     <input class='form-check-input' type='radio' name='typeofPizza' value='
    //       ".$row['pizza_desc']." '>"
    //     .$row['pizza_desc']."
    //   </label>
    // </div>";
    } else {

    }
?>
  </div>
</div>
</div>


<!-- Crust -->
<div id="Crust" class="top-boxes">
<div class="card">
<div class="card-header">
  Crust
</div>
<div class="card-block">
  <!-- The crusts of pizza are regular pepperoni, meat supreme, and vegetarian delight. -->

  <?php
  $sql = ("SELECT crust_desc FROM crust");
  $result = $conn->query($sql);

    if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
      $crust_desc = $row['crust_desc'];
      if (in_array($crust_desc, $pizza_array)) {
        echo "<tr>
                <td>
                  <div class='form-check'>
                  <label class='form-check-label'>
                  <input class='form-check-input' type='radio' name='crusts' value='".$crust_desc."' checked>".
                  $crust_desc."</label>
                  </div></td></tr>";
      } else {
      echo "<tr>
              <td>
                <div class='form-check'>
                <label class='form-check-label'>
                <input class='form-check-input' type='radio' name='crusts' value='".$crust_desc."'>".
                $crust_desc."</label>
                </div></td></tr>";
              }
            }


    //   echo "<div class='form-check'>
    // <label class='form-check-label'>
    //   <input class='form-check-input' type='radio' name='crusts' value='".$row['crust_desc']."'> ".$row['crust_desc']."</label>
    //   </div>";
    }
  ?>
</div>
</div>
</div>


<!-- Pizza Toppings -->
<div id="pizzaToppings">
<div class="card">
<div class="card-header">
  Pizza Toppings
</div>
<div class="card-block">

        <?php
        $catSQL = ("SELECT topping_category_desc FROM topping_categories");
        $catResult = $conn->query($catSQL);

        if ($catResult->num_rows > 0) {
          $x = 1;
          while ($catRow = $catResult->fetch_assoc()) {
            echo "<table class='floating-box'><tr><th>".$catRow['topping_category_desc']."</th></tr>";

            $cheeseToppingSQL = ("SELECT topping_desc FROM toppings WHERE topping_category_id = $x");
            $cheeseToppingResult = $conn->query($cheeseToppingSQL);

            if ($cheeseToppingResult->num_rows > 0) {
              // Experimental code to get the prices on this too.
              while ($cheeseToppingRow = $cheeseToppingResult->fetch_assoc()) { $topping_desc = $cheeseToppingRow['topping_desc'];
                if (in_array($topping_desc, $pizza_array)) {
                  echo "<tr>
                          <td>
                            <div class='form-check'>
                            <label class='form-check-label'>
                            <input class='form-check-input' type='checkbox' name='toppings[]' value='".$topping_desc."' checked>".
                            $topping_desc."</label>
                            </div></td></tr>";
                } else {
                echo "<tr>
                        <td>
                          <div class='form-check'>
                          <label class='form-check-label'>
                          <input class='form-check-input' type='checkbox' name='toppings[]' value='".$topping_desc."'>".
                          $topping_desc."</label>
                          </div></td></tr>";
                        }
              }
              echo "</table>";
            }
            $x++;
          }
        }

?>
</div>
</div>
<button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>
</html>
