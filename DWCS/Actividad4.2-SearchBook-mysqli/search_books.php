<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Búsqueda</title>
</head>

<body>
    <h1>Búsqueda de libros</h1>

    <form method="GET">
        <label for="busqueda">Introduzca los términos de búsqueda: </label>
        <input type="search" name="busqueda" id="busqueda" required>
        <button type="submit">Buscar</button>
    </form>
</body>

</html>
<?php
if (isset($_GET["busqueda"])) {
    $terminos_busqueda = $_GET["busqueda"];
    if (trim($terminos_busqueda) !== "") {

        require_once "connection.php";

        try {
            $con =  getConnection();

            //En la bd bookdb no importan mayúsculas/minúsculas porque está usando collation caseinsensitive, pero no está demás que nuestro código no dependa de la collation de la base de datos
            $stmt = $con->prepare("select title as resultado from books where UPPER(title) like ?
                union 
                select TRIM(Concat(coalesce(first_name, '') , coalesce(middle_name, ' '), coalesce(last_name, '')))
                 as resultado from authors where first_name like ?;");

            $filtro = "%" . strtoupper($terminos_busqueda) . "%";
            // $stmt->bind_param("ss", $filtro, $filtro);
            $stmt->execute([$filtro, $filtro]);

            $resultado = $stmt->get_result();

            $counter = 0;
            //fetch_assoc devuelve:
            // array asoc
            //null si no hay más filas
            //false si falla algo
            $results = $resultado->fetch_all();

            // echo "<pre>";
            // print_r($results);
            // echo"</pre>";

            foreach ($results as $result) {
                $counter++;
                if ($counter == 1) {
                    echo "<ol>";
                }
                echo "<li>" . $result[0] . "</li>";
            }

            // while (($row = $resultado->fetch_assoc())) {
            //     $counter++;
            //     if ($counter == 1) {
            //         echo "<ol>";
            //     }
            //     echo "<li>" . $row["resultado"] . "</li>";
            // }
            if ($counter > 0) {
                echo "</ol>";
            }
            if ($counter == 0) {
                echo "<p>No se han encontrado resultados</p>";
            }
        } catch (Exception $e) {
            echo "<p>Ha ocurrido una excepción: " . $e->getMessage() . "</p>";
        }
        //Cerramos los recursos
        //Open non-persistent MySQL connections and result sets are automatically closed when their objects are destroyed. Explicitly closing open connections and freeing result sets is optional.
        $con = null;
        if ($stmt != null)
            $stmt->close();
        if ($resultado != null)
            $resultado->free();
    } else {
        echo "<p> Introduzca una cadena no vacía </p>";
    }
}

?>