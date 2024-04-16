package org.example.exercises;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Exercise_2 {
     static String fileName = ".\\src\\main\\java\\org\\example\\exercises\\";
     static String fichero1 = "archivo2_1.txt";
     static String fichero2 = "archivo2_2.txt";
     static String tempFile = "tmp.txt";

     static List<String> contentFile1 = Arrays.asList("Paco","Juan", "Elisa");
     static List <String> contentFile2 = Arrays.asList("Maria", "Jandro", "Matías");

     public static void changeFileContents(){

         createFile(contentFile1, fichero1);
         createFile(contentFile2, fichero2);

         List<String> fileContent1 = readFile(fichero1);

         createFile(fileContent1, tempFile);

         List<String> fileContent2 = readFile(fichero2);

         createFile(fileContent2, fichero1);

         File file2 = new File(fileName + fichero2);
         file2.delete();

         File tmp = new File(fileName + tempFile);
         tmp.renameTo(file2);

     }
     private static void createFile(List<String> fileContent, String namefile) {

         try (BufferedWriter bufferedWriter = Files.newBufferedWriter(Paths.get(fileName + namefile))) {
             if (!Files.exists(Paths.get(fileName + namefile))) {
                 Files.createFile(Paths.get(fileName + namefile));
             }

             for (String line : fileContent) {
                 bufferedWriter.write(line);
                 bufferedWriter.newLine();
             }

         } catch (IOException e) {
             e.printStackTrace();
         }
     }
    private static List<String> readFile(String nameFile){
        List<String> fileContent = new ArrayList<>();

         try(BufferedReader bufferedReader = Files.newBufferedReader(Paths.get(fileName + nameFile))){
            fileContent = bufferedReader.lines().toList();
         }catch (IOException e){
             e.printStackTrace();
         }
        return fileContent;
     }
}
