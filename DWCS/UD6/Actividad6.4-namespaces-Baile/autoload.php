<?php
//Ya no son necearios porque van en el $nombre_clase
// const CLASES_FOLDER = "clases";
// const PEOPLE_FOLDER = "people";
// const ITEMS_FOLDER = "items";

spl_autoload_register(function ($nombre_clase) {

    //los namespaces, si existen, forman parte de la cadena de texto $nombre_clase: Por ejemplo, para Academia, nombre_clase será: clases\items\Academia
    //Si existen namespaces y se corresponden con la jerarquía de ficheros, como es convención, hay que tenerlo en cuenta en las modificaciones
    //echo "## $nombre_clase";
    $ruta = $nombre_clase . '.php';
    //Si existen \, las reemplazamos por el DIRECTORY_SEPARATOR del S.O. correspondiente
    //Entre comillas dobles hay que escapar \ sustituyéndola por \\
    $ruta = str_replace("\\", DIRECTORY_SEPARATOR, $ruta);
    if (file_exists($ruta)) {
        require_once $ruta;      
        return;
    }


});