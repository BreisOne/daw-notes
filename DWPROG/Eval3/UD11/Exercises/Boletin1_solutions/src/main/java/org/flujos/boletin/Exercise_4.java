package org.flujos.boletin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;
public class Exercise_4 {

    static String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo3.txt";

    public static void execute() {
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
                String nameWanted = scanner.nextLine();
                findRegister(nameWanted);
                break;
            default:
                System.out.println("No has elegido una opción correcta");
        }
    }

    private static List<String> readRegisters(){
        Optional<List <String>> registers = null;
        try{
            if(!Files.exists(Paths.get(fileName))){
                Files.createFile(Paths.get(fileName));
            }

            BufferedReader reader = Files.newBufferedReader(Paths.get(fileName));

            List<String> fileContent = reader.lines().toList();
            registers = Optional.of(fileContent);

        }catch (IOException e){
            e.printStackTrace();
           registers = Optional.empty();
        }
        return (List<String>) registers.orElse(Collections.emptyList());
    }
    private static void addRegister(String name, String adress, int tlf) {
        List<String> registers = readRegisters();

        String register = name + ", " + adress + ", " + tlf;

        registers.add(register);

        try(BufferedWriter writer = Files.newBufferedWriter(Paths.get(fileName))){
            for (String registerLine: registers){
                writer.write(registerLine);
                writer.newLine();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private static void listRegisters(){
        List<String> registers = readRegisters();
        registers.forEach(System.out::println);
    }
    private static void findRegister(String nameWanted){
        List<String> registers = readRegisters();

        registers.stream().filter(line -> line.equalsIgnoreCase(nameWanted))
                 .forEach(System.out::println);

        List<String> registersUpdated = registers.stream()
                                                 .filter(line -> !line.equalsIgnoreCase(nameWanted)).toList();

        try(BufferedWriter writer = Files.newBufferedWriter(Paths.get(fileName))){
            for (String line : registersUpdated){
                writer.write(line);
                writer.newLine();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
