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
        // return $this->render('lucky/index.html.twig', [
        //     'controller_name' => 'LuckyController',
        // ]);
        return $this->redirectToRoute('app_lucky_number', ['max' => 10]);
    }

    #[Route('lucky/number/{max}', name:'app_lucky_number')]
    public function maxRandom(int $max):Response{
        if($max%2==0){
            $number = random_int(0, $max);

            return $this->render('lucky/index.html.twig', [
                'controller_name' => 'LuckyController',
                'numero'=> $number
            ]);
        }else{

            return $this->redirectToRoute('app_table_params', ['fils' => $max, 'cols' => $max]);
        }
       
    }
}
