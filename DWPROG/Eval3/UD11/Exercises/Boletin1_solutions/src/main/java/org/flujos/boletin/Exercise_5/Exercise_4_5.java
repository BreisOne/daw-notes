package org.flujos.boletin.Exercise_5;

import java.io.*;
import java.util.*;

public class Exercise_4_5 {
    static String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\Exercise_5\\archivo4_5.txt";
    static File file = new File(fileName);
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
                String address = scanner.nextLine();
                System.out.println("Cual es un tlf?");
                int tlf = scanner.nextInt();
                scanner.nextLine();
                User user = new User(name, address, tlf);
                addRegister(user);
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

    private static List<User> readRegisters(){
        Optional<List <User>> registers;
        List<User> users = new ArrayList<>();

        try{
            if(!file.exists()){
                file.createNewFile();
            }

            try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(file))){
                while(true){
                    User user = (User) inputStream.readObject();
                    users.add(user);
                }
            }catch (EOFException e){
                registers = Optional.of(users);
            }

        }catch (IOException | ClassNotFoundException e){
            e.printStackTrace();
            registers = Optional.empty();
        }

        return (List<User>) registers.orElse(Collections.emptyList());
    }
    private static void addRegister(User user) {
        List<User> registers = readRegisters();

        registers.add(user);

        try(ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(file))){
            for (User userRegistered: registers){
                outputStream.writeObject(userRegistered);
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private static void listRegisters(){
        List<User> registers = readRegisters();
        registers.forEach(System.out::println);
    }
    private static void findRegister(String nameWanted){
        List<User> registers = readRegisters();

        registers.stream()
                 .filter(user -> user.name.equalsIgnoreCase(nameWanted))
                 .forEach(System.out::println);

        List<User> registersUpdated = registers.stream()
                                                 .filter(user -> !user.name.equalsIgnoreCase(nameWanted)).toList();

        try(ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(file))){
            for (User user : registersUpdated){
                outputStream.writeObject(user);
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
