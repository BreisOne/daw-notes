<?php

class MyPDO extends PDO
{
    public function __construct($file = 'db_settings.ini')

    {
        //https://www.php.net/manual/es/function.parse-ini-file.php
        //carga el fichero ini especificado en filename, y devuelve las configuraciones que hay en él a un array asociativa. 
        if (!$settings = parse_ini_file($file, TRUE)) throw new exception('Unable to open ' . $file . '.');

        $dns = $settings['database']['driver'] .
            ':host=' . $settings['database']['host'] .
            ((!empty($settings['database']['port'])) ? (';port=' . $settings['database']['port']) : '') .
            ';dbname=' . $settings['database']['schema'];
        //Se llama al constructor del padre, la clase PDO
        parent::__construct($dns, $settings['database']['username'], $settings['database']['password']);
    }
}
