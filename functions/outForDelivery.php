<?php
  require '../connect.php';
  $order_id = $_REQUEST['order_id'];

  $sql = "UPDATE orders SET order_status_cd = 'Out For Delivery' WHERE order_id = $order_id";
  $result = $conn->query($sql);
  if ($result) {
    $bool = true;
  } else {
    $bool = false;
  }
  header("Location: ../viewOrders.php");
?>
