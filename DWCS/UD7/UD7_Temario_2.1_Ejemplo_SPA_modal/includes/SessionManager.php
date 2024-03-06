<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of SessionManager
 *
 * @author wadmin
 */
class SessionManager {
    
//    e) Para las operaciones relacionadas con la sesión puedes crear una clase nueva SessionManager con métodos estáticos que permitan gestionar (2 puntos) :
//-inicio de sesión
//-cierre de sesión
//-comprobación de tiempo de actividad de usuario
//-si usuario tiene los roles adecuados para ejecutar una determinada action y cualquier otra funcionalidad que precises
//
//La clase SessionManager será invocada desde los controllers que la necesiten.

    CONST MAX_SECONDS_INACTIVITY = 600;

    public static function isRoleAllowedInAction(array $actionAllowedRoles) {
        self::iniciarSesion();
        if (isset($_SESSION["roleId"])) {

            return in_array($_SESSION["roleId"], $actionAllowedRoles);
        }
        return false;
    }

    public static function cerrarSesion() {
        self::iniciarSesion();

        session_destroy();

        $_SESSION = array();

        if (ini_get("session.use_cookies")) {
            $params = session_get_cookie_params();
            setcookie(session_name(), '', time() - 42000,
                    $params["path"], $params["domain"],
                    $params["secure"], $params["httponly"]
            );
        }
    }

    public static function iniciarSesion(): bool {
        $iniciada = true;
        if (session_status() !== PHP_SESSION_ACTIVE) {
            $iniciada = session_start();
        }

        return $iniciada;
    }

    public static function isUserLoggedIn() {
        $autenticado = self::iniciarSesion() && isset($_SESSION["userId"]) && isset($_SESSION["roleId"]) && isset($_SESSION["ultimoAcceso"]);
        return $autenticado && self::isUserActive();
    }

//    h) Establece un tiempo máximo de inactividad con el servidor tras el cual se cerrará la sesión de forma automática. Actualiza el tiempo de acceso, siempre que se invoque una action con el rol permitido. (1 punto)
    public static function isUserActive(): bool {
        $active = false;
        $actual_time = time();
        $diff = $actual_time - $_SESSION["ultimoAcceso"];
        if ($diff < self::MAX_SECONDS_INACTIVITY) {
            $active = true;
        } else {
            self::cerrarSesion();
        }

        return $active;
    }
    
    public static function updateLastAccess(){
        $_SESSION["ultimoAcceso"]= time();
    }

}
