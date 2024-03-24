import java.util.Scanner;


public class Main {
    public static void main(String[] args) {
        int[] miArray = new int[5];
        boolean negativo = false;
        Scanner scanner = new Scanner(System.in);

        for (int i = 0; i <=4 ; i++) {
            System.out.println("Introduce un numero: ");
            miArray[i] = scanner.nextInt();

            if(miArray[i] < 0){
                negativo = true;
            }
        }

        if(negativo == true){
            System.out.println("Hay negativos en la serie");
        } else {
            System.out.println("No hay negativo en la serie");
        }
    }
}