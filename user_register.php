<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['submit'])){

   $name = $_POST['name'];
   $name = filter_var($name, FILTER_SANITIZE_STRING);
   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);
   $cpass = sha1($_POST['cpass']);
   $cpass = filter_var($cpass, FILTER_SANITIZE_STRING);

   $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ?");
   $select_user->execute([$email,]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if($select_user->rowCount() > 0){
      $message[] = 'email already exists!';
   }else{
      if($pass != $cpass){
         $message[] = 'confirm password not matched!';
      }else{
         $insert_user = $conn->prepare("INSERT INTO `users`(name, email, password) VALUES(?,?,?)");
         $insert_user->execute([$name, $email, $cpass]);
         $message[] = 'registered successfully, login now please!';
      }
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>login</title>

   <title>HLCYN - Log in or Sign up</title>
        <link rel="stylesheet" href="malupetnastyle.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/d39b623768.js" crossorigin="anonymous"></script>

</head>
<body>
   
<div class="container">
            <div class="curved-shape"></div>
            <div class="curved-shape2"></div>
            <div class="form-box Login">
            <h2 class="animation" style="--li:17; --S:0;">HLCYN Register</h2>

<form action="#" method="post">
      
<div class="input-box animation" style="--li:18; --S:1;">
            <input type="text" name="name" required placeholder="" maxlength="20"  class="box">           
            <label for="">Username</label>
            <i class='bx bxs-user'></i>
</div>

<div class="input-box animation" style="--li:18; --S:1;">
            <input type="email" name="email" required placeholder="" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
            <label for="">Email</label>
            <i class='bx bx-envelope'></i>
</div>

<div class="input-box animation" style="--li:19; --S:2;">
            <input type="password" name="pass" required placeholder="" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
         
            <label for="">Password</label>
            <i class='bx bxs-lock-alt' ></i>
</div>

<div class="input-box animation" style="--li:19; --S:2;">
            <input type="password" name="cpass" required placeholder="" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
            <label for="">Confirm Password</label>
            <i class='bx bxs-lock-alt' ></i>
</div>
      
      
<div class="input-box animation" style="--li:20; --S:3;">    
            <button input type="submit" value="register now" class="btn" name="submit">Register</button>
</div>

<div class="regi-link animation" style="--li:21; --S:4;">
            <p>Already have an account ? <a href="user_login.php" class="SignInLink">Sign In</a></p>
</div>


   </form>

</section>


<script src="programparasaanimation.js"></script>

</body>
</html>