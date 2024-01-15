<?php

/**
 * Summary of getConnection
 * Crea un objeto mysqli
 * @return mysqli|null un objeto mysqli si ha habido éxito creando la conexión, null en caso contrario
 */
function getConnection($file = 'db_settings.ini')
{

    $con = null;
   

    try {

        if (!$settings = parse_ini_file($file, TRUE)) throw new exception('Unable to open ' . $file . '.');

        $host = $settings['database']['host'];
        $db = $settings['database']['schema'];
        $user = $settings['database']['username'];
        $pass = $settings['database']['password'];

        $con = new mysqli($host, $user, $pass,$db);

        
    } catch (mysqli_sql_exception $ex) {

        echo "Error en la conexión: mensaje: " . $ex->getMessage();
    }
    catch(Exception $ex){
        echo "Ha ocurrido una excepción: ". $ex->getMessage();
    }
    return $con;
}
