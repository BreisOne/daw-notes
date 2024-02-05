<?php
final class Profesor extends Persona{
    private String $NIF;

    public function __construct(string $nombre, string $apellidos, int $tlf_mobil, String $NIF){
        parent::__construct($nombre, $apellidos, $tlf_mobil);
        $this->NIF = $NIF;            
    }



}