<?php
class Circulo extends Figura
{
    public const PI = 3.1416;
    
    private float $radio;

    private Point $centro;

    public function __construct(String $nombre, float $radio, Point $centro)
    {
        parent::__construct($nombre);
        $this->radio = $radio;
        $this->centro = $centro;
    }
    
    public function calcularArea()
    {
        //return $this->radio * $this->radio * self::PI;
        parent::calcularArea();
        return pow($this->radio, 2) * self::PI;
    }

    /**
     * Get the value of radio
     */ 
    public function getRadio()
    {
        return $this->radio;
    }

    /**
     * Set the value of radio
     *
     * @return  self
     */ 
    public function setRadio($radio)
    {
        $this->radio = $radio;

        return $this;
    }

    /**
     * Get the value of centro
     */ 
    public function getCentro()
    {
        return $this->centro;
    }

    /**
     * Set the value of centro
     *
     * @return  self
     */ 
    public function setCentro($centro)
    {
        $this->centro = $centro;

        return $this;
    }
}