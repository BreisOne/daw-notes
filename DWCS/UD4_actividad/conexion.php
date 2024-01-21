
<?php



/**
 * Summary of getConnection
 * Crea un objeto PDO
 * @return PDO|null un objeto PDO si ha habido éxito creando la conexión, null en caso contrario
 */

function getConnection($file = 'settings.ini')
{
    if (!$settings = parse_ini_file($file, TRUE)) throw new exception('Unable to open ' . $file . '.');
    try {

        $dns = $settings['database']['driver'] .
            ':host=' . $settings['database']['host'] .
            ((!empty($settings['database']['port'])) ? (';port=' . $settings['database']['port']) : '') .
            ';dbname=' . $settings['database']['schema'];


        $con = new PDO($dns, $settings['database']['username'], $settings['database']['password'],  array(
            PDO::ATTR_PERSISTENT => $settings['database']['persistent']
        ));

        //Esto no hace falta en versión PHP 8 y superiores: https://www.php.net/manual/en/pdo.error-handling.php
        //PDO::ERRMODE_EXCEPTION: As of PHP 8.0.0, this is the default mode.
        //$con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch (PDOException $ex) {

        echo "Error en la conexión: mensaje: " . $ex->getMessage();
    }
    return $con;
}
