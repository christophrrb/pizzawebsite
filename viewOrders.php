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
</head>

<body>
  <center><h1>Manage Orders</h1></center>
  <?php
    require 'connect.php';

    $all_orders_sql = "SELECT * FROM orders ORDER BY order_id ASC";
    $all_orders_result = $conn->query($all_orders_sql);
    $all_orders_row = $all_orders_result->fetch_assoc();
    $num_rows = $all_orders_result->num_rows;


    // if ($num_rows > 0) {
    //     $array = array($all_orders_row_for_sql);
    //
    //     if ($x < $num_rows) {
    //         while ($x < $num_rows) {
    //         array_push($array, $all_orders_row_for_sql);
    //       }
    //     }
    //   }else {
    //     echo "It didn't work.";
    // }

    echo "<br></br>";
    //var_dump($array);
    // var_dump($all_orders_row_for_sql);
    echo "<br></br>";


    // var_dump($gonna_need_result);
    // echo "<br>";
    // var_dump($gonna_need_row);

    $x = 0;
    $y = 0;
    $z = 1;
     if ($all_orders_result) {
      while ($all_orders_row = $all_orders_result->fetch_assoc()) {
        echo "<table border=1px>
          <tr><td>Order #".$all_orders_row['customer_id']."</td><td>Pizzas</td></tr>";

          $all_orders_row_for_sql = (int) $all_orders_row['order_id'];
          $gonna_need_sql = "SELECT selected_type, selected_crust, pizza_desc, price FROM pizza WHERE order_id=$all_orders_row_for_sql";
          $gonna_need_result = $conn->query($gonna_need_sql);

          var_dump($all_orders_row_for_sql);

      while ($gonna_need_row = $gonna_need_result->fetch_assoc()) {
        echo
          "<tr>
            <td>$z</td>
            <td>".$gonna_need_row['selected_type']."</td>
            <td>".$gonna_need_row['selected_crust']."</td>
            <td>".$gonna_need_row['pizza_desc']."</td>
            <td>".$gonna_need_row['price']."</td>
          </tr>";

        $y++;
        $z++;
      }
      echo "</table><br></br>";
      $x++;
      $y = 0;
      $z = 1;
    }
  } else {
    echo "There was an error.";
  }
  ?>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
