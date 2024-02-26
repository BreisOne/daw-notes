<?php

spl_autoload_register(function ($nombre_clase) {

    //echo "## $nombre_clase<br/>";
    $dirs = [ MODELS_FOLDER,   CONTROLLERS_FOLDER, REPOSITORIES_FOLDER, ENTITIES_FOLDER, SERVICES_FOLDER, INCLUDES_FOLDER, TRAITS_FOLDER, VIEWDATA_FOLDER
        ];
    
    foreach ($dirs as $dir) {
     
        $ruta = dirname(__DIR__) . '\\' . $dir . '\\' . $nombre_clase . '.php';
        //echo "## $ruta<br/>";
        $ruta = str_replace("\\", DIRECTORY_SEPARATOR, $ruta);
        
        
        //##echo $ruta."<br/>";
        if (file_exists($ruta)) {
            require_once $ruta;
            return;
        }
    }
});


