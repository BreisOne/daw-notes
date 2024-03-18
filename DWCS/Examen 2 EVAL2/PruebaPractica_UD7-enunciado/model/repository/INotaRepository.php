<?php


/**
 *
 * @author mfernandez
 */
interface INotaRepository {

    public function getNotas(): array; 

    function getNotaById(int $id):Nota;

    public function updateNota(Nota $notaToUpdate): bool;

    public function deleteNota(int $id): bool;
    
    public function create(Nota $nota):Nota;
}
