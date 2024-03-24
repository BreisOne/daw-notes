package Productos;

import Productos.Producto;

public class ProductoDeBazar extends Producto {
    private String tipo;
    public ProductoDeBazar(){
        super();
        this.tipo = "";
    }
    public ProductoDeBazar(String nombre, double precio, String tipo){
        super(nombre, precio);
        this.tipo = tipo;

    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}
