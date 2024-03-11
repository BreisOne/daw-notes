<?php

class ProductoController {

    const VIEW_FOLDER = "producto";

    public $page_title;
    public $view;
    private ProductoServicio $productoServicio;


    public function __construct() {
        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'list_producto';
        $this->page_title = '';
        $this->productoServicio = new ProductoServicio();
  
    }

    /* List all products */

    public function list():array {

        $this->view = self::VIEW_FOLDER . DIRECTORY_SEPARATOR . 'list_producto';
        $this->page_title = 'Listado de productos';
        return $this->productoServicio->list();
    }

    public function delete(){
        if(isset($_POST["id"])){
            $productId = $_POST["id"];
            session_start();
            $_SESSION["error"] = $this->productoServicio->delete($productId);

            header("Location:FrontController.php");
        }
        
    }

}

?>