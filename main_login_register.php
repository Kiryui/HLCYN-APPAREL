<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
};

if(isset($_POST['login'])){

   $email = $_POST['email'];
   $email = filter_var($email, FILTER_SANITIZE_STRING);
   $pass = sha1($_POST['pass']);
   $pass = filter_var($pass, FILTER_SANITIZE_STRING);

   $select_user = $conn->prepare("SELECT * FROM `users` WHERE email = ? AND password = ?");
   $select_user->execute([$email, $pass]);
   $row = $select_user->fetch(PDO::FETCH_ASSOC);

   if($select_user->rowCount() > 0){
      $_SESSION['user_id'] = $row['id'];
      header('location:home.php');
   }else{
      $message[] = 'incorrect username or password!';
   }

}

if(isset($_POST['register'])){

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
 
 if(isset($message)){
    foreach($message as $message){
       echo '
       <div class="message">
          <span>'.$message.'</span>
          <i class="fas fa-times" onclick="this.parentElement.remove();"></i>
       </div>
       ';
    }
 }
 
 ?>


<!DOCTYPE html>
<html lang="eng">
    <head>
    <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>HLCYN - Log in or Register</title>
        <link href="malupetnastyle.css" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://kit.fontawesome.com/d39b623768.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!--Gagawa ng Log in form-->
        <div class="container">
            <div class="curved-shape"></div>
            <div class="curved-shape2"></div>
            <div class="form-box Login">
                <h2 class="animation" style="--D:0; --S:21">Login</h2>
                <form action="" method="post">
                    <div class="input-box animation" style="--D:1; --S:22">
                    <input type="email" name="email" required placeholder="" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                        <label for="">Email</label>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box animation" style="--D:2; --S:23">
                        <input type="password" name="pass" required placeholder="" required id="MyInput" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                        <label for="">Password</label>
                        <i class='bx bxs-lock-alt' ></i>
                        <i2 class="fa-solid fa-eye-slash Eyecon"></i2>
                    </div>
                    <div class="input-box animation" style="--D:3; --S:24">
                        <button input type="login" value="Login" class="btn" name="login">Login</button>
                    </div>
                    <div class="sign-in-with animation" style="--D:3; --S:24">
                        <p>Or Log in with</p>
                    </div>
                    <div class="social-icons animation" style="--D:4; --S:25">
                        <a href="https://www.facebook.com/" class="social-icon facebook"><span class="fa fa-facebook"></span></a>
                        <a href="https://accounts.google.com/v3/signin/identifier?ifkv=AYZoVhdpZ3i4FFSTvzKL_nLDhDYLOYU2Kzh8-UXPzoM78D_QawEn8ygZGFyS2-HXwMOyiDAf40BsRA&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S620932658%3A1696429404840243&theme=glif" class="social-icon google"><span class="fa fa-google"></span></a>
                    </div>
                    <div class="regi-link animation" style="--D:4; --S:25">
                        <p>Don't have an account ? <a href="#" class="SignUpLink">Sign Up</a></p>
                    </div>
                </form>
            </div>
            <div class="info-content Login">
                <h2 class="animation" style="--D:0; --S:20">HLCYN APPAREL</h2>
                <p class="animation" style="--D:1; --S:21">Log in and start browsing your favorite TEES again!</p>
            </div>

            
            <div class="form-box Register">
                <h2 class="animation" style="--li:17; --S:0;">Register</h2>
                <form action="" method="post">
                    <div class="input-box animation" style="--li:18; --S:1;">
                        <input type="text" name="name" required placeholder="" maxlength="20"  class="box">
                        <label for="">Username</label>
                        <i class='bx bxs-user'></i>
                    </div>
                    <div class="input-box animation" style="--li:18; --S:1;">
                        <input type="phone_number" required>
                        <label for="">Phone Number</label>
                        <i class='bx bx-phone'></i>
                    </div>
                    <div class="input-box animation" style="--li:18; --S:1;">
                        <input type="email" name="email" required placeholder="" maxlength="50"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                        <label for="">Email</label>
                        <i class='bx bx-envelope'></i>
                    </div>
                    <div class="input-box animation" style="--li:19; --S:2;">
                        <input type="password" name="pass" required placeholder="" required id="MyInput" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                        <label for="">Password</label>
                        <i class='bx bxs-lock-alt' ></i>
                        <i2 class="fa-solid fa-eye-slash Eyecon"></i2>
                    </div>
                    <div class="input-box animation" style="--li:19; --S:3;">
                        <input type="password" name="cpass" required placeholder="" required id="MyInput" maxlength="20"  class="box" oninput="this.value = this.value.replace(/\s/g, '')">
                        <label for="">Confirm your password</label>
                        <i class='bx bxs-lock-alt' ></i>
                        <i2 class="fa-solid fa-eye-slash Eyecon"></i2>
                    </div>
                    <div class="input-box animation" style="--li:20; --S:4;">
                    <button input type="register" value="register now" class="btn" name="register">Register</button>
                    </div>
                    <div class="regi-link animation" style="--li:21; --S:4;">
                        <p>Already have an account? <a href="#" class="SignInLink">Sign In</a></p>
                    </div>
                </form>
            </div>
            <div class="info-content Register">
                <h2 class="animation" style="--li:17; --S:0;">HLCYN APPAREL</h2>
                <p class="animation" style="--li:18; --S:1;">Join us and start your shopping adventure with us!</p>
            </div>
        </div>
        <script src="js/programparasaanimation.js"></script>
    </body>
    </html>