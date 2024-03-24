package Productos;

import Productos.Producto;

import java.time.LocalDate;

public class ProductoComestible extends Producto {
    private LocalDate fechaCaducidad;
    
    public ProductoComestible(){
        super();
        this.fechaCaducidad = LocalDate.of(0,0,0);
    }
    public ProductoComestible(String nombre, double precio, LocalDate fechaCaducidad){
        super(nombre, precio);
        this.fechaCaducidad= fechaCaducidad;
    }

    public LocalDate getFechaCaducidad() {
        return fechaCaducidad;
    }

    public void setFechaCaducidad(LocalDate fechaCaducidad) {
        this.fechaCaducidad = fechaCaducidad;
    }
}
