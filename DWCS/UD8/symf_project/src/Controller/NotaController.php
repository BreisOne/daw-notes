<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Nota;
use App\Service\NotaService;

class NotaController extends AbstractController
{
    #[Route('/nota/new', name: 'app_nota_new')]
    public function new(NotaService $notaService): Response
    {
        $nota = new Nota();
        $nota->setTitulo("Mi primera nota");
        $nota->setDescription("bla bla");

        $notaService->create($nota);

        return $this->render('nota/index.html.twig', [
            'controller_name' => 'NotaController',
            'nota' => $nota
        ]);
    }

    #[Route('/nota/list', name: 'app_nota_list')]
    public function findNotas(NotaService $notaService): Response
    {
        $notas = $notaService->findAll();

        $this->addFlash("warning", "Tienes que tener cuidado");
        
        return $this->render('nota/table.html.twig', [
            'controller_name' => 'NotaController',
            'notas' => $notas
        ]);
    }
    
}
