<?php

include 'cashier_connect.php';

session_start();
session_unset();
session_destroy();

header('location:../cashier/cashier_login.php');

?>