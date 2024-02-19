import java.io.IOException;
import java.util.Scanner;
import java.util.Stack;

public class Main {
    public static void main(String[] args) throws IOException {

        System.out.println("Introduce caracteres para que se guarden en la pila. Para salir del programa pulsa entrer");

        Stack<Character> caracteres = new Stack<>();
        char caracter;

        do{
            caracter =  (char) System.in.read();
            caracteres.push(caracter);
        }while(caracter != '\n');

        while (!caracteres.isEmpty()) {
            System.out.print(caracteres.pop());
        }

    }
}