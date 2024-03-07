<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of Rol
 *
 * @author wadmin
 */
class Rol implements JsonSerializable {
    
    use ViewData;
    
    private int $id;
    private string $name;
    
//    public function __construct(int $id, string $name) {
//        $this->name = $name;
//    }

    public function getId(): int {
        return $this->id;
    }

    public function getName(): string {
        return $this->name;
    }

    public function setId(int $id): void {
        $this->id = $id;
    }

    public function setName(string $name): void {
        $this->name = $name;
    }

    public function jsonSerialize(): mixed {
        $array = array();
        $array["id"]= $this->id;
        $array["name"]=$this->name;
        return $array;
    }

}
