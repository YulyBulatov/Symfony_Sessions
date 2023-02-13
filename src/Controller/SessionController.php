<?php

namespace App\Controller;

use App\Repository\CoursRepository;
use App\Repository\SessionRepository;
use App\Repository\StagiaireRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class SessionController extends AbstractController
{
    #[Route('/session', name: 'app_session')]
    public function index(SessionRepository $sessionRepository): Response
    {
        return $this->render('session/index.html.twig', [
            'sessions' => $sessionRepository->findAll(),

        ]);
    }

    #[Route('/session/{id}', name: 'show_session')]
    public function showSession($id, SessionRepository $sessionRepository, StagiaireRepository $stagiaireRepository, CoursRepository $coursRepository): Response
    {
        return $this->render('session/show.html.twig', [
            'session' => $sessionRepository->find($id),
            'stagiaires' => $stagiaireRepository->findNonInscrits($id),
            'cours' => $coursRepository->findNonProgrammed($id)
        ]);
    }

    #[Route('/session/{id_stagiaire}/{id_session}', name: 'desinscrire_stagiaire_session')]
    public function desinscrireStagiaire($id_stagiaire, $id_session, SessionRepository $sessionRepository): Response
    {
        $sessionRepository->desinscrire($id_stagiaire, $id_session);


        return $this->redirectToRoute('show_session', ['id' => $id_session]);


    }    


}
