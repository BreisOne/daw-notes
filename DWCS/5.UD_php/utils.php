<?php
require_once 'conexion.php';
function findAllRoles(): array
{
    $conProyecto = getConnection();

    $pdostmt = $conProyecto->prepare("SELECT * FROM rol ORDER BY id");

    $pdostmt->execute();
    $array = $pdostmt->fetchAll(PDO::FETCH_ASSOC);

  
    return $array;
}

?>