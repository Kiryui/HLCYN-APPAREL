<?php

include '../cashier/cashier_connect.php';

session_start();

$cashier_id = $_SESSION['cashier_id'];

if(!isset($cashier_id)){
   header('location:cashier_login.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>dashboard</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../cashier/cashier_header.php'; ?>

<section class="dashboard">

   <h1 class="heading">dashboard</h1>

   <div class="box-container">

      <div class="box">
         <h3>welcome!</h3>
         <p><?= $fetch_profile['name']; ?></p>
         <a href="cashier_update_profile.php" class="btn">update profile</a>
      </div>

      <div class="box">
         <?php
            $total_pendings = 0;
            $select_pendings = $conn->prepare("SELECT * FROM `orders` WHERE payment_status = ?");
            $select_pendings->execute(['pending']);
            if($select_pendings->rowCount() > 0){
               while($fetch_pendings = $select_pendings->fetch(PDO::FETCH_ASSOC)){
                  $total_pendings += $fetch_pendings['total_price'];
               }
            }
         ?>
         <h3><span>$</span><?= $total_pendings; ?><span>/-</span></h3>
         <p>total pendings</p>
         <a href="cashier_placed_orders.php" class="btn">see orders</a>
      </div>

      <div class="box">
         <?php
            $total_completes = 0;
            $select_completes = $conn->prepare("SELECT * FROM `orders` WHERE payment_status = ?");
            $select_completes->execute(['completed']);
            if($select_completes->rowCount() > 0){
               while($fetch_completes = $select_completes->fetch(PDO::FETCH_ASSOC)){
                  $total_completes += $fetch_completes['total_price'];
               }
            }
         ?>
         <h3><span>$</span><?= $total_completes; ?><span>/-</span></h3>
         <p>completed orders</p>
         <a href="cashier_placed_orders.php" class="btn">see orders</a>
      </div>

      <div class="box">
         <?php
            $select_orders = $conn->prepare("SELECT * FROM `orders`");
            $select_orders->execute();
            $number_of_orders = $select_orders->rowCount()
         ?>
         <h3><?= $number_of_orders; ?></h3>
         <p>orders placed</p>
         <a href="cashier_placed_orders.php" class="btn">see orders</a>
      </div>





      <div class="box">
         <?php
            $select_cashier = $conn->prepare("SELECT * FROM `cashier`");
            $select_cashier->execute();
            $number_of_cashier = $select_cashier->rowCount()
         ?>
         <h3><?= $number_of_cashier; ?></h3>
         <p>cashier users</p>
         <a href="cashier_accounts.php" class="btn">see cashier users</a>
      </div>


   </div>

</section>












<script src="../js/cashier_script.js"></script>
   
</body>
</html>