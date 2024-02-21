¿<?php
class UsuarioController {

public string $page_title;
public string $view;
private IUsuarioServicio $UsuarioServicio;

private const VIEW_FOLDER ="usuario".DIRECTORY_SEPARATOR;

public function __construct() {
    $this->view = self::VIEW_FOLDER.'list_usuario';
    $this->page_title = '';
    $this->UsuarioServicio = new UsuarioServicio();
}

/* List all users */

public function list() {
    $this->page_title = 'Listado de usuarios';
    return $this->UsuarioServicio->getUsuarios();
}
}