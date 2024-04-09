package org.flujos.boletin.Exercise_5;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

public class Exercise_3_5 {

    static Product detergente = new Product("Detergente", 13);
    static Product camiseta = new Product("Camiseta", 25);
    static Product microondas = new Product("Microondas", 65);

    static List<Product> products = Arrays.asList(detergente, camiseta,microondas);
    static String fileName = ".\\src\\main\\java\\org\\flujos\\boletin\\Exercise_5\\archivo3_5.txt";

    static File file = new File(fileName);
    public static void execute(){
        writeFile(products);
    }
    private static void printFile(){
        Optional<List<Product>> productsReaded = readFile();
        productsReaded.orElse(Collections.emptyList())
                        .stream()
                        .map(Product::toString)
                        .forEach(System.out::println);
    }
    private static Optional<List<Product>> readFile(){
        List<Product> productsReaded = new ArrayList<>();

        try(ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(file))){
            while (true){
                Product product = (Product) inputStream.readObject();
                productsReaded.add(product);
            }
        }catch (EOFException e){
            return Optional.of(productsReaded);

        }catch (IOException | ClassNotFoundException e){
            e.printStackTrace();
            return Optional.empty();
        }
    }
    private static void writeFile(List<Product> products){

        try (ObjectOutputStream outputStream =new ObjectOutputStream(new FileOutputStream(file))){
            for (Product product : products){
                outputStream.writeObject(product);
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

        Optional<List<Product>> productsReaded = readFile();

        List<Product> finalFile = productsReaded.orElse(Collections.emptyList())
                                                .stream()
                                                .filter(product -> !product.name.equalsIgnoreCase(userOption))
                                                .toList();



        writeFile(finalFile);
        printFile();
    }
}
