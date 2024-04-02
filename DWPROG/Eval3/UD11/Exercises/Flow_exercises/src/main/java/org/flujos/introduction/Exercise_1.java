package org.flujos.introduction;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
//ENUNCIADO: Crea un programa que lea todos los archivos de una carpeta data con una extensión dada

public class Exercise_1 {
    public static void execute(){

    // Ruta de la carpeta
    String folderPath = "ruta_de_la_carpeta";

    // Extensión de archivo específica
    String extension = ".txt"; // Cambia esto por la extensión deseada

    // Obtener archivos con la extensión especificada
    List<String> filePaths = getFilesWithExtension(folderPath, extension);

    // Mostrar las rutas de los archivos
    System.out.println("Archivos con la extensión "+ extension + " en la carpeta " + folderPath + ":");

    for(String filePath : filePaths) {
        System.out.println(filePath);
    }
}
    private static List<String> getFilesWithExtension(String folderPath, String extension) {
    List<String> result = new ArrayList<>();
    File folder = new File(folderPath);

    // Verificar si la carpeta existe
    if (!folder.exists() || !folder.isDirectory()) {
        System.err.println("La carpeta especificada no existe.");
        return result;
    }

    // Obtener archivos con la extensión especificada
    File[] files = folder.listFiles((dir, name) -> name.toLowerCase().endsWith(extension.toLowerCase()));
    if (files != null) {
        for (File file : files) {
            if (file.isFile()) {
                result.add(file.getAbsolutePath());
            }
        }
    }

    return result;
    }
}
