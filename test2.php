<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags always come first -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Second Test Site</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>

<body>

  <?php
  require 'connect.php';
  $random = "random";
  session_start();
  // unset($random);
  echo $_SESSION['hithere']." ".$_SESSION['byethere'];
  echo $random;
  $pizza_type = $_POST['typeofPizza'];
  // $toppings = $_POST['exampleCheckboxes']; This is commented out because it's not necessary.
  // $meats = $_POST['meat'];

  $comma_separated = implode(", ", $_POST['exampleCheckboxes']);

  echo $comma_separated.$_SESSION['hithere'];

  $sql = "INSERT INTO pizza(selected_type, pizza_desc)
          VALUES ('$pizza_type', '$comma_separated')"; //You have to have quotes aroud the values!

  if ($conn->query($sql) === TRUE) {
    echo "Thank God!";
  } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
  }

  // echo "<pre>";
  // var_dump($_POST);
  // exit;
  ?>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
