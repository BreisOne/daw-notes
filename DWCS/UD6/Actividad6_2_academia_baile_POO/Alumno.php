<?php

final class Alumno extends Persona{
    private int $numClases;

    public function __construct(string $nombre, string $apellidos, int $tlf_mobil, int $numClases = null){
        parent::__construct($nombre, $apellidos, $tlf_mobil);
        $this->numClases =  $numClases;
    }

    /**
     * Set the value of numClases
     *
     * @return  self
     */ 
    public function setNumClases($numClases)
    {
        $this->numClases = $numClases;

        return $this;
    }
    public function aPagar()
    {
        if (!isset($this->numClases)) {
            return "Debe indicar previamente o numero de clases";
        }elseif ($this->numClases === 1) {
            return 20;
        }elseif ($this->numClases === 2) {
            return 32;
        }else{
            return 40;
        }
    }

    
}