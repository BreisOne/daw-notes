<?php
namespace clases\people;

use clases\items\Baile;
use DateTime;
use DateTimeImmutable;

/**
 * Description of Profesor
 *
 * @author maria
 */


final class Profesor extends Persoa {

    const IMPORTE_HORA_POR_DEFECTO = 16;
    private $bailes = [];
    private $NIF;
    

    public function __construct(string $nome,
            string $apelidos,
            string $mobil,
            DateTimeImmutable $fechaNacimeinto,
            string $NIF) {
        parent::__construct($nome, $apelidos, $mobil, $fechaNacimeinto);
        $this->NIF = $NIF;
    }

    public function calcularSoldo(float $horas,
            float $importe_hora = self::IMPORTE_HORA_POR_DEFECTO): float {
        return $horas * $importe_hora;
    }

    public function engadir(Baile $baile): bool {
        $engadido = false;
        if (!in_array($baile, $this->bailes)) {
            $this->bailes[] = $baile;
//Outra posibilidade: 
            //   if(array_search($baile, $this->bailes===false){
            //array_push($this->bailes, $baile);     
            // }

            $engadido = true;
        }
        return $engadido;
    }
    
    //Se se considera o mesmo baile só polo nome:
      public function engadirSoDiferenteNome(Baile $baile): bool {
        $engadido = false;
        $array_nomes_bailes = array_map("getNomesBailes", $this->bailes);
        if (!in_array($baile->getNome(), $array_nomes_bailes)) {
            $this->bailes[] = $baile;
            $engadido = true;
        }
        return $engadido;
    }

    public function eliminar(Baile $baile): bool {
        $eliminado = false;
        //false o index
        $encontrado = array_search($baile, $this->bailes);
        if ($encontrado !== false) {
            unset($this->bailes[$encontrado]);
            //Para non quedar co índice numérico $encontrado baleiro:
            //$this->bailes = array_values($this->bailes);
            $eliminado = true;
        }


        return $eliminado;
    }

    public function mostrarBailes() {
        foreach ($this->bailes as $b) {
            //$nome_baile = $b->getNome();

            echo $b->getNome() . " (idade min: " . $b->getIdadeMinima() . " anos)<br/>";
        }
    }

    public function verInformacion(){
        $cadea = implode (" ", 
        [$this->nome,  $this->apelidos, 
            "(".$this->mobil.") "]);
        echo $cadea;

        echo $this->fechaNacimiento->format('Y-m-d')."<br/>";
    }

}
