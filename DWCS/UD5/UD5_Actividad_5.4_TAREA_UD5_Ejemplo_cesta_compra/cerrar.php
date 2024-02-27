<?php
session_start();
unset($_SESSION['nombre']);
unset($_SESSION['cesta']);
header('Location:login.php');