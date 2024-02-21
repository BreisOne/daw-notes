<?php

class NotaController {

    public string $page_title;
    public string $view;
    private INotaServicio $notaServicio;

    private const VIEW_FOLDER ="nota".DIRECTORY_SEPARATOR;

    public function __construct() {
        $this->view = self::VIEW_FOLDER.'list_note';
        $this->page_title = '';
        $this->notaServicio = new NotaServicio();
    }

    /* List all notes */

    public function list() {
        $this->page_title = 'Listado de notas';
        return $this->notaServicio->getNotas();
    }

    /* Load note for edit */

    public function edit($id = null) {
        $this->page_title = 'Editar nota';
        $this->view = self::VIEW_FOLDER.'edit_note';
        /* Id can from get param or method param */
        if (isset($_GET["id"])) {
            $id = $_GET["id"];

            $nota = $this->notaServicio->getNoteById($id);
        } else {
            //para creación
            $nota = new Nota();
        }
        return $nota;
    }

    /* Create or update note */

    public function save() {
        $this->view = self::VIEW_FOLDER.'edit_note';
        $this->page_title = 'Editar nota';
        
        $id=null;
        $title="";
        $content="";
        
        if (isset($_POST["id"]) and $_POST["id"] != '') {
            $id = $_POST["id"];
        }
           /* Received values */
        if (isset($_POST["title"])) {
            $title = $_POST["title"];
        }
        if (isset($_POST["content"])) {
            $content = $_POST["content"];
        }
        
        $nota = new Nota($id, $title, $content);   

        $notaGuardada = $this->notaServicio->save($nota);
        //para saber si ha habido error o no
        //Solo se establece un campo "error" si se ha realizado un (save) exitoso o no
        if ($notaGuardada == null) {
            $notaGuardada = new Nota(); //creamos una nota vacía para poder añadirle el estado
            $notaGuardada->setEstado(Util::OPERATION_NOK);
        } else {
            $notaGuardada->setEstado(Util::OPERATION_OK);
        }


        return $notaGuardada;
    }

    /* Confirm to delete */

    public function confirmDelete() {
        $this->page_title = 'Eliminar nota';
        $this->view = self::VIEW_FOLDER.'confirm_delete_note';
        return $this->notaServicio->getNoteById($_GET["id"]);
    }

    /* Delete */

    public function delete(): bool {
        $this->page_title = 'Listado de notas';
        $this->view = self::VIEW_FOLDER. 'delete_note';
        return $this->notaServicio->deleteNoteById($_POST["id"]);
    }

}

?>