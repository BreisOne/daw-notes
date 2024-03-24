import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        int cont = 0;
        int sum = 0;
        int[] userArray = new int[5];
        Scanner scanner = new Scanner(System.in);

        for (int i = 0; i < userArray.length; i++) {
                System.out.println("Introduce un numero:");
                userArray[i] = scanner.nextInt();
        }

        for (int i = 0; i < userArray.length ; i++) {
            if(sum<3000){
                sum += userArray[i];
                cont++;
            }
        }
        System.out.println("El numero es mayor de 3000 y se han usado "+ cont +" iteraciones");
    }
}