<?php

namespace App\Controller\Admin;

use App\Entity\Session;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use App\Controller\Admin\ProgrammeCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
/**
 * @IsGranted("ROLE_ADMIN")
 */
class SessionCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Session::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            AssociationField::new('formateur'),
            AssociationField::new('formation'),
            Field::new('dateDebut'),
            Field::new('dateFin'),
            Field::new('nbrePlaces'),
            Field::new('nom'),
            AssociationField::new('stagiaire')->onlyOnForms(),
            CollectionField::new('programmes')->onlyOnForms()->useEntryCrudForm(),
        ];
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
