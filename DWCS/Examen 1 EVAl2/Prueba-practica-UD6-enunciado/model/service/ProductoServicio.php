<?php

class ProductoServicio {

    private IProductoRepository $productoRepository;

    public function __construct() {
        $this->productoRepository = new ProductoRepository();
    }

    /* Get all notes */

    public function list(): array {
        return $this->productoRepository->findAll();
    }
    public function delete(String $id): bool{

        return $this->productoRepository->delete($id);
    }
 
}

?>