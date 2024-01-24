
<?php
/**
 * borrar_libro
 * Elimina la tupla de books por el book_id que coincida con $cod. Además, elimina los registros de la tabla book_authors en una misma transacción
 * @param  int $cod
 * @return bool TRUE si el borrado fue exitoso, FALSE en caso contrario
 */
function borrar_libro(int $cod): bool
{
    $exito = false;

    try {
        $conProyecto = getConnection();
        //Tenemos que modificar 2 tablas

        //Comenzamos la tx
        $conProyecto->begin_transaction();

        $delete = "delete from books where book_id= ?";
        $delete_book_authors = "delete from book_authors where book_id = ?";

        $stmt = $conProyecto->prepare($delete);
        $stmt_del_book_authors = $conProyecto->prepare($delete_book_authors);

        //Ejecutamos y reemplazamos los parámetros con un array
        $exito = $stmt_del_book_authors->execute([$cod]);     
        $exito = $exito && $stmt->execute([$cod]);

        
        if ($exito) {
            $conProyecto->commit();
        } else
            $conProyecto->rollBack();
        //Throwable es una clase madre común a error y a Exception. Capturará un fatal error y cualquier excepción
    } catch (Throwable $ex) {
        $conProyecto->rollBack();
        $exito = false;
        echo "Ocurrió un error al borrar el libro con book_id $cod, mensaje: " . $ex->getMessage();
    }

    //Devolvemos el resultado de la operación
    return $exito;
}
