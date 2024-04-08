package org.flujos.boletin.Exercise_5;

import java.io.*;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

public class Exercise_2_5 {
    public static void execute(){

        Product detergente = new Product("Detergente", 13);
        Product camiseta = new Product("Camiseta", 25);
        Product microondas = new Product("Microondas", 65);

        List<Product> products = Arrays.asList(detergente, camiseta,microondas);

        String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\Exercise_5\\archivo2_5.txt";
        File file = new File(fileName);

        try(ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream(file))){
            for (Product product : products) {
                outputStream.writeObject(product);
            }
        }catch (IOException e){
            e.printStackTrace();
        }

    }
}
