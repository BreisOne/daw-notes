<?php
//dirname devuelve  la ruta de un directorio padre subiendo x niveles, en este caso 2 niveles: la carpeta que contiene controller
require_once dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'config' . DIRECTORY_SEPARATOR . 'config.php';
require_once dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'includes' . DIRECTORY_SEPARATOR . 'autoload.php';

//La URL será algo del estilo: http://localhost/FrontController.php?controller=Nota&action=list
if (!isset ($_GET["controller"])) {
    $_GET["controller"] = DEFAULT_CONTROLLER;
}

if (!isset ($_GET["action"])) {
    $_GET["action"] = DEFAULT_ACTION;
}

/* Load controller */
//Por convención, nuestros controladores terminar con la palabra Controller y se situarán en carpeta controller
$controllerName = $_GET["controller"] . 'Controller';
$controller_path = $controllerName . '.php';

//Todos los controladores estarán en la carpeta controller. Si no existe, asignamos uno por defecto
if (!file_exists($controller_path)) {
    $controllerName = DEFAULT_CONTROLLER . 'Controller';
}
//Se crea una instancia del controlador que llega como parámetro por $_GET o el controlador por defecto
$controller = new $controllerName();



/* Si existe el método que llega por $_GET en la clase de $controller */
if (method_exists($controller, $_GET["action"])) {
    //Se invoca el método y se establecen los datos que devuelve el controlador  para que estén disponibles para la vista
    $data = $controller->{$_GET["action"]}();
    ob_clean();
    //https://www.php.net/manual/en/function.header.php
    header("Content-Type: application/json; charset=utf-8", true);
    header('Access-Control-Allow-Origin: *');
    //Se envían directamente los datos al cliente en JSON
    echo $data;
}


//No hay vistas en este backend
