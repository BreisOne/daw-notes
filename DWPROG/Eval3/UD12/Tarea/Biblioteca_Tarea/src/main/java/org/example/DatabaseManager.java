package org.example;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DatabaseManager {

    static Scanner scanner = new Scanner(System.in);
    public static void createDB(String DB, Statement statement) throws SQLException {
        statement.execute(" CREATE TABLE IF NOT EXISTS " + DB +";");
        statement.execute("use"+DB+";");
    }
    public static  void createTables(Statement statement) throws SQLException {
        statement.executeUpdate("CREATE TABLE IF NOT EXISTS Autores (" +
                "DNI VARCHAR(9) PRIMARY KEY," +
                "Nombre VARCHAR(30)," +
                "Nacionalidad VARCHAR(30))");

        statement.executeUpdate("CREATE TABLE IF NOT EXISTS Libros (" +
                "IdLibro INT AUTO_INCREMENT PRIMARY KEY," +
                "Titulo VARCHAR(30)," +
                "Precio FLOAT," +
                "Autor VARCHAR(9)," +
                "FOREIGN KEY (Autor) REFERENCES Autores(DNI))");
    }
    public static void insert( Statement statement){
        System.out.println("Que quieres insertar?: \n"+
                           "1) Un Autor\n"+
                           "2) Un libro\n");
        int insertOption = scanner.nextInt();
        scanner.nextLine();

        if(insertOption == 1){
            System.out.println("Dame el DNI del autor:");
            String dniAutor= scanner.nextLine();
            System.out.println("Dame el nombre del autor:");
            String nombreAutor= scanner.nextLine();
            System.out.println("Dame la nacionalidad del autor:");
            String nacionalidadAutor= scanner.nextLine();

            try {
                statement.executeUpdate("INSERT INTO Autores (DNI, nombre, nacionalidad) VALUES('" + dniAutor + "','" + nombreAutor + "','"+ nacionalidadAutor+"')");
            } catch (SQLException e) {
                System.err.println("Se ha producido un error al insertar");
            }
        }else {
            System.out.println("Dame el titulo del libro:");
            String tituloLibro= scanner.nextLine();
            System.out.println("Dame el precio del libro:");
            float precioLibro= scanner.nextFloat();
            System.out.println("Dame el dni del autor:");
            String dniAutor= scanner.nextLine();

            try {
                statement.executeUpdate("INSERT INTO Libros (Titulo, Precio, Autor) VALUES('" + tituloLibro + "','" + precioLibro + "','"+ dniAutor+"')");
            } catch (SQLException e) {
                System.err.println("Se ha producido un error al insertar");
            }
        }
    }
    public static void delete(Statement statement){

    }
    public static void query(Statement statement){

    }
    public static void update(Statement statement){

    }
}
