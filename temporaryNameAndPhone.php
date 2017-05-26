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
  <title>Quick Information</title>
  <link rel="stylesheet" type="text/css" href="css/temporaryNameandPhone.css">
</head>

<body>
  <?php
  session_start();
  $_SESSION['delivOption'] = $_REQUEST['delivOption'];
  ?>
  <h1>Quick Information</h1>

  <form action="customerInfotoDatabase.php" method="post">
<div id="quickInfo">
  <span id="blocky">
    <label for="exampleInputEmail1">First Name</label>
    <input type="text" class="form-control" id="firstName" aria-describedby="emailHelp" placeholder="John" name="firstName">
  </span>

  <span id="blocky">
    <label for="lastName">Last Name</label>
    <input type="text" class="form-control" id="lastName" aria-describedby="emailHelp" placeholder="Smith" name="lastName">
  </span>
</div>

<span id="email">
  <label for="email">Email</label>
  <input type="email" class="form-control" id="email" aria-describedby="emailHelp"
  placeholder="validemailaddress@domain.com" name="email">
</span>

<br>

<span id="theDigits">
<label for="">Phone Number</label>
<input type="tel" class="form-control" id="phoneNumber" aria-describedby="iWishIKnew" placeholder="555-555-5555" name="phoneNumber">
</span>

<br>

<span id="theAlternativeDigits">
<label for="">Alternative Phone Number</label>
<input type="tel" class="form-control" aria-describedby="iWishIKnew" placeholder="555-555-5555" name="altPhoneNumber">
</span>

<span id="address">
  <label>Address</label>
  <input type="text" class="form-control" name="address" placeholder="Address">
</span>

<br></br>

<div id="forms">

<table>
  <tr>
    <td class="tSpacing">
     Blank
    </td>
    <td>
      <label for="exampleInputEmail1"> <br>City</label>
      <input type="text" class="form-control" name="city" placeholder="City">
    </td>
    <td class="tSpacing">
     Blank
    </td>
    <td>
    <div class="form-group">
   <label for="exampleSelect1"><br> State</label>
   <select class="form-control" id="exampleSelect1">
     <option name="state" value="AL">AL</option>
     <option name="state" value="AK">AK</option>
     <option name="state" value="AZ">AZ</option>
     <option name="state" value="AR">AR</option>
     <option name="state" value="CA">CA</option>
     <option name="state" value="CO">CO</option>
     <option name="state" value="CT">CT</option>
     <option name="state" value="DE">DE</option>
     <option name="state" value="FL">FL</option>
     <option name="state" value="GA">GA</option>
     <option name="state" value="HI">HI</option>
     <option name="state" value="ID">ID</option>
     <option name="state" value="IL">IL</option>
     <option name="state" value="IN">IN</option>
     <option name="state" value="IA">IA</option>
     <option name="state" value="KS">KS</option>
     <option name="state" value="KY">KY</option>
     <option name="state" value="LA">LA</option>
     <option name="state" value="ME">ME</option>
     <option name="state" value="MD">MD</option>
     <option name="state" value="MA">MA</option>
     <option name="state" value="MI">MI</option>
     <option name="state" value="MN">MN</option>
     <option name="state" value="MS">MS</option>
     <option name="state" value="MO">MO</option>
     <option name="state" value="MT">MT</option>
     <option name="state" value="NE">NE</option>
     <option name="state" value="NV">NV</option>
     <option name="state" value="NH">NH</option>
     <option name="state" value="NJ">NJ</option>
     <option name="state" value="NM">NM</option>
     <option name="state" value="NY">NY</option>
     <option name="state" value="NC">NC</option>
     <option name="state" value="ND">ND</option>
     <option name="state" value="OH">OH</option>
     <option name="state" value="OK">OK</option>
     <option name="state" value="OR">OR</option>
     <option name="state" value="PA">PA</option>
     <option name="state" value="RI">RI</option>
     <option name="state" value="SC">SC</option>
     <option name="state" value="SD">SD</option>
     <option name="state" value="TN">TN</option>
     <option name="state" value="TX">TX</option>
     <option name="state" value="UT">UT</option>
     <option name="state" value="VT">VT</option>
     <option name="state" value="VA">VA</option>
     <option name="state" value="WA">WA</option>
     <option name="state" value="WV">WV</option>
     <option name="state" value="WI">WI</option>
     <option name="state" value="WY">WY</option>
   </select>
 </div>
 </td>
 <td class="tSpacing">
  Blank
 </td>
 <td>
   <label for="exampleInputEmail1"> <br>Zip Code</label>
   <input type="number" class="form-control" name="zipCode" placeholder="Zip Code">
 </td>
  </tr>
  <tr>

  </tr>
</table>
  </div>
</div>

<button class="btn btn-primary" type="submit">Submit</button>
</form>


  <!-- jQuery first, then Bootstrap JS. -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js" integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7" crossorigin="anonymous"></script>
</body>

</html>
