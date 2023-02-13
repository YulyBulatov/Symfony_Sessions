<?php

namespace App\Controller;

use App\Repository\FormateurRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class FormateurController extends AbstractController
{
    #[Route('/formateur', name: 'app_formateur')]
    public function index(FormateurRepository $formateurRepository): Response
    {
        return $this->render('formateur/index.html.twig', [
            'formateurs' => $formateurRepository->findAll(),

        ]);
    }

    #[Route('/formateur/{id}', name: 'show_formateur')]
    public function showformateur($id, FormateurRepository $formateurRepository ): Response
    {
        return $this->render('formateur/show.html.twig', [
            'formateur' => $formateurRepository->find($id)
        ]);
    }

    #[Route('/formateur/{id}/remove', name: 'remove_formateur')]
    public function removeformateur(FormateurRepository $formateurRepository, $id): Response
    {
        $formateur = $formateurRepository->find($id);
        $formateurRepository->remove($formateur, true);

        return $this->redirectToRoute('app_formateur');
    }
}
