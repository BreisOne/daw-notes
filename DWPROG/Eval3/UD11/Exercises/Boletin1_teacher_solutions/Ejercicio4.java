/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ActividadesStreams.Boletin;

import java.io.*;
import java.util.Scanner;

/**
 *
 * @author nccasares
 */
public class Ejercicio4 {

    static Scanner teclado = new Scanner(System.in);

    public static void main(String[] args) {
        ejercicio3();
    }
    public static void ejercicio3() {
        int opcion;
        do {
            opcion = menu();
            switch (opcion) {
                case 1:
                    añadirRegistro();
                    break;
                case 2:
                    listarRegistro();
                    break;
                case 3:
                    buscarPorNombre();
                    break;
                case 4:
                    borrarRegistro();

            }
        } while (opcion != 0);
    }

    private static int menu() {
        System.out.println("-- Registro --");
        System.out.println("1-- Añadir registro");
        System.out.println("2-- Listar");
        System.out.println("3-- Buscar registro");
        System.out.println("4-- Borrar registro");
        System.out.println("0-- Salir");
        return Integer.parseInt(teclado.nextLine());
    }

    private static void añadirRegistro() {
        System.out.println("Introduzca nombre: ");
        String nombre = teclado.nextLine();
        System.out.println("Introduzca direccion: ");
        String direccion = teclado.nextLine();
        System.out.println("Introduzca telefono: ");
        String telefono = teclado.nextLine();

        DataOutputStream registroSalida;
        try {
            registroSalida = new DataOutputStream(new FileOutputStream("Registro.txt", true));
            registroSalida.writeUTF(nombre);
            registroSalida.writeUTF(direccion);
            registroSalida.writeUTF(telefono);

            registroSalida.close();
        } catch (FileNotFoundException ex) {
            System.out.println("Error con el fichero");
        } catch (IOException ex) {
            System.out.println("Error al manipular");
        }
        System.out.println("Persona añadida correctamente");
    }

    private static void listarRegistro() {
        DataInputStream registroEntrada;
        try {
            registroEntrada = new DataInputStream(new FileInputStream("Registro.txt"));
            int i = 1;
            while (registroEntrada.available() != 0) {
                System.out.println("----------");
                System.out.println("Nº Registro " + i);
                System.out.println("----------");
                System.out.println("Nombre: " + registroEntrada.readUTF());
                System.out.println("Direccion: " + registroEntrada.readUTF());
                System.out.println("Telefono: " + registroEntrada.readUTF());
                i++;
            }
            registroEntrada.close();
        } catch (FileNotFoundException ex) {
            System.out.println("Error con el fichero");
        } catch (IOException ex) {
            System.out.println("Error con el fichero");
        }
    }

    private static void buscarPorNombre() {
        System.out.println("Ingresa el nombre de la persona: ");
        String nombre = teclado.nextLine();
        DataInputStream registroEntrada;
        try {
            registroEntrada = new DataInputStream(new FileInputStream("Registro.txt"));

            int i = 1;
            int cont = 1;
            while (registroEntrada.available() != 0) {
                String linea = registroEntrada.readUTF();
                if (nombre.equals(linea)) {
                    System.out.println("----------");
                    System.out.println("Nº Registro " + i);
                    System.out.println("----------");
                    System.out.println("Nombre: " + linea);
                    System.out.println("Direccion: " + registroEntrada.readUTF());
                    System.out.println("Telefono: " + registroEntrada.readUTF());
                    i++;
                }
                cont++;
                // AVANZO EL CONTADOR DE REGISTROS HASTA LA LÍNEA SIGUIENTE (AVANZO 3 CAMPOS)
                if (cont % 3 == 0) {
                    i++;
                }
            }

            registroEntrada.close();

        } catch (FileNotFoundException ex) {
            System.out.println("No se encontró el fichero");
        } catch (IOException ex) {
            System.out.println("Error con el fichero");
        }
    }

    private static void borrarRegistro() {
        DataInputStream registroLectura, temporalLectura;
        DataOutputStream registroEscritura, temporalEscritura;
        System.out.println("Ingresa el nombre de la persona que quieres borrar del registro: ");
        String nombre = teclado.nextLine();

        try {
            File temp = File.createTempFile("Temp", ".txt");
            registroLectura = new DataInputStream(new FileInputStream("Registro.txt"));
            temporalEscritura = new DataOutputStream(new FileOutputStream(temp));

            boolean encontrado = false;
            int i = 1;
            while (registroLectura.available() != 0) {
                String linea = registroLectura.readUTF();
                if (nombre.equals(linea)) {
                    encontrado = true;
                }
                if (!encontrado) {
                    temporalEscritura.writeUTF(linea);
                }
                
                // CUANDO LLEGA AL ÚLTIMO CAMPO DEL REGISTRO, SE RESETEA LA VARIABLE BOOLEANA
                if (i % 3 == 0) {
                    encontrado = false;
                }
                i++;
            }

            registroLectura.close();
            temporalEscritura.close();

            temporalLectura = new DataInputStream(new FileInputStream(temp));
            registroEscritura = new DataOutputStream(new FileOutputStream("Registro.txt"));

            while (temporalLectura.available() != 0) {
                registroEscritura.writeUTF(temporalLectura.readUTF());
            }

            temporalLectura.close();
            registroEscritura.close();

            System.out.println((temp.delete() ? "Temporal eliminado con exito" : "No se pudo eliminar el temporal"));

        } catch (IOException ex) {
            System.out.println("Error con el fichero");
        }

    }
}
