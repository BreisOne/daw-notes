import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        ///Opción 1: Recomendada;
        do{
            Scanner scanner = new Scanner(System.in);
            System.out.println("Introduce un numero: ");
            int miNumero = scanner.nextInt();

            if(miNumero % 3 == 0){
                System.out.println("El número es múltiplo de 3");
            } else{
                System.out.println("El número no es múltiplo de 3");
            }

        }while(miNumero != -1);

        ///Opción 2: No Recomendada;
        while(true){

            Scanner scanner = new Scanner(System.in);
            System.out.println("Introduce un numero: ");
            int miNumero = scanner.nextInt();

            if(miNumero == -1){
                break;
            }

            if(miNumero % 3 == 0){
                System.out.println("El número es múltiplo de 3");
            } else{
                System.out.println("El número no es múltiplo de 3");
            }

        }
    }
}