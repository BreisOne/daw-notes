<?php

namespace App\Controller;

use App\Entity\Nota;
use App\Service\NotaService;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Validator\Validator\ValidatorInterface;

class NotaController extends AbstractController
{
    // #[Route('/nota/new', name: 'app_nota_new')]
    // public function new(NotaService $notaService): Response
    // {
    //     $nota = new Nota();
    //     $nota->setTitulo("Mi primera nota");
    //     $nota->setDescripcion("bla bla");
    //     $nota->setFechaModificion(new \DateTime());

    //     // $entityManager->persist($nota);
    //     // $entityManager->flush();

    //     $notaService->create($nota);

    //     return $this->render('nota/index.html.twig', [
    //         'controller_name' => 'NotaController',
    //         'nota' => $nota
    //     ]);
    // }



    #[Route('/nota/new', name: 'app_nota_new')]
    public function new(Request $request, ValidatorInterface $validator, NotaService $notaService): Response
    {
        $nota = new Nota();
        if ($request->getMethod() === 'POST') {
            $descripcion = $request->request->get('desc', "");
            $titulo = $request->request->get('titulo', "");
            $nota->setTitulo($titulo);
            $nota->setDescripcion($descripcion);
            $errores = $validator->validate($nota);
            if (count($errores) > 0) {
                foreach ($errores as $error) {
                    $this->addFlash("warning", $error->getMessage());
                }
                return $this->render('nota/crear.html.twig', ['nota' => $nota]);
            } else {
                $notaService->create($nota);
                $this->addFlash('success', 'Nota guardada correctamente');
                return $this->redirectToRoute('app_nota_list');

            }
        } else {
            return $this->render('nota/crear.html.twig', [
                'controller_name' => 'NotaController',
                'nota' => $nota
            ]);
        }
    }

    #[Route('/nota', name: 'app_nota_list')]
    public function list(NotaService $notaService): Response
    {


        $notas = $notaService->list();

        return $this->render('nota/list.html.twig', [
            'controller_name' => 'NotaController',
            'notas' => $notas
        ]);
    }

    // #[Route('/nota/{id<\d+>}', name: 'app_nota_read')]
    // public function find(int $id, NotaService $notaService): Response    {


    //     $nota = $notaService->find($id);

    //     return $this->render('nota/detail.html.twig', [
    //         'controller_name' => 'NotaController',
    //         'nota' => $nota
    //     ]);
    // }


    #[Route('/nota/{id<\d+>}', name: 'app_nota_read')]
    public function find(Nota $nota): Response
    {




        return $this->render('nota/detail.html.twig', [
            'controller_name' => 'NotaController',
            'nota' => $nota
        ]);
    }

}
