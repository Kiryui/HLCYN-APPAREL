<?php

include '../cashier/cashier_connect.php';

session_start();

$cashier_id = $_SESSION['cashier_id'];

if(!isset($cashier_id)){
   header('location:cashier_login.php');
}

if(isset($_GET['delete'])){
   $delete_id = $_GET['delete'];
   $delete_cashier = $conn->prepare("DELETE FROM `cashier` WHERE id = ?");
   $delete_cashier->execute([$cashier_id]);
   header('location:cashier_accounts.php');
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>cashier accounts</title>

   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>

<?php include '../cashier/cashier_header.php'; ?>

<section class="accounts">

   <h1 class="heading">cashier accounts</h1>

   <div class="box-container">

   <div class="box">
      <p>add new cashier</p>
      <a href="cashier_register.php" class="option-btn">register cashier</a>
   </div>

   <?php
      $select_accounts = $conn->prepare("SELECT * FROM `cashier`");
      $select_accounts->execute();
      if($select_accounts->rowCount() > 0){
         while($fetch_accounts = $select_accounts->fetch(PDO::FETCH_ASSOC)){   
   ?>
   <div class="box">
      <p> cashier id : <span><?= $fetch_accounts['id']; ?></span> </p>
      <p> cashier name : <span><?= $fetch_accounts['name']; ?></span> </p>
      <div class="flex-btn">
         <a href="cashier_accounts.php?delete=<?= $fetch_accounts['id']; ?>" onclick="return confirm('delete this account?')" class="delete-btn">delete</a>
         <?php
            if($fetch_accounts['id'] == $cashier_id){
               echo '<a href="cashier_update_profile.php" class="option-btn">update</a>';
            }
         ?>
      </div>
   </div>
   <?php
         }
      }else{
         echo '<p class="empty">no accounts available!</p>';
      }
   ?>

   </div>

</section>












<script src="../js/admin_script.js"></script>
   
</body>
</html>