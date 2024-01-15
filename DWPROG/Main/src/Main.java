import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int contador = 0;
        int userInput;

        Scanner scanner = new Scanner(System.in);

        System.out.println("Introduce un numero");
        userInput = scanner.nextInt();

        while (userInput!=-1) {
            if (userInput<1 || userInput>31) {
                System.out.println("Error: dia invalido");
            } else {
                contador = contador+1;
            }
            System.out.println("Introduce un numero");
            userInput = scanner.nextInt();
        }
        System.out.println("Se ha introducido un total de "+contador+" dias validos");
    }
}