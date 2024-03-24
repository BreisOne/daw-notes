import java.util.Random;
import java.util.Scanner;

public class Main {
    public static void main (String[] args){
        Random rand = new Random();
        int numeroAleatorio = rand.nextInt(100) +1;
        int intentos = 10;

        System.out.println("Adina el numero generado entre 1 y 100");
        Scanner scanner = new Scanner(System.in);

        while(intentos > 0){

            System.out.println("Introduce un numero: ");
            int miNumero = scanner.nextInt();
            intentos--;

            if (miNumero > numeroAleatorio){
                System.out.println("Menor");

            } else if (miNumero < numeroAleatorio) {
                System.out.println("Mayor");

            } else {
                int intentos_used = 10 - intentos;
                System.out.print("Has ganado en " + intentos_used + " intentos");
                break;

            }
        }

        System.out.println( "El número era " + numeroAleatorio);
        scanner.close();

    }
}
