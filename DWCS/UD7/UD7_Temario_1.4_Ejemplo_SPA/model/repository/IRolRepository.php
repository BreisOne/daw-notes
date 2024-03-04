<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPInterface.php to edit this template
 */

/**
 *
 * @author wadmin
 */
interface IRolRepository extends IBaseRepository{

   public function findRolByName(string $name):Rol;

   public function findRolesByUserId(int $userId):array;
   
}
