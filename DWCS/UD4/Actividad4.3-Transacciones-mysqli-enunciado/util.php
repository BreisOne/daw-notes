<?php


/**
 * isNotEmpty
 * Comprueba si un string, una vez eliminados los espacios a ambos lados, es distinta de cadena vacía
 * @param  string $name cadena de entrado
 * @return bool FALSE si es reducible a cadena vacía, TRUE en caso contrario
 */
function isNotEmpty(string $name): bool {

    return (trim($name) !== "");
}
?>