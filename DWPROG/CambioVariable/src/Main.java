import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        while (true) {
            Scanner scanner = new Scanner(System.in);
            boolean[] array = GenerateArray();
            int machineIndex = MachineChoiceIndex(array);

            System.out.println("Elige una puerta del 1 al 100");
            int firstChoice = scanner.nextInt();
            scanner.nextLine();

            boolean firstChoiceFromArray = array[firstChoice];
            boolean machineChoice = array[machineIndex];

            if (firstChoiceFromArray == machineChoice) {
                machineChoice = false;
            }

            System.out.println("Mantienes la elección o no?. Responde 1 (SI) o 0(NO)");
            String mantenVariable = scanner.nextLine().toUpperCase();


            if (mantenVariable.equals("NO") && machineChoice == true) {
                System.out.println("Has ganado");
            } else if (mantenVariable.equals("SI") && firstChoiceFromArray == true) {
                System.out.println("Has ganado");
            } else {
                System.out.println("Has perdido");
            }
        }

    }
    public static boolean [] GenerateArray(){
         boolean[] array = new boolean[100];
         int index = (int) Math.random()*100;
         array [index] = true;
         return array;
    }
    public static int MachineChoiceIndex(boolean[] array) {
        int index = 0;
        for (int i = 0; i < array.length; i++) {
            if (array[i]) {
                index = i;
            }
        }
        return index;
    }
}