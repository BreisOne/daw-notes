<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$cont = 0;

do{
  $tirada = rand(1,6);
  $cont++;
  echo "La tirada ha obtenido un $tirada <br>";

}while ($tirada !=5);

echo "<li> La tirada ha obtedino un: $tirada en $cont tiradas </li>";

?>
</body>
</html>