package org.flujos.boletin;

import javax.swing.plaf.synth.SynthTextAreaUI;
import java.io.*;
import java.util.List;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Exercise_3 {
    String[] names = {"Detergente", "Camiseta", "Microondas"};
    int[] prices = {13,25,65};
    static String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo2.txt";

    public static void execute(String[] names, int[] prices){
        File file = new File(fileName);

        try(BufferedWriter writer = new BufferedWriter(new FileWriter(file))){
            for (int i = 0; i < names.length; i++) {
                writer.write(names[i]+": "+ prices[i]);
                writer.newLine();
            }
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private static void printFile(){
        File file = new File(fileName);
        List<String> reader = readFile();
        reader.forEach(line->{
                    System.out.println(line.split(":")[0]);
                }
        );
    }
    private static List<String> readFile(){
        File file = new File(fileName);
        List <String> readedFile = null;

        try(BufferedReader reader = new BufferedReader(new FileReader(file))){
            readedFile =  reader.lines().collect(Collectors.toList());
        }catch (IOException e){
            e.printStackTrace();
        }
        return readedFile;
    }
    private static void writeFile(List file){

        try (BufferedWriter writer = new BufferedWriter( new FileWriter(fileName))){
            for (int i = 0; i < file.size() ; i++) {
                writer.write((String) file.get(i));
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

        List<String> reader = readFile();

        List<String> finalFile = reader
                                    .stream()
                                    .filter(line -> !line.split(":")[0].equalsIgnoreCase(userOption)).toList();

        writeFile(finalFile);
    }
}
