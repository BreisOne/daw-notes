import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        int userNum1;
        int userNum2;
        int contPares = 0;

        do {
            System.out.println("Introduce un primer numero: ");
            userNum1 = scanner.nextInt();
            System.out.println("Introduce un segundo numero: ");
            userNum2 = scanner.nextInt();

            if ((userNum1 % 2 == 0)){
                contPares++;
            }
            if ((userNum2 % 2 == 0)){
                contPares++;
            }

            for (int i = userNum1+1; i <userNum2 ; i++) {
                if (i % 2 != 0){
                    System.out.println(i);
                }
            }


        }while(userNum1 != userNum2);

        System.out.println("Se han introducido " + contPares + " pares por teclado");

    }
}