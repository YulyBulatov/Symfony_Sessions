<?php

namespace App\Repository;

use App\Entity\Session;
use App\Repository\StagiaireRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;

/**
 * @extends ServiceEntityRepository<Session>
 *
 * @method Session|null find($id, $lockMode = null, $lockVersion = null)
 * @method Session|null findOneBy(array $criteria, array $orderBy = null)
 * @method Session[]    findAll()
 * @method Session[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class SessionRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Session::class);
    }

    public function save(Session $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Session $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findCurrentSessions(): array
    {
        $query = $this->getEntityManager()->createQuery('SELECT session FROM App\Entity\Session session
                WHERE CURRENT_DATE() >= session.dateDebut AND CURRENT_DATE() <= session.dateFin');

        return $query->getResult();   

    }
    public function findPastSessions(): array
    {
        $query = $this->getEntityManager()->createQuery('SELECT session FROM App\Entity\Session session
                WHERE CURRENT_DATE() > session.dateFin');

        return $query->getResult();   

    }

    public function findFutureSessions(): array
    {
        $query = $this->getEntityManager()->createQuery('SELECT session FROM App\Entity\Session session
                WHERE CURRENT_DATE() < session.dateDebut');

        return $query->getResult();   

    }
/* 
    public function removeStagiaireSession($id_stagiare, $id_session, StagiaireRepository $stagiaireRepository)
    {
        $stagiaire = $stagiaireRepository->find($id_stagiare);

        return $query = $this->getEntityManager()->createQueryBuilder()->delete('')
    }
 */
    



//    /**
//     * @return Session[] Returns an array of Session objects
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

//    public function findOneBySomeField($value): ?Session
//    {
//        return $this->createQueryBuilder('s')
//            ->andWhere('s.exampleField = :val')
//            ->setParameter('val', $value)
//            ->getQuery()
//            ->getOneOrNullResult()
//        ;
//    }
}
