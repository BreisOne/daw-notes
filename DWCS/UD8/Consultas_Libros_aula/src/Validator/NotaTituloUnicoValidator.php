<?php

namespace App\Validator;

use App\Repository\NotaRepository;
use Symfony\Component\Validator\Constraint;
use Symfony\Component\Validator\ConstraintValidator;

class NotaTituloUnicoValidator extends ConstraintValidator
{

    //++ ctror + Inyectamos una propiedad NotaRepository 
    public function __construct(private NotaRepository $notaRepository) {
        
    }
    //Como la constraint es a nivel de clase, el primer parámetro será una Nota
    public function validate($nota, Constraint $constraint)
    {
        /* @var NotaTituloUnico $constraint */

        $titulo = $nota->getTitulo();

         // custom constraints should ignore null and empty values to allow
        // other constraints (NotBlank, NotNull, etc.) to take care of that
        if (null === $titulo || '' === $titulo) {
            return;
        }

       $tareaConIgualTitulo = $this->notaRepository->findOneBy(["titulo"=>$titulo]);
       if($tareaConIgualTitulo!=null && $nota->getId()!= $tareaConIgualTitulo->getId()){
        $this->context->buildViolation($constraint->message)
            ->setParameter('{{ value }}', $titulo)
            ->addViolation();
       }
    }
}
