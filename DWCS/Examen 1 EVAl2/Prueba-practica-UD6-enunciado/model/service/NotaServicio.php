<?php

class NotaServicio
{

    const RUTA_FICHEROS_CONST = DIRECTORY_SEPARATOR . IMAGES_FOLDER . DIRECTORY_SEPARATOR;
    const SEPARADOR_NOMBRE_FICHERO = "_";

    private INotaRepository $repository;

    public function __construct()
    {
        $this->repository = new NotaRepository();
    }

    /* Get all notes */

    public function getNotas(): array
    {

        $notas = $this->repository->findAll();

        return $notas;
    }

    /* Get note by id */

    public function getNoteById($id)
    {
        if (is_null($id)) {
            return false;
        }
        return $this->repository->read($id);
    }

    /* Save note */

    //Se usa para crear una nueva nota y para editar una ya existente
    public function save(Nota $nota, array $fileInfoArray = null)
    {

        $imgOld = "";
        $exists = false;
        if (!is_null($id = $nota->getId())) {
            $exists = true;
        }
        if ($exists) {

            //Antes de actualizar tomamos la img antigua
            $imgOld = $this->repository->read($id)->getImagePath();
            //Si no se escoge nada en la vista de edición, se pierde la imagen anterior. Para conservarla:
            $nota->setImagePath($imgOld);

            if ($this->repository->update($nota)) {
                $notaToVista = $nota;
            } else {
                $notaToVista = new Nota();
                $notaToVista->setStatus(Util::OPERATION_NOK);
            }
        } else {
            $notaToVista = $this->repository->create($nota);
        }

        //Si se ha actualizado con éxito la nota en BD
        if ($notaToVista->getStatus() !== Util::OPERATION_NOK) {
            //movemos el fichero
            $this->gestionarFichero($fileInfoArray, $imgOld, $notaToVista);
            //si no ha habido errores moviendo el fichero
            if ($notaToVista->getStatus() !== Util::IMAGE_ERROR) {
                $notaToVista->setStatus(Util::OPERATION_OK);
            } else {
                $notaToVista->setStatus(Util::OPERATION_NOK);
            }

        }



        return $notaToVista;
    }

    public function deleteNoteById($id)
    {
        $exito = true;
        //Recuperamos la nota para obtener el nombre del fichero
        $nota = $this->repository->read($id);

        $exito = $exito && $this->repository->delete($id);
        //Borramos el fichero si existe
        if ($nota->getImagePath() != "")
            $exito = $exito && unlink($this->getFilesPath($nota->getImagePath()));
        return $exito;
    }

    /**
     * Comprueba que el fichero ha llegado al servidor correctamente y lo mueve al directorio de destino
     * Actualiza la $notaToVista y también en el sistema de persistencia el nombre del fichero
     * Si existe un fichero antiguo y es distinto de cadena vacía, se elimina
     */
    private function gestionarFichero(
        array $fileInfoArray,
        string $imgOld,
        Nota $notaToVista
    ) {
        $exito = false;

        if ($fileInfoArray["error"] === UPLOAD_ERR_OK) {

            $destino = $this->crearRutaNombreFichero($notaToVista->getId(), $fileInfoArray["name"]);
            $origen = $fileInfoArray["tmp_name"];
            $exito = $this->moverFichero($origen, $destino);
            if ($exito) {
                //Si hubo éxito en el movimiento del fichero
                $notaToVista->setImagePath($this->getNombreFichero($destino));
                $exito = $exito && $this->repository->update($notaToVista);
                //Sabemos que se ha añadido un fichero
                //borramos fichero antiguo solo si es diferente de cadena vacía. Si no estaremos intentando borrar el directorio files

                if ($imgOld !== "" && file_exists($this->getFilesPath($imgOld)))
                    unlink($this->getFilesPath($imgOld));
            }
            if (!$exito) {
                //Si hubo algún error relacionado con la imagen
                $notaToVista->setStatus(Util::IMAGE_ERROR);
            }

        }
        //Si no se ha añadido una imagen en creación, no se considera error
        
       

    }

    //Dado el id y nombre, construye la ruta relativa al fichero
    private function crearRutaNombreFichero(string $id, string $nombreFichero): string
    {
        //  $ruta_fichero_start = dirname(__FILE__, 3) . self::RUTA_FICHEROS_CONST;
        $ruta_fichero_start = ".." . DIRECTORY_SEPARATOR . self::RUTA_FICHEROS_CONST;
        $rutaFichero = $ruta_fichero_start . $id . self::SEPARADOR_NOMBRE_FICHERO . $nombreFichero;
        return $rutaFichero;
    }

    public function moverFichero(string $origen, string $destino): bool
    {
        $exito = false;
        if (is_uploaded_file($origen)) {
            $exito = move_uploaded_file($origen, $destino);
        }
        return $exito;
    }

    //Dada una ruta, obtiene la última parte de la ruta: El nombre del fichero con su extensión
    private function getNombreFichero(string $path): string
    {
        return basename($path);
    }

    private function getFilesPath(string $fileName): string
    {
        return ".." . DIRECTORY_SEPARATOR . IMAGES_FOLDER . DIRECTORY_SEPARATOR . $fileName;
    }

}

?>