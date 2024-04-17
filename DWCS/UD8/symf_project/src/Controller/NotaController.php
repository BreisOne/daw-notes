<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Entity\Nota;
use App\Service\NotaService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class NotaController extends AbstractController
{
    // #[Route('/nota/new', name: 'app_nota_new')]
    // public function new(NotaService $notaService): Response
    // {
    //     $nota = new Nota();
    //     $nota->setTitulo("Mi primera nota");
    //     $nota->setDescription("bla bla");

    //     $notaService->create($nota);

    //     return $this->render('nota/index.html.twig', [
    //         'controller_name' => 'NotaController',
    //         'nota' => $nota
    //     ]);
    // }

    #[Route('/nota/list', name: 'app_nota_list')]
    public function findNotas(NotaService $notaService): Response
    {
        $notas = $notaService->findAll();

        //$this->addFlash("warning", "Tienes que tener cuidado");
        
        return $this->render('nota/table.html.twig', [
            'controller_name' => 'NotaController',
            'notas' => $notas
        ]);
    }
    
    #[Route('/nota/new', name: 'app_nota_new')]
    public function new(Request $request, NotaService $notaService, ValidatorInterface $validator): Response
    {
        $nota = new Nota();

        if($request->getMethod() == "POST")
        {
            $titulo = $request->request->get('titulo');
            $desc = $request->request->get('desc');

            $nota->setTitulo($titulo);
            $nota->setDescription($desc);

            $errores = $validator->validate($nota);

            if(count($errores)>0){
                foreach ($errores as $error) {
                    $this->addFlash('danger', 'Se ha producido un error: ' . $error->getMessage());
                }
            }else{
                $notaService->create($nota);
                $this->addFlash('success', 'Se ha creado la nota con éxito');
                return $this->redirectToRoute('app_nota_list');
            }

        }

        return $this->render('nota/create.html.twig', [
            'nota' => $nota
        ]);
    }

}
