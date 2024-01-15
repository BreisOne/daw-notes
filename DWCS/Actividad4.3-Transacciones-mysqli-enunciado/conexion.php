
<?php
/**
 * Summary of getConnection
 * Crea un objeto mysqli. Si ocurre algún error leyendo el fichero de configuración lanza una excepción.
 * @return mysqli|null un objeto mysqli si ha habido éxito creando la conexión, null en caso contrario
 */
function getConnection($file = 'db_settings.ini'):mysqli{

    if (!$settings = parse_ini_file($file, TRUE)) throw new exception('Unable to open ' . $file . '.');

    $con = null;
    $host = $settings['database']['host'];
    $db = $settings['database']['db'];
    $user = $settings['database']['user'];
    $pass = $settings['database']['pass'];
    $port = $settings['database']['port'];   

    $con = new mysqli($host, $user, $pass, $db, $port);

    return $con;
}
