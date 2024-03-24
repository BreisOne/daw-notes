import javax.swing.*;
import java.util.Arrays;
import java.util.Collections;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int[] miArray = new int[5];

        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i <=4 ; i++) {

            System.out.println("Introduce un número");
            miArray[i] = scanner.nextInt();
        }

        System.out.println("Tu numeros en orden inversa son:");

        for (int i = 4; i >=0 ; i--) {
            System.out.println(miArray[i]);
        }

    }
}
