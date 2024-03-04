<?php

/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/EmptyPHP.php to edit this template
 */


spl_autoload_register(function ($nombre_clase) {

    $dirs = [ MODELS_FOLDER,  VIEWDATA_FOLDER,  CONTROLLERS_FOLDER, REPOSITORIES_FOLDER, ENTITIES_FOLDER, SERVICES_FOLDER, INCLUDES_FOLDER, TRAITS_FOLDER];
    
    foreach ($dirs as $dir) {
        $ruta = dirname(__DIR__) . '\\' . $dir . '\\' . $nombre_clase . '.php';
        $ruta = str_replace("\\", DIRECTORY_SEPARATOR, $ruta);
        
        
        //##echo $ruta."<br/>";
        if (file_exists($ruta)) {
            require_once $ruta;
            return;
        }
    }
});


