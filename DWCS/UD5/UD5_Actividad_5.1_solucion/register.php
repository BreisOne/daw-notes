<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>


    <?php
    require_once "conexion.php";
    require_once "util.php";
    ?>
    <div class="container-fluid">
        <h1 class="text-center">Registro de usuario</h1>

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
                    <!-- Password input 2-->
                    <div class="form-group mb-4">
                        <label class="form-label" for="pwd2">Repita contraseña</label>
                        <input type="password" id="pwd2" class="form-control" name="pwd2" required />

                    </div>
                    <!-- roles -->

                    <div class="form-group mb-4">
                        <label class="form-label" for="rol">Seleccione el rol:</label>

                        <select name="rol" id="rol" required>
                            <?php

                            $app_roles = find_all_roles();
                            foreach ($app_roles as $rol) { ?>


                                <option value="<?= $rol["id"] ?>">
                                    <?= $rol["name"] ?>
                                </option>
                            <?php } ?>
                        </select>
                    </div>

                    <!-- Submit button -->
                    <input type="submit" class="btn btn-primary btn-block mb-4" value="Registrar usuario"></button>
                    <p><a class="link-opacity-100" href="login.php">Login</a></p>

                </form>

            </div>
        </div>
        <?php

        if (isset($_POST["email"], $_POST["pwd"], $_POST["pwd2"], $_POST["rol"])) {

            $email = $_POST["email"];
            $pwd = $_POST["pwd"];
            $pwd2 = $_POST["pwd2"];
            $rol_id = $_POST["rol"];

            if (check_pwd_equals($pwd, $pwd2)) {
                $usuario = find_user_by_email($email);
                //si usuario es array vacío o se ha devuelto false (por error o porque no existe)
                if (empty($usuario)) {

                    $pwd_hash = password_hash($pwd, PASSWORD_BCRYPT);
                    $user_id = create_user($email, $pwd_hash, $rol_id);
                    if ($user_id == null) {
                        show_message("Ha ocurrido un error y el usuario no ha podido crearse.", "danger");

                    } else {

                        show_message("El usuario se ha creado con éxito", "success");

                    }

                } else {
                    show_message("El usuario $email ya está registrado", "danger");

                }

            } else {
                show_message("Las contraseñas no coinciden", "danger");
            }
        }
        ?>
    </div>
</body>

</html>