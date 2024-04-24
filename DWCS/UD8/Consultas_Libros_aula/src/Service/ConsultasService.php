<?php
namespace App\Service;

use App\Entity\Libro;
use App\Repository\AutorRepository;
use App\Repository\LibroRepository;
use DateTime;

class ConsultasService
{

    public function __construct(private AutorRepository $autorRepository, private LibroRepository $libroRepository)
    {
    }

    public function getAutoresByFechaNac(DateTime $fecha){
        return $this->autorRepository->findByFechaNac($fecha);
    }

    public function getMaxUnidades():int{
        return $this->libroRepository->findMaxUnidades();
    }

    public function getAutoresByUnidades($unidades):array{
        return $this->autorRepository->findByVentas($unidades);
    }

    public function getAutoresByUnidades2($unidades):array{
        return $this->autorRepository->findByVentas2($unidades);
    }

    public function getAutoresSuperVentas():Libro{
        return $this->autorRepository->findAutoresSuperVentas();
    }
    
}
