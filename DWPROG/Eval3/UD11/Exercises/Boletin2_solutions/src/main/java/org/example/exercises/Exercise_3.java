package org.example.exercises;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Exercise_3 {
    static String fileName = ".\\src\\main\\java\\org\\example\\exercises\\archivo2_1.txt";
    public static void execute(){
        try(BufferedReader bufferedReader = Files.newBufferedReader(Paths.get(fileName))){

            bufferedReader.lines()
                          .flatMap(linea -> linea.chars().mapToObj(c -> (char) c))
                          .filter(caracter -> !esVocalEnMinuscula(caracter) && caracter != ' ')
                          .forEach(System.out::println);

        }catch (IOException e){
            e.printStackTrace();
        }
    }
    // Método para verificar si un carácter es una vocal en minúscula
    private static boolean esVocalEnMinuscula(char c) {
        return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
    }
}
