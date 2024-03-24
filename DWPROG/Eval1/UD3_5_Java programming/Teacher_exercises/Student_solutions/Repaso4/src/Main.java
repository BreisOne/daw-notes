import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        String miPalabra = "";

        Scanner scanner = new Scanner(System.in);

        System.out.println("Introduce una palabra");
        miPalabra = scanner.nextLine();

        if (esPalindromo(miPalabra)) {
            System.out.println("Tu palabra es palindroma");
        }

    }
    // Método para verificar si una palabra es un palíndromo
    public static boolean esPalindromo(String miPalabra) {
        int longitud = miPalabra.length();
        for (int i = 0; i < longitud / 2; i++) {
            if (miPalabra.charAt(i) != miPalabra.charAt(longitud-1-i)) {
                return false;
            }
        }
        return true;
    }
}