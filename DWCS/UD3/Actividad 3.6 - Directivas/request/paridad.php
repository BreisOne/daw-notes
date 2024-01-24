<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Other/html.html to edit this template
-->
<html>

<head>
    <title>Resultado del cálculo de paridad</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <?php

    ini_set("request_order","P");

    foreach ($_REQUEST as $clave => $valor) {
        echo "<strong>$clave</strong>:";

        if (!is_array($valor)) {
            echo " $valor <br/>";
            echo "El tipo de \$valor es: " . gettype($valor) . "<br/>";
            if (is_int($valor)) {
                echo "Es entero <br/>";
            } else {
                echo "No es entero <br/>";
            }
            if (is_numeric($valor)) {
                echo "Es numérico <br/>";
            } else {
                echo "No es numérico <br/>";
            }

            if ($valor % 2 == 0) {
                echo "El número $valor es par";
            } else {
                echo "El número $valor es impar";
            }
        }
        echo "<br/>";
    }
    ?>
</body>

</html>