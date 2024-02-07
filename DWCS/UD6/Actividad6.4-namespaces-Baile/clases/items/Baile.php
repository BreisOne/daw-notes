<?php
namespace clases\items;

/**
 * Description of Baile
 *
 * @author maria
 */
class Baile {
   const IDADE_MINIMA_DEFECTO=8;
    
   private $nome;
   private $idadeMinima;
   
   public function __construct(string $nome, 
           int $idadeMinima= self::IDADE_MINIMA_DEFECTO) {
       $this->nome = $nome;
       $this->idadeMinima = $idadeMinima;
   }
   
   public function getNome():string {
       return $this->nome;
   }

   public function getIdadeMinima(): int{
       return $this->idadeMinima;
   }

   public function setNome(string $nome): void {
       $this->nome = $nome;
   }

   public function setIdadeMinima(int $idadeMinima): void {
       $this->idadeMinima = $idadeMinima;
   }



}
