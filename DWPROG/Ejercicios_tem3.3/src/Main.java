import java.sql.Array;

public class Main {
    public static void main(String[] args) {
    int[] userArray = new int[5];
    int n = 5;

        for (int i = 0; i < 5 ; i++) {
            System.out.println("Introduce un numero: ");
            userArray[i] = scanner.nextInt();
        }

        for (int i = 0; i < 5 ; i++) {
            for (int j = 0; j < n - 1 - i; j++) {
                if (userArray[j] > userArray[j + 1]) {
                    int temp = userArray[j];
                    userArray[j] = userArray[j + 1];
                    userArray[j + 1] = temp;
                }
            }
        }

        System.out.println("Números ordenados de menor a mayor:");
        for (int i = 0; i < n; i++) {
            System.out.println(userArray[i]);
        }

    }
}