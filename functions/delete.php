<?php
require '../connect.php';
$order_id = $_REQUEST['order_id'];

  //$sql_update_to_canceled sets order_status_cd to Canceled because the order beasically is canceled.
  $sql_update_to_canceled = "UPDATE orders SET order_status_cd = 'Canceled' WHERE order_id=$order_id";
  $sql_delete = "DELETE FROM pizza WHERE order_id=$order_id"; //This actually deletes the variable.
  $update_result = $conn->query($sql_update_to_canceled);
  $delete_result = $conn->query($sql_delete);

  if ($update_result && $delete_result) {
    //variables not used, but...
    $bool = true;
  } else {
    $bool = false;
  }

  header("Location: ../viewOrders.php");
?>
