<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php
const VALOR_MIN = 2;

$n = 5;
$suma = 1;
$ter = 1;

$k = 0;
 while (($k++ <=$n) && ($suma < VALOR_MIN)){
    $ter = $ter/2;
    echo "<p> Sumando : $suma + $ter </p>";
    $suma += $ter;
}
 
echo "<p> Suma vale $suma </p>"
 ?>

</body>
</html>