<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ejemplo tablas HTMLS y FORM</h1>
    <form method="POST">
        <div>
            <label for="filas">Introduzca nº filas: </label>
            <input name="filas" id="filas" type="number">
        </div>
        <div>
            <label for="colms">Introduzca nº columnas:</label>
            <input name="colms" id="colms" type="number">
        </div>
        
        <div><input type="submit" value="Enviar"></div>
    </form>

<?php
        function constructor_array(int $fils, int $colms):array{
            $array_bidimensional =[];

            for ($i=0; $i < $fils; $i++) {   
                $array_bidimensional[$i]=[];

                for ($k=0; $k < $colms ; $k++) { 
                    
                    $number_random = rand(0,10); 
                    $array_bidimensional[$i][$k]= $number_random;
                }
            }

            return $array_bidimensional;

        }

        function tabla_de_array_bidimensional($array_bidimensional){
            
            echo "<thead>";
            echo"<tr>";    

            for ($i=0; $i < count($array_bidimensional[0]); $i++) {
                        $k = $i+1;
                        echo "<th> Colum $k </th>";
                    }         
            echo "</tr>";
            echo "</thead>";

            echo"<tbody>";                
            foreach ($array_bidimensional as $value) {
                echo "<tr>";
                foreach($value as $value2) { 
                        echo"<td>$value2</td>";
                }
                echo"</tr>";
            }
            echo"</tbody>";
        }         

        if (isset($_POST["filas"]) && isset($_POST["colms"])) {
           $filas = $_POST["filas"];
           $columnas = $_POST["colms"];

            echo "<p>El numero de filas es: $filas, numero de columnas es: $columnas";   

        }
?>
<section>
<table>
<?php
    if (isset($_POST["filas"]) && isset($_POST["colms"])) {
        $array_bidimensional = constructor_array($filas,$columnas);
        tabla_de_array_bidimensional($array_bidimensional);
        }
?>
</table>
</section>


</body>
</html>