<?php
ob_start();

require_once 'util.php';

if (!isUserLoggedIn()) {
    header("Location: login.php");
    exit;
}
?>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHPWebPage.php to edit this template
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Welcome page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>
        <?php
        if (isset($_POST["btnCerrar"])) {
            cerrarSesion();
            header("Location: login.php");
            exit;
        }
        ?>
        <div class="container-fluid">
            <h1> Bienvenid@ 
                <?php
                iniciarSesion();
                
                if (!isset($_SESSION["visitas"])) {
                    $_SESSION["visitas"] = 1;
                } else {
                    ++$_SESSION["visitas"];
                }
                $_SESSION["ultimoAcceso"] = time();
                echo $_SESSION["user"];
                ?>!
            </h1>

            <p> Ha visitado la página <?php echo $_SESSION["visitas"]; ?> veces </p>

            <dl>
                <dt> Nombre cookie: </dt> <dd><?= session_name(); ?></dd>
                <dt> SID cookie: </dt> <dd><?= session_id() ?></dd>
                <dt> Directorio de sesiones: </dt> <dd><?= session_save_path() ?></dd>
                <dt> Contenido de $_SESSION: </dt> <dd><?php print_r($_SESSION); ?></dd>
            </dl>
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-6">
                    <form method="post">
                        <input type="submit" class="btn btn-primary btn-block mb-4" value="Cerrar sesión" name="btnCerrar"></button>

                    </form>


                </div>
                </body>
                </html>
                <?php ob_end_flush() ?>
