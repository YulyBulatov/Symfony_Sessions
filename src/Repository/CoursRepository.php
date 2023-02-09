<?php

namespace App\Repository;

use App\Entity\Cours;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Cours>
 *
 * @method Cours|null find($id, $lockMode = null, $lockVersion = null)
 * @method Cours|null findOneBy(array $criteria, array $orderBy = null)
 * @method Cours[]    findAll()
 * @method Cours[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CoursRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Cours::class);
    }

    public function save(Cours $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Cours $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findNonProgrammed($id): array
    {
        $query1 = $this->getEntityManager()->createQueryBuilder();
        $query2 = $this->getEntityManager()->createQueryBuilder();

        $subquery = $query1->select('c.id')
        ->from('App\Entity\Cours', 'c')
        ->leftjoin('c.programmes', 'programmes')
        ->leftJoin('programmes.session','session')
        ->where($query1->expr()->eq('session.id', ':id'))
        ->setParameter('id', $id)
        ->getQuery()
        ->getResult();

        if (!empty($subquery)) {
        

        $ids = [];

        foreach ($subquery as $ids_programmed){

            foreach($ids_programmed as $id_programmed){

                $ids[]=$id_programmed;

            }
                
        }
        

        return $query2->select('c')
            ->from('App\Entity\Cours', 'c')
            ->where($query2->expr()->notIn('c.id', $ids))
            ->getQuery()
            ->getResult();
        }
        
        else{
            return $query2->select('c')
                ->from('App\Entity\Cours', 'c')
                ->getQuery()
                ->getResult();
        }
    }

//    /**
//     * @return Cours[] Returns an array of Cours objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('c.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Cours
//    {
//        return $this->createQueryBuilder('c')
//            ->andWhere('c.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
