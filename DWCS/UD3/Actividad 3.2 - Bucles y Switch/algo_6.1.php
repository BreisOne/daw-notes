<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php
$n = 10;

echo "Lista de los divisores del número $n: <ul>";
 for ($i = $n;$i>=2;$i--){
   if(($n % $i)==0){
    echo "<li>$i</li>";
   }
}
echo "</ul>";

?>
</body>
</html>