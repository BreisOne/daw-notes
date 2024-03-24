import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("Introduce un numero: ");
            int userNum = scanner.nextInt();

            boolean primo = true;

            for (int i = 2; i <= Math.sqrt(userNum); i++) {
                if (userNum % i == 0) {
                    primo = false;
                    break;
                }
            }

            if (primo || userNum == 1) {
                System.out.println("El numero es primo");
            } else {
                System.out.println("El numero no es primo");
            }
        }
    }
}
