<?php

foreach ($_POST as $clave => $valor) {

    echo "<strong>$clave</strong>:";

    if (!is_array($valor)) {

        echo " $valor";
    } else {

        echo var_dump($valor);
    }

    echo "<br/>";
}

/*
  Si se incluyen <input type="file"> hay que añadir el atributo    enctype="multipart/form-data" a form.
  El fichero/los ficheros se recibirán en el lado servidor en la variable global $_FILES
 */
foreach ($_FILES as $input => $infoArr) { //$input será el valor de name en el marcado HTML (sin corchetes)
    
    foreach ($infoArr as $key => $value) {
        echo "<p>" .$key . " </p>";
       
        foreach ($value as $i => $value2) {
            
            echo "<strong>" .$i . " </strong>:";
    
            echo $value2 . "<br>";
           
        }


    }
    
    
    
    if (is_array($infoArr["name"])) { //Si se envía un array de ficheros con el valor de name  en <input type="file"> terminado en []
        //Se recibe un array asociativo con claves "name", "type", "tmp_name", "error" y "size" y por cada clave, un array de índices numéricos con los valores de cada fichero por cada clave
        foreach ($infoArr["name"] as $i => $value) {

            echo "<strong>File name " . ++$i . " </strong>:";

            echo $value . "<br>";
           
        }
        
     
        
    } else { //Si se envía un único fichero (El valor del atributo name en <input type="file"> no termina con [])
        echo "<strong>File name</strong>: ";

        echo $infoArr["name"] . "<br>";
    }
}


/*
Estructura del array recibido en el servidor, en caso de múltiples ficheros:

Array(["nombre_input"] =>   Array (
							["name"] => Array(
											[0] => nombre_fichero_0.ext
											[1] => nombre_fichero_1.ext	
											...
											),
							["type"] => Array(
											[0] => tipo_fichero_0
											[1] => tipo_fichero_1
											....
											),
							["tmp_name"] => Array(
											[0] => C:\xampp\tmp\algo_0.tmp
											[1] => C:\xampp\tmp\algo_1.tmp
											....
											), 
							["error"] => Array(
											[0] =>Código de error fichero_0 https://www.php.net/manual/en/features.file-upload.errors.php
											[1] =>Código de error fichero_1
											....
											), 
							["size"] => Array(
											[0] => tamaño en bytes
											[1] => tamaño en bytes
											....
                                            ),
                                            // a partir de PHP 8.1.0
                            ["full_path"] => Array(
											[0] => ruta enviada por el navegador del fichero 0
											[1] => ruta enviada por el navegador del fichero 1
											....
											)                

							)
	)

*/