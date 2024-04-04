package org.flujos.boletin;

import javax.swing.plaf.synth.SynthTextAreaUI;
import java.util.List;
import java.util.Scanner;

public class Exercise_4 {
    public static void execute(){
        String[] options = {"1. Añadir registro",
                            "2. Listar los registros",
                            "3. Buscar uno por nombre"};

        Scanner scanner = new Scanner(System.in);
        System.out.println("Que quieres hacer?");
        for (String option: options){
            System.out.println(option);
        }
        int userOption = scanner.nextInt();
        scanner.nextLine();

        switch (userOption){
            case 1:
                System.out.println("Cual es su nombre?");
                String name = scanner.nextLine();
                System.out.println("Cual es su dirección?");
                String adress = scanner.nextLine();
                System.out.println("Cual es un tlf?");
                int tlf = scanner.nextInt();
                scanner.nextLine();
                addRegister(name, adress, tlf);
                break;
            case 2:
                listRegisters();
                break;
            case 3:
                System.out.println("Cual es el nombre del usuario que quieres buscar?");
                String name = scanner.nextLine();
                findRegister();
                break;
            default:
                System.out.println("No has elegido una opción correcta");
        }
    }

    private static void addRegister(String name, String adress, int tlf){
        List<String> reagisters = readRegisters();



    }
}
