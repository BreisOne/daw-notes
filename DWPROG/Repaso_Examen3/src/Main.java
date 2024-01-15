import java.awt.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int day;
        int month;
        int year;

        Scanner scanner = new Scanner(System.in);
        
        while(true){
            
            System.out.println("Introduce un día");
            day = scanner.nextInt();

            System.out.println("Introduce un mes (número)");
            month = scanner.nextInt();

            System.out.println("Introduce un año (número)");
            year = scanner.nextInt();

            if (day == 28 || day ==30 || day == 31) {

                System.out.println(day + "/" + month + "/" + year );
                
            }else {
                System.out.println("La fecha no es correcta");
            }
         
            
        }
    }
}