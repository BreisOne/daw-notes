import java.util.ArrayList;
import java.util.Set;

public class Main {
    public static void main(String[] args) {

        ArrayList<String>  conjunto1 = new ArrayList<>();
        conjunto1.add("Carlos");
        conjunto1.add("Juan");
        conjunto1.add("Laura");
        conjunto1.removeFirst();
        conjunto1.getLast();

        ArrayList<String> conjunto2 = new ArrayList<String>(conjunto1);
        conjunto2.add("Lucia");
        conjunto2.add("Maria");
        conjunto1.add("Mario");

        ArrayList<String> unionconjunto = new ArrayList<>(conjunto1);
        unionconjunto.addAll(conjunto2);

        ArrayList<String> diferenciaConjuntos = new ArrayList<>(conjunto1);

        diferenciaConjuntos.removeAll(conjunto2);

        System.out.println(diferenciaConjuntos);
    }
}