<?php
require_once "conexion.php";
require_once "utils.php";

$roles = findAllRoles();

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Document</title>
</head>
<body>
    <section class="container-sm">
    <form method = "POST">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email address</label>
            <input type="email" class="form-control" name = "email" id="exampleInputEmail1" aria-describedby="emailHelp">
            <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input type="password" class="form-control"  name ="password" id="exampleInputPassword1">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Repeat your Password</label>
            <input type="password2" class="form-control"  name ="password2" id="exampleInputPassword2">
        </div>

        <div class='mb-3'>
                <label for="rol" class="col-form-label col-2">Rol</label>
                <div class='col-6'>
                    <select name="rol" id="rol" class="form-control col-3" required>

                        <option value="" disabled>----</option>
                        <?php

                        if (count($roles) > 0) :
                            foreach ($roles as $rol):
                        ?>
                                <option value="<?= $rol["id"] ?>"><?= $rol["name"] ?></option>
                        <?php
                            endforeach;
                        endif;
                        ?>

                    </select>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
<?php
if (isset($_POST["email"]) && isset($_POST["password"]) && isset($_POST["rol"])&& isset($_POST["password2"])) {
    $email = $_POST["email"];
    $pwd = $_POST["password"];
    $pwd2 = $_POST["password2"];
    $rol = $_POST["rol"];
    $exito = false;
    $errormessage = "";

    if($pwd == $pwd2){
        try {
            $con = getConnection();

            //En la bd bookdb no importan mayúsculas/minúsculas porque está usando collation caseinsensitive, pero no está demás que nuestro código no dependa de la collation de la base de datos
            $stmt = $con->prepare("select email from usuario where UPPER(email) like :email ");
            // $stmt->bindValue("search", "%" . strtoupper($terminos_busqueda) . "%");
            $search_term  =  "%". strtoupper($email) . "%";
            $stmt->bindParam("email", $search_term, PDO::PARAM_STR);

            $stmt->execute();

            // echo "<pre>";
            // $stmt->debugDumpParams();
            // echo "</pre>";

            $array = $stmt->fetchAll(PDO::FETCH_NUM);
            if (($array !== false)) {
                if (empty($array)) {


                        $pwdhash = password_hash($pwd, PASSWORD_DEFAULT);

                        $conProyecto = getConnection();
                        //Tenemos que modificar 2 tablas

                        //Comenzamos la tx
                        $conProyecto->begintransaction();

                        $insert_user = "insert into usuario (email,pwdhash)Values(:email,:pwdhash)";
                        $insert_user_rol = "insert into usuario_rol (idusuario,idrol)Values(:idusuario,:idrol)";

                        $stmt = $conProyecto->prepare($insert_user);
                        $stmt->bindParam("email", $email, PDO::PARAM_STR);
                        $stmt->bindParam("pwdhash", $pwdhash, PDO::PARAM_STR);
                        $exito = $stmt->execute();

                        $user_id = $conProyecto->lastInsertId();

                        $stm_rol = $conProyecto->prepare($insert_user_rol);
                        $stm_rol->bindParam("idusuario", $user_id, PDO::PARAM_STR);
                        $stm_rol->bindParam("idrol", $rol, PDO::PARAM_STR);


                        //Ejecutamos y reemplazamos los parámetros con un array
                        $exito = $exito && $stm_rol->execute();


                        if ($exito) {
                            $conProyecto->commit();
                        } else
                            $conProyecto->rollBack();
                        }
                   
                } else {
                    $errormessage = "El usuario ya esta registrado";    
                }

        } catch (Exception $e) {
            echo "<p>Ha ocurrido una excepción: " . $e->getMessage() . "</p>";
        }
        //Cerramos los recursos
        $con = null;
        $stmt = null;

    } else {
        $errormessage = " Las contraseñas no son iguales";    
    }

    if($exito){?>
        <div class="alert alert-success" role="alert">
        Usuario registrado con exito
        </div>
        <?php }else{ ?>

        <div class="alert alert-danger" role="alert">
            <?php
            echo $errormessage;
            ?>
        </div>

<?php }
    }
?>
</section>

</body>
</html>