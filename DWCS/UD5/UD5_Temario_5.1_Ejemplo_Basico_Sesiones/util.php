<?php



/* Orden 1 */

function existeUser(string $user, array $usuarios): bool {
    return array_key_exists($user, $usuarios);
}

/* Orden 2 */

function login(string $user, string $pwd, array $usuarios): bool {
    return $usuarios[$user]["pwd"] === $pwd;
}

function cerrarSesion() {

    //Tal y como se recomienda en https://www.php.net/manual/es/function.session-destroy.php
    iniciarSesion();   

    $_SESSION = array();

    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
                $params["path"], $params["domain"],
                $params["secure"], $params["httponly"]
        );
    }
    session_destroy();
}

function isUserLoggedIn() {
    $autenticado = iniciarSesion() && (session_status() === PHP_SESSION_ACTIVE) && isset($_SESSION["user"]);
    return $autenticado; 
}


//Si se realizan dos llamadas seguidas a session_start(), se producira un mensaje de E_NOTICE A session had already been started
//Comprobamos si ya hay una sesión iniciada previamente
function iniciarSesion(): bool {
    $iniciada = true;
    if (session_status() !== PHP_SESSION_ACTIVE) {
        $iniciada = session_start();
    }
    return $iniciada;
}
