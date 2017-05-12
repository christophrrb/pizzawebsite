<html>
<?php
require 'connect.php';
session_start();
$_SESSION['hithere'] = "Hi there!";
echo $_SESSION['hithere'];
$_SESSION['byethere'] = "Bye there!";
echo $_SESSION['byethere'];

// For a single SQL row.
$sql = "SELECT topping_category_desc FROM topping_categories LIMIT 1";  // Select ONLY one, instead of all
$result = $conn->query($sql);
$row = $result->fetch_assoc();
echo 'Game ID: '.$row['topping_category_desc'];

$sql = ("SELECT pizza_desc FROM pizza_type");
$result = $conn->query($sql);
?>

<!-- Radio Buttons -->
<form action="test2.php" method="post">
<?php
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    echo "<div class='form-check'>
  <label class='form-check-label'>
    <input class='form-check-input' type='radio' name='typeofPizza' value='
      ".$row['pizza_desc']." '>"
    .$row['pizza_desc']."
  </label>
</div>";
  }
}
?>

<!--Checkboxes-->
<table>
<?php
$catSQL = ("SELECT topping_category_desc FROM topping_categories");
$catResult = $conn->query($catSQL);

if ($catResult->num_rows > 0) {
  $x = 1;
  while ($catRow = $catResult->fetch_assoc()) {
    echo "<table class='floating-box'><tr><th>".$catRow['topping_category_desc']."</th></tr>";

    $ToppingSQL = ("SELECT topping_desc, topping_price FROM toppings WHERE topping_category_id = $x");
    $ToppingResult = $conn->query($ToppingSQL);

    if ($ToppingResult->num_rows > 0) {
      while ($ToppingRow = $ToppingResult->fetch_assoc()) {

        echo "<tr>
                <td>
                  <div class='form-check'>
                  <label class='form-check-label'>
                  <input class='form-check-input' type='checkbox' name='exampleCheckboxes[]' value='".$ToppingRow['topping_desc']."'>"
                  .$ToppingRow['topping_desc']."
                  </label>
                  </div></td></tr>";
      }
      echo "</table>";
    }
    $x++;
  }
}

// $row = 0;
// while ($row < 5) {
//   echo "<p><b>Row number $row</b></p>";
//   echo "<ul>";
//   for ($col = 0; $col < 1; $col++) {
//     echo "<li>".$array[$row][$col]."</li>";
//   }
//   echo "</ul>";
//   $row++;
// }
?>

<?php
  $words = "Hi ";
  $words.= "there. <br>";

  echo $words;
?>
</table>
<input type="submit">
</form>

<!--/* All of the ones that did not work.

$id = mysql_result(mysql_query("SELECT topping_category_desc FROM topping_categories LIMIT 1"),0);
echo $id;*/


/* $sql = ("SELECT topping_category_desc FROM topping_categories WHERE id = 1 LIMIT 1");
/*$result = mysql_fetch_assoc($sql);
echo $result['topping_category_desc']; */
/*$result = $conn->query($sql);
$row = $result->fetch_assoc();
echo $row['topping_category_desc'];
-----------------------—--------—
if ($result->num_rows > 0) {
  while ($row = $result->fetch_assoc()) {
    echo $row['topping_category_desc'] . "<br>";
  }
} else {
  echo "Nothing.";
} */ -->
</html>
