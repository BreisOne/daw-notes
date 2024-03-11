<?php

class UsuarioController {

    const VIEW_FOLDER = "user";

    public $page_title;
    public $view;
    private UsuarioServicio $usuarioServicio;


    public function __construct() {
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'login';
        $this->page_title = '';
        $this->usuarioServicio = new UsuarioServicio();
  
    }

    /* List all notes */

    public function list() {

        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'list_user';
        $this->page_title = 'Listado de usuarios';
        return $this->usuarioServicio->getUsuarios();
    }

    public function login() {
       if (SessionManager::isUserLoggedIn()) {
            $this->redirectAccordingToRole();
            exit;
        }
        $this->page_title = 'Inicio de sesión';
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'login';

        //b) permitir seleccionar entre los 2 roles de la aplicación: admin y user 
        $app_roles = $this->usuarioServicio->getRoles();
        $loginViewData = new LoginViewData($app_roles);

        if (isset($_POST["email"]) && isset($_POST["pwd"]) && isset($_POST["rol"])) {
            $email = $_POST["email"];
            $pwd = $_POST["pwd"];
            $rolId = $_POST["rol"];

            //a) iniciar sesión utilizando password_hash() y password_verify() con BCRYPT y parámetros por defecto (1 punto)
            //Devuelve null si ha habido algún error
            $userResult = $this->usuarioServicio->login($email, $pwd, $rolId);

            if ($userResult == null) {

                $loginViewData->setStatus(Util::OPERATION_NOK);
                return $loginViewData;
            } else {
//                c) Se guardará en la sesión (1 punto)
//
//    El id del usuario
//    El id del rol seleccionado
//    El email del usuario
//    El tiempo de último acceso con time()
                SessionManager::iniciarSesion();
                $_SESSION["userId"] = $userResult->getId();
                $_SESSION["email"] = $userResult->getEmail();
                $_SESSION["roleId"] = $rolId;
              
                $this->redirectAccordingToRole();

                exit;
            }
        } else {
            return $loginViewData;
        }
    }
 //d) Se permitirá cerrar sesión en un formulario situado en el header.php que solo se mostrará si el usuario está autenticado. A su izquierda mostrará el email del usuario autenticado (1 punto)
    public function logout() {
        SessionManager::cerrarSesion();
        $this->redirectTo("Usuario", "login");
    }



    private function redirectTo(string $controller, string $action): void {
        header("Location: FrontController.php?controller=$controller&action=$action");
        exit;
    }

    //En función del rol seleccionado en login, el usuario deberá ser redirigido a:
    private function redirectAccordingToRole() {
        $user_selected_rol = $this->usuarioServicio->getRoleById($_SESSION["roleId"]);
        if ($user_selected_rol->getName() === ADMIN_ROLE) {
            $this->redirectTo("Usuario", "list");
        } elseif ($user_selected_rol->getName() === USER_ROLE) {
            $this->redirectTo("Nota", "list");
        }
    }

   

}

?>