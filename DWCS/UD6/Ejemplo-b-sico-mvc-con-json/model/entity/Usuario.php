<?php

/**
 * Description of Nota
 *
 * @author mfernandez
 */
class Usuario implements JsonSerializable{
    
    use ViewData;
    
    private ?int $id;
    private string $email;
    
    public function __construct(?int $id=null, string $email="") {
        $this->id = $id;
        $this->email = $email;
    }

    
    public function getId(): ?int {
        return $this->id;
    }

    public function getEmail(): string {
        return $this->email;
    }

    public function setId(int $id): void {
        $this->id = $id;
    }

    public function setEmail(string $email): void {
        $this->email = $email;
    }

    public function jsonSerialize(): mixed {
          //Especificamos qué propiedades no públicas queremos que pasen a formar parte del objeto JSON
        return array(
            'id' => $this->id,
            'email' => $this->email,
        );
    }

}
