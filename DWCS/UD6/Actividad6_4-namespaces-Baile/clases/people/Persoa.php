<?php
namespace clases\people;

use traits\Logger;

/**
 * Description of Persoa
 *
 * @author maria
 */
abstract class Persoa implements \JsonSerializable
{
    protected $nome;
    protected $apelidos;
    protected $mobil;
    protected $fechaNacimiento;

    use Logger;

    public function __construct(string $nome, string $apelidos, string $mobil, \DateTimeImmutable $fechaNacimiento)
    {
        $this->nome = $nome;
        $this->apelidos = $apelidos;
        $this->mobil = $mobil;
        $this->fechaNacimiento = $fechaNacimiento;
    }


    public function getNome(): string
    {
        return $this->nome;
    }

    public function getApelidos(): string
    {
        return $this->apelidos;
    }

    public function getMobil(): string
    {
        return $this->mobil;
    }

    public function setNome(string $nome): void
    {
        $this->nome = $nome;
    }

    public function setApelidos(string $apelidos): void
    {
        $this->apelidos = $apelidos;
    }

    public function setMobil(string $mobil): void
    {
        $this->mobil = $mobil;
    }


    abstract public function verInformacion();

    public function jsonSerialize()
    {
        $this->log("Serializando...");

        $nome_apelidos = join(" ", [$this->nome, $this->apelidos], );
        return ["nome_apelidos" => $nome_apelidos, "mobil" => $this->mobil];
    }

    public function getFechaNacimiento()
    {
        return $this->fechaNacimiento;
    }

    public function setFechaNacimiento($fechaNacimiento)
    {
        $this->fechaNacimiento = $fechaNacimiento;

        return $this;
    }

    public function esMayorEdad(): bool
    {
        $currentDate = new \DateTime("now");
        $diff = $currentDate->diff($this->fechaNacimiento);
        return $diff->y >= 18;
    }
}
