/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ficheros;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Scanner;

/**
 *
 * @author nccasares
 */
public class AFicheros {

    private static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {
        int opcion;
        do {
            opcion = menu();
            switch (opcion) {
                case 1:
                    obtenerLista();
                    break;
                case 2:
                    obtenerListaExtension();
                    break;
                case 3:
                    comprobarExistencia();
                    break;
                case 4:
                    comprobarPermisos();
                    break;
                case 5:
                    comprobarTipo();
                    break;
                case 6:
                    obtenerUltimaModificacion();
                    break;
                case 7:
                    obtenerTamanho();
                    break;
                case 8:
                    crearCarpeta();
                    break;
            }
        } while (opcion != 0);
    }

    private static int menu() {
        System.out.println("-- Ficheros --");
        System.out.println("1 -- Obtener nombres de archivos/directorios");
        System.out.println("2 -- Obtener archivos de una extension especifica");
        System.out.println("3 -- Comprobar si existe o no cierto fichero");
        System.out.println("4 -- Comprobar si tiene permisos de lectura y escritura");
        System.out.println("5 -- Comprobar si una ruta es un directorio o archivo");
        System.out.println("6 -- Obtener la horas de la ultima modificacion de un archivo");
        System.out.println("7 -- Obtener el tamaño de un archivo en bytes y Kb");
        System.out.println("8 -- Crear carpeta en una ruta especifica y dos archivos");
        return Integer.parseInt(teclado.nextLine());
    }

    /**
     * Escribir un programa Java para obtener una lista de
     * todos los nombres de archivos / directorios de una carpeta especificada.
     * */
    private static void obtenerLista() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();

        File rutaFile = new File(ruta);

        if (rutaFile.exists()) {
            File[] ficheros = rutaFile.listFiles();
            for (int i = 0; i < ficheros.length; i++) {
                System.out.println("-" + ficheros[i].getName());
            }
        }
        else {
            System.err.println("La ruta especificada no existe");
        }
    }

    /**
     * Escribir un programa Java para obtener archivos de
     * una extensión específica dentro de una carpeta proporcionada.
     * */
    private static void obtenerListaExtension() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        System.out.println("Introduzca la extension: ");
        String extension = teclado.nextLine();

        File rutaFile = new File(ruta);
        if (rutaFile.exists()) {
            File[] ficheros = rutaFile.listFiles();
            for (int i = 0; i < ficheros.length; i++) {
                if (ficheros[i].getAbsolutePath().toLowerCase().endsWith(extension))
                    System.out.println("-" + ficheros[i]);
            }
        }
        else {
            System.err.println("La ruta especificada no existe");
        }
    }

    /**
     * Escribir un programa Java para comprobar
     * si existe o no un archivo o directorio especificado por ruta.
     * */
    private static void comprobarExistencia() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        if (new File(ruta).exists()) {
            System.out.println("Existe");
        } else {
            System.out.println("No existe");
        }
    }

    /**
     * Escribir un programa Java para comprobar
     * si un archivo o directorio tiene permiso de lectura y escritura.
     * */
    private static void comprobarPermisos() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        File archivo = new File(ruta);
        if (archivo.exists()) {
            if (archivo.canRead()){
                System.out.println("Tiene permiso de lectura");
            } else {
                System.out.println("No tiene permiso de lectura");
            }
            System.out.println((archivo.canWrite() ? "Tiene permiso de escritura" : "No tiene permiso de escritura"));
        } else {
            System.err.println("No existe");
        }
    }

    /**
     * Escribir un programa Java para comprobar
     * si el nombre de una ruta dada es un directorio o un archivo.
     * */
    private static void comprobarTipo() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        File archivo = new File(ruta);
        if (archivo.exists()) {
            if (archivo.isDirectory()) {
                System.out.println("Es un directorio");
            }
            if (archivo.isFile()) {
                System.out.println("Es un archivo");
            }
        } else {
            System.out.println("No existe");
        }
    }

    /**
     * Escribir un  programa Java para obtener la última hora de modificación de un archivo.
     * */
    private static void obtenerUltimaModificacion() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        File archivo = new File(ruta);
        if (archivo.exists()) {
            System.out.println("La ultima modificacion fue en: " + new Date(archivo.lastModified()));
        } else {
            System.out.println("No existe");
        }
    }

    /**
     * Escribir un programa Java para obtener el tamaño del archivo en bytes y KB.
     * */
    private static void obtenerTamanho() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        File archivo = new File(ruta);
        if (archivo.exists() && archivo.isFile()) {
            System.out.println("El tamaño en bytes del fichero es de: " + archivo.length());
            System.out.println("El tamaño en KB del fichero es de: " + (archivo.length() / 1000));
        } else {
            System.out.println("No existe o no es un fichero");
        }
    }

    /**
     * Programa que cree una carpeta en una ruta especificada,
     * y dos archivos en dicha carpeta. A continuación listar
     * sus nombres y eliminar uno de ellos.
     * */
    private static void crearCarpeta() {
        System.out.println("Introduzca la ruta: ");
        String ruta = teclado.nextLine();
        File carpeta = new File(ruta);
        if (carpeta.mkdir()) {
            System.out.println("Carpeta creada");
            System.out.println("Creando ficheros...");
            File fichero1 = new File(ruta + "/fichero1.txt");
            File fichero2 = new File(ruta + "/fichero2.txt");
            try {
                System.out.println((fichero1.createNewFile() ? "Primer fichero creado" : "No se pudo crear el Primer fichero"));
                System.out.println((fichero2.createNewFile() ? "Segundo fichero creado" : "No se pudo crear el Segundo fichero"));
            } catch (IOException ex) {
                System.out.println("Error");
            }
            System.out.println("Nombres:");
            String[] ficheros = carpeta.list();
            for (int i = 0; i < ficheros.length; i++) {
                System.out.println("-" + ficheros[i]);
            }
            System.out.println("Eliminando un fichero...");
            if (fichero2.delete()) {
                System.out.println("Fichero eliminado");
            }
        } else {
            System.err.println("No se pudo crear la carpeta");
        }
    }

}
