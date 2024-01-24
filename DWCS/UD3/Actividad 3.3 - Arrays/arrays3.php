<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$input = -3;

$array = [];

if($input > 0){

    for($i=0; $i<=$input; $i++){
        array_push($array, $i);

    }
}else{
    for($i=$input; $i<=0;$i++){
        array_push($array, $i);
  }
}
print"<pre>";
print_r($array);
print"</pre>";
?>
</body>
</html>