package Comerciales;

import Productos.Producto;

import java.util.HashMap;

public class RegistroComercial {
    private HashMap<Integer, Producto> registroProductos;

    public  RegistroComercial(){
        this.registroProductos = new HashMap<>();
    }

    public void añadirProducto(int index, Producto producto){
        this.registroProductos.put(index, producto);
     }

    public HashMap<Integer, Producto> getRegistroProductos() {
        return registroProductos;
    }

    public void setRegistroProductos(HashMap<Integer, Producto> registroProductos) {
        this.registroProductos = registroProductos;
    }
}
