<?php

namespace App\Controller;

use App\Repository\StagiaireRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class StagiaireController extends AbstractController
{
    #[Route('/stagiaires', name: 'app_stagiaire')]
    public function index(StagiaireRepository $stagiaireRepository): Response
    {
        return $this->render('stagiaire/index.html.twig', [
            'stagiaires' => $stagiaireRepository->findAll()
        ]);
    }

    #[Route('/stagiaire/{id}', name: 'show_stagiaire')]
    public function showStagiaire($id, StagiaireRepository $stagiaireRepository ): Response
    {
        return $this->render('stagiaire/show.html.twig', [
            'stagiaire' => $stagiaireRepository->find($id)
        ]);
    }
}
