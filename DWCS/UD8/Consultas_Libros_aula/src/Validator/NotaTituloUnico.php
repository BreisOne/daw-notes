<?php

namespace App\Validator;

use Symfony\Component\Validator\Constraint;

/**
 * @Annotation
 * @Target({"PROPERTY", "METHOD", "ANNOTATION"})
 */
#[\Attribute]
class NotaTituloUnico extends Constraint
{
    /*
     * Any public properties become valid options for the annotation.
     * Then, use these in your validator class.
     */
    public $message = 'El título "{{ value }}" está ya en uso.';

    public function getTargets(): string
    {
        //para que se pueda utilizar a nivel de clase y el validador reciba un objeto como el primer parámetro en validate()
        return self::CLASS_CONSTRAINT;
    }
}
