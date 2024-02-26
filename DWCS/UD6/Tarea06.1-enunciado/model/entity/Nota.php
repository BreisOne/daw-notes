<?php


/**
 * Description of Note
 *
 * @author maria
 */
class Nota implements JsonSerializable
{

    use ViewData;

    private ?int $id = null;
    private string $titulo="";
    private string $contenido="";

    private ?string $imagePath = "";

    //Para que el método findAll funcione y esta línea en particular:
//    $array = $pdostmt->fetchAll(PDO::FETCH_CLASS, $this->class_name);
//tuve que comentar el constructor de Nota

    // public function __construct(?int $id = null, String $titulo = "", String $contenido = "") {
    //     $this->id = $id;
    //     $this->titulo = $titulo;
    //     $this->contenido = $contenido;
    // }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitulo(): string
    {
        return $this->titulo;
    }

    public function getContenido(): string
    {
        return $this->contenido;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function setTitulo(string $titulo): void
    {
        $this->titulo = $titulo;
    }

    public function setContenido(string $contenido): void
    {
        $this->contenido = $contenido;
    }

    public function getImagePath(): ?string
    {
        return $this->imagePath ?: "";
    }

    public function setImagePath(?string $imagePath): void
    {
        $this->imagePath = $imagePath;
    }


    public function jsonSerialize()
    {
        //Especificamos qué propiedades no públicas queremos que pasen a formar parte del objeto JSON
        return array(
            'id' => $this->id,
            'titulo' => $this->titulo,
            'contenido' => $this->contenido,
            'imagePath' => $this->imagePath
        );
    }



}
