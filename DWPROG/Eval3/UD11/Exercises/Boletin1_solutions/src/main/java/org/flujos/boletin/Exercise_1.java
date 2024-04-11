package org.flujos.boletin;

import java.io.*;

public class Exercise_1 {
    public static void execute(){
        String [] names = {"Juan", "María", "Paco"};

        String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\archivo.txt";
        File file = new File(fileName);

        writeFile(file, names);
        readFile(file);
    }
    private static void writeFile(File file, String[] names){
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(file))){

            for (int i = 0; i < names.length; i++) {
                int j = i+1;
                writer.write(j + ". "+ names[i]);
                writer.newLine();
                System.out.println("Nombre " + names[i] + " se ha escrito correctamente en el archivo");
            }

        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private static void readFile(File file){
         try(BufferedReader reader = new BufferedReader(new FileReader(file))){
             String linea;
             while ((linea = reader.readLine()) != null) {
                 System.out.println(linea);
             }
         }catch (IOException e){
             e.printStackTrace();
         }
    }
}
