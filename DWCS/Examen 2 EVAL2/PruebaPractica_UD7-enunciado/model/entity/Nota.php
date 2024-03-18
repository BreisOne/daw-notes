<?php


/**
 * Description of Nota
 *
 * @author mfernandez
 */
class Nota implements JsonSerializable{
    
  
    
    private ?int $id;
    private string $title="";
    private bool $completed=false;

    private ?DateTimeImmutable $createdAt=null;
    private ?DateTimeImmutable $updatedAt=null;

    
    public function __construct(?int $id=null, string $titulo="", bool $completed=false, DateTimeImmutable $createdAt=null, DateTimeImmutable $updatedAt=null) {
        $this->id = $id;
        $this->title = $titulo;
        $this->completed= $completed;
        $this->createdAt = $createdAt;
        $this->updatedAt = $updatedAt;
        
    }

    


    public function jsonSerialize(): mixed {
          //Especificamos qué propiedades no públicas queremos que pasen a formar parte del objeto JSON
        return array(
            'id' => $this->id,
            'title' => $this->title,
            'completed' => $this->completed,
            'createdAt' => $this->createdAt!=null? $this->createdAt->format('Y-m-d\TH:i:sO'): null,
            'updatedAt' => $this->updatedAt!=null? $this->updatedAt->format('Y-m-d\TH:i:sO'):null
        );
    }


    /**
     * Get the value of id
     *
     * @return ?int
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * Set the value of id
     *
     * @param ?int $id
     *
     * @return self
     */
    public function setId(?int $id): self
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Get the value of title
     *
     * @return string
     */
    public function getTitle(): string
    {
        return $this->title;
    }

    /**
     * Set the value of title
     *
     * @param string $title
     *
     * @return self
     */
    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get the value of completed
     *
     * @return bool
     */
    public function getCompleted(): bool
    {
        return $this->completed;
    }

    /**
     * Set the value of completed
     *
     * @param bool $completed
     *
     * @return self
     */
    public function setCompleted(bool $completed): self
    {
        $this->completed = $completed;

        return $this;
    }

    /**
     * Get the value of createdAt
     *
     * @return ?DateTimeImmutable
     */
    public function getCreatedAt(): ?DateTimeImmutable
    {
        return $this->createdAt;
    }

    /**
     * Set the value of createdAt
     *
     * @param ?DateTimeImmutable $createdAt
     *
     * @return self
     */
    public function setCreatedAt(?DateTimeImmutable $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get the value of updatedAt
     *
     * @return ?DateTimeImmutable
     */
    public function getUpdatedAt(): ?DateTimeImmutable
    {
        return $this->updatedAt;
    }

    /**
     * Set the value of updatedAt
     *
     * @param ?DateTimeImmutable $updatedAt
     *
     * @return self
     */
    public function setUpdatedAt(?DateTimeImmutable $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }
}
