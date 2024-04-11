package org.flujos.boletin;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Exercise_2 {
    public static void execute(){
        String[] names = {"Detergente", "Camiseta", "Microondas"};
        int[] prices ={13,25,65};
        String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo2.txt";
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
}
