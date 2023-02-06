<?php

namespace App\Controller;


use App\Repository\SessionRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class HomeController extends AbstractController
{
    #[Route('/home', name: 'app_home')]
    public function index(SessionRepository $sessionRepository): Response
    {
        return $this->render('home/index.html.twig', [
            'sessions' => $sessionRepository->findAll(),
            'current_sessions' => $sessionRepository->findCurrentSessions(),
            'future_sessions' => $sessionRepository->findFutureSessions(),
            'past_sessions' => $sessionRepository->findPastSessions()

        ]);
    }
}
