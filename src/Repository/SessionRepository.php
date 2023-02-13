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

    public function desinscrire($id_stagiare, $id_session)
    {
        $query = $this->getEntityManager()->createQueryBuilder()->update('App\Entity\Session', 's')
        ->set('s.stagiaire.session_id', '0')
        ->set('s.stagiare.stagiaire_id', '0')
        ->andWhere('s.stagiaire.session_id = :sessionId')
        ->andWhere('s.stagiare.stagiaire_id = :stagiaireId')
        ->setParameters(array(
        'sessionId' => $id_session,
        'stagiaireId' => $id_stagiare))
        ->getQuery();

        return $query->execute();
    }



    



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
