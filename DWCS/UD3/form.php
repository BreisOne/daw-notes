
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Estos son los datos de tu formulario:</h1>
    
<?php

//cambiar $_POST por $_GET en función del método HTTP utilizado
foreach ($_POST as $clave => $valor) {

    echo "<strong>$clave</strong>:";

    if (!is_array($valor)) {

        echo "$valor";

    } else {

        echo var_dump($valor);
    }

    echo "<br/>";
}
?>
</body>
</html>
