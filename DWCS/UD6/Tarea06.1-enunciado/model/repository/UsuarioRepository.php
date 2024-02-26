<?php

class UsuarioRepository extends BaseRepository implements IUsuarioRepository{
    
    public function __construct()
    {
        parent::__construct();
        $this->table_name = "usuario";
        $this->pk_name = "id";
        $this->class_name = "Usuario";
        $this->default_order_column = "email";
    }
    public function create($object)
    {
        return null;
    }
    public function update($object): bool 
    {
        return false;
    }

    public function findUsuarioByEmail($email): Usuario{
        $consulta = "SELECT * FROM usuario WHERE email = ?";

        $pdostmt = $this->conn->prepare($consulta);
        $pdostmt->bindValue(1, $email);
        $pdostmt->execute();
       // $pdostmt->debugDumpParams();

        $object = $pdostmt->fetchObject($this->class_name);
        return $object!= null ? $object : null;
    } 
}