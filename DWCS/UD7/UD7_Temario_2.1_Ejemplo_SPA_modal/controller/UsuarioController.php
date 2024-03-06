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

    public function list()
    {

        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'list_user';
        $this->page_title = 'Listado de usuarios';
        $users = $this->usuarioServicio->getUsuarios();

        return $users;
    }

    public function login(){
        //Para simplificar la implementación del ejemplo de SPA vamos a obviar la redirección en caso de que ya haya iniciado sesión


        $this->page_title = 'Inicio de sesión';
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'login';

        if (isset($_POST["email"]) && isset($_POST["pwd"]) && isset($_POST["rol"])) {
            $email = $_POST["email"];
            $pwd = $_POST["pwd"];
            $rolId = $_POST["rol"];

            $userResult = $this->usuarioServicio->login($email, $pwd, $rolId);

            if ($userResult == null) {
                //401 Unauthorized
                http_response_code(401);
                $response["error"] = true;
                return json_encode($response);
            } else {

                SessionManager::iniciarSesion();
                $_SESSION["userId"] = $userResult->getId();
                $_SESSION["email"] = $userResult->getEmail();
                $_SESSION["roleId"] = $rolId;
                $_SESSION["ultimoAcceso"] = time();


                $response["userId"] = $userResult->getId();
                $response["email"] = $userResult->getEmail();
                return json_encode($response);
            }
        } else {
            //400 Bad Request
            http_response_code(400);
            $response["error"] = true;
            return json_encode($response);
        }
    }


    public function loginJSON()
    {
        //Para simplificar la implementación del ejemplo de SPA vamos a obviar la redirección en caso de que ya haya iniciado sesión


        $this->page_title = 'Inicio de sesión';
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'loginJSON';

        $data = json_decode(file_get_contents("php://input"), true);
        if (isset($data["email"]) && isset($data["pwd"]) && isset($data["rol"])) {
            $email = $data["email"];
            $pwd = $data["pwd"];
            $rolId = $data["rol"];

            $userResult = $this->usuarioServicio->login($email, $pwd, $rolId);

            if ($userResult == null) {
                //401 Unauthorized
                http_response_code(401);
                $response["error"] = true;
                return json_encode($response);
            } else {

                SessionManager::iniciarSesion();
                $_SESSION["userId"] = $userResult->getId();
                $_SESSION["email"] = $userResult->getEmail();
                $_SESSION["roleId"] = $rolId;
                $_SESSION["ultimoAcceso"] = time();


                $response["userId"] = $userResult->getId();
                $response["email"] = $userResult->getEmail();
                return json_encode($response);
            }
        } else {
            //400 Bad Request
            http_response_code(400);
            $response["error"] = true;
            return json_encode($response);
        }
    }

    public function register()
    {
        $this->page_title = 'Registro de usuario';
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'register_user';

        if (isset($_POST["email"]) && isset($_POST["pwd1"]) && isset($_POST["pwd2"])) {
            $email = $_POST["email"];
            $pwd = $_POST["pwd1"];
            $pwd2 = $_POST["pwd2"];

            return $this->usuarioServicio->register($email, $pwd, $pwd2);
        }
    }

    public function getRoles()
    {
        $app_roles = $this->usuarioServicio->getRoles();
        return json_encode($app_roles);
    }

}

?>