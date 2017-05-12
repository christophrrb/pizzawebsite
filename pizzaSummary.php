<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags always come first -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title></title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="pizzaSummary.css">
</head>

<body>
  <h1>Pizza Summary</h1>
  <a href="choosepizza.php">Make Another Pizza</a>
  <?php
  error_reporting(E_ALL);
  require 'connect.php';
  session_start();
  unset($pizza_b);
  $pizzaType = $_POST['typeofPizza'];
  $pizzaCrust = $_POST['crusts'];
  $pizzaToppings = $_POST['toppings'];
  $pizzaToppingsString = implode(", ", $pizzaToppings);
  $pizzaToppingsStringforSQL = implode("', '", $pizzaToppings);

  // SELECT topping_price FROM toppings WHERE name in ($pizzaToppings);

  $x = 0;

  $topping_price_sql = "SELECT topping_price FROM toppings WHERE topping_desc IN
          ('$pizzaToppingsStringforSQL')";
  $crust_price_sql = "SELECT price FROM crust WHERE crust_desc IN ('$pizzaCrust') LIMIT 1";

  $topping_price_result = $conn->query($topping_price_sql);
  $crust_price_result = $conn->query($crust_price_sql);
  $crustrow = $crust_price_result->fetch_assoc();
  echo $crustrow['price'];
?>

<!--For the price of the pizza.-->
<div style="background:green">
<?php
          if ($topping_price_result) {
            $total = 0;
            while ($row = $topping_price_result->fetch_assoc()) {
              echo $row['topping_price']."<br>";
               $total+= (float)$row['topping_price']."<br>";
              }
            }
            $total+= (float)$crustrow['price'];
            echo $total;

    $sql = "INSERT INTO pizza(selected_type, selected_crust, pizza_desc, price)
                    VALUES ('$pizzaType', '$pizzaCrust', '$pizzaToppingsString', '$total')";
    $result = $conn->query($sql);
    if ($result) {
                      echo "<br></br>You have a $pizzaType pizza with $pizzaCrust crust and $pizzaToppingsString. <br>";
                    }

 if (isset($_SESSION['pizza'])) {
   $pizza_b = //array(
     array("$pizzaType", "$pizzaCrust", "$pizzaToppingsString", "$total");
     array_push($_SESSION['pizza'], $pizza_b);
 } else {
   $_SESSION['pizza'] = array(
     array("$pizzaType", "$pizzaCrust", "$pizzaToppingsString", "$total"));
 }

 print_r($_SESSION['pizza']);

  ?>
  </div>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>
</html>

<!--$prices_sql = "SELECT topping_price FROM toppings WHERE topping_desc LIKE (";

while($row = $result->fetch_assoc()) {
  $prices_sql.= "'";
  $prices_sql.= $row;
  $prices_sql.= "',";
};
$prices_sql.= ");";
} else {
echo "Error: " . $sql . "<br>" . $conn->error;
}

$result = $conn->query($prices_sql);
if ($result) {
   // Cycle through results
  while ($row = $result->fetch_object()){
      $user_arr[] = $row;
  echo $row['topping_price']."<br>";
}
  // Free result set
  $result->close();
  $conn->next_result();
} else {
echo "Error: " . $prices_sql . "<br>" . $conn->error;
}

var_dump($user_arr);
var_dump($row); -->
