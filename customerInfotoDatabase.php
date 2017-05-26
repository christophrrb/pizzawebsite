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

  <!-- Redirects to choosepizza in five seconds. -->
  <meta http-equiv="Refresh" content="5;url=choosepizza.php">
</head>

<body>
  <?php require 'connect.php';
  $firstName = $_REQUEST['firstName'];
  $lastName = $_REQUEST['lastName'];
  $email = $_REQUEST['email'];
  $phoneNumber = $_REQUEST['phoneNumber'];
  $altPhoneNumber = $_REQUEST['altPhoneNumber'];
  $address = $_REQUEST['address'];
  $city = $_REQUEST['city'];
  $state = $_REQUEST['state'];
  $zipCode = $_REQUEST['zipCode'];

    //This will insert the customer's information into the database.

    $customerSQL = "INSERT INTO customer(first_name, last_name, email_id, pri_phone, alt_phone)
    VALUES ('$firstName', '$lastName', '$email', $phoneNumber, $altPhoneNumber)";
    $customerResult = $conn->query($customerSQL);

    //Yes, I am grabbing the customer_id here, not storing it in a session variable, and then grabbing it again in the orderDetails.php page.
    $customer_id_SQL = "SELECT customer_id FROM customer ORDER BY customer_id DESC LIMIT 1";
    $customer_id_SQL_result = $conn->query($customer_id_SQL);
    /*foreach ($customer_id_SQL_result as $a) {
      var_dump($a);
    }*/

    if ($customerResult) {
      echo "The record was successfully created.";
    } else {
      echo "The record was not successfully created.";
    }

    if ($customer_id_SQL_result) {
      echo "It  works.";
      while ($row = $customer_id_SQL_result->fetch_assoc()) {
      $customer_id = $row['customer_id'];
    }

    $addressSQL = "INSERT INTO addresses(customer_id, address_line_one, city_name, state_cd, postal_cd)
                   VALUES ($customer_id, '$address', '$city', '$state', $zipCode)";
    $addressResult = $conn->query($addressSQL);
  }


    if ($addressResult) {
      echo "Address saved.";
    }


  ?>
  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
