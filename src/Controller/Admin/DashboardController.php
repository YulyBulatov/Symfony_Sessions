<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Cours;
use App\Entity\Session;
use App\Entity\Categorie;
use App\Entity\Formateur;
use App\Entity\Formation;
use App\Entity\Programme;
use App\Entity\Stagiaire;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;

/**
 * @IsGranted("ROLE_ADMIN")
 */

class DashboardController extends AbstractDashboardController
{
    #[Route('/admin', name: 'admin')]
    public function index(): Response
    {

        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);

        // Option 1. Make your dashboard redirect to the same page for all users
        return $this->redirect($adminUrlGenerator->setController(UserCrudController::class)->generateUrl());


        
        

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        // $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        // return $this->redirect($adminUrlGenerator->setController(OneOfYourCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('Symfony Sessions');
    }

    public function configureMenuItems(): iterable
    {   
        yield MenuItem::linkToCrud('User', 'fa fa-user', User::class);
        yield MenuItem::linkToCrud('Stagiaire', 'fa fa-user-graduate', Stagiaire::class);
        yield MenuItem::linkToCrud('Formateur', 'fa fa-person-chalkboard', Formateur::class);
        yield MenuItem::linkToCrud('Formation', 'fa fa-award', Formation::class); 
        yield MenuItem::linkToCrud('Session', 'fa fa-graduation-cap', Session::class);
        yield MenuItem::linkToCrud('Categorie', 'fa fa-list-ol', Categorie::class);
        yield MenuItem::linkToCrud('Courses', 'fa fa-book', Cours::class);
        yield MenuItem::linkToCrud('Programme', 'fa fa-file-o', Programme::class);
        yield MenuItem::linkToRoute('Accueil', 'fa fa-home', 'app_home');

        // yield MenuItem::linkToCrud('The Label', 'fas fa-list', EntityClass::class);
    }
}
