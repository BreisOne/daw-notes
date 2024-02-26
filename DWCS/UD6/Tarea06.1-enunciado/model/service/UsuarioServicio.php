<?php

class UsuarioServicio
{

    const USER_DOES_NOT_EXIST = "No existe usuario";
    const PWD_INCORRECT = "La contraseña no es correcta";

    private IUsuarioRepository $userRepository;
    private IRolRepository $rolRepository;

    public function __construct(){
        $this->userRepository = new UsuarioRepository();
        $this->rolRepository = new RolRepository();
    }
    public function getUsuarios(): array
    {
        //TODO
        
        $usuarios = $this->userRepository->findAll();

        foreach ($usuarios as $usuario) {
            $roles = $this->rolRepository->findRolesByUserId($usuario->getId());
            $usuario->setRoles($roles);
        }

        return $usuarios;
    }

    public function login(string $user, string $pwd, int $rolId): ?Usuario
    {
        //TODO

        $userByEmail = $this->userRepository->findUsuarioByEmail($user);

        if(password_verify($pwd, $userByEmail->getPwdhash())){

            $userRoles = $this->rolRepository->findRolesByUserId($userByEmail->getId());

            if(self::isUserInRole($userByEmail, $rolId)){
                
                $userByEmail->setRoles($userRoles);
                return $userByEmail;

            }else{

                return null;
            }
        }

    }

    public function getRoles(): array
    {

        $roles = $this->rolRepository->findAll();

        return $roles;
    }

    public function getRoleById(int $roleId): ?Rol
    {

        return $this->rolRepository->read($roleId);

    }

    private function isUserInRole(Usuario $usuario, int $roleId): bool{
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