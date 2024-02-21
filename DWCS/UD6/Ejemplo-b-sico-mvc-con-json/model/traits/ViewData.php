<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of ViewData
 *
 * @author mfernandez
 */
trait ViewData {

    //put your code here

    private int $estado = Util::NO_OPERATION;

    public function getEstado(): int {
        return $this->estado;
    }

    public function setEstado(int $estado): void {
        $this->estado = $estado;
    }

}
