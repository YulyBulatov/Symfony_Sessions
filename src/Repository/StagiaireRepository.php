<?php

namespace App\Repository;

use App\Entity\Stagiaire;
use App\Entity\Session;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Stagiaire>
 *
 * @method Stagiaire|null find($id, $lockMode = null, $lockVersion = null)
 * @method Stagiaire|null findOneBy(array $criteria, array $orderBy = null)
 * @method Stagiaire[]    findAll()
 * @method Stagiaire[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class StagiaireRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Stagiaire::class);
    }

    public function save(Stagiaire $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Stagiaire $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findNonInscrits($id): array
    {
        $query1 = $this->getEntityManager()->createQueryBuilder();
        $query2 = $this->getEntityManager()->createQueryBuilder();

        $subquery = $query1->select('s.id')
        ->from('App\Entity\Stagiaire', 's')
        ->leftjoin('s.sessions', 'sessions')
        ->where($query1->expr()->eq('sessions.id', ':id'))
        ->setParameter('id', $id)
        ->getQuery()
        ->getResult();

        if(!empty($subquery)) {

        $ids = [];

        foreach ($subquery as $ids_inscrits){

            foreach($ids_inscrits as $id_inscrits){

                $ids[]=$id_inscrits;

            }
                
        }
        

        return $query2->select('s')
            ->from('App\Entity\Stagiaire', 's')
            ->where($query2->expr()->notIn('s.id', $ids))
            ->getQuery()
            ->getResult();
    }
        else{

            return $query2->select('s')
                ->from('App\Entity\Stagiaire','s')
                ->getQuery()
                ->getResult();

        }

    }

//    /**
//     * @return Stagiaire[] Returns an array of Stagiaire objects
//     */
//    public function findByExampleField($value): array
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->orderBy('s.id', 'ASC')
//            ->setMaxResults(10)
//            ->getQuery()
//            ->getResult()
//        ;
//    }

//    public function findOneBySomeField($value): ?Stagiaire
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
