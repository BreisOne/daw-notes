import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int[] table = new int[20];
        ArrayList<Integer> pares = new ArrayList<>();
        ArrayList<Integer> impares = new ArrayList<>();

        Scanner scanner = new Scanner(System.in);

        for (int i = 0; i < 10 ; i++) {
            int num = (int) (Math.random()*21);
            table[i] = num;

            if (num % 2 == 0){
                pares.add(num);
            }else {
                impares.add(num);
            }
        }
        System.out.println("Los pares son: ");

        for (int i = 0; i < pares.size()-1 ; i++) {

            System.out.println(pares.get(i));

        }
        System.out.println("Los impares son: ");

        for (int i = 0; i < impares.size()-1; i++) {

            System.out.println(impares.get(i));

        }
    }
}