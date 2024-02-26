<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPInterface.php to edit this template
 */

/**
 *
 * @author wadmin
 */
interface IRolRepository extends IBaseRepository {

    public function findRolesByUserId($userId): array;

   
}
