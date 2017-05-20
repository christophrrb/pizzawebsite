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

   /*$order_details_sql = "INSERT INTO order(order_id, pizza_id, size_id, pizza_price)
                   VALUES ('something_useful_will_go_here', '$_SESSION['pizza'][$x][0]', '$total')";
  */

  $y = count($intoSQL,0);

   for ($x=0; $x < $y; $x++) {
     echo "Inserted in database.";
     echo $x;
     echo $intoSQL[$x][0]."-".$intoSQL[$x][1]."-".$intoSQL[$x][2]."-".$intoSQL[$x][3];
     $pizza_type = $intoSQL[$x][0];
     $pizza_crust = $intoSQL[$x][1];
     $pizza_toppings = $intoSQL[$x][2];
     $pizza_price = $intoSQL[$x][3];
        $sql = "INSERT INTO pizza(selected_type, selected_crust, pizza_desc, price)
                         VALUES ('$pizza_type', '$pizza_crust', '$pizza_toppings', $pizza_price)";
         $result = $conn->query($sql);

         if ($result) {
                           echo "Inserted in database. <br>";
                         }
        }



   /*Things to Add
   -------------
   - The crust (or not, because I guess it doesn't matter in the order_details, and it can still be grabbed for the user to see).
   - The toppings because the user needs to know those.
                   */
   ?>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
