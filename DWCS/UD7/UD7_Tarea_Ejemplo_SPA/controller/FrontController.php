<?php

ob_start();

require_once dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'config/config.php';
require_once dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'includes/autoload.php';

ini_set("session.cookie_lifetime", SessionManager::MAX_SECONDS_INACTIVITY);



if (isset($_GET["controller"]) && (isset($_GET["action"]))) {


    if (!AuthorizationManager::isAnonymousAction($_GET["controller"] . 'Controller', $_GET["action"])) {

        if (!SessionManager::isUserLoggedIn()) {
            $_GET["controller"] = DEFAULT_CONTROLLER;
            $_GET["action"] = DEFAULT_ACTION;
        }
    }

    $controllerName = $_GET["controller"] . 'Controller';
    $controller = new $controllerName();

//Se preparan los datos para que estén disponibles en la vista
    $dataToView["data"] = array();

    /* Check if method is defined */
    if (method_exists($controller, $_GET["action"])) {
        $allowed = AuthorizationManager::isUserAuthorized($controllerName, $_GET["action"]);
        if ($allowed) {
            //Se llama a la action
            $dataToView["data"] = $controller->{$_GET["action"]}();
            SessionManager::updateLastAccess();

            ob_clean();
            //https://www.php.net/manual/en/function.header.php
            header("Content-Type: application/json; charset=utf-8", true);
            echo $dataToView["data"];
        }
    } else {
        header("Content-Type: text/html; charset=utf-8", true);
        require_once dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'view/template/spa_view.php';
    }
} else {
    header("Content-Type: text/html; charset=utf-8", true);
    require_once dirname(__FILE__, 2) . DIRECTORY_SEPARATOR . 'view/template/spa_view.php';
}

ob_end_flush();
?>