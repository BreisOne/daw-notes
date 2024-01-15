import java.util.Scanner;

import java.util.Random;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        Random random = new Random();
        int randomNum = random.nextInt(109 - 56) + 56;
        int intentos = 3;

        System.out.println("Introduce un número: ");
        int userNum = scanner.nextInt();

        int randomNumMul = userNum * randomNum;
        System.out.println("Tu numero multiplicado por el número aleatorios es:" + randomNumMul);

        while (intentos > 0){
            System.out.println("Cual es el número aleatorio? ");
            userNum = scanner.nextInt();

            if (userNum == randomNum) {
                System.out.println("Has ganado pendejo");
                break;
            }else {
                intentos--;
                System.out.println("Has perdido, te quedan " + intentos);
            }
        }
    }
}