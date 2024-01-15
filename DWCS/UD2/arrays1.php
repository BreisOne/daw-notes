<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

const PAGO_HORA_EXTRA = 12.5;
$acumulador = 0;

$horas_extra = [
    16,
    67,
    56,
    3,
    6
];

for($i=0; $i<count($horas_extra); $i++){
    
    $acumulador += $horas_extra[$i]*PAGO_HORA_EXTRA;
    
}

echo "<p> El pago de horas extra es: $acumulador </p>"
?>
</body>
</html>