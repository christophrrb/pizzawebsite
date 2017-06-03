<?php
  $order_id = $_REQUEST['order_id'];
?>

<script>
function hello() {
  alert("Hi.");
}

hello();
</script>

<script>
if(isset($_REQUEST['order_id'])) {
function pending() {
  <?php
    $sql = "UPDATE orders SET order_status_cd = 'Pending' WHERE order_id = $order_id";
    $result = $conn->query($sql);
    if ($result) {
      $bool = true;
    } else {
      $bool = false;
    }
  ?>

  var bool = "<?php echo $bool ?>";
  alert (bool);
}

function outForDelivery() {
  <?php
    $sql = "UPDATE orders SET order_status_cd = 'Out for Delivery' WHERE order_id = $order_id";
    $result = $conn->query($sql);
  ?>
}

function delivered() {
  <?php
    $sql = "UPDATE orders SET order_status_cd = 'Delivered' WHERE order_id = $order_id";
    $result = $conn->query($sql);
  ?>
}

function canceled() {
  <?php
    $sql = "UPDATE orders SET order_status_cd = 'Canceled' WHERE order_id = $order_id";
    $result = $conn->query($sql);
  ?>
}
}
</script>
