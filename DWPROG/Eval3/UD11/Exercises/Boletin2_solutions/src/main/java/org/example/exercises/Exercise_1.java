package org.example.exercises;

import javax.swing.text.html.Option;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

public class Exercise_1 {

    static String fileName = ".\\src\\main\\java\\org\\example\\exercises\\archivo1.txt";
    private static int[] createNumbers(){
        Random random = new Random();
        int[] randomNumbers = new int[100];

        Arrays.setAll(randomNumbers, index -> random.nextInt(101));
        //Arrays.stream(randomNumbers).forEach(System.out::println);
        return randomNumbers;
    }
    private static void createFile(){
        try(DataOutputStream outputStream = new DataOutputStream(Files.newOutputStream(Paths.get(fileName)))){

            int [] randomNumbers = createNumbers();

            if(!Files.exists(Paths.get(fileName))){
                Files.createFile(Paths.get(fileName));
            }

            for (int randomNumber : randomNumbers){
                outputStream.writeInt(randomNumber);
            }

        }catch (IOException e){
            e.printStackTrace();
        }
    }
    public static void calculateMeanFromFile(){
        int total = 0;
        int cont = 0;

        createFile();

        try(DataInputStream inputStream = new DataInputStream(Files.newInputStream(Paths.get(fileName)))){

            while (true){
                int fileItem= inputStream.readInt();
                System.out.println(fileItem);
                total += fileItem;
                cont++;
            }

        }catch (EOFException e){
            System.out.println("La media del array es: " + total/cont);

        }catch (IOException e){
            e.printStackTrace();
        }
    }


}
