<?php

namespace App\Controller\Admin;

use App\Entity\Programme;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\Field;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

/**
 * @IsGranted("ROLE_ADMIN")
 */

class ProgrammeCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Programme::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            AssociationField::new('session'),
            AssociationField::new('cours'),
            Field::new('duree'),
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
