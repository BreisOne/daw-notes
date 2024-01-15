<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Operaciones aritméticas</h1>
    <form method="POST">
        <div> 
            <label for="operacion">Seleccione una oepración:</label>
            <select name="operacion" id="operacion" >
                <option value="1">Suma</option>
                <option value="2">Producto</option>
            </select>
        </div>
        <div>
            <label for="operador1">Operador 1: </label>
            <input name="operador1" id="operador1" type="number" step="0.01">
        </div>
        <div>
            <label for="operador2">Operador 2:</label>
            <input name="operador2" id="operador2" type="number" step="0.01">
        </div>
        
        <div><input type="submit" value="Enviar"></div>
    </form>

</body>
<?php
        const OP_SUMA = 1;
        const OP_PROD = 2;
        
        /* include 'operar.php'; en caso de querer llevar la función a otro archivo independiente*/
        function Operar(int $tipo_operacion, float $op1, float $op2){
            if($tipo_operacion == OP_SUMA){
            
                $suma = $op1 +$op2;
                 echo "<p>La suma es: $suma</p>"; 
                
            } else{
                $producto = $op1 * $op2;

                echo "<p>El producto es: $producto</p>";

            }
        }

        if (isset($_POST["operacion"]) && isset($_POST["operador1"]) && isset($_POST["operador2"])) {
           $operacion = $_POST["operacion"];
           $operador1 = $_POST["operador1"];
           $operador2 = $_POST["operador2"];

            echo "<p>Operacion: $operacion, operador1: $operador1, operador 2: $operador2 </p>";

            if($operacion == OP_SUMA){
                
                $suma = $operador1 +$operador2;
                 echo "<p>La suma es: $suma</p>"; 
                
            } else{
                $producto = $operador1 * $operador2;

                echo "<p>El producto es: $producto</p>";

            }
            
            Operar($operacion,$operador1,$operador2);
            
        }
        ?>
</html>