<?php


class NotaRepository extends BaseRepository implements INotaRepository
{

    public function __construct()
    {
        parent::__construct();
        $this->table_name = "nota";
        $this->pk_name = "id";
        $this->class_name = "Nota";
        $this->default_order_column = "titulo";
    }



    public function update($object): bool
    {
        $stmt = $this->conn->prepare("UPDATE $this->table_name set titulo =?, contenido = ?, imagePath=? WHERE $this->pk_name = ?");
        $stmt->bindValue(1, $object->getTitulo());
        $stmt->bindValue(2, $object->getContenido());
        $stmt->bindValue(3, $object->getImagePath());
        $stmt->bindValue(4, $object->getId());
        $exito = $stmt->execute();
        //$stmt->debugDumpParams();
        return $exito;

    }
    public function create($object)
    {
        $stmt = $this->conn->prepare("INSERT INTO $this->table_name (titulo,
         contenido, imagePath) VALUES (?, ?, ?)");
        $stmt->bindValue(1, $object->getTitulo());
        $stmt->bindValue(2, $object->getContenido());
        $stmt->bindValue(3, $object->getImagePath());
        $stmt->execute();
        //$stmt->debugDumpParams();

        $nota_id = $this->conn->lastInsertId();

        //Establecemos el id como parte del objeto
        if ($nota_id !== false) {
            $object->setId($nota_id);
            return $object;
        } else {
            return null;
        }


    }





}
