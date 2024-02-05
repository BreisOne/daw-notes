<?php
class Baile{
    private String $nombre;
    private int $edadeMinima;

    public function __construct(String $nombre, int $edadMinima = 8){
        $this->nombre = $nombre;
        $this->edadeMinima = $edadMinima;
    }

    

    /**
     * Get the value of nombre
     */ 
    public function getNombre()
    {
        return $this->nombre;
    }

    /**
     * Set the value of nombre
     *
     * @return  self
     */ 
    public function setNombre($nombre)
    {
        $this->nombre = $nombre;

        return $this;
    }

    /**
     * Get the value of edadeMinima
     */ 
    public function getEdadeMinima()
    {
        return $this->edadeMinima;
    }

    /**
     * Set the value of edadeMinima
     *
     * @return  self
     */ 
    public function setEdadeMinima($edadeMinima)
    {
        $this->edadeMinima = $edadeMinima;

        return $this;
    }
}