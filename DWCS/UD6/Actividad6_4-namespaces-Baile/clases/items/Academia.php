<?php
namespace clases\items;

use clases\people\{Profesor, Alumno};


/**
 * Description of Academia
 *
 * @author maria
 */

class Academia {

    CONST ACADEMIA_NOME = "Baila comigo";

    private $profes = [];
    private $alumnos = [];

    public function engadirProfe(Profesor $profe): bool {
        $engadido = false;
        if (!in_array($profe, $this->profes)) {
            $this->profes[] = $profe;
            $engadido = true;
        }
        return $engadido;
    }
    
      public function engadirAlumno(Alumno $al): bool {
        $engadido = false;
        if (!in_array($al, $this->alumnos)) {
            $this->alumnos[] = $al;
            $engadido = true;
        }
        return $engadido;
    }

}
