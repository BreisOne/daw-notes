<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHPWebPage.php to edit this template
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>Change password</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    </head>
    <body>

        <div class="container-fluid">
            <h1>Cambio de contraseña</h1>
            <div class="row justify-content-center">
                <div class="col-sm-12 col-md-6">
                    <form method="post">
                        <!-- Email input -->
                        <div class="form-group mb-4 ">
                            <label class="form-label" for="email">Email address</label>
                            <input type="email" id="email" class="form-control" name="email"  required/>

                        </div>

                        <!-- Current Password input -->
                        <div class="form-group mb-4">
                            <label class="form-label" for="currentPwd">Contraseña actual</label>
                            <input type="password" id="currentPwd" class="form-control" name="pwd" required/>

                        </div>

                        <!-- New Password input 1-->
                        <div class="form-group mb-4">
                            <label class="form-label" for="newPwd1">Nueva contraseña</label>
                            <input type="password" id="newPwd1" class="form-control" name="newPwd1" required/>

                        </div>

                        <!-- New Password input 2-->
                        <div class="form-group mb-4">
                            <label class="form-label" for="newPwd2">Repita nueva contraseña</label>
                            <input type="password" id="newPwd2" class="form-control" name="newPwd2" required/>

                        </div>

                        <!-- Submit button -->
                        <input type="submit" class="btn btn-primary btn-block mb-4" value="Cambiar contraseña"></button>


                    </form>

                    <?php

                    require_once 'util.php';
                   
                    const MIN_LENGH = 6;
                    $usuarios = array("user1@edu.es" => array("pwd" => "Abc123.", "pwd-1" => "aBc123.", "pwd-2" => "abC123."),
                        "user2@edu.es" => array("pwd" => "123Abc.", "pwd-1" => "123aBc.", "pwd-2" => "123abC."));
                    $simbolos = [".", "?", "@"];
                  
                    $numeros = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

                    const USER_DOES_NOT_EXIST = "No existe usuario";
                    const PWD_INCORRECT = "La contraseña no es correcta";
                    const PWD_MISMATCH = "Las contraseñas no coinciden";
                    const MIN_LENGTH_ERROR = "La longitud mínima es " . MIN_LENGH;
                    const PWD_USED = "La contraseña es una de las 2 últimas utilizadas";
                    const UPPER_CASE_NEEDED = "La nueva contraseña debe contener al menos una letra mayúscula";
                    const NUMBER_NEEDED = "La nueva contraseña debe contener al menos un número";
                    const SYMBOL_NEEDED = "La nueva contraseña debe contener al menos un símbolo: ";

                    //Completar
                   
                    if (isset($_POST["email"]) && isset($_POST["pwd"]) && isset($_POST["newPwd1"]) && isset($_POST["newPwd2"])) {
                        
                        $email = $_POST["email"];
                        $currrentPwd = $_POST["pwd"];
                        $newPwd1 = $_POST["newPwd1"];
                        $newPwd2 = $_POST["newPwd2"];
                        $errors = [];
                        $containsNumbers = false;
                        $containsSymbol = false; 

                        $errors = checkUser($email, $usuarios, $errors);

                        $errors = checkPwd($currrentPwd, $email, $usuarios, $errors);

                        $errors = pwd1Equalpwd2($newPwd1, $newPwd2, $errors);

                        $errors = minimunLength($newPwd1, $errors);

                        $errors = pwdUsed($newPwd1, $usuarios, $email, $errors);
                        
                        $errors = containsUpperCase($newPwd1, $errors);

                        $errors = containsNumber($numeros, $newPwd1, $containsNumbers, $errors);

                        $errors = containsSymbols($simbolos, $newPwd1, $containsSymbol, $errors);

                    }
                    
                    if (empty($errors)){

                        echo"<div class='alert alert-success' role='alert'>
                                Se ha actualizado correctamente la contraseña 
                            </div>";

                    }else{
                        echo "<div class='alert alert-danger' role='alert'>";
                        foreach ($errors as $error) {
                            echo "<p>" . $error . "</p>";
                        }
                        echo"</div>";
                    }
            
                    ?>
           

                        
                   </div>
            </div>
        </div>


    </body>
</html>

