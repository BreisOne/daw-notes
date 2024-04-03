<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class LuckyController extends AbstractController
{
    #[Route('/lucky', name: 'app_lucky')]
    public function index(): Response
    {
        return $this->render('lucky/index.html.twig', [
            'controller_name' => 'LuckyController',
        ]);
    }

    #[Route('lucky/number/{max}', name:'app_lucky')]
    public function maxRandom(int $max):Response{
        $number = random_int(0, $max);

        return $this->render('lucky/index.html.twig', [
            'controller_name' => 'LuckyController',
            'numero'=> $number
        ]);
    }
}
