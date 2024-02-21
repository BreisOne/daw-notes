<?php



/**
 * Description of noteRepository
 *
 * @author maria
 */
class UsuarioRepository implements IUsuarioRepository {

    const RUTA_FICHERO =CONFIG_FOLDER . DIRECTORY_SEPARATOR . "usuarios.json";

    private $filePath;
    //Array de objetos de la clase Nota
    private $arrayUsuarios= [];

    public function __construct() {
        $this->filePath = dirname(__FILE__, 3) . DIRECTORY_SEPARATOR . self::RUTA_FICHERO;
        
        //Se lee el fichero .json como array asociativo
        $arrayAsoc = json_decode(file_get_contents($this->filePath), true);
        foreach ($arrayAsoc as $key => $value) {
            //Se tranforma el array asociativo 
            $usuario = Util::json_decode_array_to_class($value, "Usuario");
            $this->arrayUsuarios[] = $usuario;
        }
        // echo "## $this->filePath";
    }

    public function getUsuarios(): array {
        return $this->arrayUsuarios;
    }

}
