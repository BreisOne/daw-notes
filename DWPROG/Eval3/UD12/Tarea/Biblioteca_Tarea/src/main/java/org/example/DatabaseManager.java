package org.example;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class DatabaseManager {

    static Scanner scanner = new Scanner(System.in);
    public static void createDB(String DB, Statement statement) throws SQLException {
        statement.execute(" CREATE DATABASE IF NOT EXISTS " + DB +";");
        statement.execute("use "+DB+";");
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
        }else if (insertOption == 2){
            System.out.println("Dame el titulo del libro:");
            String tituloLibro= scanner.nextLine();
            System.out.println("Dame el precio del libro:");
            float precioLibro= scanner.nextFloat();
            scanner.nextLine();
            System.out.println("Dame el dni del autor:");
            String dniAutor= scanner.nextLine();

            try {
                statement.executeUpdate("INSERT INTO Libros (Titulo, Precio, Autor) VALUES('" + tituloLibro + "'," + precioLibro + ",'"+ dniAutor+"')");
            } catch (SQLException e) {
                System.err.println("Se ha producido un error al insertar");
            }
        }else{
            System.err.println("No has elegido una opción valida");
        }
    }
    public static void delete(Statement statement){

        System.out.println("Que quieres eliminar?: \n"+
                            "1) Un Autor\n"+
                            "2) Un libro\n");
        int userOption = scanner.nextInt();
        scanner.nextLine();

        if(userOption == 1){

            System.out.println("Dime el DNI del autor a eliminar");
            String autor = scanner.nextLine();
            eliminarAutor(statement, autor);

        } else if (userOption == 2) {

            System.out.println("Dime el titulo del libro a eliminar");
            String libro = scanner.nextLine();
            eliminarLibro(statement, libro);

        } else{
            System.out.println("No has elegido una opción valida");
        }

    }
    public static void query(Statement statement){
        System.out.println("Que es lo que quieres consultar? \n"+
                "1) Consultar datos de un libro por título \n"+
                "2) Libros de un autor \n"+
                "3) Todos los libros de la base de datos \n"+
                "4) Todos los autores de la base de datos");

        int userOption = scanner.nextInt();
        scanner.nextLine();

        try{
        switch (userOption){
            case 1:
                System.out.println("Cual es el título del libro que quieres buscar?");
                String Libro  = scanner.nextLine();
                ResultSet libroResult = buscarLibro(statement,Libro);
                printResultSet(libroResult);
                break;
            case 2:
                System.out.println("Cual es el dni del autor que quieres buscar?");
                String dniAutor = scanner.nextLine();
                ResultSet librosA = librosAutor(statement, dniAutor);
                printResultSet(librosA);
                break;
            case 3:
                ResultSet libros = librosDB(statement);
                printResultSet(libros);
                break;
            case 4:
                ResultSet autores = autoresDB(statement);
                printResultSet(autores);
                break;
            default:
        }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    public static void update(Statement statement){
        System.out.println("Que es lo que quieres actualizar? \n"+
                           "1) Libro \n"+
                           "2) Autor \n");
            int userOption = scanner.nextInt();
            scanner.nextLine();

            if(userOption == 1){

                System.out.println("Dime el titulo del libro a actualizar");
                String libro = scanner.nextLine();
                actualizarLibro(statement, libro);

            } else if (userOption == 2){
                System.out.println("Dime el DNI del autor a actualizar");
                String autor = scanner.nextLine();
                actualizarAutor(statement, autor);
            }else{
                System.out.println("No has elegiro una opción valida");
            }
    }

    ///Helper functions
    private static ResultSet buscarAutor(Statement statement, String dniAutor) throws SQLException {
        return  statement.executeQuery("SELECT * FROM Autores WHERE DNI = '" + dniAutor +"';");
    }
    private static ResultSet buscarLibro (Statement statement, String Libro) throws SQLException {
        return  statement.executeQuery("SELECT * FROM Libros WHERE Titulo = '" + Libro +"';");
    }

    private static ResultSet librosAutor(Statement statement, String dniAutor) throws SQLException {
        return statement.executeQuery("SELECT * FROM libros WHERE autor = '" + dniAutor + "';");
    }

    private static ResultSet librosDB ( Statement statement) throws SQLException {
        return  statement.executeQuery("SELECT * FROM libros");
    }

    private static ResultSet autoresDB (Statement statement) throws SQLException {
        return statement.executeQuery("SELECT * FROM autores");
    }

    private static void printResultSet(ResultSet resultSet) throws SQLException {
        // Imprimir los nombres de las columnas
        for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
            System.out.print(resultSet.getMetaData().getColumnName(i) + "\t");
        }
        System.out.println(); // Salto de línea después de imprimir los nombres de las columnas

        // Imprimir los datos de cada fila
        while (resultSet.next()) {
            for (int i = 1; i <= resultSet.getMetaData().getColumnCount(); i++) {
                System.out.print(resultSet.getString(i) + "\t");
            }
            System.out.println(); // Salto de línea después de imprimir los datos de una fila
        }
    }

    private static void eliminarAutor(Statement statement, String dniAutor) {
        try{
            ResultSet queryResult = buscarAutor(statement, dniAutor);
            if(queryResult.next()){

                statement.execute("DELETE FROM Libros WHERE Autor = '"+ queryResult.getString("DNI")+"';");
                statement.execute("DELETE FROM Autores WHERE DNI = '" + queryResult.getString("DNI")+"';");
                System.out.println("El autor y sus libros se han eliminado correctamente");

            }else{
                System.out.println("El autor no se encuentra en la base de datos");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    private static void eliminarLibro(Statement statement, String Libro) {
        try{
            ResultSet queryResult = buscarLibro(statement, Libro);
            if(queryResult.next()){
                statement.execute("DELETE FROM Libros WHERE IdLibro = " + queryResult.getInt("IdLibro")+";");
                System.out.println("El libro se ha eliminado correctamente");
            }else{
                System.out.println("El libro no se encuentra en la base de datos");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
    private static void actualizarLibro(Statement statement, String Libro){
        System.out.println("Dime el nuevo titulo del libro a actualizar");
        String titulo = scanner.nextLine();

        System.out.println("Dime el dni del nuevo autor del libro a actualizar");
        String dniAutor = scanner.nextLine();

        System.out.println("Dime el nuevo precio del libro a actualizar");
        float precio = scanner.nextFloat();

        try{
            ResultSet queryAutor = buscarAutor(statement, dniAutor);

            if(queryAutor.next()){

                ResultSet queryResult = buscarLibro(statement, Libro);
                queryResult.next();
                statement.executeUpdate("UPDATE Libros SET Titulo = '" + titulo + "' , Precio = "+precio+", Autor = '" + dniAutor + "' WHERE IdLibro = " + queryResult.getString("IdLibro") +";");
                System.out.println("El libro se ha actualizado correctamente");

            }else{
                System.out.println("No se puede actualizar el libro porque el autor introducido no existe");
            }

        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    private static void actualizarAutor(Statement statement, String Autor){
        System.out.println("Dime el nuevo nombre del autor a actualizar");
        String nombre = scanner.nextLine();

        System.out.println("Dime el nuevo dni del autor  a actualizar");
        String dniAutor = scanner.nextLine();

        System.out.println("Dime la nueva nacionalidad del autor a actualizar");
        String nacionalidad = scanner.nextLine();

        try{
            ResultSet queryAutor = buscarAutor(statement, dniAutor);
            queryAutor.next();

            statement.executeUpdate("UPDATE Autores SET DNI = '" + dniAutor + "' , Nombre = '"+nombre+"' , Nacionalidad = '" + nacionalidad + "' WHERE DNI = '" + queryAutor.getString("DNI") +"';");

            System.out.println("El autor se ha actualizado correctamente");

        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
