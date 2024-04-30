package org.example;

import javax.xml.crypto.Data;
import java.sql.*;
import java.util.Scanner;

public class Main {
    private static final String URL = "jdbc:mariadb://localhost:3306";
    private static final String USER = "root";
    private static final String PASSWORD = "123";
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            
            // Establecer conexión con la base de datos
            Connection connection = ConectionManager.getConnection(URL, USER, PASSWORD);
            Statement statement = ConectionManager.createStatement(connection);

            // Crear BD si no existe
            DatabaseManager.createDB("biblioteca", statement);

            // Crear tablas si no existen
            DatabaseManager.createTables(statement);

            // Menú de opciones
            int opcion;
            do {
                System.out.println("MENÚ");
                System.out.println("1. Inserción de nuevas filas");
                System.out.println("2. Borrado de filas");
                System.out.println("3. Consultas");
                System.out.println("4. Modificaciones");
                System.out.println("5. Fin");
                System.out.print("Seleccione una opción: ");
                opcion = scanner.nextInt();

                switch (opcion) {
                    case 1:
                        // Implementar inserción de nuevas filas
                        DatabaseManager.insert(statement);
                        break;
                    case 2:
                        // Implementar borrado de filas
                        DatabaseManager.delete(statement);
                        break;
                    case 3:
                        // Implementar consultas
                        DatabaseManager.query(statement);
                        break;
                    case 4:
                        // Implementar modificaciones
                        DatabaseManager.update(statement);
                        break;
                    case 5:
                        System.out.println("Fin del programa.");
                        break;
                    default:
                        System.out.println("Opción no válida. Intente de nuevo.");
                }
            } while (opcion != 5);

            // Cerrar conexión con la base de datos
            ConectionManager.closeStatement(statement);
            ConectionManager.closeConnection(connection);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}