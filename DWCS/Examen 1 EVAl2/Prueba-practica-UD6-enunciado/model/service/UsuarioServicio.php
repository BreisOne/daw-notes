<?php

class UsuarioServicio {

    const USER_DOES_NOT_EXIST = "No existe usuario";
    const PWD_INCORRECT = "La contraseña no es correcta";

    private IUsuarioRepository $productoRepository;
    private IRolRepository $rolRepository;

    public function __construct() {
        $this->productoRepository = new UsuarioRepository();
        $this->rolRepository = new RolRepository();
    }

    /* Get all notes */

    public function getUsuarios(): array {

        $usuarios = $this->productoRepository->findAll();
        foreach ($usuarios as $usuario) {
            $roles = $this->rolRepository->findRolesByUserId($usuario->getId());
            $usuario->setRoles($roles);
        }

        return $usuarios;
    }

    public function login(string $user, string $pwd, $rolId): ?Usuario {

        $userResult = $this->productoRepository->findUsuarioByEmail($user);

        if ($userResult != null && password_verify($pwd, $userResult->getPwdhash())) {

//Buscamos los roles de ese usuario 
           $userRoles =  $this->rolRepository->findRolesByUserId($userResult->getId());
           $userResult->setRoles($userRoles);
            //check if selected rol is among user roles
            if ($this->isUserInRole($userResult, $rolId)) {

                return $userResult;
            }
        }
        return null;
    }

    public function getRoles(): array {

        $roles = $this->rolRepository->findAll();

        return $roles;
    }

     public function getRoleById(int $roleId): ?Rol {

      return $this->rolRepository->read($roleId);
     
      

        
    }
    
    private function isUserInRole(Usuario $usuario, int $roleId): bool {
        $rolesArray = $usuario->getRoles();
        foreach ($rolesArray as $rol) {
            if ($rol->getId() === $roleId) {
                return true;
            }
        }

        return false;
    }

  
}

?>