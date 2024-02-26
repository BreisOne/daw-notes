<?php

class UsuarioController
{

    const VIEW_FOLDER = "user";

    public $page_title;
    public $view;
    private UsuarioServicio $usuarioServicio;


    public function __construct()
    {
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'login';
        $this->page_title = '';
        $this->usuarioServicio = new UsuarioServicio();

    }

    /* List all notes */

    public function list()
    {

        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'list_user';
        $this->page_title = 'Listado de usuarios';
        return $this->usuarioServicio->getUsuarios();
    }

    public function login()
    {
        if (SessionManager::isUserLoggedIn()) {
            $this->redirectAccordingToRole();
            exit;
        }
        $this->page_title = 'Inicio de sesión';
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'login';

        //b) permitir seleccionar entre los 2 roles de la aplicación: admin y user 
        $app_roles = $this->usuarioServicio->getRoles();
        $loginViewData = new LoginViewData($app_roles);

        //TODO

        //         4. En la clase UsuarioController, completa la implementación del método login() para que:
// a) si vienen por el método HTTP POST los datos email, contraseña y rol, compruebe a través del servicio si las credenciales son válidas.

        //     Si no lo son, en  loginViewData invoca el método setStatus a la constante Util::OPERATION_NOK
//     En caso de que el login del servicio sea correcto, se guardarán en la sesión el id del usuario, el id del rol seleccionado y el email del usuario. A continuación, se llamará al método redirectAccordingToRole para que redirija al listado de usuarios si se usa el rol admin o al listado de notas si se usa el rol user.

    }
    public function logout()
    {
        SessionManager::cerrarSesion();
        $this->redirectTo("Usuario", "login");
    }



    private function redirectTo(string $controller, string $action): void
    {
        header("Location: FrontController.php?controller=$controller&action=$action");
        exit;
    }

    //En función del rol seleccionado en login, el usuario deberá ser redirigido a:
    private function redirectAccordingToRole()
    {
        $user_selected_rol = $this->usuarioServicio->getRoleById($_SESSION["roleId"]);
        if ($user_selected_rol->getName() === ADMIN_ROLE) {
            $this->redirectTo("Usuario", "list");
        } elseif ($user_selected_rol->getName() === USER_ROLE) {
            $this->redirectTo("Nota", "list");
        }
    }



}

?>