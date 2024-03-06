<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPInterface.php to edit this template
 */

/**
 *
 * @author wadmin
 */
interface IUsuarioRepository extends IBaseRepository {

    //Devuelve un objeto de tipo Usuario filtrando por email. Si no lo encuentra devuelve null. Utiliza un parámetro nominal para filtrar.
    //No inicializa sus roles
    public function getUsuarioByEmail($email); 
    
     //Añade un nuevo registro a la tabla usuario_rol. Devuelve true si se ha conseguido insertar con éxito, false en caso contrario.
    public function addRoleToUser($user_id, $rol_id):bool;
}
