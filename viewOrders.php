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

  <!-- <script src="order_status_cd.php"></script> -->
</head>
<body>

  <center><h1>Manage Orders</h1></center>
  <?php
    require 'connect.php';

    //This is to select the orders and sort them by id to be displayed.
    $all_orders_sql = "SELECT * FROM orders WHERE order_status_cd <> 'Canceled' ORDER BY order_id ASC";
    $all_orders_result = $conn->query($all_orders_sql);
    // $all_orders_row = $all_orders_result->fetch_assoc(); I commented this out because it's defined in the while statement. I didn't want a double definition.
    // $all_orders_row_value = $all_orders_row['customer_id']; I commented this out because I don't think it's necessary.
    // $num_rows = $all_orders_result->num_rows; I don't think this is being used.

    $z = 1; //This variable is used to count the pizza number for the order.

     if ($all_orders_row = $all_orders_result->fetch_assoc()) {
      while ($all_orders_row = $all_orders_result->fetch_assoc()) {
        $all_orders_row_value = $all_orders_row['customer_id'];
        $customer_name_sql = "SELECT first_name, last_name FROM customer WHERE customer_id=$all_orders_row_value";
        $customer_name_result = $conn->query($customer_name_sql);
        $customer_name_row = $customer_name_result->fetch_assoc();
        $customer_name = $customer_name_row['first_name']." ".$customer_name_row['last_name'];
        $total_price = $all_orders_row['price'];

        //Echo the customer_id in one td, and "Pizzas" in another.
        echo "<table border=1px>
          <tr>
            <td>Order #".$all_orders_row['customer_id']."</td>
            <td>$customer_name</td>
            <td>".$all_orders_row['order_status_cd']."</td>
            <td>Carry Out: ".$all_orders_row['carry_out']."</td>
            <td>Total Price: ".$total_price."<td>
          </tr>";

          /*$all_orders_row_for_sql type casts $all_orders_row into an int to be used in the SQL statement.

          $gonna_need_sql = Selects the pizza's things from the pizza table that correspond to the order.
          */

          $all_orders_row_for_sql = (int) $all_orders_row['order_id'];
          $gonna_need_sql = "SELECT selected_type, selected_crust, pizza_desc, price FROM pizza WHERE order_id=$all_orders_row_for_sql";
          $gonna_need_result = $conn->query($gonna_need_sql);


      while ($gonna_need_row = $gonna_need_result->fetch_assoc()) {
        echo
          "<tr>
            <td>$z</td>
            <td>".$gonna_need_row['selected_type']."</td>
            <td>".$gonna_need_row['selected_crust']."</td>
            <td>".$gonna_need_row['pizza_desc']."</td>
            <td>".$gonna_need_row['price']."</td>
          </tr>";

        $z++;
      }
            $z = 1;
            echo "</table><br>
              <form action='functions/pending.php' method='post'>
                <button type='submit' name='order_id' value='$all_orders_row_for_sql'>Pending</button>
              </form>

              <form action='functions/outForDelivery.php' method='post'>
                <button name='order_id' value='$all_orders_row_for_sql'>Out for Delivery</button>
              </form>

              <form action='functions/delivered.php' method='post'>
                <button name='order_id' value='$all_orders_row_for_sql'>Delivered</button>
              </form>

              <form action='functions/canceled.php' method='post'>
                <button name='order_id' value='$all_orders_row_for_sql'>Canceled</button>
              </form>

              <form action='functions/delete.php' method='post'>
                <button name='order_id' value='$all_orders_row_for_sql'>Delete</button>
              </form>

            <br><br><br><br>";
    }
  } else {
    echo "There was an error.";
  }

  // if(isset($_REQUEST['order_id'])) {
  //   require 'order_status_cd.php';
  // } else {
  //   echo "Waiting for a decision.";
  // }
  ?>

  <!-- jQuery first, then Bootstrap JS. -->
  <script
  src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
