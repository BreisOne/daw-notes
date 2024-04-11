package org.flujos.boletin;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.List;

public class Exercise_6 {

    private static String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo6.txt";
    private static String tempFileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo6tmp.txt";

    public static void execute(){
        try{
            if(!Files.exists(Paths.get(fileName))){
                Files.createFile(Paths.get(fileName));
            }
            if(!Files.exists(Paths.get(tempFileName))){
                Files.createFile(Paths.get(tempFileName));
            }
            List <String> fileContent = readFile();
            writeFile(fileContent);
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private static List<String> readFile(){

        try(BufferedReader bufferedReader = Files.newBufferedReader(Paths.get(fileName))){

            List<String>  fileContent = bufferedReader.lines().toList();

            return fileContent;

        }catch(IOException e){
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    private static void writeFile( List<String> fileContent){
        try (BufferedWriter bufferedWriter = Files.newBufferedWriter(Paths.get(tempFileName))){

             List<String> fileContentFiltered = fileContent.stream()
                                                           .filter(line -> line.toUpperCase().equals(line)).toList();

            for (String line : fileContentFiltered){
                bufferedWriter.write(line);
                bufferedWriter.newLine();
            }

        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
