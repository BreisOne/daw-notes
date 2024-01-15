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

        require_once "MyPDO.php";

        try {
            $con = new MyPDO();

            //En la bd bookdb no importan mayúsculas/minúsculas porque está usando collation caseinsensitive, pero no está demás que nuestro código no dependa de la collation de la base de datos
            $stmt = $con->prepare("select title from books where UPPER(title) like :search ");
            // $stmt->bindValue("search", "%" . strtoupper($terminos_busqueda) . "%");
            $search_term  =  "%". strtoupper($terminos_busqueda) . "%";
            $stmt->bindParam("search", $search_term, PDO::PARAM_STR);

            // echo "<pre>";
            // $stmt->debugDumpParams();
            // echo "</pre>";

            $stmt->execute();

            // echo "<pre>";
            // $stmt->debugDumpParams();
            // echo "</pre>";

            $array = $stmt->fetchAll(PDO::FETCH_NUM);
            if (($array !== false)) {
                if (!empty($array)) {
                    echo "<ol>";
                    foreach ($array as $fila_array) {
                        // un único valor: el title
                        echo "<li> $fila_array[0] </li>";
                    }
                    echo "</ol>";
                } else {
                    echo "<p>No se han encontrado resultados</p>";
                }
            }
        } catch (Exception $e) {
            echo "<p>Ha ocurrido una excepción: " . $e->getMessage() . "</p>";
        }
        //Cerramos los recursos
        $con = null;
        $stmt = null;

        
    } else {
        echo "<p> Introduzca una cadena no vacía </p>";
    }
}

?>