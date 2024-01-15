<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Cáculo de Calificación final</h1>
    <form method="POST">
        <div>
            <label for="calificaciones_1">Introduzca las calificaciones separadas por /.
                Por ejemplo: 5/4 </label>
            <input name="calificaciones_1" id="calificaciones_1" type="text">
        </div>
        <div>
            <label for="calificaciones_2">Introduzca nº columnas:</label>
            <input name="calificaciones_2" id="calificaciones_2" type="text">
        </div>
        
        <div><input type="submit" value="Enviar"></div>
    </form>
<section>

<?php

use function PHPSTORM_META\type;

    if (isset($_POST["calificaciones_1"]) && isset($_POST["calificaciones_2"])) {
        $cal1 = $_POST["calificaciones_1"];
        $cal2 = $_POST["calificaciones_2"];

        $notas = explode("/", $cal1);
        echo "<pre>";
        print_r($notas);
        echo"</pre>";

        $pesos = explode("%", $cal2);
        echo "<pre>";
        print_r($pesos);
        echo"</pre>";
        
        function corregirNotas(&$notas){

            foreach ($notas as &$nota) {
                $nota += $nota*0.1;
                if($nota > 10){
                    $nota = 10;
                }
            }
            unset($nota);
        }
        
        function sumaPesos ($pesos){
            $suma = 0;
            $MAX_PERCENT = 100;
            foreach ($pesos as $peso) {

                $suma += $peso;
            }
                return $suma == $MAX_PERCENT;

        }

        function igualdadOperadores($notas, $pesos):bool{
            return count($notas) == count($pesos);
        }

        function mediaPonderada($notas, $pesos){
            $media = 0;

           for ($i=0; $i <count($notas) ; $i++) {
            $ponderacion = $notas[$i]*$pesos[$i];
            $media += $ponderacion;
           }
            $media = $media/100;
           return $media;
        }
        
        // corregirNotas($notas);

        // echo "<p> Notas corregidas </p><pre>";
        // print_r($notas);
        // echo "</pre>";

        if(sumaPesos($pesos)){
            if(igualdadOperadores($notas, $pesos)){
                corregirNotas($notas);
                $media = mediaPonderada($notas, $pesos);
                echo "<p>La media es: $media</p>";

            }else{
                echo "Los operadores no son iguales";
            }
        }else{
            echo"Los porcentages deben sumar 100";
        }


    }
?>
</section>


</body>
</html>