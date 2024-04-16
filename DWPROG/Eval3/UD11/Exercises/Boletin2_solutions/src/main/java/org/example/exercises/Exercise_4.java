package org.example.exercises;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Collectors;

public class Exercise_4 {
    static String fileName = ".\\src\\main\\java\\org\\example\\exercises\\archivo2_1.txt";

    public static void execute(){
        try(BufferedReader bufferedReader = Files.newBufferedReader(Paths.get(fileName))){
                bufferedReader.lines().flatMap(line -> line.chars().mapToObj(c -> (char)c))
                                      .filter()
        }catch(IOException e){
            e.printStackTrace();
        }
    }

}
