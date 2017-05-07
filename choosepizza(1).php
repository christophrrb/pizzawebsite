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
  <?php require 'connect.php' ?>

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
        echo "<div class='form-check'>
      <label class='form-check-label'>
        <input class='form-check-input' type='radio' name='typeofPizza' value='
          ".$row['pizza_desc']." '>"
        .$row['pizza_desc']."
      </label>
    </div>";
      }
    }

    // <form action="pizzaSummary.php" method
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
      echo "<div class='form-check'>
    <label class='form-check-label'>
      <input class='form-check-input' type='radio' name='exampleRadios' value='option1'> ".$row['crust_desc']."</label>
      </div>";
    }
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
  <!-- The types of pizza are regular pepperoni, meat supreme, and vegetarian delight. -->

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
              while ($cheeseToppingRow = $cheeseToppingResult->fetch_assoc()) {
                echo "<tr>
                        <td>
                          <div class='form-check'>
                          <label class='form-check-label'>
                          <input class='form-check-input' type='checkbox' name='exampleRadios' value='option1'> ".
                          $cheeseToppingRow['topping_desc'].
                          "</label>
                          </div></td></tr>";
              }
              echo "</table>";
            }
            $x++;
          }
        }

        /* --------------*/

        /*$sauceToppingSQL = ("SELECT topping_desc FROM toppings WHERE topping_category_id = 2");
        $meatToppingSQL = ("SELECT topping_desc FROM toppings WHERE topping_category_id = 3");
        $fandvToppingSQL = ("SELECT topping_desc FROM toppings WHERE topping_category_id = 4");

        $sauceToppingResult = $conn->query($sauceToppingSQL);
        $meatToppingResult = $conn->query($meatToppingSQL);
        $fandvToppingResult = $conn->query($fandvToppingSQL);

        if ($sauceToppingResult->num_rows > 0) {
          echo "<tr>";
          while ($sauceToppingRow = $sauceToppingResult->fetch_assoc()) {
            echo "<td>".$sauceToppingRow['topping_desc']."</td>";
          }
          echo "</tr>";
        }

        if ($meatToppingResult->num_rows > 0) {
            echo "<tr>";
            while ($meatToppingRow = $meatToppingResult->fetch_assoc()) {
              echo "<td>".$meatToppingRow['topping_desc']."</td>";
            }
            echo "</tr>";
          }

        if ($fandvToppingResult->num_rows > 0) {
          echo "<tr>";
          while ($fandvToppingRow = $fandvToppingResult->fetch_assoc()) {
            echo "<td>".$fandvToppingRow['topping_desc']."</td>";
          }
          echo "</tr>";
        }

      /*  <div class="form-check">
<label class="form-check-label">
  <input class="form-check-input" type="checkbox" name="exampleRadios" id="exampleRadios1" value="option1" checked>
  Pepperoni
</label>
</div>*/
?>

</div>
</div>
</div>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
