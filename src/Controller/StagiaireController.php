<?php

namespace App\Controller;

use App\Controller\Admin\StagiaireCrudController;
use App\Repository\StagiaireRepository;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

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

    #[Route('/stagiaire/{id}/remove', name: 'remove_stagiaire')]
    public function removeStagiaire(StagiaireRepository $stagiaireRepository, $id): Response
    {
        $stagiaire = $stagiaireRepository->find($id);
        $stagiaireRepository->remove($stagiaire, true);

        return $this->redirectToRoute('app_stagiaire');
    }
}
