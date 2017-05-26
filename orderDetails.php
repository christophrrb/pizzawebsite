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
  <h1>Order Details</h1>
  <?php require 'connect.php';
   //Don't unset the variables in this page because there should be a button here allowing the user to return to change something. Do it on the next page. Or not, it's your choice. This could be the final page. In fact, I think I do want it to be the final page.
   session_start();
  $intoSQL = $_SESSION['pizza'];
  $delivOption = $_SESSION['delivOption'];

  //This links the order to the customer's id. It needs to be finished.
  $order_to_customer_sql = "SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1";
  $order_to_customer_result = $conn->query($order_to_customer_sql);
  $order_to_customer_row = $order_to_customer_result->fetch_assoc();
  $order_to_customer_row_for_if_statement = $order_to_customer_row['customer_id'];

  if ($order_to_customer_result) {
    $order_to_customer_insert_sql = "INSERT INTO orders(customer_id, carry_out)
                                     VALUES($order_to_customer_row_for_if_statement, '$delivOption')";

    $order_to_customer_insert_result = $conn->query($order_to_customer_insert_sql);
  }

  if ($order_to_customer_insert_result) {
    echo "The customer's ID has been attached along with its record.";
  }


     $grab_order_id = "SELECT order_id FROM orders ORDER BY order_id DESC LIMIT 1";
     $grab_order_id_result = $conn->query($grab_order_id);
     $grab_order_id_row = $grab_order_id_result->fetch_assoc();
     $order_id_row = $grab_order_id_row['order_id'];

  $y = count($intoSQL,0);
  $order_total = 0;

   for ($x=0; $x < $y; $x++) {
     echo "Inserted in database.";
     echo $x;
     echo $intoSQL[$x][0]."-".$intoSQL[$x][1]."-".$intoSQL[$x][2]."-".$intoSQL[$x][3];
     $pizza_type = $intoSQL[$x][0];
     $pizza_crust = $intoSQL[$x][1];
     $pizza_toppings = $intoSQL[$x][2];
     $pizza_price = $intoSQL[$x][3];
        $sql = "INSERT INTO pizza(selected_type, selected_crust, pizza_desc, price, order_id)
                         VALUES ('$pizza_type', '$pizza_crust', '$pizza_toppings', $pizza_price, '$order_id_row')";
         $result = $conn->query($sql);

      $order_total += $pizza_price;

         if ($result) {
                           echo "Inserted in database. <br>";
                         }
        } //End of while loop.

        //This inserts the total price into the order record.
         $order_price_sql = "UPDATE orders
                               SET price = $order_total
                               WHERE order_id=$order_id_row";
         $order_price_result = $conn->query($order_price_sql);

         if ($order_price_result) {
           echo "The order price has been submitted.";
         }




   /*Things to Add
   -------------
   - The crust (or not, because I guess it doesn't matter in the order_details, and it can still be grabbed for the user to see).
   - The toppings because the user needs to know those.


   - Add a uniqid field for identification somewhere because LIMIT 1 will only work if one person at a time is ordering pizzas. Otherwise, the prices can seriously get screwed up.
   */
   ?>

   <form action="orderCompleted.php" method="post">
     <button type="submit">Checkout</button>
   </form>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>

<!--Trash-->
<!--
//  $order_sql = "UPDATE orders
//                SET column1 = value1, column2 = value2, ...
//                WHERE condition;";
//  $order_result = $conn->query($order_sql);
//
//  if ($order_result) {
  //    echo "The delivery option has been stored into the database.";
  //  } else {
    //    echo "The delivery option has not been stored into the database, and the record has not been created.";
    //  }
-->
