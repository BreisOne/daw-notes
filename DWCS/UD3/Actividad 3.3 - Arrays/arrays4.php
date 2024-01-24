<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$input = 10;

$array = [];

for($i=0; $i<=10; $i++){

    $array["$input x $i"] = $input * $i;
    
}

print "<pre>";
print_r($array);
print"</pre>";
?>
</body>
</html>