<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$suma = 0;

$TOP_5_ibex = [
    "IAG" => 3.55,
    "IBERDROLA" => 1.14,
    "ENDESA" => 0.6,
    "ENAGAS" => 0.36 ,
    "REFEIA" => 0.17
];

foreach($TOP_5_ibex as $key => $value){

    echo "La acción de la empresa $key sube un $value % <br>";

    $suma += $value;
        
}

$media = $suma/count($TOP_5_ibex);
$media2 = array_sum($TOP_5_ibex)/count($TOP_5_ibex);

echo"La media de los valores del array es $media y $media2"
?>
</body>
</html>