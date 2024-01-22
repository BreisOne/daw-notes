<?php
  require_once 'utils.php';
  iniciarSesion()
  ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actividad 5.3</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-sm-12 col-md-6">
        <h1>Contenido de la sesión</h1>
        <?php
        guardarTextos();
        if(isset($_SESSION["textos"])){
            echo "<ul>";
            foreach ($_SESSION["textos"] as $key => $value) {
                echo "<li>";
                print($value);
                echo "</li>";
            }
            echo "</ul>";
        }

        if (isset($_POST["btnCerrar"])) {
            cerrarSesion();
            header("Location: index.php");
            exit;
        }
        ?>
        <form method = "post">
        <div class="form-group">
            <label for="exampleInputEmail1">Texto</label>
            <input type="text" class="form-control" name="texto" id="texto" placeholder="Introduce un texto">
        </div>
        <div>
        <button type="submit" class="btn btn-primary">Enviar</button>
        <?php if(isset($_SESSION["textos"])){
            echo "<button type='submit' name ='btnCerrar' class='btn btn-secondary'>Cerrar sesión</button>";
        }
        ?>
        </div>
  
</form>
</div>
</div>
</div>
</body>
</html>