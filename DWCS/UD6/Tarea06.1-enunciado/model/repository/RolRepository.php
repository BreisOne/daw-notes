<?php


/**
 * Description of UsuarioRepository
 *
 * @author wadmin
 */
class RolRepository extends BaseRepository implements IRolRepository
{


    public function __construct()
    {
        parent::__construct();
        $this->table_name = "rol";
        $this->pk_name = "id";
        $this->class_name = "Rol";
        $this->default_order_column = "name";

    }

    function findRolesByUserId($userId): array
    {
        $consulta = "SELECT r.id, r.name FROM usuario_rol ur INNER JOIN $this->table_name r ON ur.idRol = r.id WHERE ur.idUsuario = ?";

        $pdostmt = $this->conn->prepare($consulta);
        $pdostmt->bindValue(1, $userId);
        $pdostmt->execute();
       // $pdostmt->debugDumpParams();

        $array = $pdostmt->fetchAll(PDO::FETCH_CLASS, $this->class_name);
        return $array;
    }


    //TO DO
    public function create($object)
    {

    }
    public function update($object): bool
    {
        return false;
    }




}
