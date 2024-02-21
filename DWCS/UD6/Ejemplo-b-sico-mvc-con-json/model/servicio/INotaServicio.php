<?php
interface INotaServicio
{
    function getNotas(): array;
    function getNoteById($id): Nota;
    function save(Nota $nota): Nota;
    function deleteNoteById($id): bool;
}