<?php

function find_all_roles(): array
{
    $array = array();
    try {
        $conProyecto = getConnection();

        $pdostmt = $conProyecto->prepare("SELECT id, name FROM rol ORDER BY name");

        $pdostmt->execute();
        $array = $pdostmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (Exception $e) {
        echo "Ha ocurrido una excepción: " . $e->getMessage();
    }
    $conProyecto=null;
    return $array;
}

function find_user_by_email(String $email): array|false{
    $user =array();
    try {
        $conProyecto = getConnection();

        $pdostmt = $conProyecto->prepare("SELECT id, email, pwdhash FROM usuario WHERE email =:email");
        $pdostmt->bindParam("email", $email);

        $pdostmt->execute();
        //$pdostmt->debugDumpParams();
        //fetch devuelve false en caso de error o si no hay más registros que procesar
        $user = $pdostmt->fetch(PDO::FETCH_ASSOC);

        if($user!==false){
            $pdostmt_roles = 
            $conProyecto->prepare("SELECT ur.idRol, r.name 
            FROM usuario_rol  ur 
            INNER JOIN rol r 
            ON ur.idRol = r.id  
            WHERE idUsuario =:user_id");
            $pdostmt_roles->bindParam("user_id", $user["id"]);
            $pdostmt_roles->execute();
            $roles_array = $pdostmt_roles->fetchAll(PDO::FETCH_ASSOC);
            $user["roles"] = $roles_array;
        }
    } catch (Exception $e) {
        echo "Ha ocurrido una excepción: " . $e->getMessage();
    }
    $conProyecto=null;
    return $user;
}

function check_pwd_equals(String $pwd1, String $pwd2): bool{
    return $pwd1===$pwd2;
}

function create_user(String $email, String $pwd_hash, int $rol_id): ?int{
    $user_id=null;
    try {
        $conProyecto = getConnection();
        $conProyecto->beginTransaction();

        $pdostmt = $conProyecto->prepare("INSERT INTO usuario(email, pwdhash) VALUES(:email, :hash)");
        $pdostmt->bindParam("email", $email);
        $pdostmt->bindParam("hash", $pwd_hash);

        $pdostmt->execute();
        $user_id = $conProyecto->lastInsertId();

        $pdostmt = $conProyecto->prepare("INSERT INTO usuario_rol(idUsuario, idRol) VALUES(:id_usuario, :id_rol)");
        $pdostmt->bindParam("id_usuario", $user_id);
        $pdostmt->bindParam("id_rol", $rol_id);

        $pdostmt->execute();

        $conProyecto->commit();

    } catch (Exception $e) {
        $user_id = null;
        echo "Ha ocurrido una excepción en la creación: " . $e->getMessage();
        $conProyecto->rollBack();
    }
    $conProyecto=null;
    return $user_id;
}

function show_message(String $msg, String $type){
    echo "<div class=\"alert alert-$type\" role=\"alert\">
  $msg
</div>";
}
?>