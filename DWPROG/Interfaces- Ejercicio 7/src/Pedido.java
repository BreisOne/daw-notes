import  java.util.Arrays;
import java.util.stream.Collectors;

public class Pedido {
    private Cliente cliente;
    private Producto[] productos;

    public Pedido(Cliente cliente, Producto[] productos){

        this.cliente = cliente;
        this.productos = productos;

    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Producto[] getProductos() {
        return productos;
    }

    public void setProductos(Producto[] productos) {
        this.productos = productos;
    }

    public String toString() {
        return "Pedido{" +
                "cliente=" + cliente.getClientName() +
                ", productos=" + Arrays.stream(productos)
                                .map(Producto::getProductName)
                                .toList() +
                '}';
    }
}
