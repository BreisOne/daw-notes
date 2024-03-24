import java.util.Scanner;

public class Main {
    public static void main (String[] args){
        String palabraClave ="platano";
        int intentos = 2;

        System.out.println("Oro parece plata no es");
        Scanner scanner = new Scanner(System.in);

        while(intentos > 0){

            System.out.println("Que es?: ");
            String respuesta = scanner.nextLine();

            if (respuesta.equalsIgnoreCase(palabraClave)){
                System.out.println("Acertaste");
                break;
            } else if (intentos > 1) {
                System.out.println("Fruta amarilla");
                intentos--;

            } else {
                System.out.println("Mala suerte!");
                intentos--;
            }

        }
        scanner.close();

    }
}
