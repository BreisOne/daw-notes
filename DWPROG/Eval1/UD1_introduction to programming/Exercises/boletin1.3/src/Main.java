import java.util.Scanner;


public class Main {
    public static void main (String[] args){
        int miNumero;
        int i;

        Scanner scanner = new Scanner(System.in);

    while(true){
            System.out.println("Introduce un numero: ");
            miNumero = scanner.nextInt();

            for (i = 1; i<=10; i++){
                int resultado = miNumero * i;
                System.out.println(miNumero + " x " + i + " = " +resultado);
            }

    }

    }
}
