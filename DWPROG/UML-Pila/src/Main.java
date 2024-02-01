import java.util.Arrays;
import java.util.Objects;

public class Main {
    public static void main(String[] args) {

        Integer[] elementos = {1,2,3,4,5};

        Pila p = new Pila(5,elementos);

        System.out.println(p.toString());
        System.out.println(p.get());
        System.out.println(p.first());
        System.out.println(p.get());
        System.out.println(p.first());
        p.add(1);
        System.out.println(p.toString());



    }
}