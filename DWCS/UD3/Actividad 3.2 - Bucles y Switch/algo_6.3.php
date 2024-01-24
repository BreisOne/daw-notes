<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$nota = 9;
//Haciendo conversion a entero con (int) o intval
switch (intval($nota)) {
  case 10:
    echo "<p>El alumno ha obtenido una mastrícula de honor </p>";
    break;
  
  case 9:
      echo "<p>El alumno ha obtenido un sobresaliente </p>";
      break; 
  case 8:
  case 7:
      echo "<p>El alumno ha obtenido un notable</p>";
      break; 
  case 6:
  case 5:
      echo "<p>El alumno ha obtenido un aprobado</p>";
      break; 
  
  default:
      echo "<p>El alumno ha obtenido un suspenso</p>";
    break;
}

?>
</body>
</html>