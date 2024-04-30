<?php

namespace App\Controller;

use App\Repository\AutorRepository;
use App\Service\ConsultasService;
use DateTime;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class ConsultasController extends AbstractController
{

    public function __construct(private ConsultasService $consultasService) {
        
    }

    #[Route('/consultas/{fecha}', name: 'app_consultas')]
    public function index(DateTime $fecha ):Response
    {

        $autores =$this->consultasService->getAutoresByFechaNac($fecha);

        return $this->render('consultas/index.html.twig', [
            
            'autores' => $autores
        ]);
    }

    #[Route('/consultas/libros/maxu', name: 'app_consultas_maxunidades')]
    public function getMaxUnidades():Response
    {

        $maxUnidades = $this->consultasService->getMaxUnidades();

        return $this->render('consultas/index.html.twig', [
            
            'maxUnidades' => $maxUnidades
        ]);
    }


    
    #[Route('/consultas/autores/ventas/{unidades}', name: 'app_consultas_autores_por_ventas')]
    public function getAutoresByVentas(int $unidades):Response
    {

        $autoresSuperVentas = $this->consultasService->getAutoresByUnidades($unidades);

        return $this->render('consultas/index.html.twig', [
           
            'autoresSuperventas' => $autoresSuperVentas
        ]);
    }

    #[Route('/consultas/autores/ventas2/{unidades}', name: 'app_consultas_autores_por_ventas2')]
    public function getAutoresByVentas2(int $unidades):Response
    {

        $autoresSumaUnidades = $this->consultasService->getAutoresByUnidades2($unidades);

        return $this->render('consultas/index.html.twig', [
           
            'autoresSumaUnidades' => $autoresSumaUnidades
        ]);
    }

    #[Route('/consultas/autores/maxVentas', name: 'app_consultas_autores_max_ventas')]
    public function getAutoresMaxVentas():Response
    {

        $libroSuperVentasConAutores = $this->consultasService->getAutoresSuperVentas();
        

        return $this->render('consultas/index.html.twig', [
         
            'libroSuperVentas' => $libroSuperVentasConAutores
        ]);
    }
}
