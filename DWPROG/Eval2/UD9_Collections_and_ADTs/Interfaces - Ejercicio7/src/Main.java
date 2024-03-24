import javax.swing.*;
import java.util.LinkedList;

public class Main {
    public static void main(String[] args) {

        Producto televisor = new Producto("televisor");
        Producto lavavajillas = new Producto("lavalvajillas");
        Producto lavadora = new Producto("lavadora");

        Cliente juan = new Cliente("Juan");
        Cliente pedro = new Cliente("pedro");
        Cliente martin = new Cliente("Martin");

        Pedido pedido1 = new Pedido(juan, new Producto[]{televisor, televisor, lavavajillas});
        Pedido pedido2 = new Pedido(pedro, new Producto[]{lavadora, televisor, lavavajillas});
        Pedido pedido3 = new Pedido(martin, new Producto[]{televisor, lavadora, lavavajillas});

        LinkedList<Pedido>listaPedidos = new LinkedList<>();
        listaPedidos.add(pedido1);
        listaPedidos.add(pedido2);
        listaPedidos.add(pedido3);

        for(Pedido pedido: listaPedidos){
            System.out.println(pedido.toString());
        }
    }
}