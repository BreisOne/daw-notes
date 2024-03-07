<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPInterface.php to edit this template
 */

/**
 *
 * @author mfernandez
 */
interface IBaseRepository {

    public function create($object);

    public function read($id);

    public function update($object): bool;

    public function delete($id): bool;
    
    public function findAll():array;
    
    
    public function beginTransaction():bool;
    public function commit():bool;
    public function rollback():bool;
}
