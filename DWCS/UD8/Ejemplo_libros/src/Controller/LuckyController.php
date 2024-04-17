<?php

namespace App\Controller;

use App\Service\MessageGenerator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class LuckyController extends AbstractController
{
    #[Route('/lucky', name: 'app_lucky')]
    public function index(): Response
    {
        // return $this->render('lucky/index.html.twig', [
        //     'controller_name' => 'LuckyController',
        // ]);
       return $this->redirectToRoute('app_lucky_number', ['max' => 20]);
    }

    #[Route('/lucky/number/{max}', name: 'app_lucky_number')]
    public function maxRandom(int $max): Response
    {
        //si es impar
        if($max % 2 == 1){
            return $this->redirectToRoute('app_table', ['filas' => $max, 'cols' => $max ]);
        } else {

            $number = random_int(0, $max);

            return $this->render('lucky/index.html.twig', [
                'controller_name' => 'LuckyController',
                'numero' => $number
            ]);
        }
    }

    #[Route('/lucky/msg', name: 'app_lucky_msg')]
    public function getMessage(MessageGenerator $msgGenerator): Response
    {
        $texto = $msgGenerator->getHappyMessage();
        return $this->render('lucky/messages.html.twig', [
            'controller_name' => 'LuckyController',
            'message'=> $texto
        ]);
       
    }
}
