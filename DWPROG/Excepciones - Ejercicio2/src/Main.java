import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        System.out.println("Añade un texto");
        String userText = scanner.nextLine();

        System.out.println("Elige una letra por número");
        int userIndex = scanner.nextInt();

        try{
            checkLetter(userText, userIndex);
        }catch (ExcepcionPropia e){
            System.out.println(e);
        }
    }
    public static void checkLetter(String userText, int userIndex) throws ExcepcionPropia {
        try{
            char[] arrayText = userText.toCharArray();
            System.out.println(arrayText[userIndex]);
        }catch (Exception e){
            throw new ExcepcionPropia("Has añadido un índice incorrecto");
        }

    }
}