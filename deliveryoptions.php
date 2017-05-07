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

<body style="padding: 75px">
  <?php session_start();
        session_id(uniqid());
        echo session_id();
  ?>
  <form action="choosepizza.php" method="post">
  <h1 style="Text-align: center">Delivery Options</h1>
<br>
  <h2 style="text-align: center; color: darkgray">Carry Out or Delivery?</h2>
  <div id="buttons" style="text-align: center">
    <br>
    <button type="submit" class="btn btn-primary" name="delivOption" value="Y" style="height: 100px; width:200px; font-size:35px">Carry Out</button>
    <span style="color: white">This is just to"</span>
    <button type="submit" class="btn btn-primary" name="delivOption" value="N" style="height: 100px; width:200px; font-size: 35px">Delivery</button>
  </div>

</form>

  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
