<?php

namespace App\Controller;

use App\Repository\ProgrammeRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProgrammeController extends AbstractController
{
    #[Route('/programme', name: 'app_programme')]
    public function index(): Response
    {
        return $this->render('programme/index.html.twig', [
            'controller_name' => 'ProgrammeController',
        ]);
    }

    #[Route('/session/{id}/programme/{id_programme}', name: 'remove_programme')]
    public function removeProgramme(string $id, string $id_programme, ProgrammeRepository $programmeRepository): Response
    {
        $programme = $programmeRepository->find($id_programme);
        if (!$programme) {
            throw $this->createNotFoundException();
        }

        $programmeRepository->remove($programme, true);
        return $this->redirectToRoute('show_session', ['id' => $id]);
    }    

}
