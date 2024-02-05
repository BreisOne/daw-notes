import java.util.Iterator;
import java.util.TreeSet;

public class Main {
    public static void main(String[] args) {

        TreeSet<Integer> conjunto1 = new TreeSet<>();
        TreeSet<Integer> conjunto2 = new TreeSet<>();

        for (int i = 0; i < 15; i++) {
            conjunto1.add(i);
            conjunto2.add(i+1);
        }
        int suma1 = 0;
        int resta1 = 0;
        int multiplicar1 = 1;
        Iterator<Integer> iter = conjunto1.iterator();

        while (iter.hasNext()) {
            int tmp = iter.next();
            suma1 += tmp;
            resta1 -= tmp;
            multiplicar1 *= tmp;
        }

        int suma2 = 0;
        int resta2 = 0;
        int multiplicar2 = 1;

        Iterator<Integer> iter2 = conjunto2.iterator();
        while (iter2.hasNext()) {
           int tmp = iter2.next();
            suma2 += tmp;
            resta2 -= tmp;
            multiplicar2 *= tmp;
        }

        TreeSet<Integer> union = new TreeSet<>(conjunto1);
        union.addAll(conjunto2);

        TreeSet<Integer> diferencia = new TreeSet<>(conjunto1);
        diferencia.removeAll(conjunto2);

        System.out.println(conjunto1);
        System.out.println(conjunto2);
        System.out.println(union);
        System.out.println(diferencia);
        System.out.println(suma1);
        System.out.println(resta1);
        System.out.println(multiplicar1);
        System.out.println(suma2);
        System.out.println(resta2);
        System.out.println(multiplicar2);







    }
}