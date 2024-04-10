<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class TableController extends AbstractController
{
    // #[Route('/table', name: 'app_table')]
    // public function index(): Response
    // {
    //     return $this->render('table/index.html.twig', [
    //         'controller_name' => 'TableController',
    //     ]);
    // }

    #[Route('/table/{fils<([1-9]\d+)>?4}/{cols<([1-9]\d+)>?4}', name: 'app_table_params')]
    public function createTable(int $fils, int $cols): Response
    {
        $table = [];
        for ($i = 0; $i < $fils; $i++) {
            $row = array();
            for ($j = 0; $j < $cols; $j++) {
                $num = random_int(0, 100);
                $row[] = $num;
            }
            $table[] = $row;
        }

        return $this->render('table/index.html.twig', [
            'controller_name' => 'TableController',
            'table_array' => $table,
            'fils' => $fils,
            'cols'=> $cols,
        ]);
    }
}

