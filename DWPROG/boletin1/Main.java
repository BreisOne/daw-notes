public class Main import java.util.Scanner;

public class Main {
    public static void main (String[] args){
        int intentos = 0;
        Scanner scanner = new Scanner(System.in);

        do {

            System.out.println("Introduce un numero: ");
            int miNumero = scanner.nextInt();
            System.out.print("El cubo de tu número es "+ miNumero^2)
            intentos++;

        }while(intentos <10)
    }
        scanner.close();

}
}{
}
