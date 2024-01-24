<?php
include 'function.php';

showFilesInfo("files");



const uploadsDir = 'archivos_subidos/';
const UPLOAD_ERR_OK =0;
if ($_FILES['files']['error'][0] === UPLOAD_ERR_OK && is_uploaded_file($_FILES['files']['tmp_name'][0])) {
    $destino = uploadsDir . $_FILES['files']['name'][0];
    if (move_uploaded_file($_FILES['files']['tmp_name'][0], $destino)) {
        echo "El archivo se ha subido correctamente.";
    } else {
        echo "Hubo un error al subir el archivo.";
    }
}


foreach ($_FILES['files']['name'] as $index => $filename) {
    if ($_FILES['files']['error'][$index] === UPLOAD_ERR_OK) {
        $sizeKB = $_FILES['files']['size'][$index] / 1024;
        echo "El archivo '$filename' se ha subido con éxito. Tamaño: $sizeKB KB<br>";
    } else {
        echo "Error al subir el archivo '$filename'. Código de error: {$_FILES['archivos']['error'][$index]}<br>";
    }
}


?>
