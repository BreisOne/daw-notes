import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        int contador;
        int userinput;

        Scanner scanner = new Scanner(System.in);


        System.out.println("Introduce un numero");
        userinput = Integer.parseInt(bufEntrada.readLine());
        while (userinput!=-1) {
            if (userinput<1 || userinput>31) {
                System.out.println("Error_dia invalido");
            } else {
                contador = contador+1;
            }
            System.out.println("Introduce un numero");
            userinput = Integer.parseInt(bufEntrada.readLine());
        }
        System.out.println("Se ha introducido un total de "+contador+" d�as validos");
    }


        System.out.println("Hello world!");
    }
}