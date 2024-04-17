<?php

namespace App\Entity;

use App\Repository\NotaRepository;
use DateTime;
use App\Validator as AppValidator; 

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

#[ORM\Entity(repositoryClass: NotaRepository::class)]
#[AppValidator\NotaTituloUnico]
class Nota
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Assert\NotBlank(["message"=> "El título no debe estar vacía"])]
    #[ORM\Column(length: 50)]
    private ?string $titulo = null;

    #[Assert\NotBlank(["message"=> "La descripción no debe estar vacía"])]
    #[ORM\Column(length: 255)]
    private ?string $descripcion = null;


    #[ORM\Column(type: 'datetime')]
    private ?DateTime $fechaModificion = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitulo(): ?string
    {
        return $this->titulo;
    }

    public function setTitulo(string $titulo): static
    {
        $this->titulo = $titulo;

        return $this;
    }

    public function getDescripcion(): ?string
    {
        return $this->descripcion;
    }

    public function setDescripcion(string $descripcion): static
    {
        $this->descripcion = $descripcion;

        return $this;
    }

    public function getFechaModificion(): ?\DateTimeInterface
    {
        return $this->fechaModificion;
    }

    public function setFechaModificion(\DateTimeInterface $fechaModificion): static
    {
        $this->fechaModificion = $fechaModificion;

        return $this;
    }

  
}
