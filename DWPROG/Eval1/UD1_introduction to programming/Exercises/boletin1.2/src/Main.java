import java.util.Scanner;

public class Main {
    public static void main (String[] args){

        int cont = 0;
        int suma = 0;
        float media = 0;
        int miNumero;
        Scanner scanner = new Scanner(System.in);

        do {
            cont++;
            System.out.println("Introduce un numero: ");
            miNumero = scanner.nextInt();
            suma += miNumero;
            media = suma/cont;

            System.out.println( "La suma es; " + suma);
            System.out.println( "La media es; " + media);

        } while (miNumero != 0);
    }
}
