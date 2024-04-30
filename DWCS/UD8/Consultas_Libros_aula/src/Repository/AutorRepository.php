<?php

namespace App\Repository;

use App\Entity\Autor;
use App\Entity\Libro;
use DateTime;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Autor>
 *
 * @method Autor|null find($id, $lockMode = null, $lockVersion = null)
 * @method Autor|null findOneBy(array $criteria, array $orderBy = null)
 * @method Autor[]    findAll()
 * @method Autor[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class AutorRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Autor::class);
    }

    public function findByFechaNac(DateTime $fechaNac):array{
        
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT a FROM App\Entity\Autor a WHERE a.fechaNacimiento >= :fechaNac order by a.fechaNacimiento");
        return $query->setParameter("fechaNac", $fechaNac)->getResult();

    }

    public function findByFechaNacQB(DateTime $fechaNac):int{


        return $this->createQueryBuilder('a')
                    ->andWhere('a.fechaNaciemiento >= :val')
                    ->setParameter('val', $fechaNac)
                    ->orderBy('a.fechaNacimiento', 'ASC')
                    ->getQuery()
                    ->getSingleScalarResult();

    }

    public function findByVentas(int $unidades):array{
        
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT a FROM App\Entity\Autor a join a.libros li where li.unidadesVendidas > ?1");
        return $query->setParameter(1, $unidades)->getResult();

    }

    public function findByVentasQB(int $unidades):array{
        
        return $this->createQueryBuilder('a')
                    # Esto addSelect() trae libros y autores en una única consulta de no añadir esta función 
                    # se realizaría una consulta para traer autores y posteriormente otra consulta 
                    # por cada autor de un libro (problema de las n+1 consultas)            
                    ->addSelect('li')
                    ->innerJoin('a.libros', 'li')
                    ->andWhere('li.unidadesVendidas > ?1')
                    ->setParameter(1, $unidades)
                    ->getQuery()
                    ->getResult();

    }

    public function findByVentas2(int $unidades):array{
        
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT a, sum(li.unidadesVendidas)  FROM App\Entity\Autor a join a.libros li where li.unidadesVendidas > ?1
        group by a.id order by sum(li.unidadesVendidas)");
        return $query->setParameter(1, $unidades)->getResult();

    }
    public function findByVentas2QB(int $unidades):array{
        
        return $this->createQueryBuilder('a')
                ->addSelect("SUM(li.unidadesVendidas)")
                ->innerJoin('a.libros', 'li')
                ->andWhere("liu.unidadesVendidas > ?1")
                ->setParameter(1, $unidades)
                ->groupBy('a.id')
                ->orderBy("SUM(li.unidadesVendidas)")
                ->getQuery()
                ->getResult();

    }
    
    

    //    /**
    //     * @return Autor[] Returns an array of Autor objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('a.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Autor
    //    {
    //        return $this->createQueryBuilder('a')
    //            ->andWhere('a.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
