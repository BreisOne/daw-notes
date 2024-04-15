<?php

namespace App\Service;

use App\Entity\Nota;
use App\Repository\NotaRepository;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Doctrine\Persistence\ManagerRegistry;

class NotaService{

    public function __construct(private EntityManagerInterface $entityManager, private NotaRepository $notaRepository){}

    public function create(Nota $nota){
        $this->entityManager->persist($nota);
        $this->entityManager->flush();
    }

    public function findAll():array
    {
       $notas = $this->notaRepository->findAll();
        return $notas;
    }

}