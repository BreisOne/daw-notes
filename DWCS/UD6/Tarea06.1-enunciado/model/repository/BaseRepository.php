<?php


/**
 * Description of BaseRepository
 *
 * @author mfernandez
 */
abstract class BaseRepository implements IBaseRepository
{

    protected string $table_name;
    protected string $pk_name;
    protected PDO $conn;
    protected string $class_name;
    protected string $default_order_column;

    public function __construct()
    {
        $this->conn = PDOSingleton::getInstance();
    }

    abstract public function create($object);
    abstract public function update($object): bool;

    public function read($id)
    {

        $pdostmt = $this->conn->prepare("SELECT * FROM $this->table_name "
            . "WHERE $this->pk_name = :id");
        $pdostmt->bindValue("id", $id);
        $pdostmt->execute();

        //Llama al constructor después de establecer las propiedades. No usa los métodos setters
        $object = $pdostmt->fetchObject($this->class_name);

        return $object;
    }



    //abstract public function delete($id): bool;

    public function delete($id): bool
    {

        try {

            $pdostmt = $this->conn->prepare(
                "DELETE FROM " . $this->table_name . " WHERE " . $this->pk_name
                . " = :id"
            );

            $pdostmt->bindValue("id", $id);

            // $pdostmt->debugDumpParams();
            $resultado = $pdostmt->execute();
        } catch (Exception $ex) {
            echo "Ha ocurrido una exception en delete con errorInfo: <br/> " . $ex->getMessage();

            print_r($pdostmt->errorInfo());
            throw $ex;
        }

        return ($pdostmt->rowCount() == 1);
    }

    public function findAll(): array
    {
        $pdostmt = $this->conn->prepare("SELECT *  FROM $this->table_name ORDER BY $this->default_order_column");


        //$pdostmt->debugDumpParams();
        $pdostmt->execute();
        //$pdostmt->debugDumpParams();
        $array = $pdostmt->fetchAll(PDO::FETCH_CLASS, $this->class_name);
        return $array;
    }

    public function beginTransaction(): bool
    {

        return $this->conn->beginTransaction();
    }

    public function commit(): bool
    {

        return $this->conn->commit();
    }

    public function rollback(): bool
    {

        return $this->conn->rollback();
    }

}
