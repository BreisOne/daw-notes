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

    public function findByVentas(int $unidades):array{
        
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT a FROM App\Entity\Autor a join a.libros li where li.unidadesVendidas > ?1");
        return $query->setParameter(1, $unidades)->getResult();

    }

    public function findByVentas2(int $unidades):array{
        
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT a, sum(li.unidadesVendidas)  FROM App\Entity\Autor a join a.libros li where li.unidadesVendidas > ?1
        group by a.id order by sum(li.unidadesVendidas)");
        return $query->setParameter(1, $unidades)->getResult();

    }

    public function findAutoresSuperVentas():Libro{
        //Leer https://www.doctrine-project.org/projects/doctrine-orm/en/3.1/reference/dql-doctrine-query-language.html#joins
        //Devuelve un objeto Libro con los autores anidados en la propiedad autores
        $em = $this->getEntityManager();
        $query = $em->createQuery("SELECT a, li FROM App\Entity\Libro li join li.autores a where li.unidadesVendidas= (select max(li2.unidadesVendidas) FROM App\Entity\Libro li2)");
        return $query->getOneOrNullResult();

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
