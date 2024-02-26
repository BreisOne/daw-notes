<?php


/**
 * Description of Rol
 *
 * @author wadmin
 */
class Rol {
    
    use ViewData;
    
    private int $id;
    private string $name;
    
    // public function __construct(int $id, string $name) {
    //     $this->name = $name;
    // }

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


}
