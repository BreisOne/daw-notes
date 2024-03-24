import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
         System.out.print("Introduce un número: ");
         int userNum = scanner.nextInt();

        for (int i = 1; i <= userNum ; i++) {
        System.out.println(i);
        }

    }
}