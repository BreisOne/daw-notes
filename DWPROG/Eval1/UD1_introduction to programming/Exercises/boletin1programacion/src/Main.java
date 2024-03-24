import java.util.Scanner;

public class Main {
    public static void main (String[] args){
        int intentos = 1;
        Scanner scanner = new Scanner(System.in);

        do {
            System.out.println("Introduce un numero: ");
            int miNumero = scanner.nextInt();
            double miNumeroCubo = Math.pow(miNumero, 3);
            System.out.println("El cubo de tu número es "+ miNumeroCubo);
            intentos++;

        }while(intentos <=10);

        scanner.close();

    }

    }
