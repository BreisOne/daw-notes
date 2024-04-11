package org.flujos.introduction;

import java.io.File;
import java.util.Scanner;

//ENUNCIADO: Escribir un programa Java para comprobar si un archivo o directorio tiene permiso de lectura y escritura

public class Exercise_2 {
    public static void execute(){
        Scanner scanner = new Scanner(System.in);

        System.out.println("Introduce la ruta  absoluta del archivo:");
        String path = scanner.nextLine();

        File file = new File(path);

        if(file.canRead()){
            System.out.println("El archivo tiene permisos de lectura");
        }else{
            System.out.println("El archivo tiene permisos de lectura");
        }

        if(file.canWrite()){
            System.out.println("El archivo tiene permisos de escritura");
        }else{
            System.out.println("El archivo no tiene permisos de escritura");
        }
    }
}
