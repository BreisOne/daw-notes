import java.util.*;
public class Almacen {
    ArrayList<Producto> listaproductos = new ArrayList<Producto>();

    public ArrayList<Producto> anhadirProducto(Producto producto){
        listaproductos.add(producto);
        return listaproductos;
    }
    public ArrayList<Producto> eliminarProducto(int index){
        listaproductos.remove(index);
        return listaproductos;
    }

    public float precioTotalBebidas(){
        float precioTotal = 0;
        for( Producto producto: listaproductos) {
            if (producto instanceof Bebida) {
                precioTotal += producto.getPrecio();
            }
        }
        return precioTotal;
    }

    public float precioTotalAlmacen(){
        float precioTotal = 0;
        for( Producto producto: listaproductos) {
            precioTotal += producto.getPrecio();
        }
        return precioTotal;
    }

    public float precioTotalMarca(String marca){
        float precioTotal = 0;
        for( Producto producto: listaproductos) {
            if (producto.getMarca().equals(marca)){
                precioTotal += producto.getPrecio();
            }
        }
        return precioTotal;
    }
    public void mostraInformacion(){
        for( Producto producto: listaproductos) {
            if (producto instanceof Bebida) {
            System.out.println(producto.toString());
            }
        }
    }


}
