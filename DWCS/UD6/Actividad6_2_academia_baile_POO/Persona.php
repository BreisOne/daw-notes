<?php
class Persona{
    private String $nombre;
    private string $apellidos;
    private int $tlf_mobil;

    public function __construct(String $nombre, String $apellidos, int $tlf_mobil){
        $this->nombre = $nombre;
        $this->apellidos = $apellidos;
        $this->tlf_mobil = $tlf_mobil;
    }

    public function verInformacion(){
        return "<p>$this->nombre $this->apellidos</p>"."<p>$this->tlf_mobil</p>";
    }

    

}

