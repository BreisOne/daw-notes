<?php

class UsuarioServicio implements IUsuarioServicio
{

    private IUsuarioRepository $repository;

    public function __construct()
    {
        $this->repository = new UsuarioRepository();
    }

    /* Get all users */

    public function getUsuarios(): array
    {
        return $this->repository->getUsuarios();
    }
}

?>