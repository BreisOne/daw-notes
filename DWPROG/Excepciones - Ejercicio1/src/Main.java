import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        try{
            checkYear();
        }catch (Exception e){
            System.out.println(e);
        }
    }

    public static void checkYear() throws Exception {
        Scanner scanner = new Scanner(System.in);
        System.out.println("En que año naciste?");
        int userYear = scanner.nextInt();

        if (userYear < 0){
            throw new Exception("Año negativo no válido");
        }else {
            System.out.println("Ha nacido en el año: " + userYear);
        }
    }
}