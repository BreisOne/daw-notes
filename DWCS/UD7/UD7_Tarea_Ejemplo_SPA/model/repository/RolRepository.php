<?php

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Scripting/PHPClass.php to edit this template
 */

/**
 * Description of UsuarioRepository
 *
 * @author wadmin
 */
class RolRepository extends BaseRepository implements IRolRepository{


    public function __construct() {
       parent::__construct();
        $this->table_name = "rol";
        $this->pk_name = "id";
        $this->class_name = "Rol";
        $this->default_order_column = "name";
       
    }
    
     

    public function create($object) {
        //No es necesario en este ejercicio
        return null;
    }

    public function update($object): bool {
        //No es necesario en este ejercicio
        return false;
    }

    //Obtiene un objeto Rol consultando la tabla rol y filtrando por nombre. Utiliza un parámentro posicional
    public function findRolByName(string $name): \Rol {
       $pdostmt = $this->conn->prepare("SELECT r.id, r.name FROM rol r where r.name= ?");
       
       $pdostmt->bindParam(1, $name);
       
       $pdostmt->execute();
       
       $rol = $pdostmt->fetchObject($this->class_name);
       
       if($rol===false){
           $rol=null;
       }
               
       return $rol;
           
    }
    
    //Obtiene un array de objetos Rol filtrados por el identificador numérico del usuario. 
     public function findRolesByUserId(int $userId): array {
       
            $pdostmt = $this->conn->prepare("SELECT r.id, r.name "
                    . "FROM rol r "
                    . "JOIN usuario_rol ur "
                    . "ON ur.idRol = r.id "
                    . "WHERE  ur.idUsuario =?");
            $pdostmt->bindParam(1, $userId);
            
            $pdostmt->execute();
            
           $resultado= $pdostmt->fetchAll(PDO::FETCH_CLASS,  $this->class_name );
           
           return $resultado;
      
    }

   

}
