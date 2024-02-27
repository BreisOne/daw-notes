<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>


    <?php
    require_once "conexion.php";
    require_once "util.php";
    ?>
    <div class="container-fluid">
        <h1 class="text-center">Inicio de sesión</h1>

        <div class="row justify-content-center">
            <div class="col-sm-12 col-md-6">
                <form method="post">
                    <!-- Email input -->
                    <div class="form-group mb-4 ">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" id="email" class="form-control" name="email" required />

                    </div>

                    <!-- Password input 1-->
                    <div class="form-group mb-4">
                        <label class="form-label" for="pwd">Contraseña</label>
                        <input type="password" id="pwd" class="form-control" name="pwd" required />

                    </div>


                    <!-- Submit button -->
                    <input type="submit" class="btn btn-primary btn-block mb-4" value="Iniciar sesión"></button>

                    <a href="register.php" class="btn btn-secondary btn-block mb-4"  role="button"
                        aria-disabled="true">Regístrese aquí</a>

                </form>

            </div>
        </div>
        <?php

        if (isset($_POST["email"], $_POST["pwd"])) {

            $email = $_POST["email"];
            $pwd = $_POST["pwd"];


            $usuario = find_user_by_email($email);
            //si usuario es array vacío o se ha devuelto false (por error o porque no existe)
            if (empty($usuario)) {

                show_message("No se ha encontrado el usuario", "danger");
            } else {
                if (password_verify($pwd, $usuario["pwdhash"])) {
                    show_message("Enhorabuena, se ha autenticado con éxito", "success");
                    print_r($usuario["roles"]);
                } else {
                    show_message("No se ha encontrado un usuario y/o contraseña coincidentes", "danger");
                }
            }
        }
        ?>
    </div>
</body>

</html>