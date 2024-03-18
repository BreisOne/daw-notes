<?php



/**
 * Description of noteRepository
 *
 * @author maria
 */
class NotaRepository implements INotaRepository {

    const RUTA_FICHERO =CONFIG_FOLDER . DIRECTORY_SEPARATOR . "notas.json";

    private $filePath;
    //Array de objetos de la clase Nota
    private $arrayNotas = [];

    public function __construct() {
        $this->filePath = dirname(__FILE__, 3) . DIRECTORY_SEPARATOR . self::RUTA_FICHERO;
        
        //Se lee el fichero .json como array asociativo
        $arrayAsoc = json_decode(file_get_contents($this->filePath), true);
        foreach ($arrayAsoc as $key => $value) {
            //Se tranforma el array asociativo 
            $nota = Util::json_decode_array_to_class($value, "Nota");
            $this->arrayNotas[] = $nota;
        }
        // echo "## $this->filePath";
    }

    public function getNotas(): array {

        return $this->arrayNotas;
    }

    private function saveNotas(array $notas): bool {

        $writtenBytes = file_put_contents($this->filePath, json_encode($notas));

        return ($writtenBytes !== false);
    }

    public function getNotaById(int $id): Nota {

        foreach ($this->arrayNotas as $key => $nota) {
            if ($nota->getId() === $id) {
                return $nota;
            }
        }
        return null;
    }

    public function updateNota(Nota $notaToUpdate): bool {

        $encontrado = false;

        foreach ($this->arrayNotas as $key => $nota) {
            if ($nota->getId() === $notaToUpdate->getId()) {
                $encontrado = true;
                $this->arrayNotas[$key]->setTitulo($notaToUpdate->getTitulo());
                $this->arrayNotas[$key]->setContenido($notaToUpdate->getContenido());
            }
        }

        if ($encontrado) {
            $encontrado = $encontrado && $this->saveNotas($this->arrayNotas);
        }
        return $encontrado;
    }

    public function deleteNota(int $id): bool {


        $clave = null;

        foreach ($this->arrayNotas as $key => $nota) {
            if ($nota->getId() === $id) {
                $clave = $key;

                break;
            }
        }
        unset($this->arrayNotas[$clave]);

        if ($clave !== null) {
            return $this->saveNotas($this->arrayNotas);
        } else {
            return false;
        }
    }

    public function create(Nota $nota): Nota {

        $id = $this->getMaxId($this->arrayNotas);
        $nota->setId($id);

        array_push($this->arrayNotas, $nota);
        if ($this->saveNotas($this->arrayNotas)) {

            return $nota;
        } else {
            return null;
        }
    }

    private function getMaxId() {

        //$arrayNotas = array_values($this->arrayNotas);
        //Por cada objeto de clase Nota obtenemos su id y creamos un 
        //array con solo los ids
        $array_ids = array_map(function ($nota) {
            return $nota->getId();
        }, $this->arrayNotas
        );

        if (count($array_ids) > 0) {
            $max_id = max($array_ids);
        }
        else{
            $max_id=1;
        }

        return ++$max_id;
    }

}
