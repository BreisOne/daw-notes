<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of Usuario
 *
 * @author wadmin
 */
class Usuario implements JsonSerializable {
    private int $id;
    private string $email;
    private string $pwdhash;
    private array $roles=[];
    
    use ViewData;
    
//    public function __construct(string $email="", string $pwdhash="", array $roles=[]) {
//        $this->email = $email;
//        $this->pwdhash = $pwdhash;
//        $this->roles = $roles;
//    }
    
    public function getId(): int {
        return $this->id;
    }

    public function getEmail(): string {
        return $this->email;
    }

    public function getPwdhash(): string {
        return $this->pwdhash;
    }

    public function getRoles(): array {
        return $this->roles;
    }

    public function setId(int $id): void {
        $this->id = $id;
    }

    public function setEmail(string $email): void {
        $this->email = $email;
    }

    public function setPwdhash(string $pwdhash): void {
        $this->pwdhash = $pwdhash;
    }

    public function setRoles(array $roles): void {
        $this->roles = $roles;
    }


 public function jsonSerialize() {
        //Especificamos qué propiedades no públicas queremos que pasen a formar parte del objeto JSON
        return array(
            'id' => $this->id,
            'email' => $this->email,
            'pwdhash' => $this->pwdhash,
            'roles' => $this->roles
        );
    }
    
    
    public function getRoleNamesCSV(){
        $roleNamesArray=[];
        foreach ($this->roles as $key => $value) {
            array_push($roleNamesArray, $value->getName());
        }
        return implode(", ", $roleNamesArray);
    }
}
