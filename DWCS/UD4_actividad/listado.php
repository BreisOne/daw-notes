<?php
require_once 'conexion.php';
require_once 'borrar.php';

$libro_borrado = false;
$cod = null;

if (isset($_POST["id"], $_POST["borrar"])) {
    $cod = $_POST["id"];
    $libro_borrado = borrar_libro($cod);
}

$libros_array = obtener_libros();


/**
 * obtener_libros
 * Consulta la tabla books para obtener los book_id y title ordenados por title
 * @return array array con tantos registros como tuplas haya y por cada registro un array con 2 claves: book_id y title 
 */
function obtener_libros(): array
{
  
    $libros_array = null;
    try {
        $conProyecto = getConnection();
        $consulta = "select book_id, title from books order by title";
        $stmt = $conProyecto->prepare($consulta);

        $stmt->execute();
        $libros_array = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $ex) {
        die("Error al recuperar los libros " . $ex->getMessage());
    }

  
    return $libros_array;
}


/**
 * mostrar_libros
 * Crea una fila html mostrando en cada celda de datos book_id y title. Además añade un botón en un formulario para permitir su borrado.
 * @param  array $libros_array un array asociativo con dos claves  book_id y title
 * @return void
 */
function mostrar_libros(array $libros_array)
{
    foreach ($libros_array as $fila) {
        echo "<tr class='text-center'><th scope='row'>";
     
        echo "<td>{$fila['book_id']}</td>";
        echo "<td>{$fila['title']}</td>";
        echo "<td>";
        echo "<form   method='POST'
style='display:inline'>";
       
        echo "<input type='hidden' name='id' value='{$fila['book_id']}'>"; //mandamos el código del libro a borrar
        echo "<input type='submit' name='borrar' onclick=\"return confirm('¿Borrar Libro?')\"class='btn btn-danger' value='Borrar'>";
        echo "</form>";
        echo "</td>";
        echo "</tr>";
    }
}
?>
<!doctype html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-
scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- css para usar Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <title>Tema 4- Tarea04.1</title>
</head>

<body>
    <h3 class="text-center mt-2 font-weight-bold">Listado de libros</h3>
    <div class="container mt-3">
        <a href="crear.php" class='btn btn-success mt-2 mb-2'>Crear</a>
        <table class="table table-striped table-light">
            <thead>
                <tr class="text-center">
                    <th scope="col"></th>
                    <th scope="col">Book_id</th>
                    <th scope="col">Título</th>
                 
                </tr>
            </thead>
            <tbody>
                <?php
                mostrar_libros($libros_array);

                ?>
            </tbody>
        </table>

        <?php
        if (isset($_POST["id"], $_POST["borrar"])) {
            if ($libro_borrado) {
                echo '<div class="alert alert-success" role="alert">    Libro con book_id: ' . $cod . ' borrado correctamente.</div>';
            } else {
                echo '<div class="alert alert-danger" role="alert">   No se ha podido eliminar el libro con el book_id:' . $cod . '  </div>';
            }
        }

        ?>
    </div>
</body>

</html>
