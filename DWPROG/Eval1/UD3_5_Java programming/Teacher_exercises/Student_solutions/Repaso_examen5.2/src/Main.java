import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        ValidadorDNI validadorDNI = new ValidadorDNI();

        System.out.println("Introduce un DNI o 0 para salir: ");
        String dni = scanner.nextLine();
        System.out.println(dni.length());

        while(!dni.equals("0")){
            if (validadorDNI.validar(dni)){
                System.out.println("El DNI es válido");
            }else{
                System.out.println("El DNI no es válido");
            }
            System.out.println("Introduce un DNI o 0 para salir: ");
            dni = scanner.nextLine();
        }

    }

}
