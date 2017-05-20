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
      <input type="email" class="form-control" name="city" placeholder="City">
    </td>
    <td class="tSpacing">
     Blank
    </td>
    <td>
    <div class="form-group">
   <label for="exampleSelect1"><br> State</label>
   <select class="form-control" id="exampleSelect1">
     <option>AL</option>
     <option>AK</option>
     <option>AZ</option>
     <option>AR</option>
     <option>CA</option>
     <option>CO</option>
     <option>CT</option>
     <option>DE</option>
     <option>FL</option>
     <option>GA</option>
     <option>HI</option>
     <option>ID</option>
     <option>IL</option>
     <option>IN</option>
     <option>IA</option>
     <option>KS</option>
     <option>KY</option>
     <option>LA</option>
     <option>ME</option>
     <option>MD</option>
     <option>MA</option>
     <option>MI</option>
     <option>MN</option>
     <option>MS</option>
     <option>MO</option>
     <option>MT</option>
     <option>NE</option>
     <option>NV</option>
     <option>NH</option>
     <option>NJ</option>
     <option>NM</option>
     <option>NY</option>
     <option>NC</option>
     <option>ND</option>
     <option>OH</option>
     <option>OK</option>
     <option>OR</option>
     <option>PA</option>
     <option>RI</option>
     <option>SC</option>
     <option>SD</option>
     <option>TN</option>
     <option>TX</option>
     <option>UT</option>
     <option>VT</option>
     <option>VA</option>
     <option>WA</option>
     <option>WV</option>
     <option>WI</option>
     <option>WY</option>
   </select>
 </div>
 </td>
 <td class="tSpacing">
  Blank
 </td>
 <td>
   <label for="exampleInputEmail1"> <br>Zip Code</label>
   <input type="email" class="form-control" name="zipCode" placeholder="Zip Code">
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
