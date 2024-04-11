package ActividadesStreams.Boletin;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Scanner;

public class Ejercicio2_3 {
    private void cargarFichero() {
        try (DataOutputStream dos = new DataOutputStream(new FileOutputStream("datos.txt"))){
            String[] productos = {"Agua", "Leche", "Jabón", "Yogur"};
            double[] precios = {0.75, 0.95, 2.15, 1.50};

            for (int i = 0; i < productos.length; i++) {
                dos.writeUTF(productos[i] + " " + precios[i] + "\n");
            }
            System.out.println("Fichero cargado");
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void borrado () throws IOException {
        Scanner sc = new Scanner(System.in);
        System.out.println("Introduzca el nombre del producto que desea eliminar:");
        String nombre = sc.nextLine();

        File fic = new File("datos.txt");
        File ficAux = new File("Temp.txt");
        try (DataInputStream dis = new DataInputStream(new FileInputStream(fic))) {
            DataOutputStream temporalEscritura = new DataOutputStream(new FileOutputStream(ficAux));

            String linea;
            while (true) {
                linea = dis.readUTF();

                if (linea.split(" ")[0].equalsIgnoreCase(nombre))
                    System.out.println("Eliminado: " + linea);
                else
                    temporalEscritura.writeUTF(linea);
            }
        } catch (EOFException e) {
            System.err.println("Fin de fichero");
            fic.delete();
            Files.move(Paths.get(ficAux.getAbsolutePath()), Paths.get("datos.txt"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        Ejercicio2_3 e = new Ejercicio2_3();
        try {
            e.cargarFichero();
            e.borrado();
        } catch (IOException ex) {
            throw new RuntimeException(ex);
        }
    }
}
