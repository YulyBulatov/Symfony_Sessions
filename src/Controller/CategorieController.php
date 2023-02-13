<?php

namespace App\Controller;

use App\Repository\CategorieRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CategorieController extends AbstractController
{
    #[Route('/categorie', name: 'app_categorie')]
    public function index(CategorieRepository $categorieRepository): Response
    {
        return $this->render('categorie/index.html.twig', [
            'categories' => $categorieRepository->findAll(),

        ]);
    }

    #[Route('/categorie/{id}', name: 'show_categorie')]
    public function show(CategorieRepository $categorieRepository, int $id): Response
    {
        return $this->render('categorie/show.html.twig', [
            'categorie' => $categorieRepository->find($id),
        ]);
    }    
}
