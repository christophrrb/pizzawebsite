<?php
$conn = new mysqli('localhost', 'root', '', 'hscc_pizza');

if ($conn->connect_error) {
  die ("Connection Error: " . $conn->connect_error);
}
  echo "Connected successfully!";
?>
