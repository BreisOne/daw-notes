import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int[] userArray = new int[10];
        int[] newUserArray = new int[10];
        Scanner scanner = new Scanner(System.in);

        for (int i = 0; i < 10 ; i++) {
            System.out.println("Introduce un numero: ");
            userArray[i] = scanner.nextInt();
        }

        int lasItem = userArray[9];

        for (int i = 9; i > 0  ; i--) {
            newUserArray[i] = userArray[i-1];
        }
        newUserArray[0] = lasItem;

        System.out.println("Tabla desplazada hacia la derecha:");

        for (int i = 0; i < 10; i++) {
            System.out.println(newUserArray[i]);
        }

    }
}