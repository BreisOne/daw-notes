import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while(true){
            System.out.println("Introduce un numero:");
            int userNum = scanner.nextInt();

            if ((userNum %2 == 0 && userNum * 5 > 25) ||
                    (userNum %3 == 0 && userNum * 3 < 10)) {
                System.out.println(userNum);
            }
        }
    }
}