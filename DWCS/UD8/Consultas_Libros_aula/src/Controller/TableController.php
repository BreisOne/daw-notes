<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class TableController extends AbstractController
{
   

    private const DEFAULT_FILAS_COLS = 4;
    private const DEFAULT_MIN_RANDOM = 0;
    private const DEFAULT_MAX_RANDOM = 100;

    #[Route('/table/{filas?4}/{cols<([1-9]+\d*)>}', 
    name: 'app_table',
     requirements: ['filas'=>'([1-9]+\d*)'])]
    public function index(int $filas, 
    int $cols = self::DEFAULT_FILAS_COLS): Response
    {
        $tabla = array();
        for ($i = 0; $i < $filas; $i++) {
            $tabla[$i] = array();
            for ($j = 0; $j < $cols; $j++) {
                $tabla[$i][$j] = random_int(self::DEFAULT_MIN_RANDOM, self::DEFAULT_MAX_RANDOM);
            }
        }

        return $this->render('table/index.html.twig', [
            'controller_name' => 'TableController',
            'filas' => $filas,
            'cols' => $cols,
            'tabla' => $tabla

        ]);
    }
}
