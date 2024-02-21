<?php


/**
 * Description of Nota
 *
 * @author mfernandez
 */
class Nota implements JsonSerializable{
    
    use ViewData;
    
    private ?int $id;
    private string $titulo;
    private string $contenido;
    
    public function __construct(?int $id=null, string $titulo="", string $contenido="") {
        $this->id = $id;
        $this->titulo = $titulo;
        $this->contenido = $contenido;
    }

    
    public function getId(): ?int {
        return $this->id;
    }

    public function getTitulo(): string {
        return $this->titulo;
    }

    public function getContenido(): string {
        return $this->contenido;
    }

    public function setId(int $id): void {
        $this->id = $id;
    }

    public function setTitulo(string $titulo): void {
        $this->titulo = $titulo;
    }

    public function setContenido(string $contenido): void {
        $this->contenido = $contenido;
    }

    public function jsonSerialize(): mixed {
          //Especificamos qué propiedades no públicas queremos que pasen a formar parte del objeto JSON
        return array(
            'id' => $this->id,
            'titulo' => $this->titulo,
            'contenido' => $this->contenido
        );
    }

}
