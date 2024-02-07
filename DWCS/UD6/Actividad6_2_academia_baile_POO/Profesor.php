<?php
final class Profesor extends Persona{
    private String $NIF;
    private array $bailes; 
    public function __construct(string $nombre, string $apellidos, int $tlf_mobil, String $NIF){
        parent::__construct($nombre, $apellidos, $tlf_mobil);
        $this->NIF = $NIF;            
    }

    public function calcularSoldo(int $horasClases, float $precioClase = 16):float{
        return $horasClases * $precioClase;
    }

    public function anhadirBaile(Baile $baile){
        $this->bailes[] = $baile;
    }
    public function eliminarBaile(Baile $baile){
        
        foreach ($this->bailes as $indice => $baileExistente) {
            if ($baileExistente == $baile) {
                unset($this->bailes[$indice]);
            }
        }
    }
    public function getBailes(){
        foreach ($this->bailes as $indice => $baileExistente) {
                echo $this->bailes[$indice]->getNombre()." (idade min: ".$this->bailes[$indice]->getEdadeMinima()." anos";
        }

    }

}