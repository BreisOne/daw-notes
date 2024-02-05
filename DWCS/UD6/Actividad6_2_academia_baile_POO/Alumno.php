<?php

final class Alumno extends Persona{

    public function __construct(string $nombre, string $apellidos, int $tlf_mobil){
        parent::__construct($nombre, $apellidos, $tlf_mobil);
    }

    
}