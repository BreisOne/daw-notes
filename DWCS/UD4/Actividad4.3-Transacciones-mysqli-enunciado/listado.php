<?php
require_once 'conexion.php';
require_once 'borrar.php';

$libro_borrado = false;
$cod = null;

if (isset($_POST["id"], $_POST["borrar"])) {
    $cod = $_POST["id"];
    $libro_borrado = borrar_libro($cod);
}






/**
 * obtener_libros_no_preparada
 * Consulta la tabla books para obtener los book_id y title ordenados por title
 * @return array array con tantos registros como tuplas haya y por cada registro un array con 2 claves: book_id y title 
 */
function obtener_libros_no_preparada(): array
{

    $libros_array = [];
    $resultado = null;
    try {
        //$conProyecto es de tipo mysqli
        $conProyecto = getConnection();
        $consulta = "select book_id, title from books order by title";
        $resultado = $conProyecto->query($consulta);

        while ($row = $resultado->fetch_assoc()) {
            array_push($libros_array, $row);
        }
        //otra opción en lugar de registro a registro
        //$libros_array = $resultado->fetch_all(MYSQLI_ASSOC);

    } catch (Exception $e) {
?>
        <div class="alert alert-danger" role="alert">
            <?php echo "Ha ocurrido una excepción: " . $e->getMessage(); ?>
        </div>
<?php
    } finally {
        if ($resultado != null) {
            $resultado->close();
        }
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

    <title>Tema 4: bookdb con mysqli</title>
</head>

<body>
    <h3 class="text-center mt-2 font-weight-bold">Listado de libros</h3>
    <div class="container mt-3">
        <a href="crear.php" class='btn btn-success mt-2 mb-2'>Crear</a>

        <?php
        try {
            $libros_array = obtener_libros_no_preparada();
            if (count($libros_array) > 0) {
        ?>
                <table class="table table-striped table-light">
                    <thead>
                        <tr class="text-center">
                            <th scope="col"></th>
                            <th scope="col">Book_id</th>
                            <th scope="col">Título</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php

                        mostrar_libros($libros_array);


                        ?>
                    </tbody>
                </table>

        <?php
            } else {
                echo '<div class="alert alert-primary" role="alert">
            No se han encontrado libros
          </div>';
            }
            if (isset($_POST["id"], $_POST["borrar"])) {
                if ($libro_borrado) {
                    echo '<div class="alert alert-success" role="alert">    Libro con book_id: ' . $cod . ' borrado correctamente.</div>';
                } else {
                    echo '<div class="alert alert-danger" role="alert">   No se ha podido eliminar el libro con el book_id:' . $cod . '  </div>';
                }
            }
        } catch (Exception $ex) {
            //Captura también la Exception mysqli_sql_exception
            echo ' <div class="alert alert-danger m-5" role="alert">
            Error al recuperar los libros' . $ex->getMessage() . '
    </div>';
        }

        ?>
    </div>
</body>

</html>