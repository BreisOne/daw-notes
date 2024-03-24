import java.util.Scanner;

public class Main {
    public static void main (String[] args){

        Scanner scanner = new Scanner(System.in);

        while(true){

            System.out.println("Introduce una nota numerica o S para salir: ");
            String input = scanner.nextLine();
            if (input.equalsIgnoreCase("s")) {
                break;
            }

            switch (input){
                case "10":
                case "9":
                    System.out.println("Sobresaliente");
                    break;
                case "8":
                case "7":
                    System.out.println("Notable");
                    break;
                case "6":
                    System.out.println("Bien");
                    break;
                case "5":
                    System.out.println("Suficiente");
                    break;
                default:
                    System.out.println("Suspenso");
                    break;
            }
        }
    }
}
