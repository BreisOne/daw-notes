package org.flujos.boletin;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Exercise_3 {
    String[] names = {"Detergente", "Camiseta", "Microondas"};
    int[] prices = {13,25,65};
    static String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo2.txt";

    public static void execute(String[] names, int[] prices){

        try(BufferedWriter writer = Files.newBufferedWriter(Paths.get(fileName))){
            for (int i = 0; i < names.length; i++) {
                writer.write(names[i]+": "+ prices[i]);
                writer.newLine();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private static void printFile(){
        Optional<List<String>> reader = readFile();
        reader.orElse(Collections.emptyList())
                  .stream()
                  .map(line->line.split(":")[0])
                  .forEach(System.out::println);
    }
    private static Optional<List<String>> readFile(){
        try(BufferedReader reader = Files.newBufferedReader(Paths.get(fileName))){
            List<String> fileContent = reader.lines().toList();
            return Optional.of(fileContent);
        }catch (IOException e){
            e.printStackTrace();
            return Optional.empty();
        }
    }
    private static void writeFile(List<String> file){

        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(fileName))){
            for (String line : file){
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    public static void deleteUserOption(){
        Scanner scaner = new Scanner(System.in);

        System.out.println("Que producto quieres borrar de la lista?:");
        printFile();
        String userOption = scaner.nextLine();

        Optional<List<String>> reader = readFile();

        List<String> finalFile = reader.orElse(Collections.emptyList())
                                       .stream()
                                       .filter(line -> !line.split(":")[0].equalsIgnoreCase(userOption))
                                       .toList();

        writeFile(finalFile);
    }
}
